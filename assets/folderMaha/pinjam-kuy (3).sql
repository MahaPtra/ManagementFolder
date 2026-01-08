-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2026 at 01:03 PM
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
-- Database: `pinjam-kuy`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `kodeBuku` varchar(50) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `publicationYear` year(4) DEFAULT NULL,
  `totalStock` int(11) NOT NULL DEFAULT 0,
  `availableStock` int(11) NOT NULL DEFAULT 0,
  `category` varchar(100) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `programStudi` varchar(100) DEFAULT NULL,
  `bahasa` varchar(50) DEFAULT 'Bahasa Indonesia',
  `jenisKoleksi` varchar(50) DEFAULT 'Buku Asli',
  `lampiran` varchar(50) DEFAULT 'Tidak Ada',
  `attachment_url` varchar(500) DEFAULT NULL,
  `pemusatanMateri` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `kodeBuku`, `author`, `publisher`, `publicationYear`, `totalStock`, `availableStock`, `category`, `image_url`, `description`, `pages`, `programStudi`, `bahasa`, `jenisKoleksi`, `lampiran`, `attachment_url`, `pemusatanMateri`, `location`, `createdAt`) VALUES
(3, 'TEST', 'BK-0009', 'caca', 'caca', '2025', 98, 96, 'Fiksi', 'https://res.cloudinary.com/dxew9tloz/image/upload/v1766919222/book-covers/pvelrwqv0qhaao4wehix.png', 'icjisfjisfsuifsfsifhsifhsihfsifhsifhsifhsifhishfisfhsifhsifhd', NULL, NULL, 'Bahasa Indonesia', 'E-Book', 'PDF', 'https://res.cloudinary.com/dxew9tloz/image/upload/v1767601385/book-attachments/rp1ofnrxcvtdbl6jfcbt.pdf', NULL, 'Rak F', '2025-12-28 17:53:42'),
(7, 'ghgh', 'hihsis', 'caca', 'caca', '2026', 100, 95, 'Fiksi', 'https://res.cloudinary.com/dxew9tloz/image/upload/v1767605133/book-covers/pa3lxqx6mgp3rgqyqos3.png', NULL, NULL, NULL, 'Bahasa Indonesia', 'Buku Asli', 'Tidak Ada', NULL, NULL, 'Rak F', '2026-01-05 16:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `fine_payments`
--

CREATE TABLE `fine_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `npm` varchar(50) DEFAULT NULL,
  `method` enum('qris','bank_transfer','cash') NOT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `proof_url` varchar(500) DEFAULT NULL,
  `loan_ids` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `account_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fine_payments`
--

INSERT INTO `fine_payments` (`id`, `user_id`, `username`, `npm`, `method`, `amount_total`, `proof_url`, `loan_ids`, `status`, `account_name`, `bank_name`, `admin_notes`, `verified_by`, `verified_at`, `created_at`, `updated_at`) VALUES
(1, 4, 'farhan mp mp', '1245', 'cash', 10.00, NULL, '[15]', 'pending', NULL, NULL, NULL, NULL, NULL, '2026-01-08 18:32:29', '2026-01-08 18:32:29'),
(2, 4, 'farhan mp mp', '1245', 'qris', 10.00, NULL, '[15]', 'pending', NULL, NULL, NULL, NULL, NULL, '2026-01-08 18:32:50', '2026-01-08 18:32:50'),
(3, 4, 'farhan mp mp', '1245', 'qris', 10.00, NULL, '[15]', 'pending', NULL, NULL, NULL, NULL, NULL, '2026-01-08 19:01:53', '2026-01-08 19:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `loanDate` datetime DEFAULT NULL,
  `expectedReturnDate` date DEFAULT NULL,
  `actualReturnDate` datetime DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `status` enum('Menunggu Persetujuan','Disetujui','Diambil','Sedang Dipinjam','Terlambat','Siap Dikembalikan','Dikembalikan','Ditolak') DEFAULT 'Menunggu Persetujuan',
  `kodePinjam` varchar(40) DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `fineAmount` int(11) NOT NULL DEFAULT 0,
  `finePaid` tinyint(1) NOT NULL DEFAULT 0,
  `finePaymentStatus` enum('unpaid','awaiting_proof','pending_verification','paid') NOT NULL DEFAULT 'unpaid',
  `finePaymentMethod` varchar(30) DEFAULT NULL,
  `finePaymentProof` varchar(255) DEFAULT NULL,
  `finePaymentAt` datetime DEFAULT NULL,
  `returnProofUrl` varchar(255) DEFAULT NULL,
  `returnProofMetadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Metadata foto pengembalian: koordinat, waktu, alamat' CHECK (json_valid(`returnProofMetadata`)),
  `readyReturnDate` datetime DEFAULT NULL,
  `userNotified` tinyint(1) NOT NULL DEFAULT 0,
  `returnNotified` tinyint(1) NOT NULL DEFAULT 0,
  `returnDecision` enum('approved','rejected') DEFAULT NULL,
  `rejectionNotified` tinyint(1) NOT NULL DEFAULT 0,
  `rejectionDate` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rejectionReason` text DEFAULT NULL,
  `fineReason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `book_id`, `loanDate`, `expectedReturnDate`, `actualReturnDate`, `approvedAt`, `status`, `kodePinjam`, `purpose`, `fineAmount`, `finePaid`, `finePaymentStatus`, `finePaymentMethod`, `finePaymentProof`, `finePaymentAt`, `returnProofUrl`, `returnProofMetadata`, `readyReturnDate`, `userNotified`, `returnNotified`, `returnDecision`, `rejectionNotified`, `rejectionDate`, `createdAt`, `updatedAt`, `rejectionReason`, `fineReason`) VALUES
