-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2024 at 12:07 PM
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
-- Database: `app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `likes` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `owner_id`, `image`, `likes`, `created_at`, `updated_at`) VALUES
(10, 2, '../uploads/1725756307_Luffy Gear 5.jpg', 0, '2024-09-08 00:45:07', '2024-09-08 00:45:07'),
(11, 1, '../uploads/1725756683_MaxWithGirls.jpg', 1, '2024-09-08 00:51:23', '2024-09-08 09:56:57'),
(13, 11, '../uploads/1725789401_Luffy Gear 5.jpg', 0, '2024-09-08 09:56:41', '2024-09-08 09:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `content_likes`
--

CREATE TABLE `content_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(6) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `content_likes`
--

INSERT INTO `content_likes` (`id`, `user_id`, `post_id`, `created_at`) VALUES
(12, 11, 11, '2024-09-08 09:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(6) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `reg_date`) VALUES
(1, 'Dear', 'Dear@gmail.com', '$2y$10$v.vALF2SipkP035UAVzTK..YZtd3YcYtZ73S1vvQRdNqorspOQpjW', '2024-09-04 11:49:26'),
(2, 'Longay', 'Longay@gmail.com', '$2y$10$W8git9ewSjz/6MA6l.tfo.N/PRReFyDEcH4gMjKisSjJvkKK/.3Oa', '2024-09-04 13:09:02'),
(3, 'Nuea', 'Nuea@gmail.com', '$2y$10$V5QRlk0gELlmpvGJoZzXBujVNrJ3daa8R3Wnmm03nzSILQpOKlrE2', '2024-09-08 00:33:26'),
(4, 'T1', '123@gmail.com', '$2y$10$LXX/70oM/lgpz4O9sabz0.3sgVCiZYvk/NeTDMWOE5sevzJp0YnRa', '2024-09-08 00:36:46'),
(5, 'T2', 'T2@gmail.com', '$2y$10$y2e40ejo86kPqzWpxAxo/..D4IPInULOFoMAC0mSE59ri6Z7RmSA6', '2024-09-08 00:37:00'),
(6, 'T3', 'T3@gmail.com', '$2y$10$2w8y39IWEneAWWIHZzDaEOeQI8Ttpg.q4qYqO.hZ4iedktLcuQmVO', '2024-09-08 00:37:13'),
(7, 'T4', 'T4@gmail.com', '$2y$10$Qw45xH1EAz.QFASrss4.weEU7Ft5Vq63F1GoANfafjBtl8HZsr3/i', '2024-09-08 00:37:23'),
(8, 'T5', 'T5@gmail.com', '$2y$10$dB4bfVZDUIuJKcxmpvuB.OszVMmtTHpCbdqc4DKg8Pr.pe7is.MsW', '2024-09-08 00:37:32'),
(9, 'T6', 'T6@gmail.com', '$2y$10$voSHoKOFUSf2MFhXpaUH8OZO6cgQ9G8Bi8PMkK.og1QwDFpLsCXhy', '2024-09-08 00:37:38'),
(10, 'T7', 'T7@gmail.com', '$2y$10$NEMcDHL3ZUOMU4EDrd79/exmeRBf25pOMsAQ8vvrmhe2Ts6izemUi', '2024-09-08 00:37:44'),
(11, 'Pimchanok', '1234@gmail.com', '$2y$10$9FiKTRRC60Jq7hfHQYfPjORcv8bS4my.gOOFI1CalaewgwWUQTX2K', '2024-09-08 09:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE `user_friends` (
  `user_id` int(6) UNSIGNED NOT NULL,
  `friend_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_friends`
--

INSERT INTO `user_friends` (`user_id`, `friend_id`) VALUES
(1, 2),
(1, 11),
(2, 1),
(2, 5),
(5, 2),
(11, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `content_likes`
--
ALTER TABLE `content_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_friends`
--
ALTER TABLE `user_friends`
  ADD PRIMARY KEY (`user_id`,`friend_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `content_likes`
--
ALTER TABLE `content_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_likes`
--
ALTER TABLE `content_likes`
  ADD CONSTRAINT `content_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_friends`
--
ALTER TABLE `user_friends`
  ADD CONSTRAINT `user_friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
