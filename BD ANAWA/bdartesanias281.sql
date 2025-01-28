-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2025 a las 02:15:35
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
-- Base de datos: `bdartesanias281`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idusu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artesano`
--

CREATE TABLE `artesano` (
  `idusu` int(11) NOT NULL,
  `idcom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `artesano`
--

INSERT INTO `artesano` (`idusu`, `idcom`) VALUES
(8, 1),
(17, 4),
(22, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `califica`
--

CREATE TABLE `califica` (
  `idres` int(11) NOT NULL,
  `idprod` int(11) NOT NULL,
  `idusu` int(11) NOT NULL,
  `calificación` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fechaCali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcat` int(11) NOT NULL,
  `nomcat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcat`, `nomcat`) VALUES
(4, 'Textiles y Tejidos'),
(5, 'Joyería y Accesorios'),
(6, 'Artesanías en Madera'),
(7, 'Cerámica y Alfarería'),
(8, 'Instrumentos Musicales'),
(9, 'Cestería y Fibra Vegetal'),
(10, 'Arte en Metal'),
(11, 'Pintura y Escultura'),
(12, 'Ropa Tradicional'),
(13, 'Productos de Cuero'),
(14, 'Alimentos Artesanales'),
(15, 'Decoración para el Hogar'),
(16, 'Cultura y Tradición');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprador`
--

CREATE TABLE `comprador` (
  `idusu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunidad`
--

CREATE TABLE `comunidad` (
  `idcom` int(11) NOT NULL,
  `nomcom` varchar(100) NOT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `comunidad`
--

INSERT INTO `comunidad` (`idcom`, `nomcom`, `departamento`, `provincia`) VALUES
(1, 'Quechua', 'La Paz', 'Muñecas'),
(2, 'Afroboliviano', 'La Paz', 'Nor Yungas'),
(3, 'Araona', 'La Paz', 'Abel Iturralde'),
(4, 'Tacana', 'La Paz', 'Franz Tamayo'),
(5, 'Quechua', 'La Paz', 'Muñecas'),
(6, 'Ayoreo', 'Santa Cruz', 'Cordillera'),
(7, 'Chiquitano', 'Santa Cruz', 'Chiquitos'),
(8, 'Yuracaré', 'Cochabamba', 'Chapare'),
(9, 'Yuqui', 'Cochabamba', 'José Carrasco'),
(10, 'Afroboliviano', 'La Paz', 'Nor Yungas'),
(11, 'Guaraní', 'Santa Cruz', 'Cordillera'),
(12, 'Uru', 'Oruro', 'Sajama'),
(13, 'Aymara', 'Oruro', 'Carangas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `idusu` int(11) NOT NULL,
  `turno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idped` int(11) NOT NULL,
  `idprod` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioUni` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`idped`, `idprod`, `cantidad`, `precioUni`) VALUES
(4, 15, 5, 25.00),
(5, 1, 1, 120.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `ident` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fechaent` date DEFAULT NULL,
  `idusu` int(11) DEFAULT NULL,
  `idped` int(11) DEFAULT NULL,
  `delivery_confirmed` tinyint(1) DEFAULT 0,
  `buyer_confirmed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `entrega`
--

INSERT INTO `entrega` (`ident`, `estado`, `fechaent`, `idusu`, `idped`, `delivery_confirmed`, `buyer_confirmed`) VALUES
(4, 'Finalizado', '2024-11-17', 11, 4, 1, 1),
(5, 'asignado', NULL, 11, 5, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idinv` int(11) NOT NULL,
  `cantprod` int(11) NOT NULL,
  `fechactua` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idinv`, `cantprod`, `fechactua`) VALUES
(4, 9, '2024-11-13'),
(5, 15, '2024-11-13'),
(6, 5, '2024-11-13'),
(7, 30, '2024-11-13'),
(8, 10, '2024-11-13'),
(9, 5, '2024-11-13'),
(10, 2, '2025-01-26'),
(11, 20, '2024-11-13'),
(12, 15, '2024-11-13'),
(13, 50, '2024-11-13'),
(14, 50, '2024-11-13'),
(15, 1, '2024-11-13'),
(16, 10, '2024-11-13'),
(17, 20, '2024-11-13'),
(18, 5, '2024-11-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marketing`
--

CREATE TABLE `marketing` (
  `idmark` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `idusu` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `marketing`
--

INSERT INTO `marketing` (`idmark`, `tipo`, `contenido`, `idusu`, `imagen`) VALUES
(4, 'anuncio', 'fdkadksalñdkaslñdkslañkdsalñdkalsñd', 7, '/Anawa/uploads/marketing_images/2-1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `idMetodo` int(11) NOT NULL,
  `idusu` int(11) DEFAULT NULL,
  `nombreTarjeta` varchar(100) DEFAULT NULL,
  `numeroTarjeta` varbinary(255) DEFAULT NULL,
  `expiracionTarjeta` varbinary(255) DEFAULT NULL,
  `cvvTarjeta` varbinary(255) DEFAULT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`idMetodo`, `idusu`, `nombreTarjeta`, `numeroTarjeta`, `expiracionTarjeta`, `cvvTarjeta`, `fechaRegistro`) VALUES
(5, 16, 'Juan perez', 0x4f484e69624668715a56687a4c305278515659725355523551565a484e453546646b3151565774315a455a6d61545172626a465356797433545430364f6f31594e656b78626b6c3747574630616c646a5a6f303d, 0x52476c336355464d4f456c464d55464d546e6f31593164504e697372647a30394f6a724d51636168662f435351693159564643374359686a, 0x544656364d304d764e32746953334a695445355553466376617a4e435a7a30394f6a6f324f465a7250456d47676a4c4b645673467a6d3565, '2024-11-14 16:49:32'),
(6, 23, 'csacascas', 0x54305a32576d4a785347784f536e4251556c5a7851565243615774765a7a30394f6a725134537a2b3761526961624b2f34754a587a454173, 0x54315a535769394f64456c4364304e6d5346686c616b31504e6c4a4d515430394f6a7143545878517a50494a574d64766b476b4e6266334b, 0x556c684f62455248523274774e323175635642474e57303053487049515430394f6a7241667541787a6d33647776516568663070712b7467, '2025-01-27 00:46:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `fechapag` date DEFAULT NULL,
  `método` varchar(50) DEFAULT NULL,
  `idped` int(11) DEFAULT NULL,
  `estado_deposito` enum('pendiente','confirmado','rechazado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `fechapag`, `método`, `idped`, `estado_deposito`) VALUES
(4, '2024-11-14', 'tarjeta', 4, 'confirmado'),
(5, '2025-01-26', 'tarjeta', 5, 'confirmado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idped` int(11) NOT NULL,
  `cantprod` int(11) NOT NULL,
  `idusu` int(11) DEFAULT NULL,
  `latitud` decimal(10,8) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idped`, `cantprod`, `idusu`, `latitud`, `longitud`) VALUES
(4, 5, 16, -16.50373150, -68.12955920),
(5, 1, 23, -16.47247360, -68.17054720);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idprod` int(11) NOT NULL,
  `nomprod` varchar(100) NOT NULL,
  `descripción` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `dimensiones` varchar(100) DEFAULT NULL,
  `idusu` int(11) DEFAULT NULL,
  `idcat` int(11) DEFAULT NULL,
  `idinv` int(11) DEFAULT NULL,
  `imagen1` varchar(255) NOT NULL,
  `imagen2` varchar(255) DEFAULT NULL,
  `imagen3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idprod`, `nomprod`, `descripción`, `precio`, `dimensiones`, `idusu`, `idcat`, `idinv`, `imagen1`, `imagen2`, `imagen3`) VALUES
(1, 'Poncho Andino', 'Poncho tradicional andino, tejido a mano con lana de alpaca en colores vivos.', 120.00, 'Largo: 100 cm, Ancho: 80 cm', 8, 4, 4, '/Anawa/uploads/product_images/ponchoAndino.jpg', NULL, NULL),
(2, 'Bufanda de Alpaca', 'Bufanda suave y cálida hecha con lana de alpaca, ideal para el invierno.', 70.00, 'Largo: 150 cm, Ancho: 20 cm', 8, 4, 5, '/Anawa/uploads/product_images/bufandaAlpaca.jpg', NULL, NULL),
(3, 'Collar de Piedra Bolivianita', 'Collar hecho a mano con piedras preciosas de Bolivianita, la piedra nacional de Bolivia.', 200.00, 'Largo: 45 cm', 8, 5, 6, '/Anawa/uploads/product_images/collarBolivianita.jpg', NULL, NULL),
(4, ' Pulsera de Semillas', 'Pulsera artesanal elaborada con semillas amazónicas naturales y detalles de plata.', 50.00, 'Largo: 18 cm', 8, 5, 7, '/Anawa/uploads/product_images/pulseraSemillas.jpg', NULL, NULL),
(5, 'Máscara Típica Tallada', 'Máscara de madera tallada y pintada a mano, inspirada en tradiciones andinas.', 150.00, 'Largo: 30 cm, Ancho: 20 cm', 8, 6, 8, '/Anawa/uploads/product_images/mascaraTallada.jpg', NULL, NULL),
(6, 'Juego de Utensilios de Madera', 'Set de utensilios de cocina (cucharón, espátula, tenedor) hecho en madera natural.', 80.00, 'Largo: 30 cm, Ancho: 5 cm', 8, 6, 9, '/Anawa/uploads/product_images/utensilios1.jpg', '/Anawa/uploads/product_images/utensilios2.jpg', '/Anawa/uploads/product_images/utensilios3.jpg'),
(7, 'Jarra de Cerámica Andina', 'Jarra de cerámica decorada con motivos andinos, hecha a mano.', 90.00, 'Alto: 25 cm, Diámetro: 15 cm', 8, 7, 10, '/Anawa/uploads/product_images/ceramica.jpg', NULL, NULL),
(8, 'Plato Decorativo', 'Plato de cerámica con diseño étnico, perfecto para decorar paredes.', 60.00, 'Diámetro: 30 cm', 8, 7, 11, '/Anawa/uploads/product_images/platoetnico.jpg', NULL, NULL),
(9, 'Charango de Madera ', 'Instrumento de cuerda típico de Bolivia, elaborado en madera y decorado a mano.', 300.00, 'Largo: 60 cm, Ancho: 20 cm', 8, 8, 12, '/Anawa/uploads/product_images/charangoMadera.jpg', NULL, NULL),
(10, 'Cesta de Paja Natural', 'Cesta tejida a mano con paja, ideal para la organización o decoración.', 50.00, 'Diámetro: 30 cm, Altura: 15 cm', 8, 9, 13, '/Anawa/uploads/product_images/cestaNatural.jpeg', NULL, NULL),
(11, 'Llaveros de Llama', 'Llavero decorativo en forma de llama, hecho en metal.', 20.00, 'Largo: 5 cm, Ancho: 3 cm', 8, 10, 14, '/Anawa/uploads/product_images/llaveroLlama.jpg', NULL, NULL),
(12, 'Pintura de Paisaje Andino', 'Pintura acrílica de un paisaje típico andino, enmarcada en madera.', 250.00, 'Largo: 40 cm, Ancho: 30 cm', 8, 11, 15, '/Anawa/uploads/product_images/pintura.jpg', NULL, NULL),
(13, 'Pollera Andina', 'Falda tradicional boliviana, con bordados de colores vivos.', 180.00, 'Largo: 80 cm, Cintura: 60 cm', 8, 12, 16, '/Anawa/uploads/product_images/pollera3.jpg', '/Anawa/uploads/product_images/pollera2.jpg', '/Anawa/uploads/product_images/pollera1.jpg'),
(14, 'Cartera de Cuero Artesanal', 'Cartera elaborada en cuero genuino, con decoraciones tradicionales.', 150.00, 'Largo: 25 cm, Ancho: 15 cm', 8, 13, 17, '/Anawa/uploads/product_images/carteraCuero.jpg', NULL, NULL),
(15, 'Pecebres ', 'Pecebres de ceramica', 25.00, 'Largo: 32 cm', 17, 6, 18, '/Anawa/uploads/product_images/1-1.PNG', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idsolicitud` int(11) NOT NULL,
  `idusu` int(11) NOT NULL,
  `tipo_solicitud` enum('artesano','delivery','pago') NOT NULL,
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente',
  `fecha_solicitud` timestamp NULL DEFAULT current_timestamp(),
  `turno` varchar(255) DEFAULT NULL,
  `idcom` int(11) DEFAULT NULL,
  `idped` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`idsolicitud`, `idusu`, `tipo_solicitud`, `estado`, `fecha_solicitud`, `turno`, `idcom`, `idped`) VALUES
(3, 17, 'artesano', 'aprobado', '2024-11-14 16:40:19', NULL, 4, NULL),
(4, 16, 'pago', 'aprobado', '2024-11-14 16:49:32', NULL, NULL, 4),
(5, 22, 'artesano', 'aprobado', '2025-01-27 00:35:31', NULL, 9, NULL),
(6, 23, 'pago', 'aprobado', '2025-01-27 00:46:47', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketsoporte`
--

CREATE TABLE `ticketsoporte` (
  `idticket` int(11) NOT NULL,
  `idusu` int(11) DEFAULT NULL,
  `asunto` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','respondido','cerrado') DEFAULT 'pendiente',
  `respuesta` text DEFAULT NULL,
  `fecha_respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusu` int(11) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `nomusu` varchar(100) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `verificado` tinyint(1) DEFAULT 0,
  `token_verificacion` varchar(255) DEFAULT NULL,
  `expiracion_token` varchar(255) DEFAULT NULL,
  `idver` int(11) DEFAULT NULL,
  `estado_solicitud` enum('pendiente','rechazado','aprobado','visto','ninguno') DEFAULT 'ninguno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusu`, `ci`, `nomusu`, `celular`, `email`, `contraseña`, `verificado`, `token_verificacion`, `expiracion_token`, `idver`, `estado_solicitud`) VALUES
(6, '9870117', 'lucas', '76575162', 'pato.lucas.riqui@gmail.com', '$2y$10$v5o1H0TyVobUsPJeUC94neWGQ28oQtYSY.oRBptywNf4V3OqC8Tc.', 1, NULL, NULL, 3, 'visto'),
(7, '9870117', 'lucasAdmin', '76575162', 'luquinhas.ro.pe@gmail.com', '$2y$10$bf3bjVzxxf46d.YbAJHtjO01/NMy2uSlHJJzfwX7PAO4zxoDBwD4O', 1, NULL, NULL, 1, 'ninguno'),
(8, '9870117', 'luquinhas3264', '76575162', 'lrodriguezp@fcpn.edu.bo', '$2y$10$.MG14dHv1SiSop0341YCQ.qsp.PAjk1mlCnfiZIIEYFXQHDdN002a', 1, NULL, NULL, 2, 'aprobado'),
(11, '8326547', 'Mishel Calle', '73512839', 'mishelcalle16@gmail.com', '$2y$10$6JXImjrCUJ2/VizOfL/acuP33SB/DXPFl2CPrGYNssqMXUUHBxOPa', 1, NULL, NULL, 4, 'ninguno'),
(12, '8326547', 'Alejandra Calle', '73512839', 'mcallen@fcpn.edu.bo', '$2y$10$sI655EnyQ6x0TCSe.9wwA.0MfapngsOMiEL9NfFdSO4xHl/PVuvXS', 1, NULL, NULL, 1, 'ninguno'),
(14, '8439789', 'emitauwu', '78944010', 'emanuel.aracena7@gmail.com', '$2y$10$E5AsCHgNjz5X/yCm9YA5.OYJ4tgbzsWDoaV3cUOPEw5hSXMDZ3kVy', 1, NULL, NULL, 2, 'ninguno'),
(16, '2464727', 'emita123', '78944010', 'earacenag@fcpn.edu.bo', '$2y$10$YRStVoEa24MGr6/5qJfJUOVO0ss0zo5DlrrS1stbTf9Grp8XdGlvC', 1, NULL, NULL, 3, 'visto'),
(17, '2313123', 'juan perez', '78944010', 'egaracena@umsa.bo', '$2y$10$tcWZPSDTdM.dc9piwDSzu.BUDMrfUMFmTw2DfQxgZc9Dd6f2z8Afy', 1, NULL, NULL, 2, 'aprobado'),
(19, '8463473', 'pablo marconi', '72526318', 'pablokiller64@gmail.com', '$2y$10$mCfEPgaE3oQupgQqx0Tb8emlJvet58xeqslFe7q0YEgWPnxdb7/TS', 1, NULL, NULL, 1, 'ninguno'),
(22, '8463473', 'alejandro nuñez', '72526318', 'alexisconi15@gmail.com', '$2y$10$v9NmKdp1YfxmABeNAiCGB.BgM3olmWrb6sify3t/AlNY.bihdQjyi', 1, NULL, NULL, 2, 'aprobado'),
(23, '8463478', 'cristhian jaldin', '72526318', 'alejandromarconi14@gmail.com', '$2y$10$GqC4O2K47ePUnQrMy7h1L.fkOH4YOu2.4q5ikeUmhxo85HTfqGV9G', 1, NULL, NULL, 3, 'ninguno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificación`
--

CREATE TABLE `verificación` (
  `idver` int(11) NOT NULL,
  `nivel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `verificación`
--

INSERT INTO `verificación` (`idver`, `nivel`) VALUES
(1, 'Administrador'),
(2, 'Artesano'),
(3, 'Comprador'),
(4, 'Delivery');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idusu`);

--
-- Indices de la tabla `artesano`
--
ALTER TABLE `artesano`
  ADD PRIMARY KEY (`idusu`),
  ADD KEY `idcom` (`idcom`);

--
-- Indices de la tabla `califica`
--
ALTER TABLE `califica`
  ADD PRIMARY KEY (`idres`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcat`);

--
-- Indices de la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`idusu`);

--
-- Indices de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD PRIMARY KEY (`idcom`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`idusu`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idped`,`idprod`),
  ADD KEY `idprod` (`idprod`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`ident`),
  ADD KEY `idusu` (`idusu`),
  ADD KEY `idped` (`idped`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idinv`);

--
-- Indices de la tabla `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`idmark`),
  ADD KEY `idusu` (`idusu`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`idMetodo`),
  ADD KEY `idusu` (`idusu`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `idped` (`idped`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idped`),
  ADD KEY `idusu` (`idusu`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idprod`),
  ADD KEY `idusu` (`idusu`),
  ADD KEY `idcat` (`idcat`),
  ADD KEY `idinv` (`idinv`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`idsolicitud`),
  ADD KEY `idusu` (`idusu`),
  ADD KEY `idcom` (`idcom`);

--
-- Indices de la tabla `ticketsoporte`
--
ALTER TABLE `ticketsoporte`
  ADD PRIMARY KEY (`idticket`),
  ADD KEY `idusu` (`idusu`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusu`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuario_verificacion` (`idver`);

--
-- Indices de la tabla `verificación`
--
ALTER TABLE `verificación`
  ADD PRIMARY KEY (`idver`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `califica`
--
ALTER TABLE `califica`
  MODIFY `idres` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  MODIFY `idcom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `entrega`
--
ALTER TABLE `entrega`
  MODIFY `ident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idinv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `marketing`
--
ALTER TABLE `marketing`
  MODIFY `idmark` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `idMetodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idped` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `idsolicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ticketsoporte`
--
ALTER TABLE `ticketsoporte`
  MODIFY `idticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `verificación`
--
ALTER TABLE `verificación`
  MODIFY `idver` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`);

--
-- Filtros para la tabla `artesano`
--
ALTER TABLE `artesano`
  ADD CONSTRAINT `artesano_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`),
  ADD CONSTRAINT `artesano_ibfk_2` FOREIGN KEY (`idcom`) REFERENCES `comunidad` (`idcom`);

--
-- Filtros para la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD CONSTRAINT `comprador_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`);

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idped`) REFERENCES `pedido` (`idped`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idprod`) REFERENCES `producto` (`idprod`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`),
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`idped`) REFERENCES `pedido` (`idped`);

--
-- Filtros para la tabla `marketing`
--
ALTER TABLE `marketing`
  ADD CONSTRAINT `marketing_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`);

--
-- Filtros para la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD CONSTRAINT `metodopago_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idped`) REFERENCES `pedido` (`idped`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcat`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idinv`) REFERENCES `inventario` (`idinv`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`),
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`idcom`) REFERENCES `comunidad` (`idcom`);

--
-- Filtros para la tabla `ticketsoporte`
--
ALTER TABLE `ticketsoporte`
  ADD CONSTRAINT `ticketsoporte_ibfk_1` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusu`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_verificacion` FOREIGN KEY (`idver`) REFERENCES `verificación` (`idver`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
