-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2025 a las 22:49:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectofinal2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agente_credito`
--

CREATE TABLE `agente_credito` (
  `id_agente` int(11) NOT NULL,
  `nombre_agente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agente_credito`
--

INSERT INTO `agente_credito` (`id_agente`, `nombre_agente`) VALUES
(1, 'Pedro García'),
(2, 'Ana Rodríguez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahorro`
--

CREATE TABLE `ahorro` (
  `id_ahorro` int(11) NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_apertura_ahorro` date DEFAULT NULL,
  `fecha_clausura_ahorro` date DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `idtipoahorro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ahorro`
--

INSERT INTO `ahorro` (`id_ahorro`, `monto`, `fecha_apertura_ahorro`, `fecha_clausura_ahorro`, `ID_CLIENTE`, `idtipoahorro`) VALUES
(1, 5000.00, '2024-07-15', NULL, 1, 1),
(2, 10000.00, '2024-07-10', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_ahorro`
--

CREATE TABLE `categoria_ahorro` (
  `idcategoriaahorro` int(11) NOT NULL,
  `nombre_categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_ahorro`
--

INSERT INTO `categoria_ahorro` (`idcategoriaahorro`, `nombre_categoria`) VALUES
(1, 'Cuenta Simple'),
(2, 'Super Tasa'),
(3, 'Depósito a Plazo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_credito`
--

CREATE TABLE `categoria_credito` (
  `id_categoriacredito` int(11) NOT NULL,
  `nombre_categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_credito`
--

INSERT INTO `categoria_credito` (`id_categoriacredito`, `nombre_categoria`) VALUES
(1, 'Préstamo Personal'),
(2, 'Préstamo para Vivienda'),
(3, 'Préstamo Apoya Tu Negocio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID_CIUDAD` int(11) NOT NULL,
  `NombreCiudad` varchar(50) DEFAULT NULL,
  `ID_REGION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ID_CIUDAD`, `NombreCiudad`, `ID_REGION`) VALUES
(1, 'Lima Ciudad', 1),
(2, 'Arequipa Ciudad', 2),
(3, 'Cusco Ciudad', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `ID_TIPO_CLIENTE` int(11) DEFAULT NULL,
  `ID_CIUDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `ID_TIPO_CLIENTE`, `ID_CIUDAD`) VALUES
(1, 'Juan', 'Perez', 'Av. Primavera 123', '987654321', 1, 1),
(2, 'María', 'Gomez', 'Jr. Huancavelica 456', '999888777', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `id_credito` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `plazo_meses` int(11) DEFAULT NULL,
  `numero_cuotas` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_tipocredito` int(11) DEFAULT NULL,
  `id_agente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `credito`
--

INSERT INTO `credito` (`id_credito`, `fecha_inicio`, `fecha_final`, `plazo_meses`, `numero_cuotas`, `id_cliente`, `id_tipocredito`, `id_agente`) VALUES
(1, '2024-07-01', '2024-07-01', 12, 12, 1, 1, 1),
(2, '2024-06-15', '2024-06-15', 24, 24, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_mensual`
--

CREATE TABLE `pago_mensual` (
  `id_pago` int(11) NOT NULL,
  `monto_a_pagar` decimal(10,2) DEFAULT NULL,
  `fecha_de_pago` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `mora` decimal(5,2) DEFAULT NULL,
  `id_credito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago_mensual`
--

INSERT INTO `pago_mensual` (`id_pago`, `monto_a_pagar`, `fecha_de_pago`, `estado`, `mora`, `id_credito`) VALUES
(1, 500.00, '2024-07-15', 'Pendiente', 0.00, 1),
(2, 750.00, '2024-06-30', 'Pagado', 0.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `ID_REGION` int(11) NOT NULL,
  `NombreRegion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`ID_REGION`, `NombreRegion`) VALUES
(1, 'Lima'),
(2, 'Arequipa'),
(3, 'Cusco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ahorro`
--

CREATE TABLE `tipo_ahorro` (
  `idtipoahorro` int(11) NOT NULL,
  `descripcion_ahorro` varchar(100) DEFAULT NULL,
  `tasa_interes_ahorro` decimal(5,2) DEFAULT NULL,
  `idcategoriaahorro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_ahorro`
--

INSERT INTO `tipo_ahorro` (`idtipoahorro`, `descripcion_ahorro`, `tasa_interes_ahorro`, `idcategoriaahorro`) VALUES
(1, 'Cuenta Simple con 3% de interés', 3.00, 1),
(2, 'Super Tasa con 6.5% de interés', 6.50, 2),
(3, 'Depósito a Plazo con 8% de interés', 8.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `ID_TIPO_CLIENTE` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`ID_TIPO_CLIENTE`, `Descripcion`) VALUES
(1, 'Natural'),
(2, 'Jurídico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_credito`
--

CREATE TABLE `tipo_credito` (
  `id_tipocredito` int(11) NOT NULL,
  `descripcion_credito` varchar(100) DEFAULT NULL,
  `tasa_interes_credito` decimal(5,2) DEFAULT NULL,
  `id_categoriacredito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_credito`
--

INSERT INTO `tipo_credito` (`id_tipocredito`, `descripcion_credito`, `tasa_interes_credito`, `id_categoriacredito`) VALUES
(1, 'Préstamo Personal hasta 12 meses', 12.00, 1),
(2, 'Préstamo para Vivienda hasta 24 meses', 14.50, 2),
(3, 'Préstamo Apoya Tu Negocio hasta 36 meses', 16.00, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agente_credito`
--
ALTER TABLE `agente_credito`
  ADD PRIMARY KEY (`id_agente`);

--
-- Indices de la tabla `ahorro`
--
ALTER TABLE `ahorro`
  ADD PRIMARY KEY (`id_ahorro`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`),
  ADD KEY `idtipoahorro` (`idtipoahorro`);

--
-- Indices de la tabla `categoria_ahorro`
--
ALTER TABLE `categoria_ahorro`
  ADD PRIMARY KEY (`idcategoriaahorro`);

--
-- Indices de la tabla `categoria_credito`
--
ALTER TABLE `categoria_credito`
  ADD PRIMARY KEY (`id_categoriacredito`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID_CIUDAD`),
  ADD KEY `ID_REGION` (`ID_REGION`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD KEY `ID_TIPO_CLIENTE` (`ID_TIPO_CLIENTE`),
  ADD KEY `ID_CIUDAD` (`ID_CIUDAD`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`id_credito`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tipocredito` (`id_tipocredito`),
  ADD KEY `id_agente` (`id_agente`);

--
-- Indices de la tabla `pago_mensual`
--
ALTER TABLE `pago_mensual`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_credito` (`id_credito`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`ID_REGION`);

--
-- Indices de la tabla `tipo_ahorro`
--
ALTER TABLE `tipo_ahorro`
  ADD PRIMARY KEY (`idtipoahorro`),
  ADD KEY `idcategoriaahorro` (`idcategoriaahorro`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`ID_TIPO_CLIENTE`);

--
-- Indices de la tabla `tipo_credito`
--
ALTER TABLE `tipo_credito`
  ADD PRIMARY KEY (`id_tipocredito`),
  ADD KEY `id_categoriacredito` (`id_categoriacredito`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ahorro`
--
ALTER TABLE `ahorro`
  ADD CONSTRAINT `ahorro_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `ahorro_ibfk_2` FOREIGN KEY (`idtipoahorro`) REFERENCES `tipo_ahorro` (`idtipoahorro`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`ID_REGION`) REFERENCES `region` (`ID_REGION`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_TIPO_CLIENTE`) REFERENCES `tipo_cliente` (`ID_TIPO_CLIENTE`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `ciudad` (`ID_CIUDAD`);

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `credito_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `credito_ibfk_2` FOREIGN KEY (`id_tipocredito`) REFERENCES `tipo_credito` (`id_tipocredito`),
  ADD CONSTRAINT `credito_ibfk_3` FOREIGN KEY (`id_agente`) REFERENCES `agente_credito` (`id_agente`);

--
-- Filtros para la tabla `pago_mensual`
--
ALTER TABLE `pago_mensual`
  ADD CONSTRAINT `pago_mensual_ibfk_1` FOREIGN KEY (`id_credito`) REFERENCES `credito` (`id_credito`);

--
-- Filtros para la tabla `tipo_ahorro`
--
ALTER TABLE `tipo_ahorro`
  ADD CONSTRAINT `tipo_ahorro_ibfk_1` FOREIGN KEY (`idcategoriaahorro`) REFERENCES `categoria_ahorro` (`idcategoriaahorro`);

--
-- Filtros para la tabla `tipo_credito`
--
ALTER TABLE `tipo_credito`
  ADD CONSTRAINT `tipo_credito_ibfk_1` FOREIGN KEY (`id_categoriacredito`) REFERENCES `categoria_credito` (`id_categoriacredito`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
