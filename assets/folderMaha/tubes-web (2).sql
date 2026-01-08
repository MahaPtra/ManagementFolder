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
-- Database: `tubes-web`
--

-- --------------------------------------------------------

--
-- Table structure for table `1a1`
--

CREATE TABLE `1a1` (
  `id` int(11) UNSIGNED NOT NULL,
  `unit_kerja` varchar(255) NOT NULL,
  `nama_ketua` varchar(255) NOT NULL,
  `periode_jabatan` varchar(255) NOT NULL,
  `pendidikan_terakhir` varchar(255) NOT NULL,
  `jabatan_fungsional` varchar(255) NOT NULL,
  `tupoksi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `1a1`
--

INSERT INTO `1a1` (`id`, `unit_kerja`, `nama_ketua`, `periode_jabatan`, `pendidikan_terakhir`, `jabatan_fungsional`, `tupoksi`) VALUES
(11, 'nijddiojf', 'fiwhfow', 'jfwojfwo', 'kfopwkfw', 'jjfwojfwo', 'jfowjf'),
(12, '32323', 'fsfsf', 'fsf', 'fsf', 'fsf', 'fsfs');

-- --------------------------------------------------------

--
-- Table structure for table `1a2`
--

CREATE TABLE `1a2` (
  `id` int(11) UNSIGNED NOT NULL,
  `sumber_pendanaan` varchar(255) NOT NULL,
  `ts_2` varchar(255) NOT NULL,
  `ts_1` varchar(255) NOT NULL,
  `ts` varchar(255) NOT NULL,
  `link_bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `1a2`
--

INSERT INTO `1a2` (`id`, `sumber_pendanaan`, `ts_2`, `ts_1`, `ts`, `link_bukti`) VALUES
(7, 'hihji', 'ihihj', 'ihih', 'hih', 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `1a3`
--

CREATE TABLE `1a3` (
  `id` int(11) UNSIGNED NOT NULL,
  `sumber_pendanaan` varchar(255) NOT NULL,
  `ts_2` varchar(255) NOT NULL,
  `ts_1` varchar(255) NOT NULL,
  `ts` varchar(255) NOT NULL,
  `link_bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `1a3`
--

INSERT INTO `1a3` (`id`, `sumber_pendanaan`, `ts_2`, `ts_1`, `ts`, `link_bukti`) VALUES
(3, 'fwfwfw', 'lfmwlmfwl', 'mfwlmflw', 'flwmf', 'mflwf');

-- --------------------------------------------------------

--
-- Table structure for table `1a4`
--

CREATE TABLE `1a4` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_dtpr` varchar(255) NOT NULL,
  `sks_ps_sendiri` varchar(255) NOT NULL,
  `sks_ps_lain_pt_sendiri` varchar(255) NOT NULL,
  `sks_ps_sendiri_penelitian` varchar(255) NOT NULL,
  `sks_ps_sendiri_pengabdian` varchar(255) NOT NULL,
  `sks_ps_sendiri_manajemen` varchar(255) NOT NULL,
  `sks_ps_lain_pt_sendiri_manajemen` varchar(255) NOT NULL,
  `total_sks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `1a4`
--

INSERT INTO `1a4` (`id`, `nama_dtpr`, `sks_ps_sendiri`, `sks_ps_lain_pt_sendiri`, `sks_ps_sendiri_penelitian`, `sks_ps_sendiri_pengabdian`, `sks_ps_sendiri_manajemen`, `sks_ps_lain_pt_sendiri_manajemen`, `total_sks`) VALUES
(4, 'fwfwf', '2', '3', '2', '3', '2', '3', '12'),
(5, 'weqe', '5', '8', '8', '5', '5', '8', '5');

-- --------------------------------------------------------

--
-- Table structure for table `1a5`
--

CREATE TABLE `1a5` (
  `id` int(11) UNSIGNED NOT NULL,
  `jenis_tenaga_kependidikan` varchar(255) NOT NULL,
  `s3` varchar(255) NOT NULL,
  `s2` varchar(255) NOT NULL,
  `s1` varchar(255) NOT NULL,
  `d4` varchar(255) NOT NULL,
  `d3` varchar(255) NOT NULL,
  `d2` varchar(255) NOT NULL,
  `d1` varchar(255) NOT NULL,
  `sma_smk` varchar(255) NOT NULL,
  `unit_kerja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `1a5`
--

INSERT INTO `1a5` (`id`, `jenis_tenaga_kependidikan`, `s3`, `s2`, `s1`, `d4`, `d3`, `d2`, `d1`, `sma_smk`, `unit_kerja`) VALUES
(2, 'calmfalmf', '3', '2', '5', '3', '8', '2', '1', '5', 'mkmklm'),
(3, 'PDI', '5', '2', '9', '6', '3', '7', '1', '6', '4');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-12-02-074046', 'App\\Database\\Migrations\\News', 'default', 'App', 1765939193, 1),
(2, '2023-12-02-074436', 'App\\Database\\Migrations\\AlterNews', 'default', 'App', 1765939193, 1),
(5, '2023-12-15-071547', 'App\\Database\\Migrations\\Users', 'default', 'App', 1765940234, 2),
(6, '2023-12-20-034521', 'App\\Database\\Migrations\\Within', 'default', 'App', 1765940234, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'staff',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `name`, `role`, `created_at`, `updated_at`) VALUES
('admin', '$2y$10$IPUTty/M0ksVClGf.MBgBOi7QbqZQ4Mob5F5ZL7lfecYOp5G9rfwa', 'Admin', 'admin', NULL, NULL),
('Maha Putra', '$2y$10$ttucXuBX016vad0Z4.jukuDmwmRTnEOGJH/nnwxAMCXt6y5k8AU/m', 'empe', 'staff', '2025-12-17 03:14:21', '2025-12-17 03:42:04'),
('manajer', '$2y$10$cOWago6L0Y6uEg0ukjwG7OhBBilpO9rRdOr6JOhG10MlS/rCXHcDq', 'Manajer', 'manajer', NULL, NULL),
('staff', '$2y$10$NpK2v5uWztG/yzpb0AigeOzxf.wNJdKex5FMgCz5LxRD2GohTUp7O', 'Staff', 'staff', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `within`
--

CREATE TABLE `within` (
  `director` int(5) UNSIGNED NOT NULL,
  `shoulder` varchar(15) DEFAULT NULL,
  `successful` varchar(15) DEFAULT NULL,
  `use` varchar(15) DEFAULT NULL,
  `participant` varchar(10) DEFAULT NULL,
  `strong` varchar(5) DEFAULT NULL,
  `protect` varchar(15) DEFAULT NULL,
  `cause` varchar(20) DEFAULT NULL,
  `record` varchar(10) DEFAULT NULL,
  `policy` varchar(5) DEFAULT NULL,
  `center` varchar(5) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1a1`
--
ALTER TABLE `1a1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1a2`
--
ALTER TABLE `1a2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1a3`
--
ALTER TABLE `1a3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1a4`
--
ALTER TABLE `1a4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1a5`
--
ALTER TABLE `1a5`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `within`
--
ALTER TABLE `within`
  ADD PRIMARY KEY (`director`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1a1`
--
ALTER TABLE `1a1`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `1a2`
--
ALTER TABLE `1a2`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `1a3`
--
ALTER TABLE `1a3`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `1a4`
--
ALTER TABLE `1a4`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `1a5`
--
ALTER TABLE `1a5`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `within`
--
ALTER TABLE `within`
  MODIFY `director` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
