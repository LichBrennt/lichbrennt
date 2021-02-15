-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 15, 2021 at 09:59 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyectodesarrolloweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `camas` int(2) NOT NULL,
  `personas` int(2) NOT NULL,
  `precio` int(100) NOT NULL,
  `administracion` int(100) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `habitaciones`
--

INSERT INTO `habitaciones` (`id`, `tipo`, `camas`, `personas`, `precio`, `administracion`, `descripcion`) VALUES
(1, 'GUEST I', 1, 1, 100000, 20000, 'Incluye una cama sencilla, capacidad para una persona, incluye desayuno. Para los demás servicios, acercarse a la recepción.'),
(2, 'GUEST II', 1, 1, 120000, 20000, 'Incluye una cama sencilla, capacidad para una persona, incluye desayuno y almuerzo. Para los demás servicios, acercarse a la recepción.'),
(3, 'GUEST III', 1, 1, 150000, 20000, 'Incluye una cama sencilla, capacidad para una persona, incluye tres comidas al día. Para los demás servicios, acercarse a la recepción.'),
(4, 'PREMUIM I', 1, 2, 300000, 50000, 'Incluye una cama doble, capacidad para dos personas, acceso a piscina (6 hrs) al día, parqueadero alejado, servicio de habitación (6 hrs) al día.'),
(5, 'PREMUIM II', 1, 2, 350000, 50000, 'Incluye una cama medida queen, capacidad para dos personas, acceso a piscina (9 hrs) al día, parqueadero alejado, servicio de habitación (9 hrs) al día.'),
(6, 'PREMUIM III', 1, 3, 450000, 50000, 'Incluye una cama medida king, capacidad para tres personas, acceso a piscina (12 hrs) al día, parqueadero alejado, servicio de habitación (12 hrs) al día.'),
(7, 'SUIT', 1, 3, 550000, 80000, 'Incluye una cama medida king, capacidad para tres personas, acceso a piscina (12 hrs) al día, parqueadero alejado, servicio de habitación (12 hrs) al día.');

-- --------------------------------------------------------

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
CREATE TABLE IF NOT EXISTS `reservacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` int(50) NOT NULL,
  `TipoDeHabitacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CantidadDePersonas` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFinal` date NOT NULL,
  `Costo` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `reservacion`
--

INSERT INTO `reservacion` (`id`, `Usuario`, `TipoDeHabitacion`, `CantidadDePersonas`, `FechaInicio`, `FechaFinal`, `Costo`) VALUES
(1, 1, 'Guest3', '2', '2020-11-02', '2020-11-20', 200),
(2, 1, 'Guest2', '1', '2020-11-10', '2020-11-19', 150),
(3, 6, 'SUIT', '3', '2020-11-22', '2020-11-24', 1180000),
(4, 6, 'GUEST II', '1', '2020-11-22', '2020-11-24', 260000),
(5, 6, 'SUIT', '3', '2020-11-24', '2020-11-26', 1180000),
(6, 6, 'GUEST II', '1', '2020-11-24', '2020-11-30', 740000);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `TipoDeDocumento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `NumeroDeDocumento` int(15) NOT NULL,
  `Correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NumeroDeDocumento` (`NumeroDeDocumento`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `Nombres`, `Apellidos`, `TipoDeDocumento`, `NumeroDeDocumento`, `Correo`, `Telefono`) VALUES
(1, 'user1', 'user1', 'C.E.', 20020, 'user1@user.com', '1234'),
(2, 'user2', 'user2', 'C.C.', 2020, 'user2@user2.com', '2021'),
(3, 'user3', 'user3', 'C.C.', 2021, 'user3@user3.com', '2021'),
(6, 'Manuel', 'Gutierrez', 'C.C.', 1033795385, 'manuel.alejandro.gutierrez@hotmail.com', '3203124058'),
(7, 'Alejandro', 'Arias', 'C.C', 123456, 'lichbrennt@hotmail.com', '20183181');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
