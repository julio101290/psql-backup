# 🐘 PostgreSQL Backup Manager

[![Versión estable](https://img.shields.io/badge/versi%C3%B3n-estable-brightgreen)](https://github.com/julio101290/psql-backup/releases)
[![Licencia MIT](https://img.shields.io/badge/Licencia-MIT-blue)](LICENSE)
[![PHP](https://img.shields.io/badge/PHP-7.3%2B%20|%208.x-blue.svg)](https://www.php.net/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-9.6%2B-blue.svg)](https://www.postgresql.org/)

**PostgreSQL Backup Manager** es una biblioteca PHP moderna para crear y restaurar respaldos de bases de datos PostgreSQL. Perfecta para entornos donde `pg_dump` no está disponible, pero también lo aprovecha si está presente.

---

## 📚 Tabla de Contenido

- [🚀 Características](#-características)
- [🛠️ Requisitos](#️-requisitos)
- [📦 Instalación](#-instalación)
- [⚙️ Uso](#️-uso)
  - [Inicialización](#inicialización)
  - [Crear un respaldo](#crear-un-respaldo)
  - [Restaurar un respaldo](#restaurar-un-respaldo)
- [🔌 Ejemplo con CodeIgniter 4](#-ejemplo-con-codeigniter-4)
- [🧪 Restauración desde archivo ZIP](#-restauración-desde-archivo-zip)
- [🧾 Licencia](#-licencia)
- [🙌 Agradecimientos](#-agradecimientos)

---

## 🚀 Características

✅ Detección automática de `pg_dump`  
✅ Soporte para exportaciones comprimidas `.zip` (solo PostgreSQL)  
✅ Soporte completo para `PDO`  
✅ Compatible con cualquier framework PHP (especialmente CodeIgniter 4)  
✅ Restauración rápida y confiable

---

## 🛠️ Requisitos

- PHP 7.3 o superior
- Extensión `PDO` habilitada
- PostgreSQL 9.6 o superior
- Opcional: `pg_dump` en el sistema para respaldos más eficientes

---

## 📦 Instalación

Instala el paquete usando Composer:

```bash
composer require julio101290/postgresql-backup-manager
```

---

## ⚙️ Uso

### Inicialización

```php
use PostgresqlBackupManager\PostgreSQLBackup;

$pdo = new PDO("pgsql:host=localhost;port=5432;dbname=mi_base", "usuario", "contraseña");

$backup = new PostgreSQLBackup(
    $pdo,
    'mi_base',
    'usuario',
    'contraseña',
    'localhost',
    5432,
    __DIR__ . '/backups'
);
```

---

### Crear un respaldo

```php
$archivoSQL = $backup->backup(); // Sin compresión
$archivoZip = $backup->backup(true); // Con compresión ZIP
```

---

### Restaurar un respaldo

```php
$backup->restore('/ruta/al/respaldo.sql');
$backup->restore('/ruta/al/respaldo.sql.zip'); // Si está comprimido
```

---

## 🔌 Ejemplo con CodeIgniter 4

```php
public function restaurar($uuid) {
    $info = $this->backups->where('uuid', $uuid)->first();

    $config = config('Database')->default;

    $pdo = new \PDO("pgsql:host={$config['hostname']};port={$config['port']};dbname={$config['database']}",
                    $config['username'], $config['password']);

    $backup = new PostgreSQLBackup(
        $pdo,
        $config['database'],
        $config['username'],
        $config['password'],
        $config['hostname'],
        $config['port']
    );

    try {
        $backup->restore($info['SQLFile']);
        return $this->respondCreated(true, lang("backups.msg.restored"));
    } catch (Exception $e) {
        return $this->failServerError('Error al restaurar: ' . $e->getMessage());
    }
}
```

---

## 🧪 Restauración desde archivo ZIP

Si el respaldo fue generado con compresión (`$backup->backup(true);`), se creará un archivo `.sql.zip`. La clase `restore()` detecta automáticamente si es un `.zip` y lo descomprime para ejecutar el contenido.

> 📌 Asegúrate de que el archivo `.zip` solo contenga un `.sql`.

---

## 🧾 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## 🙌 Agradecimientos

🔧 Basado en la implementación original de [Ramazan Çetinkaya](https://github.com/ramazancetinkaya/mysql-backup)  
🛠️ Adaptado y mejorado por [julio101290](https://github.com/julio101290)

---
