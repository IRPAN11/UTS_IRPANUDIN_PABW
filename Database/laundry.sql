-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Nov 2021 pada 15.45
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry`
--

CREATE TABLE `laundry` (
  `laun_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `laun_priority` int(11) NOT NULL,
  `laun_weight` int(11) NOT NULL,
  `laun_date_received` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `laun_claimed` tinyint(4) NOT NULL DEFAULT 0,
  `laun_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laundry`
--

INSERT INTO `laundry` (`laun_id`, `customer_name`, `laun_priority`, `laun_weight`, `laun_date_received`, `laun_claimed`, `laun_type_id`) VALUES
(14, 'Asep Cilok', 3, 10, '2021-11-20 13:42:50', 0, 4),
(15, 'Reka', 1, 2, '2021-11-20 13:09:47', 1, 2),
(17, 'Reka Wibu', 3, 4, '2021-11-20 13:43:10', 0, 3),
(18, 'Panji Petualang', 3, 4, '2021-11-20 13:43:30', 0, 2),
(19, 'Dimas Ganteng', 1, 2, '2021-11-21 08:02:35', 0, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry_type`
--

CREATE TABLE `laundry_type` (
  `laun_type_id` int(11) NOT NULL,
  `laun_type_desc` varchar(50) NOT NULL,
  `laun_type_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laundry_type`
--

INSERT INTO `laundry_type` (`laun_type_id`, `laun_type_desc`, `laun_type_price`) VALUES
(1, 'Blanket', 20),
(2, 'Clothes', 30),
(3, 'Jaket', 10),
(4, 'Baju', 50),
(5, 'Karpet', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_customer_name` varchar(100) NOT NULL,
  `sale_type_desc` varchar(50) NOT NULL,
  `sale_date_paid` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sale_laundry_received` datetime NOT NULL,
  `sale_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_customer_name`, `sale_type_desc`, `sale_date_paid`, `sale_laundry_received`, `sale_amount`) VALUES
(1, 'Reyvelyn Ybanez Viovicente', 'Blanket', '2017-03-18 22:38:02', '2017-03-20 00:00:00', 60),
(2, 'Jane Dougah Hah', 'Clothes', '2017-03-19 22:43:23', '2017-03-20 06:43:16', 60),
(3, 'Winnie Alterado Damayo', 'Blanket', '2017-03-19 22:43:23', '2017-03-20 06:42:58', 40),
(4, 'Johnny Deep', 'Blanket', '2017-03-19 23:53:36', '2017-03-20 07:53:27', 60),
(5, 'Winnie Alterado Damayo', 'Clothes', '2017-03-22 16:14:47', '2017-03-23 00:14:40', 60),
(6, 'Winnie Alterado Damayo', 'Blanket', '2017-03-22 16:15:33', '2017-03-23 00:15:28', 200),
(7, 'Reka', 'Clothes', '2021-11-20 13:09:47', '2021-11-20 20:09:12', 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(50) NOT NULL,
  `user_password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_account`, `user_password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(8, 'irpanudin11', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`laun_id`),
  ADD KEY `laun_type_id` (`laun_type_id`);

--
-- Indeks untuk tabel `laundry_type`
--
ALTER TABLE `laundry_type`
  ADD PRIMARY KEY (`laun_type_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `laundry`
--
ALTER TABLE `laundry`
  MODIFY `laun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `laundry_type`
--
ALTER TABLE `laundry_type`
  MODIFY `laun_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`laun_type_id`) REFERENCES `laundry_type` (`laun_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
