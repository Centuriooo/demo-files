-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql-database:3306
-- Generation Time: Dec 14, 2022 at 02:38 PM
-- Server version: 8.0.20
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_monitor`
--
CREATE DATABASE IF NOT EXISTS `system_monitor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `system_monitor`;


-- --------------------------------------------------------

--
-- Table structure for table `CPU_temp`
--

CREATE TABLE `CPU_temp` (
  `id` int NOT NULL,
  `system_id` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `temperature` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CPU_usage`
--

CREATE TABLE `CPU_usage` (
  `id` int NOT NULL,
  `system_id` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cpu-usage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DISK_usage`
--

CREATE TABLE `DISK_usage` (
  `id` int NOT NULL,
  `system_id` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `disk-usage` double NOT NULL,
  `available` int NOT NULL,
  `used` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NETWORK_usage`
--

CREATE TABLE `NETWORK_usage` (
  `id` int NOT NULL,
  `system_id` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `network-usage` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RAM_usage`
--

CREATE TABLE `RAM_usage` (
  `id` int NOT NULL,
  `system_id` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ram-usage` double NOT NULL,
  `available` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `System`
--

CREATE TABLE `System` (
  `system_id` int NOT NULL,
  `operating_system` text NOT NULL,
  `disk_size` int NOT NULL,
  `ram_size` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `System`
--

INSERT INTO `System` (`system_id`, `operating_system`, `disk_size`, `ram_size`) VALUES
(1, "Ubuntu", 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CPU_temp`
--
ALTER TABLE `CPU_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_id` (`system_id`);

--
-- Indexes for table `CPU_usage`
--
ALTER TABLE `CPU_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_id` (`system_id`);

--
-- Indexes for table `DISK_usage`
--
ALTER TABLE `DISK_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_id` (`system_id`);

--
-- Indexes for table `NETWORK_usage`
--
ALTER TABLE `NETWORK_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_id` (`system_id`);

--
-- Indexes for table `RAM_usage`
--
ALTER TABLE `RAM_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_id` (`system_id`);

--
-- Indexes for table `System`
--
ALTER TABLE `System`
  ADD PRIMARY KEY (`system_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CPU_temp`
--
ALTER TABLE `CPU_temp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CPU_usage`
--
ALTER TABLE `CPU_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;


--
-- AUTO_INCREMENT for table `DISK_usage`
--
ALTER TABLE `DISK_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `NETWORK_usage`
--
ALTER TABLE `NETWORK_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `RAM_usage`
--
ALTER TABLE `RAM_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `System`
--
ALTER TABLE `System`
  MODIFY `system_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CPU_temp`
--
ALTER TABLE `CPU_temp`
  ADD CONSTRAINT `CPU_temp_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `System` (`system_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `CPU_usage`
--
ALTER TABLE `CPU_usage`
  ADD CONSTRAINT `CPU_usage_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `System` (`system_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `DISK_usage`
--
ALTER TABLE `DISK_usage`
  ADD CONSTRAINT `DISK_usage_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `System` (`system_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `NETWORK_usage`
--
ALTER TABLE `NETWORK_usage`
  ADD CONSTRAINT `NETWORK_usage_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `System` (`system_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `RAM_usage`
--
ALTER TABLE `RAM_usage`
  ADD CONSTRAINT `RAM_usage_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `System` (`system_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;