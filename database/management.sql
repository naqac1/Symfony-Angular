-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 23, 2023 at 08:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) UNSIGNED NOT NULL,
  `role` varchar(25) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` char(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `role`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin', 'test.admin@test1.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2023-07-23 16:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `customer` varchar(25) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `city` varchar(25) NOT NULL DEFAULT '',
  `postcode` varchar(255) NOT NULL DEFAULT '0',
  `country` varchar(25) NOT NULL DEFAULT '',
  `amount` decimal(10,0) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `deleted` varchar(10) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `customers_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='`id` int(11) unsigned NOT NULL AUTO_INCREMENT,';

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer`, `address1`, `city`, `postcode`, `country`, `amount`, `status`, `deleted`, `date`, `last_modified`, `customers_id`) VALUES
(1000, 'Hilary Greer', '488-8906 Facilisis Avenue', 'Mobile', '511162', 'Switzerland', 6093, 'cancelled', 'No', '2020-07-22 18:57:51', '2020-10-16 05:35:52', 1),
(1001, 'Yen Ortega', '9360 Iaculis Road', 'Coquimbo', '960096', 'China', 8545, 'cancelled', 'No', '2020-04-19 03:39:30', '2020-10-21 08:16:30', 1),
(1002, 'Maris Oconnor', '1234 Posuere St.', 'Acquasanta Terme', '551564', 'Hong Kong', 2609, 'in_production', 'No', '2019-07-03 15:44:11', '2019-08-29 03:02:30', 1),
(1003, 'Sybill Gregory', '809-4206 Nunc St.', 'Birmingham', 'M0C 9A5', 'Moldova', 3790, 'pending', 'No', '2020-10-16 08:48:14', '2021-01-18 03:38:23', 1),
(1004, 'Briar Lee', '973-9570 Nisl Rd.', 'Fryazino', '21109', 'French Guiana', 2470, 'pending', 'Yes', '2020-09-02 09:26:05', '2020-09-09 01:45:51', 1),
(1005, 'Keiko Mathews', '3611 Non Rd.', 'Chicoutimi', '26269', 'Kiribati', 7919, 'cancelled', 'No', '2019-07-19 10:17:31', '2019-09-25 07:15:48', 1),
(1006, 'Latifah Irwin', '620-3105 Sapien Road', 'San Pedro', '923996', 'Cambodia', 9645, 'pending', 'No', '2020-09-09 02:15:01', '2019-10-05 04:21:03', 1),
(1007, 'Hillary Watkins', 'P.O. Box 621, 5214 Nec Rd.', 'Raurkela', '64-651', 'Azerbaijan', 6491, 'in_production', 'No', '2020-09-25 12:48:23', '2020-06-17 07:03:17', 1),
(1008, 'Jena Santos', 'P.O. Box 304, 3464 Accumsan Av.', 'Beaufays', '7645 IC', 'Maldives', 1207, 'in_production', 'No', '2020-10-29 04:29:02', '2020-07-14 22:11:21', 1),
(1009, 'Tana Young', 'Ap #463-9557 Ipsum Av.', 'Bevilacqua', '66326', 'Lebanon', 8525, 'cancelled', 'No', '2021-01-06 06:38:45', '2021-01-08 10:05:11', 1),
(1010, 'Madeline Lane', '2409 Nunc Rd.', 'White Rock', 'Z1836', 'Papua New Guinea', 8492, 'pending', 'Yes', '2019-09-10 02:57:38', '2019-06-22 09:02:42', 1),
(1011, 'Ignacia Drake', '170-5878 Neque Road', 'Hull', '7350 IL', 'Angola', 8202, 'cancelled', 'Yes', '2020-01-11 11:13:12', '2021-03-08 07:29:24', 1),
(1012, 'Ciara Mayo', '6487 Sem Ave', 'Bonnyville', '22747', 'Saudi Arabia', 7639, 'in_production', 'No', '2019-10-01 14:38:27', '2019-07-23 10:28:28', 1),
(1013, 'Carol Beard', 'Ap #800-2454 Orci. Road', 'Providencia', '311774', 'Aruba', 5236, 'cancelled', 'No', '2019-07-11 07:14:37', '2020-04-20 16:38:54', 1),
(1014, 'Francesca Joyner', 'Ap #587-660 Erat. Street', 'Baracaldo', '4414 MV', 'Isle of Man', 9744, 'pending', 'Yes', '2019-07-03 15:45:50', '2020-11-21 14:51:51', 1),
(1015, 'Charity Robertson', '997-5278 Mauris Street', 'Ternitz', '3918', 'Philippines', 1785, 'cancelled', 'Yes', '2019-08-03 21:34:59', '2020-03-05 17:56:49', 1),
(1016, 'Azalia Harvey', 'P.O. Box 385, 5118 Consequat Street', 'Saint-Urbain', '504023', 'Oman', 8662, 'in_production', 'No', '2019-10-13 10:43:04', '2020-04-25 23:29:17', 1),
(1017, 'Hyacinth Harrington', 'P.O. Box 565, 5029 Neque Street', 'North Vancouver', '01951', 'Sudan', 3224, 'cancelled', 'Yes', '2020-11-13 11:11:12', '2021-04-03 02:59:48', 1),
(1018, 'Iris Elliott', '691-1863 Duis Street', 'Ambleside', 'Y4M 1S1', 'Canada', 5150, 'cancelled', 'Yes', '2020-09-07 21:13:15', '2020-05-08 17:04:14', 1),
(1019, 'Desiree House', 'Ap #974-6672 Mi Rd.', 'San Martino in Pensilis', '6145', 'Cameroon', 1531, 'pending', 'Yes', '2020-09-16 10:07:09', '2020-09-05 22:12:16', 1),
(1020, 'Faith Nunez', 'P.O. Box 352, 1955 Proin Rd.', 'Santa Marta', '06359', 'Western Sahara', 2005, 'cancelled', 'Yes', '2020-05-07 21:18:55', '2020-07-26 20:08:33', 1),
(1021, 'Whitney Head', 'P.O. Box 739, 8396 Cras Rd.', 'Tübingen', '09558', 'Tunisia', 9985, 'cancelled', 'Yes', '2021-03-04 19:04:26', '2019-11-22 05:12:36', 1),
(1022, 'Colleen Chandler', '2418 Magna Rd.', 'Kortessem', '6114', 'Micronesia', 9905, 'pending', 'Yes', '2021-03-10 19:43:22', '2020-05-13 06:10:49', 1),
(1023, 'Kerry Franklin', '232-3004 Aliquet St.', 'Paternopoli', '6515', 'Faroe Islands', 8060, 'pending', 'Yes', '2019-12-29 06:48:42', '2021-04-25 21:36:18', 1),
(1024, 'Stephanie Avila', '7083 Ante Street', 'Toledo', '4516', 'Hong Kong', 2303, 'pending', 'Yes', '2019-08-11 10:42:26', '2021-05-03 14:13:53', 1),
(1025, 'Shay Nicholson', 'P.O. Box 747, 8427 Fringilla St.', 'Wimbledon', '13725', 'El Salvador', 4511, 'in_production', 'Yes', '2020-08-22 00:34:52', '2019-05-14 03:49:30', 1),
(1026, 'Kalia Gilbert', 'P.O. Box 912, 6881 Tempus Rd.', 'Overland Park', '60458', 'Marshall Islands', 6581, 'cancelled', 'Yes', '2020-01-20 17:27:55', '2020-08-10 07:06:13', 1),
(1027, 'Isabella Hawkins', 'P.O. Box 160, 7777 Vitae Avenue', 'Charlottetown', '91090', 'Saint Martin', 7122, 'in_production', 'No', '2020-09-22 12:49:06', '2019-09-25 10:30:42', 1),
(1028, 'Nelle Hill', 'P.O. Box 527, 5047 Nulla Rd.', 'Angoulême', '888573', 'Bahamas', 7678, 'cancelled', 'Yes', '2021-04-04 15:57:36', '2019-10-15 20:12:41', 1),
(1029, 'Dakota Sexton', '733-3500 Ut Ave', 'Erciş', '4508', 'Turkmenistan', 8275, 'cancelled', 'Yes', '2020-11-01 21:44:04', '2020-05-12 20:45:47', 1),
(1030, 'Minerva Beard', 'Ap #882-5348 Tempor Av.', 'San Fernando', '322486', 'Iceland', 6494, 'cancelled', 'No', '2019-08-13 15:48:20', '2020-04-09 06:57:26', 1),
(1031, 'Hanae Curry', 'P.O. Box 525, 8870 Nullam Avenue', 'Sesto al Reghena', 'M9H 8A9', 'Namibia', 6943, 'pending', 'Yes', '2019-11-08 19:28:10', '2021-02-02 00:37:48', 1),
(1032, 'Teegan Fry', 'Ap #580-7426 Lectus Street', 'Winnipeg', 'R4T 6X2', 'Martinique', 3420, 'in_production', 'No', '2020-08-08 04:36:05', '2021-04-12 04:57:04', 1),
(1033, 'Briar Harris', 'P.O. Box 132, 2239 Senectus St.', 'Beaumaris', '12197-829', 'Turkmenistan', 5545, 'pending', 'Yes', '2020-02-27 00:00:00', '2019-12-22 22:45:00', 1),
(1034, 'Kylie Middleton', 'Ap #109-2447 Tincidunt Rd.', 'Dipignano', '35-794', 'Guatemala', 9081, 'pending', 'No', '2020-09-16 05:59:25', '2019-07-14 00:52:11', 1),
(1035, 'Nina Valencia', '9637 Mollis Road', 'Pont-de-Loup', '25648-577', 'Tonga', 1615, 'pending', 'No', '2020-12-12 10:08:50', '2019-06-04 03:34:32', 1),
(1036, 'Rowan Mendez', '7774 Non St.', 'Samsun', '4982', 'Virgin Islands, British', 3823, 'cancelled', 'No', '2020-09-17 14:42:57', '2019-12-31 02:58:59', 1),
(1037, 'Victoria Fuentes', 'P.O. Box 303, 108 Sit Road', 'Yerbas Buenas', '299442', 'Madagascar', 3557, 'cancelled', 'Yes', '2019-09-22 20:11:56', '2020-09-11 15:34:03', 1),
(1038, 'Joelle Hudson', 'P.O. Box 465, 9929 Sapien. Ave', 'Motta Visconti', '762423', 'Dominica', 6594, 'cancelled', 'Yes', '2019-06-13 06:40:51', '2019-11-13 19:52:41', 1),
(1039, 'Vivian Rosario', '6041 Cras Rd.', 'Henderson', '60167', 'Japan', 3239, 'pending', 'Yes', '2020-03-26 20:36:41', '2019-12-22 14:14:00', 1),
(1040, 'Dora Blevins', 'P.O. Box 846, 5041 Ultrices. St.', 'Ripalta Guerina', '471363', 'Namibia', 3596, 'pending', 'No', '2019-11-08 19:40:51', '2021-04-16 08:00:15', 1),
(1041, 'Raya Guerra', '968-8635 In St.', 'Ganshoren', '94264', 'Chad', 6702, 'in_production', 'Yes', '2020-07-02 13:35:12', '2020-10-07 03:27:06', 1),
(1042, 'Vera Adkins', '946-5117 Lacus. Rd.', 'Malvern', '902243', 'Paraguay', 7175, 'cancelled', 'No', '2020-03-31 19:57:53', '2019-06-16 08:35:08', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`,`customers_id`),
  ADD KEY `fk_orders_customers_idx` (`customers_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1043;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
