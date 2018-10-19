-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2018 at 06:40 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ugmpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` mediumint(9) NOT NULL,
  `work_unit_id` mediumint(9) NOT NULL,
  `institute_id` mediumint(9) NOT NULL,
  `author_name` varchar(256) NOT NULL,
  `author_degree` varchar(256) NOT NULL,
  `author_address` text NOT NULL,
  `author_contact` varchar(20) NOT NULL,
  `author_email` varchar(256) NOT NULL,
  `author_saving_num` varchar(20) NOT NULL,
  `heir_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` mediumint(9) NOT NULL,
  `draft_id` mediumint(9) NOT NULL,
  `code_id` mediumint(9) NOT NULL,
  `book_title` varchar(256) NOT NULL,
  `book_edition` varchar(256) NOT NULL,
  `isbn` varchar(256) NOT NULL,
  `book_file` varchar(256) NOT NULL,
  `printing_type` varchar(20) NOT NULL,
  `serial_num_per_year` mediumint(9) NOT NULL,
  `copies_num` varchar(256) NOT NULL,
  `book_note` text NOT NULL,
  `book_status` tinyint(1) NOT NULL,
  `is_reprint` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` mediumint(9) NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_year` year(4) NOT NULL,
  `category_note` text NOT NULL,
  `date_open` datetime NOT NULL,
  `date_close` datetime NOT NULL,
  `category_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `code_id` mediumint(9) NOT NULL,
  `book_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE `draft` (
  `draft_id` mediumint(9) NOT NULL,
  `category_id` mediumint(9) NOT NULL,
  `theme_id` mediumint(9) NOT NULL,
  `draft_title` varchar(256) NOT NULL,
  `draft_file` varchar(256) NOT NULL,
  `proposed_fund` int(11) NOT NULL,
  `approved_fund` int(11) NOT NULL,
  `entry_date` datetime NOT NULL,
  `finish_date` datetime NOT NULL,
  `print_date` datetime NOT NULL,
  `worksheet_serial_num` int(20) NOT NULL,
  `approved_worksheet` int(20) NOT NULL,
  `is_reviewed` tinyint(1) NOT NULL,
  `review_notes` text NOT NULL,
  `is_revised` tinyint(1) NOT NULL,
  `revise_notes` text NOT NULL,
  `is_edited` tinyint(1) NOT NULL,
  `edit_notes` text NOT NULL,
  `is_layouted` tinyint(1) NOT NULL,
  `is_reprint` tinyint(1) NOT NULL,
  `draft_notes` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` mediumint(9) NOT NULL,
  `faculty_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE `institute` (
  `institute_id` mediumint(9) NOT NULL,
  `institute_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `process_id` mediumint(9) NOT NULL,
  `draft_id` mediumint(9) DEFAULT NULL,
  `reviewer_id` mediumint(9) DEFAULT NULL,
  `author_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `responsibility`
--

CREATE TABLE `responsibility` (
  `responsibility_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) DEFAULT NULL,
  `draft_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `reviewer_id` mediumint(9) NOT NULL,
  `reviewer_name` varchar(256) NOT NULL,
  `faculty_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` mediumint(9) NOT NULL,
  `role_name` varchar(256) NOT NULL,
  `publishing_module` tinyint(1) NOT NULL,
  `printing_module` tinyint(1) NOT NULL,
  `marketing_module` tinyint(1) NOT NULL,
  `storage_module` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `publishing_module`, `printing_module`, `marketing_module`, `storage_module`) VALUES
(1, 'SUPERADMIN', 1, 1, 1, 1),
(2, 'PUBLISHING ADMIN', 1, 0, 0, 0),
(3, 'PUBLISHING STAFF', 1, 0, 0, 0),
(4, 'MARKETING', 0, 0, 1, 0),
(5, 'PRODUCTION ADMIN', 0, 1, 0, 0),
(6, 'STORAGE ADMIN', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `theme_id` mediumint(9) NOT NULL,
  `theme_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` mediumint(9) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `role_id`) VALUES
(1, 'superadmin', 'superadmin', 1),
(2, 'publishingadmin', 'admin', 2),
(3, 'publishingstaff', 'staff', 3),
(4, 'marketingadmin', 'admin', 4),
(5, 'productionadmin', 'admin', 5),
(6, 'storageadmin', 'admin', 6);

-- --------------------------------------------------------

--
-- Table structure for table `worksheet`
--

CREATE TABLE `worksheet` (
  `worksheet_id` mediumint(9) NOT NULL,
  `draft_id` mediumint(9) NOT NULL,
  `worksheet_num` varchar(256) NOT NULL,
  `is_reprint` tinyint(1) NOT NULL,
  `reprint_code` varchar(256) NOT NULL,
  `worksheet_status` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `work_unit`
--

CREATE TABLE `work_unit` (
  `work_unit_id` mediumint(9) NOT NULL,
  `work_unit_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `work_unit_id` (`work_unit_id`),
  ADD KEY `institute_id` (`institute_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `id_proposal` (`draft_id`),
  ADD KEY `code_id` (`code_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`code_id`);

--
-- Indexes for table `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`draft_id`),
  ADD KEY `id_kategori` (`category_id`),
  ADD KEY `id_penulis` (`theme_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `draft_id` (`draft_id`),
  ADD KEY `reviewer_id` (`reviewer_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `responsibility`
--
ALTER TABLE `responsibility`
  ADD PRIMARY KEY (`responsibility_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `draft_id` (`draft_id`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`reviewer_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `id_role` (`role_id`);

--
-- Indexes for table `worksheet`
--
ALTER TABLE `worksheet`
  ADD PRIMARY KEY (`worksheet_id`),
  ADD KEY `id_proposal` (`draft_id`);

--
-- Indexes for table `work_unit`
--
ALTER TABLE `work_unit`
  ADD PRIMARY KEY (`work_unit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `code_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `draft`
--
ALTER TABLE `draft`
  MODIFY `draft_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `process_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `responsibility`
--
ALTER TABLE `responsibility`
  MODIFY `responsibility_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `reviewer_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `worksheet`
--
ALTER TABLE `worksheet`
  MODIFY `worksheet_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `work_unit`
--
ALTER TABLE `work_unit`
  MODIFY `work_unit_id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`work_unit_id`) REFERENCES `work_unit` (`work_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `author_ibfk_2` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`draft_id`) REFERENCES `draft` (`draft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`code_id`) REFERENCES `code` (`code_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `draft`
--
ALTER TABLE `draft`
  ADD CONSTRAINT `draft_ibfk_1` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `draft_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`draft_id`) REFERENCES `draft` (`draft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer` (`reviewer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `process_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `responsibility`
--
ALTER TABLE `responsibility`
  ADD CONSTRAINT `responsibility_ibfk_1` FOREIGN KEY (`draft_id`) REFERENCES `draft` (`draft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsibility_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD CONSTRAINT `reviewer_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `worksheet`
--
ALTER TABLE `worksheet`
  ADD CONSTRAINT `worksheet_ibfk_1` FOREIGN KEY (`draft_id`) REFERENCES `draft` (`draft_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
