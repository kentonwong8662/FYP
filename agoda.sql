-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-05-20 17:15:16
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `agoda`
--

-- --------------------------------------------------------

--
-- 資料表結構 `blog`
--

CREATE TABLE `blog` (
  `blog_ID` int(100) NOT NULL,
  `blog_Title` char(255) COLLATE utf8mb4_bin NOT NULL,
  `blog_Index` text COLLATE utf8mb4_bin NOT NULL,
  `blog_Type` char(100) COLLATE utf8mb4_bin NOT NULL,
  `blog_Tag` char(100) COLLATE utf8mb4_bin NOT NULL,
  `location_ID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `member_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `blog`
--

INSERT INTO `blog` (`blog_ID`, `blog_Title`, `blog_Index`, `blog_Type`, `blog_Tag`, `location_ID`, `member_ID`) VALUES
(1, 'Hello World', 'Hello, I am Kenton from Hong Kong.', 'Hello', 'Hello', 'L00001', 1),
(2, 'Welcome', 'Welcome to use our page.', 'Welcome', 'Welcome', 'L00002', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `business_data`
--

CREATE TABLE `business_data` (
  `business_ID` int(10) NOT NULL,
  `business_Name` char(100) COLLATE utf8mb4_bin NOT NULL,
  `business_Type` char(100) COLLATE utf8mb4_bin NOT NULL,
  `business_Intro` char(255) COLLATE utf8mb4_bin NOT NULL,
  `business_Link` char(255) COLLATE utf8mb4_bin NOT NULL,
  `business_Logo` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `business_data`
--

INSERT INTO `business_data` (`business_ID`, `business_Name`, `business_Type`, `business_Intro`, `business_Link`, `business_Logo`) VALUES
(1, 'Kenton Travel', 'Study Tour', 'Study Tour', 'www.kenton.com.hk', '');

-- --------------------------------------------------------

--
-- 資料表結構 `loca_country`
--

CREATE TABLE `loca_country` (
  `country_ID` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `country_Name` char(30) COLLATE utf8mb4_bin NOT NULL,
  `country_Continent` char(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `loca_country`
--

INSERT INTO `loca_country` (`country_ID`, `country_Name`, `country_Continent`) VALUES
('C001', 'China', 'Asia'),
('C002', 'United Kingdom', 'Europe'),
('C003', 'United States', 'North America'),
('C004', 'Japan', 'Asia');

-- --------------------------------------------------------

--
-- 資料表結構 `loca_location`
--

CREATE TABLE `loca_location` (
  `location_ID` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `location_Name` char(100) COLLATE utf8mb4_bin NOT NULL,
  `country_ID` varchar(5) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `loca_location`
--

INSERT INTO `loca_location` (`location_ID`, `location_Name`, `country_ID`) VALUES
('L00001', 'Hong Kong', 'C001'),
('L00002', 'London', 'C002'),
('L00003', 'Beijing', 'C001'),
('L00004', 'Coventry', 'C002'),
('L00005', 'New York', 'C003'),
('L00006', 'Tokyo', 'C004');

-- --------------------------------------------------------

--
-- 資料表結構 `member_data`
--

CREATE TABLE `member_data` (
  `member_ID` int(10) NOT NULL,
  `member_Surname` char(255) COLLATE utf8mb4_bin NOT NULL,
  `member_Firstname` char(255) COLLATE utf8mb4_bin NOT NULL,
  `member_Username` char(255) COLLATE utf8mb4_bin NOT NULL,
  `member_password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `member_Phone` int(255) NOT NULL,
  `member_Email` char(255) COLLATE utf8mb4_bin NOT NULL,
  `member_Location` char(255) COLLATE utf8mb4_bin NOT NULL,
  `member_Address` char(255) COLLATE utf8mb4_bin NOT NULL,
  `member_Type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `member_data`
--

INSERT INTO `member_data` (`member_ID`, `member_Surname`, `member_Firstname`, `member_Username`, `member_password`, `member_Phone`, `member_Email`, `member_Location`, `member_Address`, `member_Type`) VALUES
(1, 'Wong', 'Kenton', 'Kenton', '12345678', 98765432, 'thelastk2820@gmail.com', 'Hong Kong', 'Hong Kong', 'TourGudide'),
(2, 'A', 'B', 'Agoda', '87654321', 98765432, 'agoda.fyp.auto@gmail.com', 'World', 'World', 'NormalUser'),
(3, 'Test', 'Yo', 'yotest', '12345678', 55556666, 'thelastk2820@gmail.com', 'HK', 'TSTE', 'TravelBusiness'),
(8, 'Welcome', 'Hey', 'Yo', '12345678', 55208994, 'ab@gmail.com', 'Hong Kong', 'HK299', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `member_order`
--

CREATE TABLE `member_order` (
  `member_ID` int(10) NOT NULL,
  `trips_ID` int(11) NOT NULL,
  `product_ID` int(255) NOT NULL,
  `order_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `member_payment`
--

CREATE TABLE `member_payment` (
  `member_ID` int(10) NOT NULL,
  `Credit_card_number` int(16) NOT NULL,
  `CSV` int(3) NOT NULL,
  `Expiry_date` char(5) COLLATE utf8mb4_bin NOT NULL,
  `Credit_card_name` char(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_ID` int(255) NOT NULL,
  `product_Name` char(255) COLLATE utf8mb4_bin NOT NULL,
  `product_Intro` text COLLATE utf8mb4_bin NOT NULL,
  `product_Price` int(10) NOT NULL,
  `product_Logo` char(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `product_Stock` int(5) NOT NULL,
  `business_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`product_ID`, `product_Name`, `product_Intro`, `product_Price`, `product_Logo`, `product_Stock`, `business_ID`) VALUES
(1, 'Hong Kong Sim card', '4GB local 4G in 5days', 50, '', 20, NULL),
(2, '3UK sim card', '12GB 4G UK data in 30days', 160, '', 10, NULL),
(3, 'Test', 'GOGO', 10, '', 20, 1),
(8, 'mask', '50 masks', 150, NULL, 10, NULL),
(9, 'mask', '50 masks', 500, NULL, 800, 1),
(10, 'hong kong', 'hello', 50, NULL, 20, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product_type`
--

CREATE TABLE `product_type` (
  `product_type_ID` int(5) NOT NULL,
  `product_type_Name` char(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `trips`
--

CREATE TABLE `trips` (
  `trips_ID` int(11) NOT NULL,
  `member_ID` int(10) NOT NULL,
  `trips_Title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `trips_Intro` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `trips_dateStart` date DEFAULT NULL,
  `trips_dateEnd` date DEFAULT NULL,
  `trips_Price` int(11) NOT NULL,
  `trips_Stock` int(11) NOT NULL,
  `trips_Location` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `trips_Type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `trip_uploadDate` date DEFAULT NULL,
  `trip_guide` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `trips`
--

INSERT INTO `trips` (`trips_ID`, `member_ID`, `trips_Title`, `trips_Intro`, `trips_dateStart`, `trips_dateEnd`, `trips_Price`, `trips_Stock`, `trips_Location`, `trips_Type`, `trip_uploadDate`, `trip_guide`) VALUES
(1, 1, 'Hong Kong Day Trip', 'KLT to TSTE', '2020-05-11', '2020-05-11', 100, 500, 'Hong Kong', 'Day Trip', '2020-05-04', NULL),
(2, 1, 'World trip', 'World trip', NULL, NULL, 100000, 10, NULL, 'Business', NULL, NULL),
(3, 1, 'robt', 'Hong kong', NULL, NULL, 5000, 20, 'robot', 'technology', NULL, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_ID`),
  ADD KEY `member_ID` (`member_ID`),
  ADD KEY `country_ID` (`location_ID`);

--
-- 資料表索引 `business_data`
--
ALTER TABLE `business_data`
  ADD PRIMARY KEY (`business_ID`);

--
-- 資料表索引 `loca_country`
--
ALTER TABLE `loca_country`
  ADD PRIMARY KEY (`country_ID`);

--
-- 資料表索引 `loca_location`
--
ALTER TABLE `loca_location`
  ADD PRIMARY KEY (`location_ID`),
  ADD KEY `country_ID` (`country_ID`);

--
-- 資料表索引 `member_data`
--
ALTER TABLE `member_data`
  ADD PRIMARY KEY (`member_ID`);

--
-- 資料表索引 `member_order`
--
ALTER TABLE `member_order`
  ADD KEY `member_ID` (`member_ID`),
  ADD KEY `product_ID` (`product_ID`),
  ADD KEY `trips_ID` (`trips_ID`);

--
-- 資料表索引 `member_payment`
--
ALTER TABLE `member_payment`
  ADD PRIMARY KEY (`member_ID`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `business_ID` (`business_ID`);

--
-- 資料表索引 `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`product_type_ID`);

--
-- 資料表索引 `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trips_ID`),
  ADD KEY `member_ID` (`member_ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member_data`
--
ALTER TABLE `member_data`
  MODIFY `member_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `product_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_type`
--
ALTER TABLE `product_type`
  MODIFY `product_type_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trips`
--
ALTER TABLE `trips`
  MODIFY `trips_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`member_ID`) REFERENCES `member_data` (`member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`location_ID`) REFERENCES `loca_location` (`location_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `loca_location`
--
ALTER TABLE `loca_location`
  ADD CONSTRAINT `loca_location_ibfk_1` FOREIGN KEY (`country_ID`) REFERENCES `loca_country` (`country_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `member_order`
--
ALTER TABLE `member_order`
  ADD CONSTRAINT `member_order_ibfk_1` FOREIGN KEY (`member_ID`) REFERENCES `member_data` (`member_ID`),
  ADD CONSTRAINT `member_order_ibfk_2` FOREIGN KEY (`trips_ID`) REFERENCES `trips` (`trips_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_order_ibfk_3` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `member_payment`
--
ALTER TABLE `member_payment`
  ADD CONSTRAINT `member_payment_ibfk_1` FOREIGN KEY (`member_ID`) REFERENCES `member_data` (`member_ID`);

--
-- 資料表的限制式 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`business_ID`) REFERENCES `business_data` (`business_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`member_ID`) REFERENCES `member_data` (`member_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
