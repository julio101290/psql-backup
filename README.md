
# PostgreSQLBackupManager

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![PHP Version](https://img.shields.io/badge/PHP-7.4%2B-blue.svg)

---

## 📦 Descripción

**PostgreSQLBackupManager** es una librería PHP para realizar respaldos y restauraciones de bases de datos **PostgreSQL** de manera sencilla y confiable. 

- Detecta automáticamente si tienes `pg_dump` instalado para hacer un respaldo rápido y eficiente.
- Si `pg_dump` no está disponible, usa una solución nativa en PHP que realiza el backup y restore.
- Permite respaldar tablas específicas o toda la base de datos.
- Opcionalmente comprime el respaldo en un archivo ZIP.
- Envía el respaldo por correo electrónico usando **PHPMailer**.
- Adaptado por **julio101920** para mayor compatibilidad y personalización.

---

## 🚀 Características principales

- Compatible con PostgreSQL vía PDO.
- Verificación automática y uso de `pg_dump` si está disponible.
- Backup nativo en PHP con exportación del esquema y datos.
- Restauración sencilla desde archivos SQL.
- Soporte para envío de respaldos por email.
- Archivo de respaldo con marca de tiempo y nombre de base de datos.
- Fácil integración con Composer y PSR-4.
- Adaptado y mejorado para proyectos modernos en PHP 7.4+.

---

## 📋 Requisitos

- PHP 7.4 o superior
- Extensión PDO con soporte PostgreSQL (`pdo_pgsql`)
- (Opcional) Herramienta `pg_dump` disponible en el sistema para respaldos más rápidos
- Librería [PHPMailer](https://github.com/PHPMailer/PHPMailer) (se instala vía Composer)
- Permisos para crear archivos y carpetas para los respaldos

---

## ⚙️ Instalación

Desde la raíz de tu proyecto, ejecuta:

```bash
composer require julio101920/postgresql-backup-manager
```

---

## 🧑‍💻 Uso Básico

```php
<?php
require 'vendor/autoload.php';

use PostgreSQLBackupManager\PostgreSQLBackup;

// Crear conexión PDO a PostgreSQL
$pdo = new PDO('pgsql:host=localhost;port=5432;dbname=tu_basedatos', 'usuario', 'contraseña');

// Crear instancia del backup manager
$backupManager = new PostgreSQLBackup($pdo, __DIR__ . '/backups');

try {
    // Hacer respaldo completo, incluir datos, crear zip y sin enviar email
    $backupFile = $backupManager->backup(null, true, true);

    echo "Backup creado exitosamente en: $backupFile\n";
} catch (Exception $e) {
    echo "Error al crear backup: " . $e->getMessage() . "\n";
}
```

---

## 🛠️ Métodos principales

### `backup($tables = null, $includeData = true, $archive = false, $emailRecipient = null)`

- **$tables**: string|array|null - Nombre(s) de tabla(s) para respaldar. Null para todas.
- **$includeData**: bool - Si incluir datos o solo estructura.
- **$archive**: bool - Comprime el archivo SQL en ZIP.
- **$emailRecipient**: string|null - Email para enviar respaldo adjunto (opcional).

### `restore($backupFilePath, $dropTables = true)`

- **$backupFilePath**: string - Ruta al archivo SQL de respaldo.
- **$dropTables**: bool - Si eliminar tablas existentes antes de restaurar.

---

## 📂 Estructura del respaldo

- Archivo SQL con sentencias para crear tablas y volcar datos.
- Comentarios con detalles del backup (fecha, servidor, versión).
- Compatible con PostgreSQL y formato estándar SQL.

---

## ✨ Adaptado por julio101920

Este proyecto está basado y adaptado para ofrecer mejor compatibilidad con PostgreSQL, detección automática de `pg_dump`, y soporte en PHP puro para quienes no cuenten con esta herramienta. ¡Gracias por usarlo!

---

## 📝 Licencia

MIT License © 2025 julio101920

---

## 📬 Contacto

Si tienes dudas, sugerencias o quieres reportar un error, abre un issue o contáctame directamente.

---

¡Gracias por usar **PostgreSQLBackupManager**! 🎉
