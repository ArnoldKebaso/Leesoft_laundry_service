use laundry;
-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 12:01 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

-- CREATE DATABASE LAUNDRY;
-- USE LAUNDRY;

SET SQL_MODE
= "NO_AUTO_VALUE_ON_ZERO";
SET time_zone
= "+00:00";

-- Database: `laundry`
--

-- Table structure for table `laundry`
--

CREATE TABLE `laundry`
(
  `laun_id` int NOT NULL,
  `customer_name` varchar
(100) NOT NULL,
  `laun_priority` int NOT NULL,
  `laun_weight` int NOT NULL,
  `laun_date_received` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP,
  `laun_claimed
` tinyint NOT NULL DEFAULT '0',
  `laun_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `laundry`
--

INSERT INTO `laundry` (`
laun_id`,
`customer_name
`, `laun_priority`, `laun_weight`, `laun_date_received`, `laun_claimed`, `laun_type_id`) VALUES
(7, 'Wilma', 7, 3, '2024-04-19 16:40:49', 1, 1),
(9, 'Julia', 3, 2, '2024-03-19 22:43:23', 1, 1);

-- Table structure for table `laundry_type`
--

CREATE TABLE `laundry_type`
(
  `laun_type_id` int NOT NULL,
  `laun_type_desc` varchar
(50) NOT NULL,
  `laun_type_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `laundry_type`
--

INSERT INTO `laundry_type` (`
laun_type_id`,
`laun_type_desc
`, `laun_type_price`) VALUES
(1, 'Blanket', 20),
(2, 'Clothes', 30);

-- Table structure for table `sales`
--

CREATE TABLE `sales`
(
  `sale_id` int NOT NULL,
  `sale_customer_name` varchar
(100) NOT NULL,
  `sale_type_desc` varchar
(50) NOT NULL,
  `sale_date_paid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP,
  `sale_laundry_received
` datetime NOT NULL,
  `sale_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `sales`
--

INSERT INTO `sales` (`
sale_id`,
`sale_customer_name
`, `sale_type_desc`, `sale_date_paid`, `sale_laundry_received`, `sale_amount`) VALUES
(1, 'Wilma', 'socks', '2024-05-30 22:38:02', '2024-05-31 07:00:16', 60),
(2, 'Julia', 'Clothes', '2024-05-30 22:39:02', '2024-05-31 07:01:16', 60);

-- Table structure for table `user`
--

CREATE TABLE user
(
  user_id int
  auto_increment primary key,
username varchar
  (255),
email varchar
  (255),
user_password varchar
  (255)
);


  -- Dumping data for table `user`
  --

  INSERT INTO `user`
    (`user_id`, `user_account
  
  `, `user_password`) VALUES
  (1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

  -- Indexes for dumped tables
  --

  -- Indexes for table `laundry`
  --
  ALTER TABLE `laundry`
  ADD PRIMARY KEY
  (`laun_id`),
  ADD KEY `laun_type_id`
  (`laun_type_id`);

  -- Indexes for table `laundry_type`
  --
  ALTER TABLE `laundry_type`
  ADD PRIMARY KEY
  (`laun_type_id`);

  -- Indexes for table `sales`
  --
  ALTER TABLE `sales`
  ADD PRIMARY KEY
  (`sale_id`);

  -- Indexes for table `user`
  --
  ALTER TABLE `user`
  ADD PRIMARY KEY
  (`user_id`);

  -- AUTO_INCREMENT for dumped tables
  --

  -- AUTO_INCREMENT for table `laundry`
  --
  ALTER TABLE `laundry`
  MODIFY `laun_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

  -- AUTO_INCREMENT for table `laundry_type`
  --
  ALTER TABLE `laundry_type`
  MODIFY `laun_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

  -- AUTO_INCREMENT for table `sales`
  --
  ALTER TABLE `sales`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

  -- AUTO_INCREMENT for table `user`
  --
  ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

  -- Constraints for dumped tables
  --

  -- Constraints for table `laundry`
  --
  ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY
  (`laun_type_id`) REFERENCES `laundry_type`
  (`laun_type_id`);
