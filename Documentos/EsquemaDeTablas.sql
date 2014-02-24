-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2014 at 01:46 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gestiontele`
--
CREATE DATABASE IF NOT EXISTS `gestiontele` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestiontele`;

-- --------------------------------------------------------

--
-- Table structure for table `areaincidencia`
--

CREATE TABLE IF NOT EXISTS `areaincidencia` (
  `idarea` int(11) NOT NULL AUTO_INCREMENT,
  `nombrearea` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `areaincidencia`
--

INSERT INTO `areaincidencia` (`idarea`, `nombrearea`) VALUES
(1, 'Tecnica'),
(2, 'Academica'),
(3, 'Gestion');

-- --------------------------------------------------------

--
-- Table structure for table `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `codempresa` int(11) DEFAULT NULL,
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`idcontrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `correoelectronico`
--

CREATE TABLE IF NOT EXISTS `correoelectronico` (
  `Cod_CorreoElectronico` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CorreoElectronico` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Cod_CorreoElectronico`),
  UNIQUE KEY `Cod_CorreoElectronico` (`Cod_CorreoElectronico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `correo_personafisica`
--

CREATE TABLE IF NOT EXISTS `correo_personafisica` (
  `Cod_PersonaFisica` int(11) NOT NULL,
  `Cod_Correo` int(11) NOT NULL,
  PRIMARY KEY (`Cod_PersonaFisica`,`Cod_Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `correo_personajuridica`
--

CREATE TABLE IF NOT EXISTS `correo_personajuridica` (
  `Cod_PersonaJuridica` int(11) NOT NULL,
  `Cod_Correo` int(11) NOT NULL,
  PRIMARY KEY (`Cod_PersonaJuridica`,`Cod_Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
  `coddireccion` int(11) NOT NULL AUTO_INCREMENT,
  `idpais` int(11) DEFAULT NULL,
  `idpersona` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`coddireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `coddocumento` int(11) NOT NULL DEFAULT '0',
  `numdocumento` int(11) NOT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`coddocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documentoempresa`
--

CREATE TABLE IF NOT EXISTS `documentoempresa` (
  `codempresa` int(11) NOT NULL,
  `coddocumento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `idtelecentro` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `idunidadalm` int(11) DEFAULT NULL,
  `serialequipo` varchar(255) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `establecimiento`
--

CREATE TABLE IF NOT EXISTS `establecimiento` (
  `idestablecimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) DEFAULT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `UV` int(11) DEFAULT NULL,
  `MZ` int(11) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  PRIMARY KEY (`idestablecimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `establecimiento`
--

INSERT INTO `establecimiento` (`idestablecimiento`, `calle`, `barrio`, `UV`, `MZ`, `lat`, `lng`) VALUES
(8, 'Pedro Maillard', 'Petro Caja', 39, 23, -17.7781, -63.1963),
(9, 'Los Palos', 'Urbacruz', 39, 23, -17.7899, -63.1985),
(10, 'Ernesto Primo', 'Gualberto Villaroel', 39, 23, -17.7904, -63.1865),
(11, 'Santa Cruz', 'Junin', 39, 23, -17.7889, -63.182);

-- --------------------------------------------------------

--
-- Table structure for table `estadoevento`
--

CREATE TABLE IF NOT EXISTS `estadoevento` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nomestado` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estadoimplementacion`
--

CREATE TABLE IF NOT EXISTS `estadoimplementacion` (
  `idestadoimplem` int(11) NOT NULL AUTO_INCREMENT,
  `nombreestado` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idestadoimplem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `estadoimplementacion`
--

INSERT INTO `estadoimplementacion` (`idestadoimplem`, `nombreestado`) VALUES
(1, 'Pendiente'),
(2, 'Completo'),
(3, 'Planeado');

-- --------------------------------------------------------

--
-- Table structure for table `estadoticket`
--

CREATE TABLE IF NOT EXISTS `estadoticket` (
  `idestadoticket` int(11) NOT NULL AUTO_INCREMENT,
  `nombreestado` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idestadoticket`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `estadoticket`
--

INSERT INTO `estadoticket` (`idestadoticket`, `nombreestado`) VALUES
(1, 'Abierto'),
(2, 'Pendiente'),
(3, 'Cerrado'),
(4, 'Revisado');

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `idevento` int(11) NOT NULL AUTO_INCREMENT,
  `nomevento` varchar(64) DEFAULT NULL,
  `tematica` varchar(64) DEFAULT NULL,
  `idhorario` int(11) DEFAULT NULL,
  `fechaini` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`idevento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `horaini` time DEFAULT NULL,
  `horafin` time DEFAULT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `incidencia`
--

CREATE TABLE IF NOT EXISTS `incidencia` (
  `idincidencia` int(11) NOT NULL AUTO_INCREMENT,
  `idarea` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `idcreador` int(11) DEFAULT NULL,
  `idtelecentro` int(11) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`idincidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `IDPAIS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(64) DEFAULT NULL,
  `NACIONALIDAD` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`IDPAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patrocinadortelecentro`
--

CREATE TABLE IF NOT EXISTS `patrocinadortelecentro` (
  `idtelecentro` int(11) NOT NULL DEFAULT '0',
  `idpatrocinador` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtelecentro`,`idpatrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `CODPERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  PRIMARY KEY (`CODPERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `personafisica`
--

CREATE TABLE IF NOT EXISTS `personafisica` (
  `NOMBRE` varchar(128) NOT NULL,
  `APPATERNO` varchar(64) NOT NULL,
  `APMATERNO` varchar(64) NOT NULL,
  `GRADOACADEMICO` varchar(64) DEFAULT NULL,
  `TIPODOCUMENTOID` int(11) NOT NULL,
  `DOCUMENTO` varchar(32) DEFAULT NULL,
  `NACIONALIDAD` int(11) DEFAULT NULL,
  `CODPERSONA` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODPERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personafisica`
--

INSERT INTO `personafisica` (`NOMBRE`, `APPATERNO`, `APMATERNO`, `GRADOACADEMICO`, `TIPODOCUMENTOID`, `DOCUMENTO`, `NACIONALIDAD`, `CODPERSONA`) VALUES
('Luis', 'Carrasco', 'Bravo', 'Bachiller', 1, '7722900', 0, 1),
('Pablo', 'Cesar', 'Suarez', 'Titulado', 2, '2313123', 0, 2),
('Ramiro', 'Crespo', 'Melgar', 'Bachiller', 1, '4324234', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
  `idprograma` int(11) NOT NULL AUTO_INCREMENT,
  `idhorario` int(11) DEFAULT NULL,
  `nombreprograma` varchar(64) DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idprograma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rolacceso`
--

CREATE TABLE IF NOT EXISTS `rolacceso` (
  `IDROL` int(11) NOT NULL DEFAULT '0',
  `IDTIPOACCESO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDROL`,`IDTIPOACCESO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `IDROL` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `telecentro`
--

CREATE TABLE IF NOT EXISTS `telecentro` (
  `idtelecentro` int(11) NOT NULL AUTO_INCREMENT,
  `idsupervisor` int(11) DEFAULT NULL,
  `idestablecimiento` int(11) DEFAULT NULL,
  `idestadoimplem` int(11) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtelecentro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `telecentro`
--

INSERT INTO `telecentro` (`idtelecentro`, `idsupervisor`, `idestablecimiento`, `idestadoimplem`, `capacidad`) VALUES
(1, 1, 8, 2, 20),
(2, 3, 9, 2, 10),
(3, 2, 10, 2, 20),
(4, 2, 11, 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `telefono`
--

CREATE TABLE IF NOT EXISTS `telefono` (
  `Cod_Telefono` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NumeroTelefono` varchar(24) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Cod_Telefono`),
  UNIQUE KEY `Cod_Telefono` (`Cod_Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `telefono_personafisica`
--

CREATE TABLE IF NOT EXISTS `telefono_personafisica` (
  `Cod_PersonaFisica` int(11) NOT NULL,
  `Cod_Telefono` int(11) NOT NULL,
  PRIMARY KEY (`Cod_PersonaFisica`,`Cod_Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telefono_personajuridica`
--

CREATE TABLE IF NOT EXISTS `telefono_personajuridica` (
  `Cod_Telefono` int(11) NOT NULL,
  `Cod_PersonaFisica` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Telefono`,`Cod_PersonaFisica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `idticket` int(11) NOT NULL AUTO_INCREMENT,
  `codigoticket` varchar(16) DEFAULT NULL,
  `idestadoticket` int(11) NOT NULL,
  `idincidencia` int(11) NOT NULL,
  PRIMARY KEY (`idticket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoacceso`
--

CREATE TABLE IF NOT EXISTS `tipoacceso` (
  `IDTIPOACCESO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(64) NOT NULL,
  `NIVELACCESO` int(11) NOT NULL,
  PRIMARY KEY (`IDTIPOACCESO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoequipo`
--

CREATE TABLE IF NOT EXISTS `tipoequipo` (
  `idtipoequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nomtipo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idtipoequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoevento`
--

CREATE TABLE IF NOT EXISTS `tipoevento` (
  `idtipoevento` int(11) NOT NULL AUTO_INCREMENT,
  `nomtipo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idtipoevento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoincidencia`
--

CREATE TABLE IF NOT EXISTS `tipoincidencia` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombretipo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tiposdocumentos`
--

CREATE TABLE IF NOT EXISTS `tiposdocumentos` (
  `IDTIPODOCUMENTO` int(11) NOT NULL,
  `NOMBREDOCUMENTO` varchar(255) NOT NULL,
  PRIMARY KEY (`IDTIPODOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `Cod_Turno` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Cod_Horario` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Cod_Turno`),
  UNIQUE KEY `Cod_Turno` (`Cod_Turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unidadalmacenamiento`
--

CREATE TABLE IF NOT EXISTS `unidadalmacenamiento` (
  `idua` int(11) NOT NULL AUTO_INCREMENT,
  `nomunidad` varchar(64) DEFAULT NULL,
  `iddireccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idua`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unidadeducativa`
--

CREATE TABLE IF NOT EXISTS `unidadeducativa` (
  `Cod_UnidadEducativa` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Cod_Establecimiento` int(11) NOT NULL,
  `Cod_Turno` int(11) NOT NULL,
  `Cod_PersonaJuridica` int(11) NOT NULL,
  PRIMARY KEY (`Cod_UnidadEducativa`),
  UNIQUE KEY `Cod_UnidadEducativa` (`Cod_UnidadEducativa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unidadeducativa_turno`
--

CREATE TABLE IF NOT EXISTS `unidadeducativa_turno` (
  `Cod_UnidadEducativa` int(11) NOT NULL,
  `Cod_Turno` int(11) NOT NULL,
  PRIMARY KEY (`Cod_UnidadEducativa`,`Cod_Turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `NICK` varchar(128) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PREGUNTA_SECRETA` varchar(255) DEFAULT NULL,
  `IDPERSONA` int(11) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