(14, 4, 7, '2026-01-08 16:40:21', '2026-01-11', '2026-01-08 17:21:10', NULL, 'Dikembalikan', 'KP-20260108-PB4K', 'jhjojojo', 0, 0, 'unpaid', NULL, NULL, NULL, 'https://res.cloudinary.com/dxew9tloz/image/upload/v1767865752/return-proofs/tcs9svlygfbhirmtuvmb.jpg', '{\"lat\":-6.7895296,\"lng\":107.2791552,\"accuracy\":908.6201396819705,\"time\":\"Kamis, 8 Januari 2026 pukul 16.49.06\"}', '2026-01-08 16:49:14', 0, 1, 'approved', 0, NULL, '2026-01-08 16:38:22', '2026-01-08 17:21:13', NULL, NULL),
(15, 4, 7, '2026-01-08 17:55:30', '2026-01-09', '2026-01-08 18:03:25', NULL, 'Dikembalikan', 'KP-20260108-ZM76', 'jojojoj', 10, 0, 'unpaid', NULL, NULL, NULL, 'https://res.cloudinary.com/dxew9tloz/image/upload/v1767869752/return-proofs/qdne0q0lc46m9j4fhx8e.jpg', '{\"lat\":-6.7916407,\"lng\":107.2799007,\"accuracy\":20,\"time\":\"Kamis, 8 Januari 2026 pukul 17.55.46\"}', '2026-01-08 17:55:54', 0, 1, 'approved', 0, NULL, '2026-01-08 17:48:07', '2026-01-08 18:03:28', NULL, 'buku rusak');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `npm` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `angkatan` varchar(255) DEFAULT NULL,
  `fakultas` varchar(255) DEFAULT NULL,
  `prodi` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `profile_photo_url` varchar(255) DEFAULT NULL,
  `denda` decimal(12,2) NOT NULL DEFAULT 0.00,
  `denda_unpaid` decimal(12,2) NOT NULL DEFAULT 0.00,
  `active_loans_count` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `npm`, `password`, `username`, `angkatan`, `fakultas`, `prodi`, `role`, `profile_photo_url`, `denda`, `denda_unpaid`, `active_loans_count`, `createdAt`) VALUES
(1, '123456', '$2b$10$IKolWxl/DByohJrDrc2qCOKXeMNrHfDN9AYKiSBkryefB/Uz3i7rK', 'Admin Perpustakaan', NULL, NULL, NULL, 'admin', NULL, 0.00, 0.00, 0, '2025-12-16 16:54:26'),
(2, '123', '$2b$10$p/fgnI/.htPPIMwawhndtuT3gEOoAUxZxlaZmc2OGGryqO4veXbcy', 'farhan', '2023', 'Teknik', 'Informatika', 'user', 'https://res.cloudinary.com/dxew9tloz/image/upload/v1766337157/profile/rnvm9txttmnpxzoamiu3.png', 0.00, 0.00, 0, '2025-12-16 21:05:34'),
(3, '111', '$2b$10$CyJcTlP5U1DKG.zvtNiope8FCybWSQE/m.Tta5w56zHdNxvUcrQTy', 'farhan mp', '2022', 'Teknik', 'Informatika', 'user', NULL, 0.00, 0.00, 0, '2025-12-16 22:19:22'),
(4, '1245', '$2b$10$TUCh0p7eVNBlSi24FAem5utZeBO0HjdDSkjmX66pUk.eQq3hc4Boa', 'farhan mp mp', '2025', 'Teknik', 'Informatika', 'user', NULL, 10.00, 10.00, 0, '2025-12-16 22:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'info',
  `message` text NOT NULL,
  `is_broadcast` tinyint(1) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `type`, `message`, `is_broadcast`, `createdAt`) VALUES
(15, 4, 'warning', 'Pengembalian buku \"ghgh\" telah disetujui oleh admin.\n\n⚠️ Denda: Rp 10\n- Denda Admin: Rp 10\n\nAlasan denda: buku rusak\n\nSilakan bayar denda melalui menu Pembayaran.', 0, '2026-01-08 18:03:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kodeBuku` (`kodeBuku`);

--
-- Indexes for table `fine_payments`
--
ALTER TABLE `fine_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verified_by` (`verified_by`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_kodePinjam` (`kodePinjam`),
  ADD KEY `idx_loans_user` (`user_id`),
  ADD KEY `idx_loans_book` (`book_id`),
  ADD KEY `idx_loans_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `npm` (`npm`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_payments`
--
ALTER TABLE `fine_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fine_payments`
--
ALTER TABLE `fine_payments`
  ADD CONSTRAINT `fine_payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fine_payments_ibfk_2` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `fk_loans_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_loans_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
