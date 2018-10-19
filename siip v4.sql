-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2018 at 04:26 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

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
  `id_jml_cetak` smallint(6) NOT NULL,
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
(1212121, 323, 3565, 9898, 'dasndksan', '898', 'klskdl', 'djndk', 454, '32122456', 4545, 5454, 'admkadasm', 'horehore', 1);

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

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `tgl_login`, `tgl_dibuat`, `ip_akses`, `prev_value`, `current_value`, `change_field`) VALUES
(78564, '0000-00-00', '0000-00-00', '090909090', '79849', '49456', '49878');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` mediumint(9) NOT NULL,
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
(2, 'hibah buku UGM', '2018', 'pendaftaran buku hibah untuk dosen ', '2018-05-01 00:00:00', '2018-05-31 00:00:00', 'BUKA CUYY');

-- --------------------------------------------------------

--
-- Table structure for table `konversi`
--

CREATE TABLE `konversi` (
  `id_jml_cetak` smallint(6) NOT NULL,
  `kode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konversi`
--

INSERT INTO `konversi` (`id_jml_cetak`, `kode`) VALUES
(91, 'jsdjs'),
(99, 'mdkas');

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
(45, 7878, 89959, '121362456', 1, '45456', '0'),
(898, 44545, 12121, '15745', 1, '4545', '1'),
(12132, 316146, 2132, '132132', 1, '13213', '1');

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
(13, 'lasdkla', 'jdks', 'aksdmn', 'smadkmas', 'sdklamdklmas', '024356454', 'kmckda@kmwqp.com', '12145', 'najsdnl'),
(45464, 'dasdksa', 'dmkasmdk', 'mksamdk', 'dmksamdk', 'makdmkas', '312', 'dmkasdmk@mkdmsk.com', '56456465', 'adkskasmd');

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
  `id_lembar_kerja` mediumint(9) NOT NULL,
  `judul_proposal` varchar(256) NOT NULL,
  `pengusul` varchar(256) NOT NULL,
  `file_proposal` varchar(256) NOT NULL,
  `dana_yang_diajukan` int(11) NOT NULL,
  `dana_yang_disetujui` int(11) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
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

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`id_proposal`, `id_kategori`, `id_penulis`, `id_user`, `id_tema`, `id_reviewer`, `id_lembar_kerja`, `judul_proposal`, `pengusul`, `file_proposal`, `dana_yang_diajukan`, `dana_yang_disetujui`, `tanggal_masuk`, `no_urut_lembar_kerja`, `lembar_kerja_is_accepted`, `tanggal_selesai`, `tanggal_cetak`, `is_reviewed`, `catatan_review`, `is_revised`, `catatan_revisi`, `is_edited`, `catatan_editor`, `is_layouted`, `is_print`, `is_cetak_ulang`, `keterangan`) VALUES
(233, 5466, 3232, 1515, 13213, 1214564, 7854, 'sdfdsfdsfgh', 'fdghdhgf', 'gdhdgh', 1213, 3213564, '0000-00-00 00:00:00', 4545, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'dafhdgj', 1, 'dghdgfh', 1, 'sdfdsghdf', 1, 1, 1, 'bdgfhdgfh'),
(1321, 213, 233, 21321, 2131, 3213, 31, 'sdgnjgfj', 'fghgdfh', 'hdfghdf', 12123, 3655656, '0000-00-00 00:00:00', 3232, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, '', 0, '', 0, 0, 0, '');

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

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`id_reviewer`, `nama_reviewer`, `fakultas`, `id_history`) VALUES
(456, 'mkghmhg', '1213', 48549),
(78949, 'asdgdfg', 'bgfrhtrfh', 1547);

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

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id_role`, `nama_role`, `modul_penerbitan`, `modul_percetakan`, `modul_pemasaran`, `modul_gudang`) VALUES
(456, 'dfngfh', 'gfgf', 'bdfbfds', '32156', 'dgdfhdf'),
(1231, '456', '78949', 'dafdasf', '156145', '6790');

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id_tema` mediumint(9) NOT NULL,
  `nama_tema` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tema`
--

INSERT INTO `tema` (`id_tema`, `nama_tema`) VALUES
(3, 'nf nfkd'),
(4550, 'sdabgfsghfh');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` mediumint(9) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `id_role` mediumint(9) NOT NULL,
  `id_history` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_role`, `id_history`) VALUES
(12344, '5446', 'sdgfdgdfk', 4654, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_jml_cetak` (`id_jml_cetak`),
  ADD KEY `id_proposal` (`id_proposal`);

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
  ADD PRIMARY KEY (`id_lembar_kerja`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_proposal` (`id_proposal`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id_proposal`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_penulis` (`id_penulis`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tema` (`id_tema`),
  ADD KEY `id_reviewer` (`id_reviewer`),
  ADD KEY `id_lembar_kerja` (`id_lembar_kerja`);

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
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_history` (`id_history`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1212122;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14524565;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=545647;

--
-- AUTO_INCREMENT for table `konversi`
--
ALTER TABLE `konversi`
  MODIFY `id_jml_cetak` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `lembar_kerja`
--
ALTER TABLE `lembar_kerja`
  MODIFY `id_lembar_kerja` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12133;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id_penulis` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45465;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id_proposal` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1322;

--
-- AUTO_INCREMENT for table `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `id_reviewer` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78950;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id_role` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1232;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4565;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45647;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
