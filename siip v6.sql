-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2018 at 05:51 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siip`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` mediumint(9) NOT NULL,
  `author_name` varchar(256) NOT NULL,
  `author_degree` varchar(256) NOT NULL,
  `work_unit` varchar(256) NOT NULL,
  `instance_name` varchar(256) NOT NULL,
  `author_address` text NOT NULL,
  `author_contact` varchar(20) NOT NULL,
  `author_email` varchar(256) NOT NULL,
  `author_saving_num` varchar(20) NOT NULL,
  `heir_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `author_degree`, `work_unit`, `instance_name`, `author_address`, `author_contact`, `author_email`, `author_saving_num`, `heir_name`) VALUES
(1, 'bagas', 'S1', 'FT', 'UGM', 'purworejo', '085640888777', 'bagas@gmail.com', '8796665', 'anak bagas'),
(2, 'edward', 'S1', 'FEB', 'UGM', 'jakarta', '0857888333111', 'edward@yahoo.com', '987555422', 'anak edward'),
(3, 'syu', 'S1', 'FKH', 'UGM', 'medan', '08544466777', 'syu@ugm.ac.id', '998543432', 'anak syu'),
(4, 'kara', 'S2', 'FMIPA', 'UGM', 'jogja', '086555331121', 'kara@jos.com', '8367448', 'anak kara');

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

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `draft_id`, `code_id`, `book_title`, `book_edition`, `isbn`, `book_file`, `printing_type`, `serial_num_per_year`, `copies_num`, `book_note`, `book_status`, `is_reprint`) VALUES
(1, 2, 1, 'buku mysql', '1', '93489384', 'disini aja', '1', 200, '500', '0', 1, 0),
(2, 4, 1, 'buku ci', '1', '4536546', 'sinii', 'tauk', 12, '400', 'keren bukunya jois', 1, 0);

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

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_year`, `category_note`, `date_open`, `date_close`, `category_status`) VALUES
(1, 'hibah', 2018, 'kategori hibah broo', '2018-06-19 00:00:00', '2018-08-03 00:00:00', 1),
(2, 'umum', 2018, 'umum untuk orang2 broo', '2018-07-02 00:00:00', '2018-09-08 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `code_id` mediumint(9) NOT NULL,
  `book_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`code_id`, `book_code`) VALUES
(1, '100cetakbro');

-- --------------------------------------------------------

--
-- Table structure for table `datax`
--

CREATE TABLE `datax` (
  `data_id` mediumint(9) NOT NULL,
  `draft_id` mediumint(9) DEFAULT NULL,
  `reviewer_id` mediumint(9) DEFAULT NULL,
  `author_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datax`
--

INSERT INTO `datax` (`data_id`, `draft_id`, `reviewer_id`, `author_id`) VALUES
(1, 1, 1, 1),
(2, 1, NULL, 4),
(3, 2, 2, 2),
(4, 3, 1, 3),
(5, 4, 3, 1),
(6, 4, 4, NULL);

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

--
-- Dumping data for table `draft`
--

INSERT INTO `draft` (`draft_id`, `category_id`, `theme_id`, `draft_title`, `draft_file`, `proposed_fund`, `approved_fund`, `entry_date`, `finish_date`, `print_date`, `worksheet_serial_num`, `approved_worksheet`, `is_reviewed`, `review_notes`, `is_revised`, `revise_notes`, `is_edited`, `edit_notes`, `is_layouted`, `is_reprint`, `draft_notes`) VALUES
(1, 1, 1, 'draft1', 'file/disini', 5000000, 2000000, '2018-07-23 00:00:00', '2018-07-27 00:00:00', '2018-07-25 00:00:00', 134354252, 0, 0, 'belum sampe', 0, 'tidak sampe', 0, 'nope', 0, 0, 'ditolak bosku'),
(2, 1, 2, 'draft2', 'disini aja', 560000, 450000, '2018-07-17 00:00:00', '2018-07-19 00:00:00', '2018-07-21 00:00:00', 2455647, 1, 1, 'sipp', 1, 'sipplah', 1, 'okay', 1, 0, 'mantap lanjut cetak'),
(3, 2, 3, 'draft3', 'disini', 39000, 37000, '2018-07-03 00:00:00', '2018-07-04 00:00:00', '2018-07-07 00:00:00', 4546765, 0, 0, 'gagal', 0, 'nooo', 0, 'gagal', 0, 0, 'tolak keras'),
(4, 2, 2, 'draft4', 'sini ajah bro', 56000, 88990, '2018-07-08 00:00:00', '2018-07-14 00:00:00', '2018-07-13 00:00:00', 5356467, 1, 1, 'yeay', 0, 'npopee', 0, 'noo', 0, 0, 'gagal total');

-- --------------------------------------------------------

--
-- Table structure for table `responsibility`
--

CREATE TABLE `responsibility` (
  `responsibility_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) DEFAULT NULL,
  `draft_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `responsibility`
--

INSERT INTO `responsibility` (`responsibility_id`, `user_id`, `draft_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2),
(5, 4, 2),
(6, 1, 3),
(7, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `reviewer_id` mediumint(9) NOT NULL,
  `reviewer_name` varchar(256) NOT NULL,
  `reviewer_faculty` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`reviewer_id`, `reviewer_name`, `reviewer_faculty`) VALUES
(1, 'pak aji', 'FT'),
(2, 'pak baroto', 'FK'),
(3, 'pak kunto ', 'FEB'),
(4, 'pak willy', 'fisipol');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` mediumint(9) NOT NULL,
  `role_name` varchar(256) NOT NULL,
  `publishing_module` varchar(256) NOT NULL,
  `printing_module` varchar(256) NOT NULL,
  `marketing_module` varchar(256) NOT NULL,
  `storage_module` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `publishing_module`, `printing_module`, `marketing_module`, `storage_module`) VALUES
(1, 'superadmin', '1', '1', '1', '1'),
(2, 'admin penerbitan', '1', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `theme_id` mediumint(9) NOT NULL,
  `theme_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`theme_id`, `theme_name`) VALUES
(1, 'komputer'),
(2, 'ternak'),
(3, 'kesehatan');

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
(1, 'samsul', 'samsul11', 2),
(2, 'wayan', 'wayan88', 1);

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

--
-- Dumping data for table `worksheet`
--

INSERT INTO `worksheet` (`worksheet_id`, `draft_id`, `worksheet_num`, `is_reprint`, `reprint_code`, `worksheet_status`) VALUES
(1, 1, 'aassdd', 0, 'cu', '1'),
(2, 3, 'ccvvbb', 0, 'nocu', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `id_proposal` (`draft_id`);

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
-- Indexes for table `datax`
--
ALTER TABLE `datax`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `draft_id` (`draft_id`),
  ADD KEY `reviewer_id` (`reviewer_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`draft_id`),
  ADD KEY `id_kategori` (`category_id`),
  ADD KEY `id_penulis` (`theme_id`);

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
  ADD PRIMARY KEY (`reviewer_id`);

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
-- AUTO_INCREMENT for table `datax`
--
ALTER TABLE `datax`
  MODIFY `data_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `draft`
--
ALTER TABLE `draft`
  MODIFY `draft_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `role_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `worksheet`
--
ALTER TABLE `worksheet`
  MODIFY `worksheet_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
