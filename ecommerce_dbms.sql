-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 22, 2022 at 07:52 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderItem`
--

CREATE TABLE `orderItem` (
  `orderItemID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  `unitPrice` decimal(14,2) NOT NULL,
  `totalPrice` decimal(14,2) NOT NULL,
  `orderID` int(11) NOT NULL,
  `paidStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderItem`
--

INSERT INTO `orderItem` (`orderItemID`, `productID`, `units`, `unitPrice`, `totalPrice`, `orderID`, `paidStatus`) VALUES
(1, 1, 12, '12.00', '144.00', 1, 0),
(2, 2, 8, '12.00', '96.00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderPayment`
--

CREATE TABLE `orderPayment` (
  `orderID` int(11) NOT NULL,
  `paymentMethod` varchar(30) NOT NULL,
  `cardNumber` varchar(16) NOT NULL,
  `cardExpiration` datetime DEFAULT current_timestamp(),
  `agreement` tinyint(1) NOT NULL,
  `paidAmount` decimal(14,2) NOT NULL,
  `transactionCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderPayment`
--

INSERT INTO `orderPayment` (`orderID`, `paymentMethod`, `cardNumber`, `cardExpiration`, `agreement`, `paidAmount`, `transactionCode`) VALUES
(1, 'VISA', '4310009090907878', '2022-04-22 01:36:53', 1, '13.00', 'REWUIRWEH432423'),
(2, 'MasterCard', '13200030121090', '2022-04-22 01:36:53', 1, '80.00', 'UORWER732234UO');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `orderDate` datetime DEFAULT current_timestamp(),
  `shippingID` int(11) NOT NULL,
  `shippingCost` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `userID`, `orderDate`, `shippingID`, `shippingCost`) VALUES
(1, 1, '2022-04-22 01:32:34', 1, '13.00'),
(2, 2, '2022-04-22 01:32:34', 2, '90.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `unitPrice` decimal(14,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `unitPrice`, `quantity`) VALUES
(1, 'Tooth Brush', '12.00', 3),
(2, 'Tooth Paste', '56.00', 30);

-- --------------------------------------------------------

--
-- Table structure for table `shippingInformation`
--

CREATE TABLE `shippingInformation` (
  `shippingID` int(11) NOT NULL,
  `addressOne` varchar(100) NOT NULL,
  `addressTwo` varchar(100) NOT NULL,
  `stateCode` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipCode` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippingInformation`
--

INSERT INTO `shippingInformation` (`shippingID`, `addressOne`, `addressTwo`, `stateCode`, `city`, `zipCode`) VALUES
(1, '89 Wall Street', '23 Millwall', 'TEX', 'Texas', '893223'),
(2, '78, London Walk', '21 Main Street', 'TEX', 'London', '4328334');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `stateCode` varchar(10) NOT NULL,
  `stateName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`stateCode`, `stateName`) VALUES
('IND', 'INDIANA'),
('TEX', 'Texas');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `addressOne` varchar(100) NOT NULL,
  `addressTwo` varchar(100) DEFAULT NULL,
  `stateCode` varchar(10) NOT NULL,
  `zipCode` varchar(9) NOT NULL,
  `phoneNumber` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fullName`, `addressOne`, `addressTwo`, `stateCode`, `zipCode`, `phoneNumber`, `email`) VALUES
(1, 'Washington Brian', '89, Main Street', '90 Illinois', 'TEX', '893223', '123123123123', 'washington@gmail.com'),
(2, 'Lynda Beryl', 'Lowton 78th Street', NULL, 'IND', '4328334', '1891891891', 'lynda@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderItem`
--
ALTER TABLE `orderItem`
  ADD PRIMARY KEY (`orderItemID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indexes for table `orderPayment`
--
ALTER TABLE `orderPayment`
  ADD PRIMARY KEY (`transactionCode`),
  ADD KEY `orderID` (`orderID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `shippingID` (`shippingID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `shippingInformation`
--
ALTER TABLE `shippingInformation`
  ADD PRIMARY KEY (`shippingID`),
  ADD KEY `stateCode` (`stateCode`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`stateCode`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `stateCode` (`stateCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderItem`
--
ALTER TABLE `orderItem`
  MODIFY `orderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippingInformation`
--
ALTER TABLE `shippingInformation`
  MODIFY `shippingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderItem`
--
ALTER TABLE `orderItem`
  ADD CONSTRAINT `orderItem_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  ADD CONSTRAINT `orderItem_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`);

--
-- Constraints for table `orderPayment`
--
ALTER TABLE `orderPayment`
  ADD CONSTRAINT `orderPayment_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shippingID`) REFERENCES `shippingInformation` (`shippingID`);

--
-- Constraints for table `shippingInformation`
--
ALTER TABLE `shippingInformation`
  ADD CONSTRAINT `shippingInformation_ibfk_1` FOREIGN KEY (`stateCode`) REFERENCES `state` (`stateCode`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`stateCode`) REFERENCES `state` (`stateCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
