-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Kas 2024, 10:58:52
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `webinars_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `webinars`
--

CREATE TABLE `webinars` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `webinars`
--

INSERT INTO `webinars` (`id`, `title`, `description`, `date`, `status`, `created_at`) VALUES
(1, 'Intro to PHP', 'Learn the basics of PHP programming', '2024-11-10 10:00:00', 1, '2024-11-01 08:42:34'),
(2, 'Advanced MySQL Techniques', 'Deep dive into MySQL indexing and optimization', '2024-11-15 15:00:00', 0, '2024-11-01 08:42:34'),
(3, 'RESTful APIs with PHP', 'Building REST APIs using PHP and CodeIgniter', '2024-11-20 12:00:00', 1, '2024-11-01 08:42:34'),
(4, 'JavaScript for Beginners', 'Understanding the basics of JavaScript programming', '2024-11-25 14:00:00', 0, '2024-11-01 08:42:34'),
(5, 'Laravel for Web Development', 'Comprehensive guide to web development with Laravel', '2024-12-01 09:00:00', 0, '2024-11-01 08:42:34'),
(6, 'Responsive Web Design', 'Techniques for creating responsive websites', '2024-12-05 11:00:00', 1, '2024-11-01 08:42:34');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `webinars`
--
ALTER TABLE `webinars`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `webinars`
--
ALTER TABLE `webinars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
