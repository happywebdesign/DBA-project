-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 09:57 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbac`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `PermissionID` int NOT NULL,
  `PermissionName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`PermissionID`, `PermissionName`) VALUES
(1, 'Perform Transaction'),
(2, 'Approve Loan'),
(3, 'Manage Accounts'),
(4, 'Manage Users'),
(5, 'Manage Roles');

-- --------------------------------------------------------

--
-- Table structure for table `rolepermissionmapping`
--

CREATE TABLE `rolepermissionmapping` (
  `RoleID` int NOT NULL,
  `PermissionID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rolepermissionmapping`
--

INSERT INTO `rolepermissionmapping` (`RoleID`, `PermissionID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(2, 2),
(3, 2),
(2, 3),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`) VALUES
(1, 'Teller'),
(2, 'Manager'),
(3, 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`PermissionID`);

--
-- Indexes for table `rolepermissionmapping`
--
ALTER TABLE `rolepermissionmapping`
  ADD PRIMARY KEY (`RoleID`,`PermissionID`),
  ADD KEY `PermissionID` (`PermissionID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `PermissionID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rolepermissionmapping`
--
ALTER TABLE `rolepermissionmapping`
  ADD CONSTRAINT `rolepermissionmapping_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`),
  ADD CONSTRAINT `rolepermissionmapping_ibfk_2` FOREIGN KEY (`PermissionID`) REFERENCES `permissions` (`PermissionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
