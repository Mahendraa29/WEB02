-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Bulan Mei 2025 pada 16.32
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkegiatan_dosen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidang_ilmu`
--

CREATE TABLE `bidang_ilmu` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `bidang_ilmu`
--

INSERT INTO `bidang_ilmu` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Teknik Informatika', 'Bidang yang mempelajari tentang komputer dan pemrograman.'),
(2, 'Sistem Informasi', 'Gabungan antara manajemen dan teknologi informasi.'),
(3, 'Matematika', 'Ilmu tentang angka dan logika.'),
(4, 'Fisika', 'Ilmu tentang alam dan energi.'),
(5, 'Kimia', 'Ilmu tentang zat dan reaksinya.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `gelar_belakang` varchar(30) NOT NULL,
  `gelar_depan` varchar(20) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tahun_masuk` int(11) NOT NULL,
  `prodi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id`, `nidn`, `nama`, `gelar_belakang`, `gelar_depan`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `email`, `tahun_masuk`, `prodi_id`) VALUES
(1, '001', 'Andi Wijaya', 'M.Kom', 'Dr.', 'laki-laki', 'Bandung', '1980-01-15', 'Jl. Mawar 1', 'andi@example.com', 2010, 1),
(2, '002', 'Budi Santoso', 'M.T', 'Ir.', 'laki-laki', 'Surabaya', '1978-06-22', 'Jl. Melati 2', 'budi@example.com', 2008, 2),
(3, '003', 'Citra Lestari', 'M.Si', '', 'perempuan', 'Jakarta', '1985-03-10', 'Jl. Anggrek 3', 'citra@example.com', 2012, 3),
(4, '004', 'Dian Pratama', 'Ph.D', 'Prof.', 'laki-laki', 'Medan', '1975-11-05', 'Jl. Kamboja 4', 'dian@example.com', 2005, 4),
(5, '005', 'Eka Ruhdi', 'M.Sc', 'Dr.', '', 'Yogyakarta', '1982-07-19', 'Jl. Kenanga 5', 'eka@example.com', 2011, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_kegiatan`
--

CREATE TABLE `dosen_kegiatan` (
  `dosen_id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `dosen_kegiatan`
--

INSERT INTO `dosen_kegiatan` (`dosen_id`, `kegiatan_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kegiatan`
--

CREATE TABLE `jenis_kegiatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `nama`) VALUES
(1, 'Seminar'),
(2, 'Workshop'),
(3, 'Pelatihan'),
(4, 'Konferensi'),
(5, 'Webinar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `jenis_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `tanggal_mulai`, `tanggal_selesai`, `tempat`, `deskripsi`, `jenis_kegiatan`) VALUES
(1, '2024-05-01', '2025-05-03', 'Jakarta', 'Seminar Nasional Teknologi', 1),
(2, '2024-03-15', '2025-03-17', 'Bandung', 'Workshop Data Science', 2),
(3, '2024-02-10', '2025-02-11', 'Surabaya', 'Pelatihan Python Dasar', 3),
(4, '2024-04-05', '2025-04-07', 'Yogyakarta', 'Konferensi Mahasiswa', 4),
(5, '2024-05-10', '2025-05-11', 'Online', 'Webinar AI dan Masa Depan', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penelitian`
--

CREATE TABLE `penelitian` (
  `id` int(11) NOT NULL,
  `judul` text NOT NULL,
  `mulai` date NOT NULL,
  `akhir` date NOT NULL,
  `tahun_ajaran` varchar(5) NOT NULL,
  `bidang_ilmu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `penelitian`
--

INSERT INTO `penelitian` (`id`, `judul`, `mulai`, `akhir`, `tahun_ajaran`, `bidang_ilmu_id`) VALUES
(1, 'Pemanfaatan AI dalam Pendidikan', '2024-01-01', '2024-12-31', '2024', 1),
(2, 'Sistem Informasi Akademik', '2023-02-01', '2023-12-01', '2023', 2),
(3, 'Model Matematika Penyebaran Virus', '2024-03-01', '2024-11-30', '2024', 3),
(4, 'Eksperimen Energi Terbarukan', '2023-05-01', '2023-10-30', '2023', 4),
(5, 'Analisis Reaksi Kimia Baru', '2024-04-01', '2024-09-30', '2024', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `ketua` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id`, `kode`, `nama`, `alamat`, `telpon`, `ketua`) VALUES
(1, 'TI', 'Teknik Informatika', 'Jl. Teknologi No.1', '081234567890', ''),
(2, 'SI', 'Sistem Informasi', 'Jl. Sistem No.2', '082345678901', ''),
(3, 'MTK', 'Matematika', 'Jl. Angka No.3', '083456789012', ''),
(4, 'FIS', 'Fisika', 'Jl. Energi No.4', '084567890123', ''),
(5, 'KIM', 'Kimia', 'Jl. Zat No.5', '085678901234', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tim_penelitian`
--

CREATE TABLE `tim_penelitian` (
  `dosen_id` int(11) NOT NULL,
  `penelitian_id` int(11) NOT NULL,
  `peran` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bidang_ilmu`
--
ALTER TABLE `bidang_ilmu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_prodi_id_idx` (`prodi_id`);

--
-- Indeks untuk tabel `dosen_kegiatan`
--
ALTER TABLE `dosen_kegiatan`
  ADD PRIMARY KEY (`dosen_id`,`kegiatan_id`),
  ADD KEY `fk_kegiatan_dosen_idx` (`kegiatan_id`);

--
-- Indeks untuk tabel `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jenis_kegiatan_idx` (`jenis_kegiatan`);

--
-- Indeks untuk tabel `penelitian`
--
ALTER TABLE `penelitian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bidang_ilmu_idx` (`bidang_ilmu_id`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tim_penelitian`
--
ALTER TABLE `tim_penelitian`
  ADD PRIMARY KEY (`dosen_id`,`penelitian_id`),
  ADD KEY `fk_penelitian_id_idx` (`penelitian_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `fk_prodi_id` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `dosen_kegiatan`
--
ALTER TABLE `dosen_kegiatan`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kegiatan_dosen` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `fk_jenis_kegiatan` FOREIGN KEY (`jenis_kegiatan`) REFERENCES `jenis_kegiatan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `penelitian`
--
ALTER TABLE `penelitian`
  ADD CONSTRAINT `fk_bidang_ilmu` FOREIGN KEY (`bidang_ilmu_id`) REFERENCES `bidang_ilmu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tim_penelitian`
--
ALTER TABLE `tim_penelitian`
  ADD CONSTRAINT `fk_dosen_id` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_penelitian_id` FOREIGN KEY (`penelitian_id`) REFERENCES `penelitian` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
