<?php

/**
 * PostgreSQL Backup & Restore Library
 *
 * This library provides functionalities for backing up and restoring PostgreSQL databases.
 * Verifica si existe el binario `pg_dump`, y si no, hace backup en PHP puro.
 *
 * Adaptado por julio101920
 * Basado en el proyecto original de Ramazan Çetinkaya
 * @link https://github.com/ramazancetinkaya/mysql-backup
 */

namespace PostgresqlBackupManager;

use PDO;
use ZipArchive;
use Exception;

class PostgreSQLBackup {

    private PDO $db;
    private string $backupFolder;
    private string $dbName;
    private string $dbUser;
    private ?string $dbPassword;
    private ?string $dbHost;
    private ?int $dbPort;

    public function __construct(PDO $db, string $dbName, string $dbUser, ?string $dbPassword = null, ?string $dbHost = 'localhost', ?int $dbPort = 5432, string $backupFolder = 'backup') {
        $this->db = $db;
        $this->dbName = $dbName;
        $this->dbUser = $dbUser;
        $this->dbPassword = $dbPassword;
        $this->dbHost = $dbHost;
        $this->dbPort = $dbPort;
        $this->backupFolder = rtrim($backupFolder, '/') . '/';
        $this->checkBackupFolder();
    }

    private function checkBackupFolder(): void {
        if (!file_exists($this->backupFolder) && !mkdir($this->backupFolder, 0755, true)) {
            throw new Exception("No se pudo crear la carpeta de respaldo");
        }
        if (!is_writable($this->backupFolder) && !chmod($this->backupFolder, 0755)) {
            throw new Exception("No se pudo establecer permisos de escritura para la carpeta de respaldo");
        }
    }

    public function backup(bool $archive = false): string {
        $filename = $this->backupFolder . "backup_{$this->dbName}_" . date('Y-m-d_His') . ".sql";

        if (shell_exec("which pg_dump")) {
            $cmd = sprintf(
                    'PGPASSWORD="%s" pg_dump -U %s -h %s -p %d -F p -d %s > %s',
                    $this->dbPassword,
                    $this->dbUser,
                    $this->dbHost,
                    $this->dbPort,
                    $this->dbName,
                    escapeshellarg($filename)
            );
            $result = null;
            system($cmd, $result);
            if ($result !== 0) {
                throw new Exception("Error al ejecutar pg_dump");
            }
        } else {
            $this->backupWithPHP($filename);
        }

        if ($archive) {
            $zip = new ZipArchive();
            $zipFile = $filename . ".zip";
            if ($zip->open($zipFile, ZipArchive::CREATE) === TRUE) {
                $zip->addFile($filename, basename($filename));
                $zip->close();
                unlink($filename);
                return $zipFile;
            } else {
                throw new Exception("No se pudo crear el archivo ZIP");
            }
        }

        return $filename;
    }

    private function backupWithPHP(string $filename): void {
        $tables = $this->db->query("SELECT tablename FROM pg_tables WHERE schemaname = 'public'")->fetchAll(PDO::FETCH_COLUMN);
        $fp = fopen($filename, 'w');

        fwrite($fp, "-- Respaldo generado en PHP
-- Adaptado por julio101920
\n");

        foreach ($tables as $table) {
            fwrite($fp, "-- Estructura de la tabla $table\n");
            $res = $this->db->query("SELECT column_name, data_type FROM information_schema.columns WHERE table_name = '$table'")->fetchAll(PDO::FETCH_ASSOC);
            $columns = [];
            foreach ($res as $col) {
                $columns[] = $col['column_name'] . ' ' . $col['data_type'];
            }
            fwrite($fp, "CREATE TABLE IF NOT EXISTS \"$table\" (" . implode(", ", $columns) . ");\n\n");

            fwrite($fp, "-- Datos de la tabla $table\n");
            $data = $this->db->query("SELECT * FROM \"$table\"")->fetchAll(PDO::FETCH_ASSOC);
            foreach ($data as $row) {
                $cols = array_map(fn($v) => '"' . $v . '"', array_keys($row));
                $vals = array_map(fn($v) => $v === null ? 'NULL' : "'" . str_replace("'", "''", $v) . "'", array_values($row));
                fwrite($fp, "INSERT INTO \"$table\" (" . implode(", ", $cols) . ") VALUES (" . implode(", ", $vals) . ");\n");
            }
            fwrite($fp, "\n");
        }
        fclose($fp);
    }

    public function restore(string $sqlFile): bool {
        // Descomprimir si es .zip
        if (str_ends_with($sqlFile, '.zip')) {
            $zip = new \ZipArchive();
            if ($zip->open($sqlFile) === TRUE) {
                $zip->extractTo(dirname($sqlFile));
                $extracted = $zip->getNameIndex(0);
                $zip->close();
                $sqlFile = dirname($sqlFile) . '/' . $extracted;
            } else {
                throw new Exception("No se pudo descomprimir el archivo ZIP");
            }
        }

        // Si contiene COPY ... FROM stdin o \., usar psql
        $sqlContent = file_get_contents($sqlFile);
        if (str_contains($sqlContent, 'COPY') && str_contains($sqlContent, '\\.')) {
            $cmd = sprintf(
                    'PGPASSWORD="%s" psql -U %s -h %s -p %d -d %s -f %s',
                    $this->dbPassword,
                    $this->dbUser,
                    $this->dbHost,
                    $this->dbPort,
                    $this->dbName,
                    escapeshellarg($sqlFile)
            );
            system($cmd, $result);
            if ($result !== 0) {
                throw new Exception("Error al restaurar con psql");
            }
            return true;
        }

        // Restauración simple con PDO (si no tiene COPY ... FROM)
        try {
            $this->db->beginTransaction();
            $this->db->exec($sqlContent);
            $this->db->commit();
            return true;
        } catch (Exception $e) {
            $this->db->rollBack();
            throw new Exception("Error al restaurar la base de datos: " . $e->getMessage());
        }
    }
}
