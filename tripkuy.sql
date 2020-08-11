-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Agu 2020 pada 17.07
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tripkuy2`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `urutRating` ()  BEGIN
SELECT t.trip_id, t.trip_nama, t.trip_harga, t.trip_gambar, AVG(f.feedback_rating) as rata_rating
FROM trip t inner join feedback f
ON t.trip_id = f.trip_id
GROUP BY t.trip_nama
ORDER BY AVG(f.feedback_rating) DESC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `agen`
--

CREATE TABLE `agen` (
  `agen_id` int(11) NOT NULL,
  `agen_nama` varchar(30) NOT NULL,
  `agen_alamat` varchar(50) NOT NULL,
  `agen_telp` varchar(20) NOT NULL,
  `agen_email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `agen`
--

INSERT INTO `agen` (`agen_id`, `agen_nama`, `agen_alamat`, `agen_telp`, `agen_email`) VALUES
(1, 'PT Jalanin Aja Dulu', 'Jalan Goa Gong ', '087654321', 'jalaninajadulu@gmail.com'),
(2, 'PT Travel Mantul', 'Jalan Giri Kencana', '086762321', 'travel.mantul@gmail.com'),
(3, 'Agen Travel Indo', 'Jalan Planet Jupiter 25', '08777999123', 'agentravelindo@gmail.com'),
(4, 'PT Sejahtera', 'Jalan Mataram Modern', '00876656712', 'Sejahtera@selalu.com'),
(5, 'PT Marindo ', 'Jalan Patimura', '087654321345', 'Marindo@rocketmail.com'),
(6, 'Marinasi', 'Jalan Pahlawan Cinta', '086567987111', 'Cinta@pahlawan.com'),
(7, 'PT Surga Travel', 'Jalan Sesama', '08999887766', 'surgatravel@gmail.com'),
(8, 'Melali Travel', 'Jalan Uluwatu no 18', '08765432177', 'maimelali@gmail.com'),
(9, 'Travelling World', 'Jalan Amerika', '08563999927', 'worldtrav@gmail.com'),
(10, 'PT Maju Mundur', 'Jalan Jalan aja', '087890976543', 'majumundurcantik@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `feedback_rating` int(2) NOT NULL,
  `feedback_komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `trip_id`, `feedback_rating`, `feedback_komentar`) VALUES
(1, 5, 4, 5, 'Mantap sekali, recommended buat paket liburan sekeluarga.'),
(2, 3, 2, 3, 'Huft gara - gara corona agak sedih sih. Harusnya tripnya bakal seru nih.'),
(3, 2, 3, 4, 'Ya overall oke lah. Arigatou nee~'),
(4, 31, 21, 5, 'Bagussss'),
(5, 32, 10, 5, 'Bagusssss'),
(6, 32, 17, 5, 'Bagus sekali'),
(7, 35, 1, 3, 'Mantap lur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `level_id` int(2) NOT NULL,
  `level_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`level_id`, `level_name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photo_profile`
--

CREATE TABLE `photo_profile` (
  `user_id` int(11) NOT NULL,
  `pp_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `photo_profile`
--

INSERT INTO `photo_profile` (`user_id`, `pp_nama`) VALUES
(1, '5ee217ad6bc7d.jpg'),
(2, ''),
(3, 'default.jpg'),
(4, 'default.jpg'),
(5, 'default.jpg'),
(23, 'default.jpg'),
(26, '5ee21f696b83a.jpg'),
(28, 'default.jpg'),
(29, 'default.jpg'),
(31, 'default.jpg'),
(32, '5ee30bb3becbe.jpg'),
(33, '5ee32fb8dd232.jpg'),
(34, 'default.jpg'),
(35, 'default.jpg'),
(36, 'default.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `transaksi_status` varchar(20) NOT NULL,
  `transaksi_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `user_id`, `trip_id`, `transaksi_status`, `transaksi_date`) VALUES
(1, 4, 1, 'PROSES', '2020-05-04'),
(2, 2, 3, 'GAGAL', '2020-05-01'),
(3, 3, 2, 'SELESAI', '2020-05-02'),
(4, 5, 4, 'PROSES', '2020-04-07'),
(6, 1, 1, 'SELESAI', '2020-05-06'),
(7, 26, 6, 'PROSES', '2020-06-11'),
(8, 32, 17, 'PROSES', '2020-06-12'),
(9, 32, 17, 'PENDING', '2020-06-12'),
(10, 32, 6, 'PENDING', '2020-06-12'),
(11, 33, 10, 'PENDING', '2020-06-12'),
(12, 34, 48, 'PENDING', '2020-06-17'),
(13, 35, 1, 'PENDING', '2020-06-29'),
(14, 36, 21, 'PENDING', '2020-07-22'),
(15, 36, 21, 'PENDING', '2020-07-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trip`
--

CREATE TABLE `trip` (
  `trip_id` int(11) NOT NULL,
  `agen_id` int(11) NOT NULL,
  `trip_nama` varchar(30) NOT NULL,
  `trip_kapasitas` int(5) NOT NULL,
  `trip_desc` text NOT NULL,
  `trip_harga` int(20) NOT NULL,
  `trip_kategori` varchar(20) NOT NULL,
  `trip_gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `trip`
--

INSERT INTO `trip` (`trip_id`, `agen_id`, `trip_nama`, `trip_kapasitas`, `trip_desc`, `trip_harga`, `trip_kategori`, `trip_gambar`) VALUES
(1, 2, 'Go to Suwalesi', 8, 'perjalanan menyenagkan bersama kami', 3500000, 'Bali', '5ee243c5bc04b.jpg'),
(2, 1, 'Jelajah Jawa', 6, 'Dari Tolikara menuju Jayapura.', 3500000, 'Jawa', '5ee32c4d698a2.jpg'),
(3, 1, 'Bali Bahagia', 13, 'Bangli on the way', 1200000, 'Bali', 'balipermai.jpg'),
(4, 3, 'NTT Back To Nature', 9, 'Dari Maumere ke sekitarnya.', 2000000, 'NTT', 'ntt.jpg'),
(5, 3, 'Nusa Penida', 2, 'Tripke nusa penida bersama WayQ', 9000000, 'Bali', 'p5.jpg'),
(6, 4, 'Nusa Kembangan', 20, 'Trip Bersama Keluarga tercinta', 10000000, 'Bali', 'p6.jpg'),
(7, 6, 'Trip to Jogja', 10, 'Jalan Jalan ke tempat sejarah', 5000000, 'Jawa', 'p7.jpg'),
(8, 5, 'Trip to Bandung', 12, 'Jalan jalan ke kota bandung', 6000000, 'Jawa', 'p8.jpg'),
(9, 4, 'Explore Mataram', 15, 'Jalan2 mnikmati pemandnagan kota Mataram yg indahh', 8000000, 'NTT', '5ee245da63e2d.jpg'),
(10, 8, 'Bali Selatan 2', 10, 'Mari menikmati indahnya Bali bagian selatan dengan berbagai macam keindahan alamnya', 10000000, 'Bali', '5ee2454049edf.jpg'),
(15, 8, 'Bali Timur', 8, 'menikmati adat-istiadat Bali Timur yang masih kental', 7000000, 'Bali', '5ee2476e84718.jpg'),
(16, 1, 'Trip Alam Bali', 9, 'mengeksplor keindaha alam Bali Utara', 8000000, 'Bali', '5ee24e213bdd1.jpg'),
(17, 8, 'Jungle', 10, 'Menerobos Hutan belantara dan manikmatii fauna flora alam Bali barat', 10000000, 'Bali', '5ee2480ea1a5b.jpg'),
(19, 2, 'Lombok indah', 10, 'Wisata pantai lombok yang indah dan asri', 5000000, 'Lombok', '5ee2499d734f6.jpg'),
(20, 2, 'Laut Lombok', 8, 'Bermain menjelajahi alam bawah laut Lombok', 7000000, 'Lombok', '5ee248f229f06.jpg'),
(21, 1, 'Galungan Kuningan', 15, 'Ikut merasakan bagaimana menjadi orang Bali saat hari raya', 10000000, 'Bali', '5ee2473fd7e67.jpg'),
(22, 9, 'Let\'s go Bali', 10, 'Menikmati dan berjalan2 ke tempat wisata yg terkenal d seluruh Bali bersama kami', 13000000, 'Bali', 'p17.jpg'),
(23, 10, 'Jugle go jungle', 10, 'Menikmati pedalaman Papua dan ikut rasakan keseruannya', 15000000, 'Jawa', '5ee247f94cabc.jpg'),
(24, 5, 'Nature Sulawesi', 12, 'Berkeliling melihat alam dan beragaman flora fauna Suwalesi', 7000000, 'Sulawesi', '5ee24b043e725.jpg'),
(25, 5, 'Culture Sulawesi', 14, 'Berinteraksi pada budaya setempat dan jadi moment tersendiri untuk anda', 5000000, 'Sulawesi', '5ee245b5335b1.jpg'),
(26, 3, 'Jawa Asix', 10, 'Menjelajahi kota Papua yang keren', 10000000, 'Jawa', '5ee24bc25f7c8.jpg'),
(27, 10, 'jamet', 5, 'Bermain ke desa tradisional setempat', 7000000, 'Jawa', '5ee24d43a1574.jpg'),
(28, 6, 'Malu malu aku', 8, 'Bermain dan jelajahi daerah Maluku yg indahh', 8000000, 'Maluku', '5ee24a78e47f3.jpg'),
(29, 5, 'View lombok', 10, 'Mencari tempat2 indah dan spot foto untuk anda', 6000000, 'Lombok', '5ee24ed3bd8e0.jpg'),
(30, 9, 'Trip to Lombok', 8, 'Explore west Lombok island', 8000000, 'Lombok', 'p25.jpg'),
(31, 7, 'NTT view', 10, 'Indahnya Indonesia bagiat timur ini', 7000000, 'NTT', '5ee24b6510368.jpg'),
(32, 3, 'Maluku jaya', 11, 'Mari mengeksplor alam laut maluku yang indah', 9000000, 'Maluku', '5ee24ae9c3696.jpg'),
(33, 4, 'Magestic Lombok', 12, 'Menyelami budaya setempat dan berkunjung ke tempat2 bersejarah', 10000000, 'Lombok', '5ee24a655007a.jpg'),
(34, 2, 'Jawa Virgin', 10, 'menyelami dan menikmati indahnya Raja Ampat', 18000000, 'Jawa', '5ee24cb9b5774.jpg'),
(35, 10, 'Around NTT', 10, 'Mengunjungi desa2 pedalaman di NTT', 4000000, 'NTT', '5ee24515a5c27.jpg'),
(36, 4, 'Food NTT', 7, 'Nikmati kuliner legendaris daerah NTT', 5000000, 'NTT', '5ee247216eda8.jpg'),
(37, 3, 'Sahabat Maluku', 8, 'Nikmati kekayaan alam Maluku', 8000000, 'Maluku', '5ee24cf9b768c.jpg'),
(38, 6, 'Ambon Mantap', 10, 'Menikati suasana kota Ambon yang indah', 7600000, 'Maluku', '5ee244e4800a8.jpg'),
(39, 1, 'Sulawesi Park', 15, 'jalan-jalan menikmati Taka Bonerate National Park', 3000000, 'Sulawesi', '5ee24dca72f53.jpg'),
(40, 4, 'Samalona island', 12, 'Berkunjung ke Pulau samalona yg eksotis', 7500000, 'Sulawesi', '5ee24d1a5d302.jpg'),
(41, 7, 'Heaven Maluku', 10, 'Nikmati keindahan surgawi yg disediakan alam Maluku', 8500000, 'Maluku', '5ee2479a9b072.jpg'),
(42, 2, 'Sulawesi go go', 12, 'go go to sulawesi', 4000000, 'Sulawesi', '5ee24d9ed6521.jpg'),
(43, 7, 'Trip jawa', 10, 'go go jamet', 6000000, 'Jawa', '5ee24e6b84343.jpg'),
(44, 10, 'Lombok live', 12, 'kuy ke Lombok aja', 4500000, 'Lombok', '5ee24a2a8af76.jpg'),
(45, 9, 'NTT world', 8, 'Kami manjakan harimu dengan jalan2 di NTT', 5000000, 'NTT', '5ee24b8c732cb.jpg'),
(46, 5, 'survive jawa', 8, 'Menelusuri Hutan Jawa', 7000000, 'Jawa', '5ee24df9454de.jpg'),
(47, 3, 'jawa red', 10, 'Berpetualang menjelajahi Hutan Rimba bagikan Tarzann', 9500000, 'Jawa', '5ee24c9f37958.jpg'),
(48, 5, 'Hi Lombok', 12, 'Bermain berpetualang di Lombok', 5500000, 'Lombok', '5ee247b9c3970.jpg'),
(49, 7, 'Lombok menari', 20, 'Menikmati keindahan Lombok dan berbagai ragam kebudayaanya', 6000000, 'Lombok', '5ee24a548ab8c.jpg'),
(50, 5, 'Welcome Sulawesi', 10, 'Berkunjung ke Sulawesi Utara', 4500000, 'Sulawesi', '5ee24ee7f0b35.jpg'),
(51, 6, 'Sulawesi Bahagia', 11, 'Bercengkrama dengan indahnya alam Sulawesi', 5000000, 'Sulawesi', '5ee24d8266eed.jpg'),
(52, 10, 'Maluku Gembira', 14, 'Mengelilingi daerah Maluku dri ujung ke ujung', 14000000, 'Maluku', '5ee24a8daa59f.jpg'),
(53, 9, 'Mentari Maluku', 12, 'Nikmati wisata pegunungan dengan mendaki gunung dan melihat sunrise', 7500000, 'Maluku', '5ee24ad95e6b5.jpg'),
(54, 2, 'NTT menyanyi', 10, 'Nikamti indahnya NTT bak nyanyian surgawi', 3500000, 'NTT', '5ee24b345f8d3.jpg'),
(55, 1, 'Berlibur NTT', 6, 'Bercengkerama dengan biota bawah laut NTT', 7000000, 'NTT', '5ee24598b7aad.jpg'),
(56, 9, 'Trip keliling bali', 10, 'jalan jalan bersama keluarga kuyy', 10000000, 'Bali', '5ee24e3cc104e.jpg'),
(57, 2, 'Trip with Mirah', 2, 'Jalan jalan berdua', 5000000, 'Bali', '5ed86a34bdd68.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(20) NOT NULL,
  `user_lastname` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `level_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_firstname`, `user_lastname`, `user_name`, `user_password`, `user_email`, `level_id`) VALUES
(1, 'I Putu', 'Rama Anadya', 'gusrama18', '$2y$10$cOqhXuo0UOXJIlBTn8Mm6ObU5A/QdCaJEHVGN1ZRrQ.yh/mLwqcve', '       iprama11@gmail.com', 1),
(2, 'hamid', 'barbar', 'hamubar99', 'wibu123', 'lokpxx@gmail.com', 2),
(3, 'poke', 'mirara', 'gekpoke45', 'wibu456', 'mirara@gmail.com', 2),
(4, 'wayki', 'lao', 'oktalao10', 'lao90', 'wayq@rocketmail.com', 2),
(5, 'gunawan', 'gans', 'yuma11', 'notwibu', 'ymanu@gmail.com', 2),
(23, 'rama', 'aa', 'aaaaa', '123', 'aaa', 1),
(26, 'I Putu', 'Rama Anadya', 'admin', '$2y$10$Afej5HYs5we6OZbcte/cSe6Q4OkgyYI5lNVhWmHSdPemk3ZANvtWG', ' madenova112@gmail.com', 1),
(28, 'rama', 'ip', 'user1', '$2y$10$0.sqygUqtsgmX46xUJWmKOW4Gz5OHCCUQmdK9ikGGpXtyxe7YG2qu', 'Gusmadu2018@gmail.com', 1),
(29, 'rama', 'Shsjajbaba', 'gungmadu72asaaaa', '$2y$10$t6cyBSHsOgVK0lnRt7g9Y.f3BW46xOL55XV3HZ.mCpGKzCBpdIytm', 'Gusmadu2018@gmail.com', 1),
(30, 'yakizawa', 'nanami', 'nanamiyakizawa', '$2y$10$jsCp2dD9Z3K4.pXiXQRPrOm8ZF7hQhYfeLbT9P5WfYpdOZx7vTbLK', ' nanamiyakizawa@gmail.con', 1),
(31, 'rama', 'ip', 'user2', '$2y$10$/RPZSPOPAo4KiJyHSsH8WehCELyBkhSZRLak31WP9E3lyZ1JG9ts6', 'madenova112@gmail.com', 1),
(32, 'ip', 'ip', 'ipip', '$2y$10$AaX7gFUG1ZJ13b/6TDUMGeg.SLfeG7aBUT9Exf/1JGSz5HB8ABFrW', '  100033165285692@g.com', 2),
(33, 'ip', 'rama', 'iprama111', '$2y$10$BlG6eDkDPhdk87451dp.6uBgHmv9kyFjqMhdIfrql/GfsZh8FEiJW', ' madenova112@gmail.com', 2),
(34, 'gunawan', 'yuma', 'ymanu', '$2y$10$HdXGP1h49nIh8c4psBICkeVIeC7i0WhLLcF5PcPlJW4tPBXN.klfe', 'yumagitulo@gmail.com', 2),
(35, 'hayo', 'apa', 'apaja', '$2y$10$PXCWuDnrrqhEd2e1GXmO2e.tnwKui0ltdsO37QQgF8./yXfipa1gq', 'apaja@gmail.com', 2),
(36, 'ym', 'anu', 'gunawan', '$2y$10$CPNTgH5jnLXEeCNSEeTUaOSP1WUsWckRd/ozjGqG6vupOuVNDhNJu', ' aaaa@gmail.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`agen_id`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `userfeedback` (`user_id`),
  ADD KEY `tripfeedback` (`trip_id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indeks untuk tabel `photo_profile`
--
ALTER TABLE `photo_profile`
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `triptransaksi` (`trip_id`),
  ADD KEY `usertransaksi` (`user_id`) USING BTREE;

--
-- Indeks untuk tabel `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `tripagent` (`agen_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `userlevel` (`level_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agen`
--
ALTER TABLE `agen`
  MODIFY `agen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `trip`
--
ALTER TABLE `trip`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `tripfeedback` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`),
  ADD CONSTRAINT `userfeedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `photo_profile`
--
ALTER TABLE `photo_profile`
  ADD CONSTRAINT `photo_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `triptransaksi` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`),
  ADD CONSTRAINT `usertransaksi` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `tripagent` FOREIGN KEY (`agen_id`) REFERENCES `agen` (`agen_id`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `userlevel` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
