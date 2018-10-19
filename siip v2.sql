-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2018 at 07:15 AM
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
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` mediumint(9) NOT NULL,
  `id_proposal` mediumint(9) NOT NULL,
  `id_penulis` mediumint(9) NOT NULL,
  `id_tema` mediumint(9) NOT NULL,
  `judul_buku` varchar(256) NOT NULL,
  `edisi_buku` varchar(256) NOT NULL,
  `file_buku` varchar(256) NOT NULL,
  `jenis_cetak` varchar(256) NOT NULL,
  `id_jml_cetak` int(20) NOT NULL,
  `isbn` varchar(256) NOT NULL,
  `no_urut_pertahun` mediumint(9) NOT NULL,
  `jumlah_eksemplar` mediumint(9) NOT NULL,
  `keterangan` text NOT NULL,
  `status_buku` varchar(256) NOT NULL,
  `is_cetak_ulang` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_proposal`, `id_penulis`, `id_tema`, `judul_buku`, `edisi_buku`, `file_buku`, `jenis_cetak`, `id_jml_cetak`, `isbn`, `no_urut_pertahun`, `jumlah_eksemplar`, `keterangan`, `status_buku`, `is_cetak_ulang`) VALUES
(192384, 1, 1, 1, 'pemrograman ci', 'pertama', 'kosongggg', 'POD', 0, '2342454', 1, 20, 'keren', 'sudah tecetak', 0);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` int(20) NOT NULL,
  `tgl_login` date NOT NULL,
  `tgl_dibuat` date NOT NULL,
  `ip_akses` varchar(256) NOT NULL,
  `prev_value` varchar(256) NOT NULL,
  `current_value` varchar(256) NOT NULL,
  `change_field` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` smallint(6) NOT NULL,
  `nama_kategori` varchar(256) NOT NULL,
  `tahun_kategori` char(5) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_buka` datetime NOT NULL,
  `tanggal_tutup` datetime NOT NULL,
  `status` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tahun_kategori`, `keterangan`, `tanggal_buka`, `tanggal_tutup`, `status`) VALUES
(1, 'hibah buku UGM', '2018', 'pendaftaran buku hibah untuk dosen ', '2018-05-01 00:00:00', '2018-05-31 00:00:00', 'BUKA CUYY');

-- --------------------------------------------------------

--
-- Table structure for table `konversi`
--

CREATE TABLE `konversi` (
  `id_jml_cetak` smallint(6) NOT NULL,
  `kode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lembar_kerja`
--

CREATE TABLE `lembar_kerja` (
  `id_lembar_kerja` mediumint(9) NOT NULL,
  `id_proposal` mediumint(9) NOT NULL,
  `id_buku` mediumint(9) NOT NULL,
  `nomor_lembar_kerja` varchar(256) NOT NULL,
  `is_cetak_ulang` tinyint(1) NOT NULL,
  `kode_cetak_ulang` varchar(256) NOT NULL,
  `status_lembar_kerja` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lembar_kerja`
--

INSERT INTO `lembar_kerja` (`id_lembar_kerja`, `id_proposal`, `id_buku`, `nomor_lembar_kerja`, `is_cetak_ulang`, `kode_cetak_ulang`, `status_lembar_kerja`) VALUES
(1, 1, 1, '22', 0, 'CU', 'progress');

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id_penulis` mediumint(9) NOT NULL,
  `nama_penulis` varchar(256) NOT NULL,
  `gelar_penulis` varchar(256) NOT NULL,
  `unit_kerja` varchar(256) NOT NULL,
  `instansi` varchar(256) NOT NULL,
  `alamat_penulis` varchar(256) NOT NULL,
  `kontak_penulis` varchar(256) NOT NULL,
  `email_penulis` varchar(256) NOT NULL,
  `rekening_penulis` varchar(256) NOT NULL,
  `ahli_waris` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penulis`
--

INSERT INTO `penulis` (`id_penulis`, `nama_penulis`, `gelar_penulis`, `unit_kerja`, `instansi`, `alamat_penulis`, `kontak_penulis`, `email_penulis`, `rekening_penulis`, `ahli_waris`) VALUES
(1, 'syu', 'S.T', 'teknik elektro', 'UGM', 'medan', '085640999888', 'syu@gmail.com', '0927373838', 'payung');

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id_proposal` mediumint(9) NOT NULL,
  `id_kategori` mediumint(9) NOT NULL,
  `id_penulis` mediumint(9) NOT NULL,
  `id_user` mediumint(9) NOT NULL,
  `id_tema` mediumint(9) NOT NULL,
  `id_reviewer` mediumint(9) NOT NULL,
  `judul_proposal` varchar(256) NOT NULL,
  `pengusul` varchar(256) NOT NULL,
  `file_proposal` varchar(256) NOT NULL,
  `dana_yang_diajukan` int(11) NOT NULL,
  `dana_yang_disetujui` int(11) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
  `id_lembar_kerja` mediumint(9) NOT NULL,
  `no_urut_lembar_kerja` mediumint(9) NOT NULL,
  `lembar_kerja_is_accepted` tinyint(1) NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `tanggal_cetak` datetime NOT NULL,
  `is_reviewed` tinyint(1) NOT NULL,
  `catatan_review` text NOT NULL,
  `is_revised` tinyint(1) NOT NULL,
  `catatan_revisi` text NOT NULL,
  `is_edited` tinyint(1) NOT NULL,
  `catatan_editor` text NOT NULL,
  `is_layouted` tinyint(1) NOT NULL,
  `is_print` tinyint(1) NOT NULL,
  `is_cetak_ulang` tinyint(1) NOT NULL,
  `keterangan` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `id_reviewer` mediumint(9) NOT NULL,
  `nama_reviewer` varchar(256) NOT NULL,
  `fakultas` varchar(256) NOT NULL,
  `id_history` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id_role` mediumint(9) NOT NULL,
  `nama_role` varchar(256) NOT NULL,
  `modul_penerbitan` varchar(256) NOT NULL,
  `modul_percetakan` varchar(256) NOT NULL,
  `modul_pemasaran` varchar(256) NOT NULL,
  `modul_gudang` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id_tema` mediumint(9) NOT NULL,
  `nama_tema` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` smallint(6) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `id_role` smallint(6) NOT NULL,
  `id_history` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `konversi`
--
ALTER TABLE `konversi`
  ADD PRIMARY KEY (`id_jml_cetak`);

--
-- Indexes for table `lembar_kerja`
--
ALTER TABLE `lembar_kerja`
  ADD PRIMARY KEY (`id_lembar_kerja`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id_proposal`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`id_reviewer`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192385;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `konversi`
--
ALTER TABLE `konversi`
  MODIFY `id_jml_cetak` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lembar_kerja`
--
ALTER TABLE `lembar_kerja`
  MODIFY `id_lembar_kerja` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id_penulis` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id_proposal` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `id_reviewer` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id_role` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` smallint(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
