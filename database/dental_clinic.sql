-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2017 at 12:53 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dental_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(6) NOT NULL,
  `street_no` int(4) NOT NULL,
  `city` text NOT NULL,
  `municipality` text NOT NULL,
  `province` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(6) NOT NULL,
  `tel` varchar(9) NOT NULL,
  `cell` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctors_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctors_id`) VALUES
(101),
(102);

-- --------------------------------------------------------

--
-- Table structure for table `hmo`
--

CREATE TABLE `hmo` (
  `hmo_no` int(11) NOT NULL,
  `holder` int(6) NOT NULL,
  `fund` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hmo_coverage`
--

CREATE TABLE `hmo_coverage` (
  `hmo_no` int(11) NOT NULL,
  `coverage` text NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(6) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `civil_status` varchar(12) NOT NULL,
  `birthdate` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birthplace` date NOT NULL,
  `occupation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `firstname`, `lastname`, `middlename`, `civil_status`, `birthdate`, `nationality`, `age`, `gender`, `birthplace`, `occupation`) VALUES
(1, '', '', '', '', '0000-00-00', '', 0, '', '0000-00-00', ''),
(2, '', '', '', '', '0000-00-00', '', 0, '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_no` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_no`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `surgery`
--

CREATE TABLE `surgery` (
  `record_no` int(6) NOT NULL,
  `procedures` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor` int(6) NOT NULL,
  `patient` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surgery`
--

INSERT INTO `surgery` (`record_no`, `procedures`, `date`, `time`, `doctor`, `patient`) VALUES
(1101, 'tooth filling', '2017-12-07', '04:08:17', 0, 1),
(1102, 'oral prophylaxis', '2017-12-07', '08:36:32', 0, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctors_id`);

--
-- Indexes for table `hmo`
--
ALTER TABLE `hmo`
  ADD PRIMARY KEY (`hmo_no`),
  ADD KEY `hmo_no` (`hmo_no`),
  ADD KEY `hmo_no_2` (`hmo_no`),
  ADD KEY `hmo_no_3` (`hmo_no`),
  ADD KEY `holder` (`holder`);

--
-- Indexes for table `hmo_coverage`
--
ALTER TABLE `hmo_coverage`
  ADD PRIMARY KEY (`hmo_no`),
  ADD KEY `hmo_no` (`hmo_no`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_no`),
  ADD KEY `patient_no` (`patient_no`);

--
-- Indexes for table `surgery`
--
ALTER TABLE `surgery`
  ADD PRIMARY KEY (`record_no`),
  ADD KEY `record_no` (`record_no`),
  ADD KEY `patient` (`patient`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hmo`
--
ALTER TABLE `hmo`
  ADD CONSTRAINT `hmo_ibfk_1` FOREIGN KEY (`holder`) REFERENCES `patient` (`patient_no`);

--
-- Constraints for table `hmo_coverage`
--
ALTER TABLE `hmo_coverage`
  ADD CONSTRAINT `hmo_coverage_ibfk_1` FOREIGN KEY (`hmo_no`) REFERENCES `hmo` (`hmo_no`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`patient_no`) REFERENCES `info` (`id`);

--
-- Constraints for table `surgery`
--
ALTER TABLE `surgery`
  ADD CONSTRAINT `surgery_ibfk_2` FOREIGN KEY (`patient`) REFERENCES `patient` (`patient_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
