-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2026 at 05:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `idAnggota` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `noTelp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`idAnggota`, `nama`, `alamat`, `noTelp`) VALUES
('A001', 'Andi Wijaya S', 'Jl. Sudirman No. 10', '08123456789'),
('A002', 'Siti Aminah', 'Jl. Merdeka No. 5', '08571234567');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `IdBuku` varchar(20) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(100) DEFAULT NULL,
  `jumlah_halaman` int(11) DEFAULT NULL,
  `ThnTerbit` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`IdBuku`, `Judul`, `Pengarang`, `jumlah_halaman`, `ThnTerbit`) VALUES
('B001', 'PBO I', 'Budi Raharjo', 12, '2021'),
('B002', 'Struktur Data', 'Sianipar', 25, '2020'),
('B003', 'Basis Data', 'Asep', 23, '2023'),
('B004', 'Kalkulus', 'Tatang', 90, '2022');

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `idRak` varchar(10) NOT NULL,
  `namaRak` varchar(50) NOT NULL,
  `lokasi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`idRak`, `namaRak`, `lokasi`) VALUES
('R01', 'Teknik', 'Lantai 1'),
('R02', 'Sastra', 'Lantai 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`idAnggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`IdBuku`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`idRak`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
