-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.48


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cultura
--

CREATE DATABASE IF NOT EXISTS cultura;
USE cultura;

--
-- Definition of table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `idarea` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`idarea`,`numero`,`nombre`,`descripcion`,`estado`) VALUES 
 (1,1,'Administracion',NULL,'1'),
 (2,2,'Comercial',NULL,'1'),
 (3,3,'Monitoreo',NULL,'1'),
 (4,4,'Logistica',NULL,'1');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;


--
-- Definition of table `campo`
--

DROP TABLE IF EXISTS `campo`;
CREATE TABLE `campo` (
  `idcampo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `numero_trabajador` int(11) DEFAULT NULL,
  `numero_punto` int(11) DEFAULT NULL,
  `costo_parametro` decimal(10,0) DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `area_idarea` int(11) NOT NULL,
  `riesgo_idriesgo` int(11) NOT NULL,
  PRIMARY KEY (`idcampo`),
  KEY `fk_campo_area1` (`area_idarea`),
  KEY `fk_campo_riesgo1` (`riesgo_idriesgo`),
  CONSTRAINT `fk_campo_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_campo_riesgo1` FOREIGN KEY (`riesgo_idriesgo`) REFERENCES `riesgo` (`idriesgo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campo`
--

/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` (`idcampo`,`codigo`,`numero_trabajador`,`numero_punto`,`costo_parametro`,`fecha_emision`,`area_idarea`,`riesgo_idriesgo`) VALUES 
 (1,'FOR-COM-001',3,1,NULL,'2019-09-20 06:31:42',1,1),
 (2,'FOR-COM-001',2,2,NULL,'2019-09-20 06:34:43',2,2),
 (3,'FOR-COM-001',1,1,NULL,'2019-09-20 06:34:43',3,3),
 (4,'FOR-COM-001',5,2,NULL,'2019-09-20 06:34:43',4,4);
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;


--
-- Definition of table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE `cotizacion` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `empresa_idempresa` int(11) NOT NULL,
  `empleado_idempleado` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `fk_cotizacion_empresa` (`empresa_idempresa`),
  KEY `fk_cotizacion_empleado1` (`empleado_idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cotizacion`
--

/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` (`idcotizacion`,`numero`,`estado`,`empresa_idempresa`,`empleado_idempleado`) VALUES 
 (1,1,'Aprobada',1,1),
 (2,2,'No Aprobada',2,2),
 (3,3,'Aprobada',3,3);
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;


--
-- Definition of table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleado`
--

/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`idempleado`,`numero`,`nombre`,`dni`,`direccion`,`telefono`,`estado`,`email`) VALUES 
 (1,1,'Aldo Manosalva','12345678','C. Elias Ascuez 143, Urb. El Bosque, Rimac, Lima','971430728','1','afame.sis@gmail.com'),
 (2,2,'Merly Molocho',NULL,NULL,NULL,NULL,NULL),
 (3,3,'Eve Chumpisuca',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


--
-- Definition of table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `ruc` varchar(11) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empresa`
--

/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`idempresa`,`numero`,`razon_social`,`ruc`,`estado`,`direccion`,`telefono`) VALUES 
 (1,1,'Head Systems','20482383514','1','C. Elias Ascuez 143, Urb. El Bosque, Rimac, Lima','971430728'),
 (2,2,'Cultura QQSE',NULL,'1',NULL,NULL),
 (3,3,'SaneIndustrial',NULL,'1',NULL,NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


--
-- Definition of table `riesgo`
--

DROP TABLE IF EXISTS `riesgo`;
CREATE TABLE `riesgo` (
  `idriesgo` int(11) NOT NULL AUTO_INCREMENT,
  `numero_riesgo` int(11) DEFAULT NULL,
  `tipo_riesgo` varchar(100) DEFAULT NULL,
  `parametro_medicion` varchar(200) DEFAULT NULL,
  `equipo_herramienta` varchar(200) DEFAULT NULL,
  `metodo` varchar(500) DEFAULT NULL,
  `costo_unitario` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idriesgo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riesgo`
--

/*!40000 ALTER TABLE `riesgo` DISABLE KEYS */;
INSERT INTO `riesgo` (`idriesgo`,`numero_riesgo`,`tipo_riesgo`,`parametro_medicion`,`equipo_herramienta`,`metodo`,`costo_unitario`) VALUES 
 (1,1,'Riesgos Físicos','Ruido por dosimetría','Dosímetro Quest 3M',NULL,'120'),
 (2,2,'Riesgos Físicos','Personal Administrativo','Formato de evaluación/Cámara fotográfica',NULL,'50'),
 (3,3,'Riesgos Físicos','Personal Administrativo / Operativo','Formato de evaluación/Cámara fotográfica',NULL,'55'),
 (4,4,'Riesgos Físicos','Personal Operativo','Formato de evaluación/Equipo de filmación',NULL,'60');
/*!40000 ALTER TABLE `riesgo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
