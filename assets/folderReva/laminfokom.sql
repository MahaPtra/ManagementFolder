-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Okt 2025 pada 04.32
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laminfokom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `fleksibilitaspembelajaran`
--

CREATE TABLE `fleksibilitaspembelajaran` (
  `TahunAkademik` varchar(10) DEFAULT NULL,
  `JenisPembelajaran` varchar(50) DEFAULT NULL,
  `TS_2` int(11) DEFAULT NULL,
  `TS_1` int(11) DEFAULT NULL,
  `TS` int(11) DEFAULT NULL,
  `LinkBukti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fleksibilitaspembelajaran`
--

INSERT INTO `fleksibilitaspembelajaran` (`TahunAkademik`, `JenisPembelajaran`, `TS_2`, `TS_1`, `TS`, `LinkBukti`) VALUES
('TS-2', 'Jumlah Mahasiswa Aktif', 100, 120, 130, NULL),
('TS-2', 'Micro-credential', 10, 15, 20, NULL),
('TS-2', 'RPL tipe A-2', 5, 10, 8, NULL),
('TS-2', 'Pembelajaran di PS lain', 8, 7, 10, NULL),
('TS-2', 'Pembelajaran di PT lain', 6, 8, 9, NULL),
('TS-2', 'CBL/PBL', 12, 15, 18, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepuasan_pengguna_lulusan`
--

CREATE TABLE `kepuasan_pengguna_lulusan` (
  `id` int(11) NOT NULL,
  `jenis_kemampuan` varchar(100) DEFAULT NULL,
  `sangat_baik` int(11) DEFAULT 0,
  `baik` int(11) DEFAULT 0,
  `cukup` int(11) DEFAULT 0,
  `kurang` int(11) DEFAULT 0,
  `rencana_tindak` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kepuasan_pengguna_lulusan`
--

INSERT INTO `kepuasan_pengguna_lulusan` (`id`, `jenis_kemampuan`, `sangat_baik`, `baik`, `cukup`, `kurang`, `rencana_tindak`) VALUES
(1, 'Kerjasama Tim', 20, 30, 10, 5, 'Pelatihan teamwork'),
(2, 'Keahlian di Bidang Prodi', 15, 35, 15, 5, 'Upgrade kurikulum'),
(3, 'Kemampuan Berbahasa Asing (Inggris)', 10, 25, 20, 10, 'Kursus bahasa'),
(4, 'Kemampuan Berkomunikasi', 25, 20, 15, 5, 'Workshop komunikasi'),
(5, 'Pengembangan Diri', 30, 25, 10, 5, 'Seminar motivasi'),
(6, 'Kepemimpinan', 15, 30, 20, 5, 'Pelatihan kepemimpinan'),
(7, 'Etos Kerja', 40, 25, 10, 5, 'Program motivasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kesesuaian_bidang_kerja_lulusan`
--

CREATE TABLE `kesesuaian_bidang_kerja_lulusan` (
  `id` int(11) NOT NULL,
  `tahun_lulus` varchar(10) DEFAULT NULL,
  `jumlah_lulusan` int(11) DEFAULT NULL,
  `jumlah_lulusan_terlacak` int(11) DEFAULT NULL,
  `profesi_kerja_bidang_infokom` int(11) DEFAULT NULL,
  `profesi_kerja_bidang_non_infokom` int(11) DEFAULT NULL,
  `lingkup_multinasional` int(11) DEFAULT NULL,
  `lingkup_nasional` int(11) DEFAULT NULL,
  `lingkup_wirausaha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kesesuaian_bidang_kerja_lulusan`
--

INSERT INTO `kesesuaian_bidang_kerja_lulusan` (`id`, `tahun_lulus`, `jumlah_lulusan`, `jumlah_lulusan_terlacak`, `profesi_kerja_bidang_infokom`, `profesi_kerja_bidang_non_infokom`, `lingkup_multinasional`, `lingkup_nasional`, `lingkup_wirausaha`) VALUES
(1, 'TS-2', 100, 90, 60, 30, 20, 60, 10),
(2, 'TS-1', 120, 110, 70, 40, 25, 70, 15),
(3, 'TS', 130, 115, 80, 35, 30, 65, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rata_rata_masa_tunggu`
--

CREATE TABLE `rata_rata_masa_tunggu` (
  `id` int(11) NOT NULL,
  `tahun_lulus` varchar(10) DEFAULT NULL,
  `jumlah_lulusan` int(11) DEFAULT NULL,
  `jumlah_lulusan_terlacak` int(11) DEFAULT NULL,
  `rata_rata_waktu_tunggu_bulan` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rata_rata_masa_tunggu`
--

INSERT INTO `rata_rata_masa_tunggu` (`id`, `tahun_lulus`, `jumlah_lulusan`, `jumlah_lulusan_terlacak`, `rata_rata_waktu_tunggu_bulan`) VALUES
(1, 'TS-2', 100, 90, 3.50),
(2, 'TS-1', 120, 110, 2.80),
(3, 'TS', 130, 115, 3.10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kepuasan_pengguna_lulusan`
--
ALTER TABLE `kepuasan_pengguna_lulusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kesesuaian_bidang_kerja_lulusan`
--
ALTER TABLE `kesesuaian_bidang_kerja_lulusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rata_rata_masa_tunggu`
--
ALTER TABLE `rata_rata_masa_tunggu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kepuasan_pengguna_lulusan`
--
ALTER TABLE `kepuasan_pengguna_lulusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kesesuaian_bidang_kerja_lulusan`
--
ALTER TABLE `kesesuaian_bidang_kerja_lulusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rata_rata_masa_tunggu`
--
ALTER TABLE `rata_rata_masa_tunggu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
