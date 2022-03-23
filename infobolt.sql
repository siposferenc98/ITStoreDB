-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Már 23. 17:09
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `infobolt`
--
CREATE DATABASE IF NOT EXISTS `infobolt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `infobolt`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `productcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `completed` tinyint(4) NOT NULL DEFAULT 0,
  `paymentmethod` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `imgurl` varchar(500) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `type`, `imgurl`, `stock`) VALUES
(1, 'Ryzen 3 3100', 'Cores: 4 , Threads: 8, AM4 Socket, 3.6 GHZ', 60000, 1, 'https://p1.akcdn.net/mid/681776586.amd-ryzen-3-3100-4-core-3-6ghz-am4-boxed-with-fan-and-heatsink.jpg', 0),
(2, 'Ryzen 3 3300x', 'Cores: 4 , Threads: 8, AM4 Socket, 3.8 GHZ', 80000, 1, 'https://p1.akcdn.net/mid/681776622.amd-ryzen-3-3300x-4-core-3-8ghz-am4.jpg', 5),
(3, 'RTX 3080 Ti', 'Memory Size :\n12 GB ,\nMemory Type :\nGDDR6X ,\nBase Clock :\n1365 MHz , \nBoost Clock :\n1665 MHz', 460000, 2, 'https://p1.akcdn.net/full/824917482.gigabyte-geforce-gaming-rtx-3080-ti-oc-12gb-gddr6x-384bit-gv-n308tgaming-oc-12gd.jpg', 5),
(4, 'RTX 3080 ', 'Memory Size :\n12 / 10 GB ,\nMemory Type :\nGDDR6X ,\nBase Clock :\n1260 MHz , \nBoost Clock :\n1710 MHz', 620000, 2, 'https://s13emagst.akamaized.net/products/38816/38815088/images/res_1e3d16ff83aa06a041d3bef36338b6c8.jpg', 0),
(5, 'ASROCK H510 Pro BTC+', 'Socket: LGA-1200 , Chipset: Intel H510, Memory Slots: 1xDDR4, Ports: 4xUSB 2.0 ', 85000, 3, 'https://media.icdn.hu/product/GalleryMod/2021-07/707331/resp/1669530_asrock_h510_pro_btc_.webp', 5),
(6, 'ASUS ROG STRIX Z690-A GAMING WIFI D4 +', 'Socket: LGA-1700 , Chipset:Z690, Memory Slots: 4xDDR4, Ports: 4xUSB 2.0 ', 130000, 3, 'https://media.icdn.hu/product/GalleryMod/2021-10/729148/resp/1738360_asus-rog-strix-z690-a-gaming-wifi-d4.webp', 5),
(7, 'Kingston Fury 16GB Beast DDR4 3200MHz (2x8)', 'Latency: CL 16 , 3200mhz', 30000, 4, 'https://media.icdn.hu/product/GalleryMod/2021-07/709351/resp/1675337_kingston_fury_16gb_beast_ddr4_3200mhz_cl16_kit_kf432c16bbk2_16.webp', 5),
(8, 'G.SKILL 16GB Aegis DDR4 3200MHz', 'Latency: CL 16 , 3200mhz', 28000, 4, 'https://media.icdn.hu/product/GalleryMod/2019-10/584257/resp/1321106_gskill_16gb_aegis_ddr4_3200mhz_cl16_kit_f4_3200c16d_16gis.webp', 5),
(9, 'EVGA SuperNOVA GA 750W', 'Size: ATX, 750W , Fan: 135mm, Modular', 50000, 5, 'https://media.icdn.hu/product/GalleryMod/2020-12/670251/resp/1560229_evga_supernova_750_ga_750w.webp', 5),
(10, 'COOLERMASTER MWE Bronze 750W V2', 'Size: ATX, 750W , Fan: 120mm, Modular', 50000, 5, 'https://media.icdn.hu/product/GalleryMod/2020-11/666997/resp/1550850_coolermaster_mwe_750_bronze_v2_750w.webp', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_order` (`orderid`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user` (`userid`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_order` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`);

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_user` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
