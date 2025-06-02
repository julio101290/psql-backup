-- Database Backup Manager
-- This backup was created automatically by the Database Backup Manager
-- © 2025 Ramazan Çetinkaya. All rights reserved.
-- https://github.com/ramazancetinkaya/mysql-backup
--
-- Host: 127.0.0.1:3306 via TCP/IP
-- Generated on: 2025-05-30 16:05:15
-- Server version: 10.4.32-MariaDB

--
-- Table structure for table `arqueocaja`
--

CREATE TABLE `arqueocaja` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `idSucursal` bigint(20) DEFAULT NULL,
  `idUsuarioEntrega` bigint(20) NOT NULL,
  `idUsuarioVerifica` bigint(20) NOT NULL,
  `idUsuarioRecibe` bigint(20) NOT NULL,
  `fechaInicial` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `importeInicial` decimal(18,0) NOT NULL,
  `importeVentasCredito` decimal(18,0) NOT NULL,
  `importeVentasContado` decimal(18,0) NOT NULL,
  `importeEfectivoContadoManual` decimal(18,0) NOT NULL,
  `observaciones` varchar(1024) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `arqueocaja`
--

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `auth_activation_attempts`
--

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
('1', 'admin', 'Administrators. The top of the food chain.'),
('2', 'member', 'Member everyday member.');

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '1');

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
('1', '1'),
('2', '1'),
('2', '2');

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
('1', '127.0.0.1', 'admin@admin.com', '1', '2025-05-30 22:27:52', '1');

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
('1', 'back-office', 'User can access to the administration panel.'),
('2', 'manage-user', 'User can create, delete or modify the users.'),
('3', 'role-permission', 'User can edit and define permissions for a role.'),
('4', 'menu-permission', 'User cand create, delete or modify the menu.'),
('5', 'log-permission', 'Permissions for logs');

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
('6', 'empresas-permisos', 'Permissions for backups'),
('7', 'settings-permissions', 'Permissions for settings'),
('8', 'backups-permissions', 'Permissions for backups'),
('9', 'branchoffices-permission', 'Permissions for backups'),
('10', 'products-permission', 'Permissions for products'),
('11', 'categorias-permission', 'Permissions for products');

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
('12', 'storages-permission', 'Permissions for storages'),
('13', 'proveedores-permission', 'Supplier catalog permission'),
('14', 'tipos_movimientos_inventario-permission', 'Permissions for types movement inventory'),
('15', 'custumers-permission', 'Permission for add, update and delete for custumers.'),
('16', 'inventory-permission', 'Permission to view inventory list'),
('17', 'quotes-permission', 'Permission to view quotes list');

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
('18', 'comprobantes_rd-permission', 'Supplier Republic Dominican Invoices'),
('19', 'sells-permission', 'Permission to view sells list'),
('20', 'vehiculos-permission', 'Permission for Vehicles'),
('21', 'tipovehiculo-permission', 'Permission for Vehicles'),
('22', 'choferes-permission', 'Permission for drivers'),
('23', 'arqueocaja-permission', 'Cash Tonnage Permission');

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
('24', 'xml-permission', 'CFDI XML CRUD ACCESS '),
('25', 'listapagos-permission', 'Permission to payment complement CFDI4.0'),
('26', 'seriesfacturaelectronica-permission', 'CFDI Electronic Series '),
('27', 'cartasporte-permission', 'Permission to letter port'),
('28', 'ubicaciones-permission', 'Permission for locations letter port CFDI4.0'),
('29', 'remolques-permission', 'Permission for remolques letter port CFDI4.0');

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
('30', 'cartaporte-permission', 'Permiso para la lista de cartaporte'),
('31', 'sapservicelayer-permission', 'Permiso para la lista de sapservicelayer');

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `auth_reset_attempts`
--

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `auth_tokens`
--

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_users_permissions`
--

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('1', '5');

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
('1', '6'),
('1', '7'),
('1', '8'),
('1', '9'),
('1', '10'),
('1', '11');

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
('1', '12'),
('1', '13'),
('1', '14'),
('1', '15'),
('1', '16'),
('1', '17');

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
('1', '18'),
('1', '19'),
('1', '20'),
('1', '21'),
('1', '22'),
('1', '23');

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
('1', '24'),
('1', '25'),
('1', '26'),
('1', '27'),
('1', '27'),
('1', '27');

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
('1', '28'),
('1', '29'),
('1', '30'),
('1', '31'),
('2', '1');

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `SQLFile` varchar(256) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `backups`
--

--
-- Table structure for table `branchoffices`
--

CREATE TABLE `branchoffices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(8) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `cologne` varchar(64) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `postalCode` varchar(5) DEFAULT NULL,
  `timeDifference` varchar(4) DEFAULT NULL,
  `tax` varchar(4) DEFAULT NULL,
  `dateAp` date DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `companie` varchar(8) DEFAULT NULL,
  `arqueoCaja` varchar(5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branchoffices`
--

INSERT INTO `branchoffices` (`id`, `key`, `name`, `cologne`, `city`, `postalCode`, `timeDifference`, `tax`, `dateAp`, `phone`, `fax`, `companie`, `arqueoCaja`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', 'suc1', '1qqe', 'asd', '1', '81228', '', '', '2025-05-30', '', '', '1', 'on', '2025-05-30 09:09:55', '2025-05-30 09:09:55', null);

--
-- Table structure for table `cartaporte`
--

CREATE TABLE `cartaporte` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `idSucursal` bigint(20) DEFAULT NULL,
  `idCustumer` bigint(20) DEFAULT NULL,
  `folio` bigint(20) DEFAULT NULL,
  `idUser` bigint(20) DEFAULT NULL,
  `listProducts` text DEFAULT NULL,
  `taxes` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `subTotal` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `balance` decimal(18,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dateVen` date DEFAULT NULL,
  `quoteTo` varchar(512) DEFAULT NULL,
  `delivaryTime` varchar(512) DEFAULT NULL,
  `generalObservations` varchar(512) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `idQuote` int(11) DEFAULT NULL,
  `tipoComprobanteRD` int(11) DEFAULT NULL,
  `folioCombrobanteRD` bigint(11) DEFAULT NULL,
  `RFCReceptor` varchar(15) DEFAULT NULL,
  `usoCFDI` varchar(32) DEFAULT NULL,
  `metodoPago` varchar(32) DEFAULT NULL,
  `formaPago` varchar(32) DEFAULT NULL,
  `razonSocialReceptor` varchar(1024) DEFAULT NULL,
  `codigoPostalReceptor` varchar(5) DEFAULT NULL,
  `regimenFiscalReceptor` varchar(1024) DEFAULT NULL,
  `idVehiculo` bigint(20) DEFAULT NULL,
  `idChofer` bigint(20) DEFAULT NULL,
  `tipoVehiculo` bigint(20) DEFAULT NULL,
  `idArqueoCaja` bigint(20) DEFAULT NULL,
  `TranspInternac` varchar(2) DEFAULT NULL,
  `TotalDistRec` varchar(16) DEFAULT NULL,
  `IDUbicacionOrigen` varchar(16) DEFAULT NULL,
  `RFCRemitenteDestinatarioOrigen` varchar(16) DEFAULT NULL,
  `FechaHoraSalidaLlegadaOrigen` datetime DEFAULT NULL,
  `DistanciaRecorridaOrigen` varchar(16) DEFAULT NULL,
  `LocalidadOrigen` varchar(8) DEFAULT NULL,
  `ReferenciaOrigen` varchar(255) DEFAULT NULL,
  `MunicipioOrigen` varchar(16) DEFAULT NULL,
  `EstadoOrigen` varchar(16) DEFAULT NULL,
  `PaisOrigen` varchar(16) DEFAULT NULL,
  `CodigoPostalOrigen` varchar(5) DEFAULT NULL,
  `IDUbicacionDestino` varchar(16) DEFAULT NULL,
  `RFCRemitenteDestinatarioDestino` varchar(16) DEFAULT NULL,
  `FechaHoraSalidaLlegadaDestino` datetime DEFAULT NULL,
  `DistanciaRecorridaDestino` varchar(16) DEFAULT NULL,
  `LocalidadDestino` varchar(8) DEFAULT NULL,
  `ReferenciaDestino` varchar(255) DEFAULT NULL,
  `MunicipioDestino` varchar(16) DEFAULT NULL,
  `EstadoDestino` varchar(16) DEFAULT NULL,
  `PaisDestino` varchar(16) DEFAULT NULL,
  `CodigoPostalDestino` varchar(5) DEFAULT NULL,
  `PesoBrutoTotal` varchar(16) DEFAULT NULL,
  `UnidadPeso` varchar(16) DEFAULT NULL,
  `NumTotalMercancias` varchar(16) DEFAULT NULL,
  `TipoFigura` varchar(16) DEFAULT NULL,
  `RFCFigura` varchar(16) DEFAULT NULL,
  `NumLicencia` varchar(32) DEFAULT NULL,
  `NombreFigura` varchar(256) DEFAULT NULL,
  `MunicipioFigura` varchar(16) DEFAULT NULL,
  `EstadoFigura` varchar(16) DEFAULT NULL,
  `PaisFigura` varchar(16) DEFAULT NULL,
  `CodigoPostalFigura` varchar(5) DEFAULT NULL,
  `PermSCT` varchar(16) DEFAULT NULL,
  `NumPermisoSCT` varchar(32) DEFAULT NULL,
  `ConfigVehicular` varchar(16) DEFAULT NULL,
  `PesoBrutoVehicular` varchar(8) DEFAULT NULL,
  `PlacaVM` varchar(8) DEFAULT NULL,
  `AnioModeloVM` varchar(8) DEFAULT NULL,
  `AseguraRespCivil` varchar(256) DEFAULT NULL,
  `PolizaRespCivil` varchar(64) DEFAULT NULL,
  `SubTipoRem` varchar(16) DEFAULT NULL,
  `PlacaSubTipoRemolque` varchar(8) DEFAULT NULL,
  `ColoniaOrigen` varchar(128) DEFAULT NULL,
  `CalleOrigen` varchar(128) DEFAULT NULL,
  `numInteriorOrigen` varchar(32) DEFAULT NULL,
  `coloniaDestino` varchar(512) DEFAULT NULL,
  `calleDestino` varchar(512) DEFAULT NULL,
  `numInteriorDestino` varchar(512) DEFAULT NULL,
  `nombreRazonSocialUbicacionOrigen` varchar(512) DEFAULT NULL,
  `nombreRazonSocialUbicacionDestino` varchar(512) DEFAULT NULL,
  `listMercancias` text DEFAULT NULL,
  `remolqueCartaPorte` bigint(20) DEFAULT NULL,
  `numExteriorOrigen` varchar(16) DEFAULT NULL,
  `numExteriorDestino` varchar(16) DEFAULT NULL,
  `apellidoFigura` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `AseguraMedAmbiente` varchar(64) DEFAULT NULL,
  `PolizaMedAmbiente` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `cartaporte`
--

--
-- Table structure for table `cartaportedetails`
--

CREATE TABLE `cartaportedetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idCartaPorte` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `unidad` varchar(64) DEFAULT NULL,
  `claveProductoSAT` varchar(64) DEFAULT NULL,
  `claveUnidadSAT` varchar(64) DEFAULT NULL,
  `codeProduct` varchar(32) DEFAULT NULL,
  `cant` decimal(18,0) DEFAULT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `lote` varchar(64) DEFAULT NULL,
  `porcentTax` decimal(18,0) DEFAULT NULL,
  `porcentIVARetenido` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `porcentISRRetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `tax` decimal(18,0) DEFAULT NULL,
  `neto` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `cartaportedetails`
--

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `clave` varchar(8) DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `categorias`
--

--
-- Table structure for table `choferes`
--

CREATE TABLE `choferes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `nombre` varchar(512) DEFAULT NULL,
  `Apellido` varchar(512) DEFAULT NULL,
  `tipoFigura` varchar(8) DEFAULT NULL,
  `RFCFigura` varchar(16) DEFAULT NULL,
  `numLicencia` varchar(32) DEFAULT NULL,
  `MunicipioFigura` varchar(16) DEFAULT NULL,
  `EstadoFigura` varchar(8) DEFAULT NULL,
  `PaisFigura` varchar(32) DEFAULT NULL,
  `CodigoPostalFigura` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `choferes`
--

--
-- Table structure for table `comprobantes_rd`
--

CREATE TABLE `comprobantes_rd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `tipoDocumento` varchar(4) NOT NULL,
  `prefijo` varchar(8) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `folioInicial` int(11) NOT NULL,
  `folioFinal` int(11) NOT NULL,
  `folioActual` int(11) DEFAULT NULL,
  `desdeFecha` date NOT NULL,
  `hastaFecha` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `comprobantes_rd`
--

--
-- Table structure for table `custumers`
--

CREATE TABLE `custumers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `razonSocial` varchar(512) DEFAULT NULL,
  `taxID` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `direction` varchar(1024) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `formaPago` varchar(16) DEFAULT NULL,
  `metodoPago` varchar(16) DEFAULT NULL,
  `usoCFDI` varchar(16) DEFAULT NULL,
  `codigoPostal` int(11) NOT NULL,
  `regimenFiscal` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `custumers`
--

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `rfc` varchar(14) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `correoElectronico` varchar(256) DEFAULT NULL,
  `diasEntrega` varchar(8) DEFAULT NULL,
  `caja` varchar(255) DEFAULT NULL,
  `logo` varchar(1024) DEFAULT NULL,
  `certificado` varchar(1024) DEFAULT NULL,
  `archivoKey` varchar(68) DEFAULT NULL,
  `contraCertificado` varchar(68) DEFAULT NULL,
  `regimenFiscal` varchar(68) DEFAULT NULL,
  `razonSocial` varchar(68) DEFAULT NULL,
  `codigoPostal` varchar(68) DEFAULT NULL,
  `CURP` varchar(68) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `smtpDebug` varchar(32) DEFAULT NULL,
  `SMTPAuth` varchar(32) DEFAULT NULL,
  `smptSecurity` varchar(16) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `pass` varchar(256) DEFAULT NULL,
  `facturacionRD` varchar(4) NOT NULL,
  `certificadoCSD` varchar(1024) DEFAULT NULL,
  `archivoKeyCSD` varchar(1024) DEFAULT NULL,
  `contraCertificadoCSD` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`, `direccion`, `rfc`, `telefono`, `correoElectronico`, `diasEntrega`, `caja`, `logo`, `certificado`, `archivoKey`, `contraCertificado`, `regimenFiscal`, `razonSocial`, `codigoPostal`, `CURP`, `email`, `host`, `smtpDebug`, `SMTPAuth`, `smptSecurity`, `port`, `pass`, `facturacionRD`, `certificadoCSD`, `archivoKeyCSD`, `contraCertificadoCSD`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', 'GUSA', 'Direccion', 'rfc', 'Telefono', 'asd@asd.com', null, null, null, null, null, '', '601', 'empresa', '81210', 'CGU840103SZ5', '', '', '0', '0', 'null', '0', '', 'off', '', null, 'CGUSZ510', '2024-12-28 20:05:27', '2025-03-13 12:43:27', null);

--
-- Table structure for table `enlacexml`
--

CREATE TABLE `enlacexml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idDocumento` bigint(20) NOT NULL,
  `uuidXML` varchar(36) NOT NULL,
  `tipo` varchar(16) NOT NULL,
  `importe` decimal(18,0) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `enlacexml`
--

--
-- Table structure for table `groups_menu`
--

CREATE TABLE `groups_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `menu_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `groups_menu_menu_id_foreign` (`menu_id`),
  KEY `groups_menu_group_id_foreign` (`group_id`),
  KEY `id_group_id_menu_id` (`id`,`group_id`,`menu_id`),
  CONSTRAINT `groups_menu_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `groups_menu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups_menu`
--

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('1', '1', '1'),
('2', '1', '2'),
('3', '1', '3'),
('4', '1', '4'),
('5', '1', '5');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('6', '1', '6'),
('7', '1', '7'),
('8', '2', '1'),
('9', '2', '2'),
('10', '2', '3'),
('11', '1', '8');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('12', '1', '9'),
('13', '1', '10'),
('15', '1', '11'),
('16', '1', '12'),
('18', '1', '13'),
('19', '1', '14');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('20', '2', '14'),
('21', '1', '15'),
('22', '2', '15'),
('23', '1', '16'),
('24', '2', '16'),
('25', '1', '17');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('26', '1', '18'),
('27', '2', '18'),
('28', '1', '19'),
('29', '1', '20'),
('30', '2', '20'),
('31', '1', '21');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('32', '2', '21'),
('35', '1', '23'),
('36', '2', '23'),
('37', '1', '22'),
('38', '2', '22'),
('39', '1', '24');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('40', '2', '24'),
('41', '1', '25'),
('42', '2', '25'),
('43', '1', '26'),
('44', '2', '26'),
('45', '1', '27');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('46', '2', '27'),
('47', '1', '28'),
('48', '2', '28'),
('49', '1', '29'),
('50', '2', '29'),
('51', '1', '30');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('52', '2', '30'),
('53', '1', '31'),
('54', '2', '31'),
('55', '1', '32'),
('56', '2', '32'),
('57', '1', '33');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('58', '2', '33'),
('59', '1', '34'),
('60', '2', '34'),
('61', '1', '35'),
('62', '2', '35'),
('63', '1', '36');

INSERT INTO `groups_menu` (`id`, `group_id`, `menu_id`) VALUES
('64', '2', '36'),
('65', '1', '37'),
('66', '2', '37'),
('67', '1', '38'),
('68', '2', '38');

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `idTipoInventario` int(11) DEFAULT NULL,
  `idStorage` int(11) DEFAULT NULL,
  `tipoES` varchar(3) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `idUser` bigint(11) DEFAULT NULL,
  `listProducts` text DEFAULT NULL,
  `taxes` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `subTotal` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `balance` decimal(18,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dateVen` date DEFAULT NULL,
  `quoteTo` varchar(512) DEFAULT NULL,
  `delivaryTime` varchar(512) DEFAULT NULL,
  `generalObservations` varchar(512) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `idOrdenCompra` int(11) DEFAULT NULL,
  `metodoPago` varchar(32) DEFAULT NULL,
  `formaPago` varchar(32) DEFAULT NULL,
  `razonSocialReceptor` varchar(1024) DEFAULT NULL,
  `codigoPostalReceptor` varchar(5) DEFAULT NULL,
  `regimenFiscalReceptor` varchar(32) DEFAULT NULL,
  `RFCReceptor` varchar(16) DEFAULT NULL,
  `usoCFDI` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `inventory`
--

--
-- Table structure for table `inventorydetails`
--

CREATE TABLE `inventorydetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idInventory` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `unidad` varchar(64) DEFAULT NULL,
  `claveProductoSAT` varchar(64) DEFAULT NULL,
  `claveUnidadSAT` varchar(64) DEFAULT NULL,
  `codeProduct` varchar(32) DEFAULT NULL,
  `lote` varchar(64) DEFAULT NULL,
  `cant` decimal(18,0) DEFAULT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `porcentTax` decimal(18,0) DEFAULT NULL,
  `porcentIVARetenido` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `porcentISRRetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `tax` decimal(18,0) DEFAULT NULL,
  `neto` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `inventorydetails`
--

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `user` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `description`, `user`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', 'vehicles.logDescription{\"idBranchoffices\":\"0\",\"key\":\"suc1\",\"name\":\"1qqe\",\"cologne\":\"asd\",\"city\":\"1\",\"postalCode\":\"81228\",\"timeDifference\":\"\",\"tax\":\"\",\"dateAp\":\"2025-05-30\",\"phone\":\"\",\"fax\":\"\",\"companie\":\"1\",\"arqueoCaja\":\"on\"}', 'admin', '2025-05-30 09:09:55', '2025-05-30 09:09:55', null),
('2', 'vehicles.logDescription{\"idSeriesfacturaelectronica\":\"0\",\"idEmpresa\":\"1\",\"sucursal\":\"1\",\"tipoSerie\":\"ven\",\"serie\":\"a\",\"desdeFecha\":\"1990-02-01\",\"hastaFecha\":\"2028-05-30\",\"desdeFolio\":\"1\",\"hastaFolio\":\"2048\",\"ambienteTimbrado\":\"off\",\"tokenPruebas\":\"\",\"tokenProduccion\":\"\"}', 'admin', '2025-05-30 15:29:58', '2025-05-30 15:29:58', null),
('3', 'seriesfacturaelectronica.logUpdated{\"idSeriesfacturaelectronica\":\"1\",\"idEmpresa\":\"1\",\"sucursal\":\"1\",\"tipoSerie\":\"ven\",\"serie\":\"a\",\"desdeFecha\":\"1990-02-01\",\"hastaFecha\":\"2028-05-30\",\"desdeFolio\":\"1\",\"hastaFolio\":\"2048\",\"ambienteTimbrado\":\"on\",\"tokenPruebas\":\"\",\"tokenProduccion\":\"\"}', 'admin', '2025-05-30 15:33:54', '2025-05-30 15:33:54', null),
('4', 'seriesfacturaelectronica.logUpdated{\"idSeriesfacturaelectronica\":\"1\",\"idEmpresa\":\"1\",\"sucursal\":\"1\",\"tipoSerie\":\"ven\",\"serie\":\"a\",\"desdeFecha\":\"1990-02-01\",\"hastaFecha\":\"2028-05-30\",\"desdeFolio\":\"1\",\"hastaFolio\":\"2048\",\"ambienteTimbrado\":\"on\",\"tokenPruebas\":\"\",\"tokenProduccion\":\"\"}', 'admin', '2025-05-30 15:57:02', '2025-05-30 15:57:02', null);

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(55) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('1', '0', '1', 'Dashboard', 'fas fa-tachometer-alt', 'admin', '1', '2024-12-29 02:37:20', '2025-03-12 19:07:18'),
('2', '0', '1', 'User Management', 'fas fa-user', '#', '23', '2024-12-29 02:37:20', '2025-03-12 19:07:18'),
('3', '2', '1', 'User Profile', 'fas fa-user-edit', 'admin/user/profile', '24', '2024-12-29 02:37:20', '2025-03-12 19:07:18'),
('4', '2', '1', 'Users', 'fas fa-users', 'admin/user/manage', '25', '2024-12-29 02:37:20', '2025-03-12 19:07:18'),
('5', '2', '1', 'Permissions', 'fas fa-user-lock', 'admin/permission', '26', '2024-12-29 02:37:20', '2025-03-12 19:07:18');

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('6', '2', '1', 'Roles', 'fas fa-users-cog', 'admin/role', '27', '2024-12-29 02:37:20', '2025-03-12 19:07:18'),
('7', '2', '1', 'Menu', 'fas fa-stream', 'admin/menu', '28', '2024-12-29 02:37:20', '2025-03-12 19:07:18'),
('8', '0', '1', 'Configuraciones', 'fas fa-cogs', '#', '29', '2024-12-29 02:51:11', '2025-03-12 19:07:18'),
('9', '8', '1', 'Bitacora', 'fas fa-bars', 'admin/log', '30', '2024-12-29 02:52:31', '2025-03-12 19:07:18'),
('10', '8', '1', 'Empresas', 'fas fa-building', 'admin/empresas', '31', '2024-12-29 02:53:54', '2025-03-12 19:07:18'),
('11', '8', '1', 'Globales', 'fas fa-globe-asia', 'admin/settings', '32', '2024-12-29 03:08:09', '2025-03-12 19:07:18');

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('12', '8', '1', 'Respaldos', 'fas fa-database', 'admin/backups', '33', '2025-01-07 21:02:47', '2025-03-12 19:07:18'),
('13', '8', '1', 'Sucursales', 'fas fa-hotel', 'admin/branchoffices', '34', '2025-01-08 20:32:40', '2025-03-12 19:07:18'),
('14', '0', '1', 'Inventarios', 'fas fa-boxes', '#', '11', '2025-01-08 20:44:50', '2025-03-12 19:07:18'),
('15', '14', '1', 'Categorias', 'fas fa-list', 'admin/categorias', '12', '2025-01-08 20:45:56', '2025-03-12 19:07:18'),
('16', '14', '1', 'Productos', 'fas fa-box-open', 'admin/products', '13', '2025-01-08 20:48:02', '2025-03-12 19:07:18'),
('17', '14', '1', 'Almacenes', 'fas fa-store-alt', 'admin/storages', '14', '2025-01-12 05:03:59', '2025-03-12 19:07:18');

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('18', '14', '1', 'Proveedores', 'fas fa-user-friends', 'admin/proveedores', '15', '2025-02-10 02:08:36', '2025-03-12 19:07:18'),
('19', '14', '1', 'Tipos de movimiento', 'fas fa-adjust', 'admin/tipos_movimientos_inventario', '16', '2025-02-10 04:19:17', '2025-03-12 19:07:18'),
('20', '14', '1', 'Clientes', 'fas fa-users', 'admin/custumers', '17', '2025-02-10 21:13:12', '2025-03-12 19:07:18'),
('21', '14', '1', 'Inventarios', 'fas fa-box-open', 'admin/inventory', '18', '2025-02-10 21:16:34', '2025-03-12 19:07:18'),
('22', '0', '1', 'Cotizaciones', 'fas fa-book-reader', '#', '2', '2025-02-11 04:06:37', '2025-03-12 19:07:18'),
('23', '22', '1', 'Lista Cotizaciones', 'fas fa-headset', 'admin/quotes', '3', '2025-02-11 04:07:22', '2025-03-12 19:07:18');

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('24', '0', '1', 'Ventas', 'fab fa-sellcast', '#', '4', '2025-02-12 21:03:48', '2025-03-12 19:07:18'),
('25', '24', '1', 'Lista de Ventas', 'fas fa-list', 'admin/sells', '5', '2025-02-12 21:12:01', '2025-03-12 19:07:18'),
('26', '0', '1', 'Vehiculos', 'fas fa-shuttle-van', '#', '19', '2025-02-12 21:15:08', '2025-03-12 19:07:18'),
('27', '26', '1', 'Tipo Vehiculo', 'fas fa-list', 'admin/tipovehiculo', '20', '2025-02-12 21:16:24', '2025-03-12 19:07:18'),
('28', '26', '1', 'Lista de Vehiculos', 'fas fa-car', 'admin/vehiculos', '21', '2025-02-12 21:17:36', '2025-03-12 19:07:18'),
('29', '26', '1', 'Lista de Choferes', 'fas fa-users', 'admin/choferes', '22', '2025-02-12 21:20:40', '2025-03-12 19:07:18');

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('30', '24', '1', 'Arqueo de Caja', 'fas fa-clipboard-check', 'admin/arqueoCaja', '6', '2025-02-16 04:01:27', '2025-03-12 19:07:18'),
('31', '0', '1', 'Factura CFDI', 'fas fa-stamp', '#', '8', '2025-02-16 04:09:41', '2025-03-12 19:07:18'),
('32', '31', '1', 'Lista CFDI', 'fas fa-file-pdf', 'admin/xml', '9', '2025-02-16 04:10:29', '2025-03-12 19:07:18'),
('33', '24', '1', 'List Comp Pago', 'fas fa-list', 'admin/listCompPag', '7', '2025-02-16 04:13:44', '2025-03-12 19:07:18'),
('34', '8', '1', 'Series Electronicas CFDI', 'fas fa-vote-yea', 'admin/seriesfacturaelectronica', '35', '2025-02-16 04:19:14', '2025-03-12 19:07:18'),
('35', '0', '1', 'Envios', 'fas fa-car-alt', '#', '10', '2025-03-12 19:06:33', '2025-03-12 19:07:18');

INSERT INTO `menu` (`id`, `parent_id`, `active`, `title`, `icon`, `route`, `sequence`, `created_at`, `updated_at`) VALUES
('36', '35', '1', 'Carta Porte', 'fas fa-share-square', 'admin/cartasPorte', '36', '2025-03-12 19:15:28', '2025-03-12 19:15:28'),
('37', '35', '1', 'Ubicaciones', 'fas fa-location-arrow', 'admin/ubicaciones', '37', '2025-03-12 19:19:45', '2025-03-12 19:19:45'),
('38', '8', '1', 'SAP Service Layer', 'fas fa-plug', 'admin/sapservicelayer', '38', '2025-03-31 19:23:45', '2025-03-31 19:23:45');

--
-- Table structure for table `mercanciascartaporte`
--

CREATE TABLE `mercanciascartaporte` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idCartaPorte` bigint(20) DEFAULT NULL,
  `bienesTransp` varchar(16) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `cantidad` decimal(18,0) DEFAULT NULL,
  `claveUnidad` varchar(8) DEFAULT NULL,
  `unidad` varchar(16) DEFAULT NULL,
  `materialPeligroso` varchar(2) DEFAULT NULL,
  `pesoEnKg` decimal(18,0) DEFAULT NULL,
  `cantidadTransporta` decimal(18,0) DEFAULT NULL,
  `IDOrigenMercancia` varchar(16) DEFAULT NULL,
  `IDDestinoMercancia` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `claveMaterialPeligroso` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `mercanciascartaporte`
--

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('1', '2017-11-20-223112', 'App\\Database\\Migrations\\CreateAuthTables', 'default', 'App', '1748621170', '1'),
('2', '2020-02-03-081118', 'App\\Database\\Migrations\\CreateMenuTable', 'default', 'App', '1748621170', '1'),
('3', '2023-02-02-193406', 'App\\Database\\Migrations\\Userfields', 'default', 'App', '1748621170', '1'),
('4', '2023-02-14110147', 'App\\Database\\Migrations\\Branchoffices', 'default', 'App', '1748621170', '1'),
('5', '2023-04-20051528', 'App\\Database\\Migrations\\Categorias', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('6', '2023-04-21063336', 'App\\Database\\Migrations\\Proveedores', 'default', 'App', '1748621170', '1'),
('7', '2023-04-28180544', 'App\\Database\\Migrations\\Storages', 'default', 'App', '1748621170', '1'),
('8', '2023-05-06063336', 'App\\Database\\Migrations\\ChangeIdEmpresaProveedores', 'default', 'App', '1748621170', '1'),
('9', '2023-05-30192621', 'App\\Database\\Migrations\\Usuariosempresa', 'default', 'App', '1748621170', '1'),
('10', '2023-05-30192622', 'App\\Database\\Migrations\\UsuariosAlmacen', 'default', 'App', '1748621170', '1'),
('11', '2023-08-17222335', 'App\\Database\\Migrations\\Tipos_movimientos_inventario', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('12', '2023-08-31154316', 'App\\Database\\Migrations\\Saldos', 'default', 'App', '1748621170', '1'),
('13', '2023-09-06192623', 'App\\Database\\Migrations\\UsuariosSucursal', 'default', 'App', '1748621170', '1'),
('14', '2024-03-15100147', 'App\\Database\\Migrations\\Log', 'default', 'App', '1748621170', '1'),
('15', '2024-10-18122114', 'App\\Database\\Migrations\\Backups', 'default', 'App', '1748621170', '1'),
('16', '2024-11-12164212', 'App\\Database\\Migrations\\settings', 'default', 'App', '1748621170', '1'),
('17', '2024-11-24203351', 'App\\Database\\Migrations\\Empresas', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('18', '2024-11-30120819', 'App\\Database\\Migrations\\Products', 'default', 'App', '1748621170', '1'),
('19', '2024-12-02125006', 'App\\Database\\Migrations\\Custumers', 'default', 'App', '1748621170', '1'),
('20', '2024-12-10105631', 'App\\Database\\Migrations\\Inventory', 'default', 'App', '1748621170', '1'),
('21', '2024-12-10105950', 'App\\Database\\Migrations\\Inventorydetails', 'default', 'App', '1748621170', '1'),
('22', '2024-12-18093124', 'App\\Database\\Migrations\\Quotes', 'default', 'App', '1748621170', '1'),
('23', '2024-12-18093224', 'App\\Database\\Migrations\\Quotesdetails', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('24', '2024-12-19120652', 'App\\Database\\Migrations\\Sells', 'default', 'App', '1748621170', '1'),
('25', '2024-12-19120724', 'App\\Database\\Migrations\\Sellsdetails', 'default', 'App', '1748621170', '1'),
('26', '2024-12-19164526', 'App\\Database\\Migrations\\Comprobantes_rd', 'default', 'App', '1748621170', '1'),
('27', '2024-12-20170324', 'App\\Database\\Migrations\\Vehiculos', 'default', 'App', '1748621170', '1'),
('28', '2024-12-23092915', 'App\\Database\\Migrations\\Tipovehiculo', 'default', 'App', '1748621170', '1'),
('29', '2024-12-23122832', 'App\\Database\\Migrations\\Choferes', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('30', '2024-12-23162520', 'App\\Database\\Migrations\\Enlacexml', 'default', 'App', '1748621170', '1'),
('31', '2024-12-23163302', 'App\\Database\\Migrations\\Payments', 'default', 'App', '1748621170', '1'),
('32', '2024-12-23173343', 'App\\Database\\Migrations\\Arqueocaja', 'default', 'App', '1748621170', '1'),
('33', '2025-01-16123331', 'App\\Database\\Migrations\\Xml', 'default', 'App', '1748621170', '1'),
('34', '2025-01-21101209', 'App\\Database\\Migrations\\Seriesfacturaelectronica', 'default', 'App', '1748621170', '1'),
('35', '2025-01-28101227', 'App\\Database\\Migrations\\Pagos', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('36', '2025-01-31115054', 'App\\Database\\Migrations\\Ubicaciones', 'default', 'App', '1748621170', '1'),
('37', '2025-02-06120152', 'App\\Database\\Migrations\\Remolques', 'default', 'App', '1748621170', '1'),
('38', '2025-03-03093245', 'App\\Database\\Migrations\\Cartaporte', 'default', 'App', '1748621170', '1'),
('39', '2025-03-03093346', 'App\\Database\\Migrations\\Cartaportedetails', 'default', 'App', '1748621170', '1'),
('40', '2025-03-03093400', 'App\\Database\\Migrations\\Mercanciascartaporte', 'default', 'App', '1748621170', '1'),
('41', '2025-03-03093400', 'App\\Database\\Migrations\\MercanciascartaporteMaterialPeligroso', 'default', 'App', '1748621170', '1');

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
('42', '2025-03-24093400', 'App\\Database\\Migrations\\AutotransporteSeguroAmbiental', 'default', 'App', '1748621170', '1'),
('43', '2025-03-31125217', 'App\\Database\\Migrations\\Sapservicelayer', 'default', 'App', '1748621170', '1'),
('44', '2025-05-02100147', 'App\\Database\\Migrations\\AlterLogTableDescription', 'default', 'App', '1748621170', '1'),
('45', '2025-05-28180544', 'App\\Database\\Migrations\\UpdateIdEmpresaInStorages', 'default', 'App', '1748621170', '1');

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `idSucursal` bigint(20) DEFAULT NULL,
  `idCustumer` bigint(20) DEFAULT NULL,
  `folio` bigint(20) DEFAULT NULL,
  `idUser` bigint(20) DEFAULT NULL,
  `listPagos` text DEFAULT NULL,
  `taxes` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `subTotal` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `balance` decimal(18,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dateVen` date DEFAULT NULL,
  `quoteTo` varchar(512) DEFAULT NULL,
  `delivaryTime` varchar(512) DEFAULT NULL,
  `generalObservations` varchar(512) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `idQuote` int(11) DEFAULT NULL,
  `tipoComprobanteRD` int(11) DEFAULT NULL,
  `folioCombrobanteRD` bigint(11) DEFAULT NULL,
  `RFCReceptor` varchar(15) DEFAULT NULL,
  `usoCFDI` varchar(32) DEFAULT NULL,
  `metodoPago` varchar(32) DEFAULT NULL,
  `formaPago` varchar(32) DEFAULT NULL,
  `regimenFiscalReceptor` varchar(1024) DEFAULT NULL,
  `razonSocialReceptor` varchar(1024) DEFAULT NULL,
  `codigoPostalReceptor` varchar(5) DEFAULT NULL,
  `idVehiculo` bigint(20) DEFAULT NULL,
  `idChofer` bigint(20) DEFAULT NULL,
  `tipoVehiculo` bigint(20) DEFAULT NULL,
  `idArqueoCaja` bigint(20) DEFAULT NULL,
  `noCTAOrdenante` varchar(64) DEFAULT NULL,
  `noCTABeneficiario` varchar(64) DEFAULT NULL,
  `RFCCTAOrdenante` varchar(64) DEFAULT NULL,
  `RFCCTABeneficiario` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `pagos`
--

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idSell` bigint(20) NOT NULL,
  `importPayment` decimal(18,0) NOT NULL,
  `importBack` decimal(18,0) NOT NULL,
  `datePayment` datetime NOT NULL,
  `metodPayment` varchar(32) NOT NULL,
  `idComplemento` bigint(20) NOT NULL,
  `observaciones` varchar(2048) DEFAULT NULL,
  `idNotaCredito` bigint(20) DEFAULT NULL,
  `tipo` varchar(5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `payments`
--

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `idCategory` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `barcode` varchar(64) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `stock` decimal(18,0) DEFAULT NULL,
  `validateStock` varchar(4) DEFAULT NULL,
  `inventarioRiguroso` varchar(4) NOT NULL,
  `buyPrice` decimal(18,0) DEFAULT NULL,
  `salePrice` decimal(18,0) DEFAULT NULL,
  `porcentSale` int(11) DEFAULT NULL,
  `porcentTax` int(11) DEFAULT NULL,
  `porcentIVARetenido` decimal(18,0) DEFAULT NULL,
  `porcentISRRetenido` decimal(18,0) DEFAULT NULL,
  `routeImage` varchar(256) DEFAULT NULL,
  `unidadSAT` varchar(32) DEFAULT NULL,
  `claveProductoSAT` varchar(32) DEFAULT NULL,
  `nombreUnidadSAT` varchar(64) DEFAULT NULL,
  `nombreClaveProducto` varchar(256) DEFAULT NULL,
  `unidad` varchar(64) NOT NULL,
  `tasaExcenta` varchar(16) DEFAULT NULL,
  `inmuebleOcupado` varchar(16) DEFAULT NULL,
  `predial` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `products`
--

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `razonSocial` varchar(512) DEFAULT NULL,
  `taxID` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `direction` varchar(1024) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `formaPago` varchar(16) DEFAULT NULL,
  `metodoPago` varchar(16) DEFAULT NULL,
  `usoCFDI` varchar(16) DEFAULT NULL,
  `codigoPostal` int(11) unsigned NOT NULL,
  `regimenFiscal` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `proveedores`
--

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `idSucursal` bigint(20) NOT NULL,
  `folio` int(11) NOT NULL,
  `idCustumer` int(11) DEFAULT NULL,
  `idUser` bigint(11) DEFAULT NULL,
  `listProducts` text DEFAULT NULL,
  `taxes` decimal(18,0) DEFAULT NULL,
  `subTotal` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dateVen` date DEFAULT NULL,
  `quoteTo` varchar(512) DEFAULT NULL,
  `delivaryTime` varchar(512) DEFAULT NULL,
  `generalObservations` varchar(512) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `IVARetenido` decimal(18,0) NOT NULL,
  `ISRRetenido` decimal(18,0) NOT NULL,
  `idSell` bigint(20) NOT NULL,
  `RFCReceptor` varchar(16) DEFAULT NULL,
  `usoCFDI` varchar(32) DEFAULT NULL,
  `metodoPago` varchar(32) DEFAULT NULL,
  `formaPago` varchar(32) DEFAULT NULL,
  `razonSocialReceptor` varchar(1024) DEFAULT NULL,
  `codigoPostalReceptor` varchar(5) DEFAULT NULL,
  `regimenFiscalReceptor` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `quotes`
--

--
-- Table structure for table `quotesdetails`
--

CREATE TABLE `quotesdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idQuote` bigint(20) DEFAULT NULL,
  `idAlmacen` bigint(20) DEFAULT NULL,
  `lote` varchar(64) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `claveProductoSAT` varchar(64) NOT NULL,
  `claveUnidadSAT` varchar(64) NOT NULL,
  `codeProduct` varchar(32) DEFAULT NULL,
  `cant` decimal(18,0) DEFAULT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `porcentTax` decimal(18,0) DEFAULT NULL,
  `tax` decimal(18,0) DEFAULT NULL,
  `porcentIVARetenido` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `porcentISRRetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `neto` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `unidad` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `quotesdetails`
--

--
-- Table structure for table `remolques`
--

CREATE TABLE `remolques` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `descripcion` varchar(64) DEFAULT NULL,
  `subTipoRemolque` varchar(32) DEFAULT NULL,
  `placa` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `remolques`
--

--
-- Table structure for table `saldos`
--

CREATE TABLE `saldos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `idAlmacen` bigint(20) NOT NULL,
  `lote` varchar(128) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `codigoProducto` varchar(64) NOT NULL,
  `descripcion` varchar(1024) NOT NULL,
  `cantidad` decimal(18,0) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `saldos`
--

--
-- Table structure for table `sapservicelayer`
--

CREATE TABLE `sapservicelayer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `companyDB` varchar(128) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `sapservicelayer`
--

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `idSucursal` bigint(20) NOT NULL,
  `idCustumer` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `idUser` bigint(11) DEFAULT NULL,
  `listProducts` text DEFAULT NULL,
  `taxes` decimal(18,0) DEFAULT NULL,
  `subTotal` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `balance` decimal(18,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dateVen` date DEFAULT NULL,
  `quoteTo` varchar(512) DEFAULT NULL,
  `delivaryTime` varchar(512) DEFAULT NULL,
  `generalObservations` varchar(512) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `idQuote` int(11) DEFAULT NULL,
  `IVARetenido` decimal(18,0) NOT NULL,
  `ISRRetenido` decimal(18,0) NOT NULL,
  `tipoComprobanteRD` varchar(4) NOT NULL,
  `folioComprobanteRD` bigint(20) NOT NULL,
  `RFCReceptor` varchar(16) DEFAULT NULL,
  `usoCFDI` varchar(32) DEFAULT NULL,
  `metodoPago` varchar(32) DEFAULT NULL,
  `formaPago` varchar(32) DEFAULT NULL,
  `razonSocialReceptor` varchar(1024) DEFAULT NULL,
  `codigoPostalReceptor` varchar(5) DEFAULT NULL,
  `regimenFiscalReceptor` varchar(32) NOT NULL,
  `idVehiculo` bigint(20) DEFAULT NULL,
  `idChofer` bigint(20) DEFAULT NULL,
  `tipoVehiculo` varchar(64) DEFAULT NULL,
  `idArqueoCaja` bigint(20) DEFAULT NULL,
  `esFacturaGlobal` varchar(8) DEFAULT NULL,
  `periodicidad` varchar(8) DEFAULT NULL,
  `mes` varchar(8) DEFAULT NULL,
  `anio` varchar(4) DEFAULT NULL,
  `tasaCero` decimal(18,0) DEFAULT NULL,
  `tipoDocumentoRelacionado` varchar(5) DEFAULT NULL,
  `UUIDRelacion` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `sells`
--

--
-- Table structure for table `sellsdetails`
--

CREATE TABLE `sellsdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idSell` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `lote` varchar(64) DEFAULT NULL,
  `idAlmacen` bigint(20) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `claveProductoSAT` varchar(64) NOT NULL,
  `claveUnidadSAT` varchar(64) NOT NULL,
  `codeProduct` varchar(32) DEFAULT NULL,
  `cant` decimal(18,0) DEFAULT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `porcentTax` decimal(18,0) DEFAULT NULL,
  `tax` decimal(18,0) DEFAULT NULL,
  `porcentIVARetenido` decimal(18,0) DEFAULT NULL,
  `IVARetenido` decimal(18,0) DEFAULT NULL,
  `porcentISRRetenido` decimal(18,0) DEFAULT NULL,
  `ISRRetenido` decimal(18,0) DEFAULT NULL,
  `neto` decimal(18,0) DEFAULT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `unidad` varchar(64) NOT NULL,
  `tasaCero` varchar(16) DEFAULT NULL,
  `importeExento` decimal(18,0) DEFAULT NULL,
  `predial` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `sellsdetails`
--

--
-- Table structure for table `seriesfacturaelectronica`
--

CREATE TABLE `seriesfacturaelectronica` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `sucursal` bigint(20) NOT NULL,
  `tipoSerie` varchar(16) NOT NULL,
  `serie` varchar(16) NOT NULL,
  `desdeFecha` date NOT NULL,
  `hastaFecha` date NOT NULL,
  `desdeFolio` bigint(20) NOT NULL,
  `hastaFolio` bigint(20) NOT NULL,
  `ambienteTimbrado` varchar(32) NOT NULL,
  `tokenPruebas` text NOT NULL,
  `tokenProduccion` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seriesfacturaelectronica`
--

INSERT INTO `seriesfacturaelectronica` (`id`, `idEmpresa`, `sucursal`, `tipoSerie`, `serie`, `desdeFecha`, `hastaFecha`, `desdeFolio`, `hastaFolio`, `ambienteTimbrado`, `tokenPruebas`, `tokenProduccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', '1', '1', 'ven', 'a', '1990-02-01', '2028-05-30', '1', '2048', 'on', '', '', '2025-05-30 15:29:58', '2025-05-30 15:57:02', null);

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nameCompanie` varchar(256) DEFAULT NULL,
  `idTax` varchar(256) DEFAULT NULL,
  `phoneNumber` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `direction` varchar(256) DEFAULT NULL,
  `languaje` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `nameCompanie`, `idTax`, `phoneNumber`, `email`, `direction`, `languaje`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', 'asdsss', '123', '123', 'asd@asd.com', null, 'es', '2025-05-30 19:55:26', '2025-05-30 19:55:34', null);

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) unsigned DEFAULT NULL,
  `code` varchar(16) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `brachoffice` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `costCenter` int(11) DEFAULT NULL,
  `exist` int(11) DEFAULT NULL,
  `list` int(11) DEFAULT NULL,
  `main` varchar(16) DEFAULT NULL,
  `inicioOperacion` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `storages`
--

--
-- Table structure for table `tipos_movimientos_inventario`
--

CREATE TABLE `tipos_movimientos_inventario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `tipo` varchar(3) DEFAULT NULL,
  `esTraspaso` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `tipos_movimientos_inventario`
--

--
-- Table structure for table `tipovehiculo`
--

CREATE TABLE `tipovehiculo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `codigo` varchar(16) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `tipovehiculo`
--

--
-- Table structure for table `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) NOT NULL,
  `calle` text DEFAULT NULL,
  `numInterior` varchar(32) DEFAULT NULL,
  `numExterior` varchar(32) DEFAULT NULL,
  `colonia` varchar(16) DEFAULT NULL,
  `localidad` varchar(16) DEFAULT NULL,
  `referencia` varchar(256) DEFAULT NULL,
  `municipio` varchar(16) DEFAULT NULL,
  `estado` varchar(16) DEFAULT NULL,
  `pais` varchar(16) DEFAULT NULL,
  `codigoPostal` varchar(16) DEFAULT NULL,
  `descripcion` varchar(1024) DEFAULT NULL,
  `RFCRemitenteDestinatario` varchar(16) DEFAULT NULL,
  `nombreRazonSocial` varchar(1024) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `ubicaciones`
--

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`, `firstname`, `lastname`) VALUES
('1', 'admin@admin.com', 'admin', '$2y$10$PkdkKi9.RJtOD2oKHT9vYupjVh6QymnmYH5R9yAmjIKpSuwmnu9HW', null, null, null, null, null, null, '1', '0', '2025-05-30 16:07:20', '2025-05-30 16:07:20', null, null, null),
('2', 'user@user.com', 'user', '$2y$10$N/putIfssurkQtCIovke7OO5Z.IgcMVnYg.8ika306hBmVWZxJsa.', null, null, null, null, null, null, '1', '0', '2025-05-30 16:07:20', '2025-05-30 16:07:20', null, null, null);

--
-- Table structure for table `usuarios_almacen`
--

CREATE TABLE `usuarios_almacen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `idStorage` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `usuarios_almacen`
--

--
-- Table structure for table `usuarios_sucursal`
--

CREATE TABLE `usuarios_sucursal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios_sucursal`
--

INSERT INTO `usuarios_sucursal` (`id`, `idEmpresa`, `idSucursal`, `idUsuario`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', '1', '1', '1', 'on', '2025-05-30 10:21:23', '2025-05-30 10:21:23', null);

--
-- Table structure for table `usuariosempresa`
--

CREATE TABLE `usuariosempresa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuariosempresa`
--

INSERT INTO `usuariosempresa` (`id`, `idEmpresa`, `idUsuario`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', '1', '1', 'on', '2024-12-28 20:05:27', '2025-05-30 10:06:21', null);

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpresa` bigint(20) DEFAULT NULL,
  `idTipoVehiculo` bigint(20) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `placas` varchar(16) DEFAULT NULL,
  `permSCT` varchar(64) DEFAULT NULL,
  `numPermisoSCT` varchar(64) DEFAULT NULL,
  `configVehicular` varchar(256) DEFAULT NULL,
  `pesoBrutoVehicular` varchar(16) DEFAULT NULL,
  `anioModelo` varchar(8) DEFAULT NULL,
  `aseguraRespCivil` varchar(8) DEFAULT NULL,
  `polizaRespCivil` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `vehiculos`
--

--
-- Table structure for table `xml`
--

CREATE TABLE `xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuidTimbre` varchar(36) DEFAULT NULL,
  `archivoXML` text DEFAULT NULL,
  `serie` varchar(256) DEFAULT NULL,
  `folio` varchar(256) DEFAULT NULL,
  `rfcEmisor` varchar(16) DEFAULT NULL,
  `rfcReceptor` varchar(16) DEFAULT NULL,
  `nombreEmisor` varchar(256) DEFAULT NULL,
  `tipoComprobante` varchar(18) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `fechaTimbrado` datetime NOT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `uuidPaquete` varchar(36) NOT NULL,
  `nombreReceptor` varchar(256) DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `metodoPago` varchar(8) DEFAULT NULL,
  `formaPago` varchar(8) DEFAULT NULL,
  `usoCFDI` varchar(8) DEFAULT NULL,
  `exportacion` varchar(4) DEFAULT NULL,
  `emitidoRecibido` varchar(32) DEFAULT NULL,
  `base16` decimal(18,0) DEFAULT NULL,
  `totalImpuestos16` decimal(18,0) DEFAULT NULL,
  `base8` decimal(18,0) DEFAULT NULL,
  `totalImpuestos8` decimal(18,0) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `tasaExenta` decimal(18,0) DEFAULT NULL,
  `motivoCancelacion` varchar(8) DEFAULT NULL,
  `uuidRelacionado` varchar(64) DEFAULT NULL,
  `observacionesCancelacion` varchar(2056) DEFAULT NULL,
  `acuseCancelacion` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- No data found for table `xml`
--

-- End of database backup process