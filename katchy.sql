-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 26, 2021 at 07:42 AM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ruto`
--

-- --------------------------------------------------------

--
-- Table structure for table `chv_albums`
--

CREATE TABLE `chv_albums` (
  `album_id` bigint NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `album_user_id` bigint DEFAULT NULL,
  `album_date` datetime NOT NULL,
  `album_date_gmt` datetime NOT NULL,
  `album_creation_ip` varchar(255) NOT NULL,
  `album_privacy` enum('public','password','private','private_but_link','custom') DEFAULT 'public',
  `album_privacy_extra` mediumtext,
  `album_password` mediumtext,
  `album_image_count` bigint NOT NULL DEFAULT '0',
  `album_description` mediumtext,
  `album_likes` bigint NOT NULL DEFAULT '0',
  `album_views` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_albums`
--

INSERT INTO `chv_albums` (`album_id`, `album_name`, `album_user_id`, `album_date`, `album_date_gmt`, `album_creation_ip`, `album_privacy`, `album_privacy_extra`, `album_password`, `album_image_count`, `album_description`, `album_likes`, `album_views`) VALUES
(1, 'Memes', 7, '2020-11-16 15:52:34', '2020-11-16 12:52:34', '154.122.68.158', 'public', NULL, NULL, 2, NULL, 0, 2249);

-- --------------------------------------------------------

--
-- Table structure for table `chv_categories`
--

CREATE TABLE `chv_categories` (
  `category_id` bigint NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `category_url_key` varchar(32) NOT NULL,
  `category_description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chv_confirmations`
--

CREATE TABLE `chv_confirmations` (
  `confirmation_id` bigint NOT NULL,
  `confirmation_user_id` bigint NOT NULL,
  `confirmation_type` enum('account-activate','account-change-email','account-password-forgot') NOT NULL,
  `confirmation_date` datetime NOT NULL,
  `confirmation_date_gmt` datetime NOT NULL,
  `confirmation_token_hash` varchar(255) NOT NULL,
  `confirmation_status` enum('active','valid','invalid') NOT NULL,
  `confirmation_extra` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chv_confirmations`
--

INSERT INTO `chv_confirmations` (`confirmation_id`, `confirmation_user_id`, `confirmation_type`, `confirmation_date`, `confirmation_date_gmt`, `confirmation_token_hash`, `confirmation_status`, `confirmation_extra`) VALUES
(1, 3, 'account-activate', '2020-11-13 13:30:43', '2020-11-13 10:30:43', '$2y$10$tczHFUW2uvq5jHo8ywcUpOz.LIAcTilb7Vrl/bz.VhXY1EIGmPIcq', 'active', NULL),
(2, 4, 'account-activate', '2020-11-13 13:38:00', '2020-11-13 10:38:00', '$2y$10$C1R15lY2PNEQ38VIavRJgOdb.4XHza/AyX3UNYF9S5nm7AgjZ8kHi', 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chv_deletions`
--

CREATE TABLE `chv_deletions` (
  `deleted_id` bigint NOT NULL,
  `deleted_date_gmt` datetime NOT NULL,
  `deleted_content_id` bigint NOT NULL,
  `deleted_content_date_gmt` datetime NOT NULL,
  `deleted_content_user_id` bigint DEFAULT NULL,
  `deleted_content_ip` varchar(191) NOT NULL,
  `deleted_content_md5` varchar(32) DEFAULT NULL,
  `deleted_content_original_filename` varchar(255) DEFAULT NULL,
  `deleted_content_views` bigint NOT NULL DEFAULT '0',
  `deleted_content_likes` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_deletions`
--

INSERT INTO `chv_deletions` (`deleted_id`, `deleted_date_gmt`, `deleted_content_id`, `deleted_content_date_gmt`, `deleted_content_user_id`, `deleted_content_ip`, `deleted_content_md5`, `deleted_content_original_filename`, `deleted_content_views`, `deleted_content_likes`) VALUES
(1, '2020-11-16 11:13:48', 1, '2020-11-13 09:51:49', 1, '::1', 'd5841fa71ddc12fd38905bb71fa6ef84', 'error-404-web-creativa.gif', 0, 0),
(2, '2020-11-16 11:13:49', 2, '2020-11-13 09:51:49', 1, '::1', 'f567d9821ea23c495335b8007293a440', 'felix tac 3.png', 4, 0),
(3, '2020-11-16 11:13:49', 3, '2020-11-13 09:51:50', 1, '::1', 'c357da948579c97ee15213948355ca80', 'FELIX-TAC.png', 0, 0),
(4, '2020-11-16 11:13:49', 4, '2020-11-13 09:51:50', 1, '::1', '67bf87ed2eefdc074b9ef87c0baa65c0', 'FELIX-TAC2.png', 4, 0),
(5, '2020-11-16 11:13:49', 5, '2020-11-13 09:51:51', 1, '::1', 'a8cfa42cdb733195df3edc214ab60838', 'FELIX-TAC2 (1).png', 2, 0),
(6, '2020-11-16 11:13:49', 6, '2020-11-13 09:51:52', 1, '::1', '9f313be8dde2a56eaeb168099d090748', 'FELIX-TAC (1).png', 2, 0),
(7, '2020-11-16 11:13:49', 7, '2020-11-13 09:51:52', 1, '::1', '19fea694926d2c568511075eedb3f626', 'WhiteSur_4k.png', 3, 0),
(8, '2020-11-16 13:03:01', 152, '2020-11-16 13:02:52', 7, '154.122.68.158', 'a6e52369ee244a8829e5f1365ea5fa5b', 'FB_IMG_16052431744724422.jpg', 1, 0),
(9, '2020-11-16 13:38:05', 159, '2020-11-16 13:35:12', 8, '102.23.98.19', 'd00cf8daaa86bab8717caffc1fac2127', 'FB_IMG_1604342367990.jpg', 1, 0),
(10, '2020-11-16 13:59:28', 125, '2020-11-16 11:30:36', 5, '197.177.114.139', 'e2f3babb2ee577837e66da1c74f3ec13', 'black_rage2.jpg', 0, 0),
(11, '2020-11-16 13:59:28', 126, '2020-11-16 11:30:36', 5, '197.177.114.139', 'ed4708b54ed7b19fcb98aca98dfb9175', 'BlackRage.png', 2, 0),
(12, '2020-11-16 13:59:28', 127, '2020-11-16 11:30:37', 5, '197.177.114.139', '3ef47468b9f03916ad482db23107bd63', 'black_rage_canadian.jpg', 0, 0),
(13, '2020-11-16 13:59:28', 128, '2020-11-16 11:30:37', 5, '197.177.114.139', '9ead6fdfa0ad2009ea7b4b566c43f1c3', 'black_rage_extreme.jpg', 0, 0),
(14, '2020-11-16 13:59:28', 129, '2020-11-16 11:30:38', 5, '197.177.114.139', '1e3131eee442515dd9711e654fafc92d', 'black_rage_extreme2.jpg', 0, 0),
(15, '2020-11-16 13:59:28', 130, '2020-11-16 11:30:38', 5, '197.177.114.139', 'ed3e05775ed79f09c1086aa358c38e78', 'black_rage_foaming.jpg', 0, 0),
(16, '2020-11-16 13:59:29', 131, '2020-11-16 11:30:38', 5, '197.177.114.139', '0128a6a758463df3d6ad0834b6c9d208', 'black_rage_getting_pissed.jpg', 0, 0),
(17, '2020-11-16 13:59:29', 132, '2020-11-16 11:30:38', 5, '197.177.114.139', '65f5fd0bfe7052cbd968b0424389cc79', 'black_rage_mad.jpg', 0, 0),
(18, '2020-11-16 13:59:29', 133, '2020-11-16 11:30:39', 5, '197.177.114.139', 'f535a4425107b9045ecda2efc5419b86', 'black_rage_quiet.jpg', 0, 0),
(19, '2020-11-16 13:59:29', 134, '2020-11-16 11:30:39', 5, '197.177.114.139', 'dac976295d2cc136ca726224aa4142e9', 'black_rage_mad2.jpg', 0, 0),
(20, '2020-11-16 13:59:29', 135, '2020-11-16 11:30:40', 5, '197.177.114.139', 'fe0a451fed9652e003bc061f2be105b2', 'black_rage_shaking.jpg', 0, 0),
(21, '2020-11-16 13:59:29', 136, '2020-11-16 11:30:40', 5, '197.177.114.139', 'c7bbfa6ceec0e26a602a077ffafeffff', 'black_rage_super.jpg', 0, 0),
(22, '2020-11-16 13:59:29', 137, '2020-11-16 11:30:40', 5, '197.177.114.139', 'f1606970a10ace65233aeb5b268f6b9e', 'black_really_determined.jpg', 0, 0),
(23, '2020-11-16 13:59:29', 138, '2020-11-16 11:30:41', 5, '197.177.114.139', 'baa4a0b58b58431429389779905c667d', 'black_schlick.jpg', 0, 0),
(24, '2020-11-16 13:59:29', 139, '2020-11-16 11:30:41', 5, '197.177.114.139', '0d5175487d1fd67d2d445c8c83138d7b', 'black_red_tongue.jpg', 0, 0),
(25, '2020-11-16 13:59:29', 140, '2020-11-16 11:30:41', 5, '197.177.114.139', '15e7ff132d9a7560cd2ddb9957484b0e', 'black_smile.jpg', 0, 0),
(26, '2020-11-16 13:59:29', 141, '2020-11-16 11:30:42', 5, '197.177.114.139', '87a7733ffb84b5100842f8a84b623e71', 'black_sweet_tears.jpg', 0, 0),
(27, '2020-11-16 13:59:29', 142, '2020-11-16 11:30:42', 5, '197.177.114.139', 'e411ac163b45690760965be095ef172f', 'black_tongue_down.jpg', 0, 0),
(28, '2020-11-16 13:59:29', 143, '2020-11-16 11:30:42', 5, '197.177.114.139', '8ed9de9410e1bcb4de58ccc48db7a04a', 'black_troll.jpg', 0, 0),
(29, '2020-11-16 13:59:29', 144, '2020-11-16 11:30:43', 5, '197.177.114.139', '3eab7ad3c43213eed8e79bc3e1f4d5d0', 'black_troll_sad.jpg', 0, 0),
(30, '2020-11-16 13:59:29', 145, '2020-11-16 11:30:43', 5, '197.177.114.139', '5739bef608b2658ef6eec7d1cebaad78', 'black_why.jpg', 0, 0),
(31, '2020-11-16 13:59:29', 146, '2020-11-16 11:30:44', 5, '197.177.114.139', '7202dc4b825f4ccfc8620cd873ff7795', 'black_what.jpg', 0, 0),
(32, '2020-11-16 13:59:29', 147, '2020-11-16 11:30:44', 5, '197.177.114.139', '97168a57297d4671b531da223a18487b', 'black_why_no_hands.jpg', 1, 0),
(33, '2020-11-16 13:59:29', 148, '2020-11-16 11:30:44', 5, '197.177.114.139', '80473a5ef7bdd16a481c7d712f76b04e', 'black_wut.jpg', 0, 0),
(34, '2020-11-16 14:00:22', 105, '2020-11-16 11:30:30', 5, '197.177.114.139', 'e33aaaed5da0906648d5512182021b44', 'blackhair.jpg', 0, 0),
(35, '2020-11-16 14:00:22', 106, '2020-11-16 11:30:30', 5, '197.177.114.139', 'bacc516b654bd97aa2e228d64b0b446a', 'blackhair2.jpg', 0, 0),
(36, '2020-11-16 14:00:22', 107, '2020-11-16 11:30:30', 5, '197.177.114.139', 'c4fca587297508c0e65769ddca5378ea', 'blackhair3.jpg', 0, 0),
(37, '2020-11-16 14:00:22', 108, '2020-11-16 11:30:31', 5, '197.177.114.139', 'dead8d3c19700cd68f221dfddf6aff9c', 'BlackHair.png', 0, 0),
(38, '2020-11-16 14:00:22', 109, '2020-11-16 11:30:31', 5, '197.177.114.139', 'aadacd4046e6a2b9d486cba3553d70f8', 'black_happy.jpg', 0, 0),
(39, '2020-11-16 14:00:22', 110, '2020-11-16 11:30:31', 5, '197.177.114.139', '353ec1ba34129fd84d783fd612c2d20c', 'black_hmmm.jpg', 0, 0),
(40, '2020-11-16 14:00:22', 111, '2020-11-16 11:30:32', 5, '197.177.114.139', '7b7d9ed1878033c5f412550105aebbf7', 'black_i_wonder.jpg', 0, 0),
(41, '2020-11-16 14:00:22', 112, '2020-11-16 11:30:32', 5, '197.177.114.139', '39f4fb6059f24f0affdda4674518902f', 'black_ladystare.jpg', 0, 0),
(42, '2020-11-16 14:00:22', 113, '2020-11-16 11:30:32', 5, '197.177.114.139', 'db1a5da721b51508e52171828f93b7d7', 'black_ladystare2.jpg', 1, 0),
(43, '2020-11-16 14:00:22', 114, '2020-11-16 11:30:33', 5, '197.177.114.139', '68c72095009170e027b452a067a61cb7', 'black_lean.jpg', 0, 0),
(44, '2020-11-16 14:00:22', 115, '2020-11-16 11:30:33', 5, '197.177.114.139', 'e0be2e31fed5afee09aa1ff0bf14806c', 'black_lol.jpg', 0, 0),
(45, '2020-11-16 14:00:22', 116, '2020-11-16 11:30:33', 5, '197.177.114.139', '6d7c90868bc19d917e61289ee3053321', 'black_me_gusta.jpg', 2, 0),
(46, '2020-11-16 14:00:22', 117, '2020-11-16 11:30:34', 5, '197.177.114.139', 'ab0a2f5b66ebad895476c03dcba520ba', 'black_milk.jpg', 2, 0),
(47, '2020-11-16 14:00:22', 118, '2020-11-16 11:30:34', 5, '197.177.114.139', '07adcee5ae53f5259114647a9bef778b', 'black_normal.jpg', 0, 0),
(48, '2020-11-16 14:00:22', 119, '2020-11-16 11:30:34', 5, '197.177.114.139', '602c6a6274fac950e088de8d4004d06c', 'black_normal2.jpg', 0, 0),
(49, '2020-11-16 14:00:22', 120, '2020-11-16 11:30:35', 5, '197.177.114.139', 'fc476c84ef99f8350d69ced0c74cc6da', 'black_okay.jpg', 0, 0),
(50, '2020-11-16 14:00:22', 121, '2020-11-16 11:30:35', 5, '197.177.114.139', '970b0eaad0c6c0b43a9f80a220a2020b', 'black_omgrun.jpg', 0, 0),
(51, '2020-11-16 14:00:22', 122, '2020-11-16 11:30:35', 5, '197.177.114.139', '1421a5615ba41f7e4fbce3ec8865b3b5', 'black_pfft.jpg', 0, 0),
(52, '2020-11-16 14:00:22', 123, '2020-11-16 11:30:35', 5, '197.177.114.139', 'b67c753f0aa1c0e31f0b6d2632f2318f', 'black_quite.jpg', 0, 0),
(53, '2020-11-16 14:00:22', 124, '2020-11-16 11:30:36', 5, '197.177.114.139', '71a79991514b141c47a6aac99b2ef341', 'black_rage.jpg', 0, 0),
(54, '2020-11-16 14:04:32', 83, '2020-11-16 11:30:22', 5, '197.177.114.139', 'b785b2843100f1a96918c3c00168a9aa', 'black_concentrated.jpg', 0, 0),
(55, '2020-11-16 14:04:32', 84, '2020-11-16 11:30:22', 5, '197.177.114.139', '936de3aab5b651c5b8b026815295bb97', 'black_big_smile.jpg', 0, 0),
(56, '2020-11-16 14:04:32', 85, '2020-11-16 11:30:23', 5, '197.177.114.139', 'ad84ed81b8ecb1e1be19c10bef58df95', 'black_crying.jpg', 0, 0),
(57, '2020-11-16 14:04:32', 86, '2020-11-16 11:30:23', 5, '197.177.114.139', '656af767dc4224a8924f632eedf15072', 'black_dazed.jpg', 0, 0),
(58, '2020-11-16 14:04:32', 87, '2020-11-16 11:30:23', 5, '197.177.114.139', '6342a4986a8b386505479e13d879ab1f', 'black_determined.jpg', 0, 0),
(59, '2020-11-16 14:04:33', 88, '2020-11-16 11:30:24', 5, '197.177.114.139', '484dd4324c91fbda749a73a85f32aa6b', 'black_dumbfounded.jpg', 0, 0),
(60, '2020-11-16 14:04:33', 89, '2020-11-16 11:30:24', 5, '197.177.114.139', '777cce0d1b6daa4e532a3ef6430138da', 'black_dude.jpg', 0, 0),
(61, '2020-11-16 14:04:33', 90, '2020-11-16 11:30:25', 5, '197.177.114.139', 'b22cc6f311f6051a6ab2d3cf6fb74691', 'black_ewbte.jpg', 0, 0),
(62, '2020-11-16 14:04:33', 91, '2020-11-16 11:30:25', 5, '197.177.114.139', 'a1334a40834ecf7fb3c8bbd5fd025bfc', 'black_excited.jpg', 0, 0),
(63, '2020-11-16 14:04:33', 92, '2020-11-16 11:30:25', 5, '197.177.114.139', '8bbad8733b12a280627c95d52162b952', 'black_excited_bliss.jpg', 0, 0),
(64, '2020-11-16 14:04:33', 93, '2020-11-16 11:30:26', 5, '197.177.114.139', '1de80272c3c45dcab5b74952bb7d75aa', 'black_excited_tears.jpg', 1, 0),
(65, '2020-11-16 14:04:33', 94, '2020-11-16 11:30:26', 5, '197.177.114.139', 'e128d580e99eb8ec06707ced962d8ba9', 'black_facepalm.jpg', 0, 0),
(66, '2020-11-16 14:04:33', 95, '2020-11-16 11:30:27', 5, '197.177.114.139', 'aab0ee86f7ff5c0fbf980b83867acf01', 'black_fake_smile.jpg', 0, 0),
(67, '2020-11-16 14:04:33', 96, '2020-11-16 11:30:27', 5, '197.177.114.139', '5547f1c0289f371588375cceb6134851', 'black_forever_alone.jpg', 0, 0),
(68, '2020-11-16 14:04:33', 98, '2020-11-16 11:30:28', 5, '197.177.114.139', '663ae7ea816055d70b9b9c96ac814e09', 'black_fuck_that_bitch.jpg', 0, 0),
(69, '2020-11-16 14:04:33', 99, '2020-11-16 11:30:28', 5, '197.177.114.139', 'fa068fdcfad7d89889e6b9a9c06a624a', 'black_fuck_yeah.jpg', 0, 0),
(70, '2020-11-16 14:04:33', 100, '2020-11-16 11:30:28', 5, '197.177.114.139', '64dc001b7d07ad7a868a05c0236fd915', 'black_gasp.jpg', 0, 0),
(71, '2020-11-16 14:04:33', 101, '2020-11-16 11:30:29', 5, '197.177.114.139', 'b83e4db6f2f1e962170c695fabc12c95', 'black_gasp2.jpg', 0, 0),
(72, '2020-11-16 14:04:33', 102, '2020-11-16 11:30:29', 5, '197.177.114.139', 'da8778ccd62b30cab6e5667dd99d78e2', 'BlackGuy.png', 0, 0),
(73, '2020-11-16 14:04:33', 103, '2020-11-16 11:30:29', 5, '197.177.114.139', '0eed746c93192e8030ed1b38aad9a6ae', 'BlackGuyBeaten.png', 0, 0),
(74, '2020-11-16 14:06:27', 61, '2020-11-16 11:30:13', 5, '197.177.114.139', '6a15750183fa247aa1d868c8b5403e74', 'AsianTroll.png', 0, 0),
(75, '2020-11-16 14:06:27', 62, '2020-11-16 11:30:13', 5, '197.177.114.139', '7759eada35f755a65f00032801865634', 'awkward_moment.jpg', 0, 0),
(76, '2020-11-16 14:06:27', 63, '2020-11-16 11:30:14', 5, '197.177.114.139', '35e5dd5e235fd1e6447ef378a042959a', 'aww_yeah.jpg', 0, 0),
(77, '2020-11-16 14:06:27', 66, '2020-11-16 11:30:15', 5, '197.177.114.139', '36cd61f0ac79d17bc8c0366d15095762', 'baby_troll.jpg', 0, 0),
(78, '2020-11-16 14:06:27', 67, '2020-11-16 11:30:15', 5, '197.177.114.139', 'abb8e2177923ff228b62847eae475a4a', 'BabyTroll.png', 0, 0),
(79, '2020-11-16 14:06:27', 69, '2020-11-16 11:30:16', 5, '197.177.114.139', '4fe1be9acf0e5c9114c9fbaaf69a6911', 'bad_luck_brian.jpg', 0, 0),
(80, '2020-11-16 14:06:27', 70, '2020-11-16 11:30:16', 5, '197.177.114.139', '8c48b7636220a441b7a899ca4d561cd6', 'bad_pokerface.jpg', 0, 0),
(81, '2020-11-16 14:06:27', 71, '2020-11-16 11:30:17', 5, '197.177.114.139', '29e83088c66b34fee3e7f619fff36c5f', 'Baww.png', 0, 0),
(82, '2020-11-16 14:06:27', 72, '2020-11-16 11:30:18', 5, '197.177.114.139', '66a150d96fdc269306de29d8f355e34c', 'bear_grylls.jpg', 0, 0),
(83, '2020-11-16 14:06:27', 73, '2020-11-16 11:30:18', 5, '197.177.114.139', 'f36be3e335d01e44201291cabe6c76f8', 'beard_guy.jpg', 0, 0),
(84, '2020-11-16 14:06:27', 74, '2020-11-16 11:30:18', 5, '197.177.114.139', '8c2193ea4e6be1f182a5f6d5ebf7c60a', 'BeerGuy.png', 0, 0),
(85, '2020-11-16 14:06:27', 75, '2020-11-16 11:30:19', 5, '197.177.114.139', '08311032ec53bb22de9e76f0208486cf', 'beer_guy.jpg', 0, 0),
(86, '2020-11-16 14:06:27', 76, '2020-11-16 11:30:19', 5, '197.177.114.139', '81ba9aaefef81bf51e4015b788cef5cb', 'beng.jpg', 0, 0),
(87, '2020-11-16 14:06:28', 78, '2020-11-16 11:30:20', 5, '197.177.114.139', '112042afa26c80069526d35cd90ef8b2', 'BigGrin.png', 0, 0),
(88, '2020-11-16 14:06:28', 80, '2020-11-16 11:30:21', 5, '197.177.114.139', '71172604687279bbfa65d035fcac1828', 'big_smile.jpg', 0, 0),
(89, '2020-11-16 14:06:28', 97, '2020-11-16 11:30:27', 5, '197.177.114.139', '3fc5a6a2beb2a495bedfb4461ee6f8bc', 'black_freddie.jpg', 0, 0),
(90, '2020-11-16 14:07:43', 21, '2020-11-16 11:29:53', 5, '197.177.114.139', '291b35d18d6346e57608367b13fd66e5', '8_01_pm.jpg', 0, 0),
(91, '2020-11-16 14:07:43', 22, '2020-11-16 11:29:53', 5, '197.177.114.139', '3b74d1ddd8bcbaf10801af3640470af7', '8_hours_later.jpg', 0, 0),
(92, '2020-11-16 14:07:43', 23, '2020-11-16 11:29:54', 5, '197.177.114.139', '122f1450e030fb09e31b12771e08c8d8', '10_seconds_later.jpg', 0, 0),
(93, '2020-11-16 14:07:43', 24, '2020-11-16 11:29:54', 5, '197.177.114.139', '7c6eba9463ff1cbbf313071ff04a5bdf', '10guy.jpg', 0, 0),
(94, '2020-11-16 14:07:43', 25, '2020-11-16 11:29:55', 5, '197.177.114.139', 'af96b620ae5d48639fcb3af5af569fb4', '12_seconds_later.jpg', 0, 0),
(95, '2020-11-16 14:07:43', 26, '2020-11-16 11:29:55', 5, '197.177.114.139', '8432eab9ec41376b8b0eb930be4f3d77', '15_minutes_later.jpg', 0, 0),
(96, '2020-11-16 14:07:43', 27, '2020-11-16 11:29:55', 5, '197.177.114.139', 'bffa772586b706eda183c47716f1d00f', '48_hours_later.jpg', 0, 0),
(97, '2020-11-16 14:07:44', 28, '2020-11-16 11:29:55', 5, '197.177.114.139', 'e2449672abe25e027b0e5bc8981e8be6', '346_minutes_later.jpg', 0, 0),
(98, '2020-11-16 14:07:44', 29, '2020-11-16 11:29:56', 5, '197.177.114.139', '72bf5cef1a3bb5f8e10ec06c2fef0e5c', '2000_years_later.jpg', 0, 0),
(99, '2020-11-16 14:07:44', 30, '2020-11-16 11:29:56', 5, '197.177.114.139', 'a0ae68b7c8341d9721997f3e4bacc4cc', '3000_years_later.jpg', 0, 0),
(100, '2020-11-16 14:07:44', 33, '2020-11-16 11:29:58', 5, '197.177.114.139', 'efd5fc2423652accb0d6b5e61468660a', 'advice_dog.jpg', 0, 0),
(101, '2020-11-16 14:07:44', 34, '2020-11-16 11:29:59', 5, '197.177.114.139', '9bbedbbaae8106884543b286eb96e68a', 'advice_god.jpg', 0, 0),
(102, '2020-11-16 14:07:44', 35, '2020-11-16 11:29:59', 5, '197.177.114.139', 'd70ff43f33d2a4b83bb5c508a4c1c82d', 'advice_yoda_gives.jpg', 0, 0),
(103, '2020-11-16 14:07:44', 36, '2020-11-16 11:29:59', 5, '197.177.114.139', '8fed58992ddd8b2cbc990146fd31874e', 'a_few_inches_later.jpg', 4, 0),
(104, '2020-11-16 14:07:44', 37, '2020-11-16 11:29:59', 5, '197.177.114.139', 'd27df6bc73fc2e2bb264255b7aeb9eb7', 'a_few_minutes_later.jpg', 2, 0),
(105, '2020-11-16 14:07:44', 38, '2020-11-16 11:30:00', 5, '197.177.114.139', '888f8917faa4535323500f1b7785cdc7', 'a_few_moments_later.jpg', 0, 0),
(106, '2020-11-16 14:07:44', 40, '2020-11-16 11:30:01', 5, '197.177.114.139', '5005a677e81f20cd2b5f975376370b85', 'aint_that_some_shit.jpg', 0, 0),
(107, '2020-11-16 14:07:44', 41, '2020-11-16 11:30:01', 5, '197.177.114.139', 'ca8c74f82de4a269c018a6e59409b50d', 'alien.jpg', 0, 0),
(108, '2020-11-16 14:07:44', 42, '2020-11-16 11:30:02', 5, '197.177.114.139', '593ca6819e6296822f37d044775e2db1', 'all_the_things_fuu.jpg', 0, 0),
(109, '2020-11-16 14:07:44', 43, '2020-11-16 11:30:02', 5, '197.177.114.139', 'e53d4d5f127fb2d7172051869af9f0c5', 'Angry.png', 0, 0),
(110, '2020-11-16 14:07:44', 44, '2020-11-16 11:30:02', 5, '197.177.114.139', 'bb0b61d13008ff9fad543c66448612cb', 'all_the_things_sad.jpg', 0, 0),
(111, '2020-11-16 14:08:28', 8, '2020-11-16 11:29:48', 5, '197.177.114.139', '8e0287073344955220ca9e1da810517e', '3_28_am.jpg', 0, 0),
(112, '2020-11-16 14:08:28', 9, '2020-11-16 11:29:48', 5, '197.177.114.139', '09184a93a2cc82e09a8a716ebd21d357', '3_days_later.jpg', 0, 0),
(113, '2020-11-16 14:08:28', 10, '2020-11-16 11:29:49', 5, '197.177.114.139', '2065d7242277864882e5fbeb3c05e599', '3_days_later_2.jpg', 0, 0),
(114, '2020-11-16 14:08:28', 11, '2020-11-16 11:29:49', 5, '197.177.114.139', '8724bfe6319a4791735dd4da076fb878', '3_days_later_3.jpg', 0, 0),
(115, '2020-11-16 14:08:28', 12, '2020-11-16 11:29:49', 5, '197.177.114.139', '91643cbca282607f650ba8e5f84f7e59', '3_days_later_4.jpg', 0, 0),
(116, '2020-11-16 14:08:28', 13, '2020-11-16 11:29:50', 5, '197.177.114.139', '0254a3c3ff23b7b98c12272c122f337e', '3_days_later_5.jpg', 0, 0),
(117, '2020-11-16 14:08:28', 14, '2020-11-16 11:29:50', 5, '197.177.114.139', '1eb1f50fa207754c0af4ddcc4cea7958', '3_hours_later.jpg', 0, 0),
(118, '2020-11-16 14:08:29', 15, '2020-11-16 11:29:51', 5, '197.177.114.139', '056194ebff63c870df4e50a462eb6810', '4_to_6_weeks_later.jpg', 0, 0),
(119, '2020-11-16 14:08:29', 16, '2020-11-16 11:29:51', 5, '197.177.114.139', '8f43960a214068cd19d172a39dd5921b', '5_minutes_later.jpg', 2, 0),
(120, '2020-11-16 14:08:29', 17, '2020-11-16 11:29:51', 5, '197.177.114.139', '6c51f0ce3c26949c3bf9606852ebd317', '6_half_hours_later.jpg', 0, 0),
(121, '2020-11-16 14:08:29', 18, '2020-11-16 11:29:52', 5, '197.177.114.139', '8065fb85a1e82e9769ba1ed46d93cd61', '7_59_am.jpg', 0, 0),
(122, '2020-11-16 14:08:29', 19, '2020-11-16 11:29:52', 5, '197.177.114.139', '69a6d95eecb7de1c75d6e3b35712952e', '6_months_later.jpg', 0, 0),
(123, '2020-11-16 14:08:29', 20, '2020-11-16 11:29:52', 5, '197.177.114.139', '0f9477d3e744de5251dce2abe8f600d3', '7_hours_later.jpg', 0, 0),
(124, '2020-11-16 14:09:31', 45, '2020-11-16 11:30:04', 5, '197.177.114.139', '27b7f6f281bb7338c944b81bad1211e4', 'angry_dark_stare.jpg', 0, 0),
(125, '2020-11-16 14:09:31', 46, '2020-11-16 11:30:05', 5, '197.177.114.139', '2502789f2a46a1c612e52b0067651d8e', 'angry_head_shake.jpg', 0, 0),
(126, '2020-11-16 14:09:31', 47, '2020-11-16 11:30:06', 5, '197.177.114.139', 'c4a6c2376eefd8c14ddf5037d754819e', 'angry_mom.jpg', 0, 0),
(127, '2020-11-16 14:09:31', 48, '2020-11-16 11:30:06', 5, '197.177.114.139', '669c2df635a8815ac287cd352dd5ec5e', 'angry_mouth.jpg', 0, 0),
(128, '2020-11-16 14:09:31', 50, '2020-11-16 11:30:07', 5, '197.177.114.139', '6a3e82a179263a8623bc47c208f57c60', 'angry_school_boy.jpg', 0, 0),
(129, '2020-11-16 14:09:31', 52, '2020-11-16 11:30:08', 5, '197.177.114.139', '7b6f781ff8e73145f0a271907e6a280c', 'annoying_childhood_friend.jpg', 0, 0),
(130, '2020-11-16 14:09:31', 53, '2020-11-16 11:30:09', 5, '197.177.114.139', '537c3f0581ca042e7b4dc455b67a44dd', 'annoying_facebook_girl.jpg', 0, 0),
(131, '2020-11-16 14:09:31', 54, '2020-11-16 11:30:10', 5, '197.177.114.139', 'bc6030eaaf236c61c3c3b55698027215', 'anonymous_mask.jpg', 0, 0),
(132, '2020-11-16 14:09:31', 56, '2020-11-16 11:30:10', 5, '197.177.114.139', '9f2f1217af7e24eca6629c062e84ebb8', 'angry_shaking.jpg', 0, 0),
(133, '2020-11-16 14:09:31', 58, '2020-11-16 11:30:12', 5, '197.177.114.139', 'f2e75afad0cc664a8f379d18166e3e23', 'are_you_fucking_kidding_me_clean.jpg', 0, 0),
(134, '2020-11-16 14:09:31', 59, '2020-11-16 11:30:12', 5, '197.177.114.139', '6098e3efd434e862f141ae01d6c4640e', 'arrow_in_knee.jpg', 0, 0),
(135, '2020-11-16 14:09:31', 60, '2020-11-16 11:30:13', 5, '197.177.114.139', 'a506c3ae17a74a8900dced9c4b8c7890', 'art_student_owl.jpg', 0, 0),
(136, '2020-11-16 15:48:56', 164, '2020-11-16 15:37:33', 7, '197.156.137.184', '12ae0833cffa86ab1551d803725f01a3', 'IMG_20201115_145056_780.jpg', 1, 0),
(137, '2020-11-16 15:52:02', 168, '2020-11-16 15:45:50', 8, '102.23.98.19', '927c7283edc4c8df8f3cc7116cd0fa1d', 'tmp-cam-4082963215900108828.jpg', 2, 0),
(138, '2020-11-16 15:52:35', 156, '2020-11-16 13:33:20', 8, '102.23.98.19', 'f59e55020ae6b5d0bb047ad2d8ae1b5f', 'FB_IMG_1604393714547.jpg', 2, 0),
(139, '2020-11-16 15:53:58', 165, '2020-11-16 15:38:23', 7, '197.156.137.184', 'c401a0a03558a3187ea9c852cfacfb90', 'FB_IMG_16054700095077902.jpg', 2, 0),
(140, '2020-11-16 15:54:27', 151, '2020-11-16 12:58:16', 7, '154.122.68.158', 'e54f62bb11355b1eea1de860468ce07b', 'FB_IMG_16054698881573760.jpg', 3, 0),
(141, '2020-11-19 19:08:16', 174, '2020-11-18 04:58:20', 7, '197.156.190.147', '4dc83d92040ecde0d0a584ba2083160f', 'IMG_20201116_215615.jpg', 2, 0),
(142, '2020-11-23 06:47:16', 185, '2020-11-23 06:45:32', 7, '197.156.137.135', 'bcb7a1bab479a259c6789705e1befd89', 'inbound8685325808812643991.jpg', 1, 0),
(143, '2020-11-24 13:55:25', 189, '2020-11-24 13:55:12', 7, '41.76.168.176', '16d6837ffc2c9ff9948b20b20149103d', 'Ele5_ewWMAIlJXw (1).jpg', 1, 0),
(144, '2020-12-03 05:11:40', 217, '2020-12-03 05:11:19', 7, '197.156.137.188', '9ba22dd3fdfcfbc688cda137cdf0d98a', 'FB_IMG_16064984357821677.jpg', 1, 0),
(145, '2020-12-11 18:22:38', 232, '2020-12-11 18:21:52', 7, '102.166.208.237', 'f1c30cfc9f8dbe3fb0afd8a52f39efe8', 'FB_IMG_16076872611282188.jpg', 1, 0),
(146, '2020-12-11 18:23:24', 233, '2020-12-11 18:23:06', 7, '102.166.208.237', 'f5e2dfe77372303cc87f74b7a68afa86', 'IMG_20201210_211631_980.jpg', 1, 0),
(147, '2021-01-13 07:10:57', 265, '2021-01-13 07:10:22', 7, '102.23.98.13', '7dffb3a009cce2d6fd3484ccf82bd765', 'tmp-cam-4843229167764805488.jpg', 1, 0),
(148, '2021-01-15 16:11:13', 269, '2021-01-15 16:10:52', 8, '105.49.175.229', '37e622aa4730500c3447e67307698ac5', 'IMG_20210112_110433_259.jpg', 1, 0),
(149, '2021-01-19 19:14:51', 273, '2021-01-19 19:14:32', 8, '197.156.137.142', '8c1ce07b7ecbcdd093405bcf79a37a5e', 'FB_IMG_16109948887556300.jpg', 1, 0),
(150, '2021-01-19 19:15:27', 274, '2021-01-19 19:15:21', 8, '197.156.137.142', 'b1879e5779df8d2fc3b7d659e1057156', 'FB_IMG_16109940145895273.jpg', 1, 0),
(151, '2021-01-24 10:32:47', 281, '2021-01-24 10:30:51', 8, '102.167.143.244', '87d106c0ba7719953be57c7b33347d2a', 'IMG_20210124_125328_374.jpg', 20, 0),
(152, '2021-01-28 20:26:34', 285, '2021-01-28 20:26:18', 8, '154.123.39.232', '005c8e39a5e88fc933c0d9cc3d79f4dd', 'FB_IMG_16108538623251251.jpg', 1, 0),
(153, '2021-02-27 17:12:27', 306, '2021-02-27 17:11:47', 8, '102.167.84.70', '1f7ebd76c5b568eef5a525bd4afc1246', 'IMG_20210227_192607_410.jpg', 1, 0),
(154, '2021-02-27 19:27:06', 308, '2021-02-27 19:26:46', 8, '102.167.22.83', '72b5e2f02a80f338a5a676a5f1560c9a', 'FB_IMG_16144537262085761.jpg', 1, 0),
(155, '2021-02-28 14:46:12', 311, '2021-02-28 14:45:08', 8, '102.167.13.252', 'd2d989346ffe3eb5109c0af9f6d4522d', 'IMG_20210228_142757_788.jpg', 2, 0),
(156, '2021-04-20 05:33:09', 349, '2021-04-20 05:32:46', 8, '154.122.1.52', '06e5c7f322f5c5edb97fff87018d5497', 'IMG_20210417_181910_267.jpg', 1, 0),
(157, '2021-04-20 05:37:41', 346, '2021-04-17 12:55:11', 8, '154.122.115.132', '1d7ddc44a6bc66c41d6fdb5acfaef9c5', 'IMG_20210417_154454_512.jpg', 58, 0),
(158, '2021-04-20 13:34:44', 353, '2021-04-20 13:33:25', 8, '102.166.156.203', 'bbf42e495bb7752ca1cd7d289bbe5e52', 'FB_IMG_16109943723981454.jpg', 1, 0),
(159, '2021-04-25 11:39:22', 362, '2021-04-25 11:37:55', 8, '154.122.20.250', 'f731ef68a0e33dcebef8cd80dce37d52', 'IMG_20210425_143247.jpg', 1, 0),
(160, '2021-05-01 09:09:21', 374, '2021-05-01 09:09:14', 8, '102.166.127.218', 'de48eadeaa78825819073f7e1b6a0ab3', 'IMG_20210430_210753_910.jpg', 1, 0),
(161, '2021-05-01 19:40:48', 377, '2021-05-01 19:40:40', 8, '102.167.56.228', '11746f815cdd0e3984e4e6593048a141', 'IMG_20210501_221842_508.jpg', 1, 0),
(162, '2021-05-07 12:11:38', 380, '2021-05-07 12:11:24', 8, '41.76.168.176', 'e74f64470cdff75846e71f73cfc78ec1', 'IMG_20210507_081600_495.jpg', 1, 0),
(163, '2021-05-16 16:22:55', 384, '2021-05-16 16:22:36', 8, '105.160.9.182', '65bb6621c9eb2a6adc8c23d0a5bc6213', 'IMG_20210516_100820_485.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chv_follows`
--

CREATE TABLE `chv_follows` (
  `follow_id` bigint NOT NULL,
  `follow_date` datetime NOT NULL,
  `follow_date_gmt` datetime NOT NULL,
  `follow_user_id` bigint NOT NULL,
  `follow_followed_user_id` bigint NOT NULL,
  `follow_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chv_images`
--

CREATE TABLE `chv_images` (
  `image_id` bigint NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_extension` varchar(255) NOT NULL,
  `image_size` int NOT NULL,
  `image_width` int NOT NULL,
  `image_height` int NOT NULL,
  `image_date` datetime NOT NULL,
  `image_date_gmt` datetime NOT NULL,
  `image_title` varchar(100) DEFAULT NULL,
  `image_description` mediumtext,
  `image_nsfw` tinyint(1) NOT NULL DEFAULT '0',
  `image_user_id` bigint DEFAULT NULL,
  `image_album_id` bigint DEFAULT NULL,
  `image_uploader_ip` varchar(255) NOT NULL,
  `image_storage_mode` enum('datefolder','direct','old','path') NOT NULL DEFAULT 'datefolder',
  `image_path` varchar(4096) DEFAULT NULL,
  `image_storage_id` bigint DEFAULT NULL,
  `image_md5` varchar(32) NOT NULL,
  `image_source_md5` varchar(32) DEFAULT NULL,
  `image_original_filename` varchar(255) NOT NULL,
  `image_original_exifdata` longtext,
  `image_views` bigint NOT NULL DEFAULT '0',
  `image_category_id` bigint DEFAULT NULL,
  `image_chain` tinyint NOT NULL,
  `image_thumb_size` int NOT NULL,
  `image_medium_size` int NOT NULL DEFAULT '0',
  `image_expiration_date_gmt` datetime DEFAULT NULL,
  `image_likes` bigint NOT NULL DEFAULT '0',
  `image_is_animated` tinyint(1) NOT NULL DEFAULT '0',
  `image_is_approved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_images`
--

INSERT INTO `chv_images` (`image_id`, `image_name`, `image_extension`, `image_size`, `image_width`, `image_height`, `image_date`, `image_date_gmt`, `image_title`, `image_description`, `image_nsfw`, `image_user_id`, `image_album_id`, `image_uploader_ip`, `image_storage_mode`, `image_path`, `image_storage_id`, `image_md5`, `image_source_md5`, `image_original_filename`, `image_original_exifdata`, `image_views`, `image_category_id`, `image_chain`, `image_thumb_size`, `image_medium_size`, `image_expiration_date_gmt`, `image_likes`, `image_is_animated`, `image_is_approved`) VALUES
(31, 'actually', 'jpg', 157952, 1500, 1108, '2020-11-16 14:29:58', '2020-11-16 11:29:58', 'actually', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'cec2fe43d8b654297aa1c7c9ace880cc', NULL, 'actually.jpg', '{\"FileName\":\"actually.jpg\",\"FileDateTime\":\"1605526197\",\"FileSize\":\"157952\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1500\\\" height=\\\"1108\\\"\",\"Height\":\"1108\",\"Width\":\"1500\",\"IsColor\":\"1\"}}', 576, NULL, 7, 7490, 24718, NULL, 0, 0, 1),
(32, 'accidentally_open_internet_explorer', 'jpg', 319404, 1500, 1293, '2020-11-16 14:29:58', '2020-11-16 11:29:58', 'accidentally open internet explorer', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '6b13d7c4beaa54c03dd11d8518a09864', NULL, 'accidentally_open_internet_explorer.jpg', '{\"FileName\":\"accidentally_open_internet_explorer.jpg\",\"FileDateTime\":\"1605526198\",\"FileSize\":\"319404\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1500\\\" height=\\\"1293\\\"\",\"Height\":\"1293\",\"Width\":\"1500\",\"IsColor\":\"1\"}}', 438, NULL, 7, 13802, 56539, NULL, 0, 0, 1),
(39, 'Aint-no-body-got-time-fo-dat', 'jpg', 57738, 480, 330, '2020-11-16 14:30:00', '2020-11-16 11:30:00', 'Aint no body got time fo dat', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'aeea5f3ecdc70dc6b227b162be4ec436', NULL, 'Aint no body got time fo dat.jpg', '{\"FileName\":\"Aint no body got time fo dat.jpg\",\"FileDateTime\":\"1605526200\",\"FileSize\":\"57738\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"330\\\"\",\"Height\":\"330\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 554, NULL, 5, 12634, 0, NULL, 0, 0, 1),
(49, 'angry_bang', 'jpg', 736751, 1374, 1500, '2020-11-16 14:30:07', '2020-11-16 11:30:07', 'angry bang', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '9b36c99787b5f425ff9f27781e72a8b7', NULL, 'angry_bang.jpg', '{\"FileName\":\"angry_bang.jpg\",\"FileDateTime\":\"1605526207\",\"FileSize\":\"736751\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1374\\\" height=\\\"1500\\\"\",\"Height\":\"1500\",\"Width\":\"1374\",\"IsColor\":\"1\"}}', 473, NULL, 7, 19837, 110903, NULL, 0, 0, 1),
(51, 'angry_with_pc', 'jpg', 19336, 600, 376, '2020-11-16 14:30:08', '2020-11-16 11:30:08', 'angry with pc', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'b719dd83e9355807465df074979f4070', NULL, 'angry_with_pc.jpg', '{\"FileName\":\"angry_with_pc.jpg\",\"FileDateTime\":\"1605526208\",\"FileSize\":\"19336\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"600\\\" height=\\\"376\\\"\",\"Height\":\"376\",\"Width\":\"600\",\"IsColor\":\"1\"}}', 442, NULL, 7, 8427, 25808, NULL, 0, 0, 1),
(55, 'anti_joke_chicken', 'jpg', 15969, 500, 500, '2020-11-16 14:30:10', '2020-11-16 11:30:10', 'anti joke chicken', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'b0121c9591b84e24373190be096ce286', NULL, 'anti_joke_chicken.jpg', '{\"FileName\":\"anti_joke_chicken.jpg\",\"FileDateTime\":\"1605526210\",\"FileSize\":\"15969\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"COMMENT\",\"COMPUTED\":{\"html\":\"width=\\\"500\\\" height=\\\"500\\\"\",\"Height\":\"500\",\"Width\":\"500\",\"IsColor\":\"1\"},\"COMMENT\":[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), default quality\\n\"]}', 376, NULL, 5, 6527, 0, NULL, 0, 0, 1),
(57, 'are_you_fucking_kidding_me', 'jpg', 156130, 1500, 1111, '2020-11-16 14:30:11', '2020-11-16 11:30:11', 'are you fucking kidding me', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '735616e4f725504905342318fdbb09d4', NULL, 'are_you_fucking_kidding_me.jpg', '{\"FileName\":\"are_you_fucking_kidding_me.jpg\",\"FileDateTime\":\"1605526211\",\"FileSize\":\"156130\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1500\\\" height=\\\"1111\\\"\",\"Height\":\"1111\",\"Width\":\"1500\",\"IsColor\":\"1\"}}', 324, NULL, 7, 7405, 28554, NULL, 0, 0, 1),
(64, 'AwwYeah', 'png', 42334, 250, 196, '2020-11-16 14:30:14', '2020-11-16 11:30:14', 'AwwYeah', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '2b8199c059d052d19445c6897f9a1fe2', NULL, 'AwwYeah.png', NULL, 471, NULL, 5, 38531, 0, NULL, 0, 0, 1),
(65, 'baby_godfather', 'jpg', 73068, 500, 599, '2020-11-16 14:30:15', '2020-11-16 11:30:15', 'baby godfather', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '7c8993b1a815d4a9df658dc77d3e19fb', NULL, 'baby_godfather.jpg', '{\"FileName\":\"baby_godfather.jpg\",\"FileDateTime\":\"1605526214\",\"FileSize\":\"73068\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"500\\\" height=\\\"599\\\"\",\"Height\":\"599\",\"Width\":\"500\",\"IsColor\":\"1\"}}', 470, NULL, 5, 10368, 0, NULL, 0, 0, 1),
(68, 'bad_advice_cat', 'jpg', 25362, 500, 500, '2020-11-16 14:30:16', '2020-11-16 11:30:16', 'bad advice cat', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'b0a1dc2f0b098190d4e51efaee84e0a2', NULL, 'bad_advice_cat.jpg', '{\"FileName\":\"bad_advice_cat.jpg\",\"FileDateTime\":\"1605526216\",\"FileSize\":\"25362\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"COMMENT\",\"COMPUTED\":{\"html\":\"width=\\\"500\\\" height=\\\"500\\\"\",\"Height\":\"500\",\"Width\":\"500\",\"IsColor\":\"1\"},\"COMMENT\":[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), default quality\\n\"]}', 383, NULL, 5, 10129, 0, NULL, 0, 0, 1),
(77, 'Beyon', 'jpg', 117643, 1000, 715, '2020-11-16 14:30:20', '2020-11-16 11:30:20', 'Beyon', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'e453a929769b14d9a73108236eb1f334', NULL, 'Beyon.jpg', '{\"FileName\":\"Beyon.jpg\",\"FileDateTime\":\"1605526219\",\"FileSize\":\"117643\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"COMMENT\",\"COMPUTED\":{\"html\":\"width=\\\"1000\\\" height=\\\"715\\\"\",\"Height\":\"715\",\"Width\":\"1000\",\"IsColor\":\"1\"},\"COMMENT\":[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\\n\"]}', 423, NULL, 7, 11684, 51626, NULL, 0, 0, 1),
(79, 'bill_oreilly', 'jpg', 15374, 500, 500, '2020-11-16 14:30:20', '2020-11-16 11:30:20', 'bill oreilly', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '73c3c7a52eeae6515ed075e3a59aa040', NULL, 'bill_oreilly.jpg', '{\"FileName\":\"bill_oreilly.jpg\",\"FileDateTime\":\"1605526220\",\"FileSize\":\"15374\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"COMMENT\",\"COMPUTED\":{\"html\":\"width=\\\"500\\\" height=\\\"500\\\"\",\"Height\":\"500\",\"Width\":\"500\",\"IsColor\":\"1\"},\"COMMENT\":[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), default quality\\n\"]}', 436, NULL, 5, 7417, 0, NULL, 0, 0, 1),
(81, 'bitchslap', 'jpg', 54619, 400, 300, '2020-11-16 14:30:21', '2020-11-16 11:30:21', 'bitchslap', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'e9ad57ed1de34808a1775ba59382736a', NULL, 'bitchslap.jpg', '{\"FileName\":\"bitchslap.jpg\",\"FileDateTime\":\"1605526221\",\"FileSize\":\"54619\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"400\\\" height=\\\"300\\\"\",\"Height\":\"300\",\"Width\":\"400\",\"IsColor\":\"1\"}}', 516, NULL, 5, 9914, 0, NULL, 0, 0, 1),
(82, 'Black', 'png', 25316, 210, 220, '2020-11-16 14:30:21', '2020-11-16 11:30:21', 'Black', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, '2e04d980ce8c021b5877ed9b73528f27', NULL, 'Black.png', NULL, 528, NULL, 5, 25378, 0, NULL, 0, 0, 1),
(104, 'black_guy_gun', 'jpg', 50829, 266, 300, '2020-11-16 14:30:29', '2020-11-16 11:30:29', 'black guy gun', NULL, 0, 5, NULL, '197.177.114.139', 'datefolder', NULL, NULL, 'a96ec22c7256e2947a6bf14e4253abda', NULL, 'black_guy_gun.jpg', '{\"FileName\":\"black_guy_gun.jpg\",\"FileDateTime\":\"1605526229\",\"FileSize\":\"50829\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"266\\\" height=\\\"300\\\"\",\"Height\":\"300\",\"Width\":\"266\",\"IsColor\":\"1\"}}', 534, NULL, 5, 12896, 0, NULL, 0, 0, 1),
(149, 'IMG_20201116_150826_164', 'jpg', 94701, 720, 720, '2020-11-16 15:53:24', '2020-11-16 12:53:24', 'IMG 20201116 150826 164', NULL, 0, 7, NULL, '154.122.68.158', 'datefolder', NULL, NULL, '8c7fd1b0a000f6982a2563352aa6c615', NULL, 'IMG_20201116_150826_164.jpg', '{\"FileName\":\"IMG_20201116_150826_164.jpg\",\"FileDateTime\":\"1605531204\",\"FileSize\":\"94701\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 396, NULL, 7, 15471, 78934, NULL, 0, 0, 1),
(150, 'FB_IMG_16055049649225496', 'jpg', 116989, 480, 479, '2020-11-16 15:54:00', '2020-11-16 12:54:00', 'FB IMG 16055049649225496', NULL, 0, 7, NULL, '154.122.68.158', 'datefolder', NULL, NULL, '12cc9c6afe6eee10b7e8e4facaac2e30', NULL, 'FB_IMG_16055049649225496.jpg', '{\"FileName\":\"FB_IMG_16055049649225496.jpg\",\"FileDateTime\":\"1605531240\",\"FileSize\":\"116989\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"479\\\"\",\"Height\":\"479\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 527, NULL, 5, 12306, 0, NULL, 0, 0, 1),
(153, 'FB_IMG_16055281046525292', 'jpg', 183758, 465, 627, '2020-11-16 16:03:58', '2020-11-16 13:03:58', 'FB IMG 16055281046525292', NULL, 0, 7, NULL, '154.122.68.158', 'datefolder', NULL, NULL, '3c3c48ce8761b07ed4df72ce0edf4c36', NULL, 'FB_IMG_16055281046525292.jpg', '{\"FileName\":\"FB_IMG_16055281046525292.jpg\",\"FileDateTime\":\"1605531838\",\"FileSize\":\"183758\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"465\\\" height=\\\"627\\\"\",\"Height\":\"627\",\"Width\":\"465\",\"IsColor\":\"1\"}}', 657, NULL, 5, 15072, 0, NULL, 0, 0, 1),
(154, 'FB_IMG_16053633234474859', 'jpg', 54869, 320, 321, '2020-11-16 16:05:14', '2020-11-16 13:05:14', 'FB IMG 16053633234474859', NULL, 0, 7, NULL, '154.122.68.158', 'datefolder', NULL, NULL, '0beaca1d1c7c18a31510f15ff3284d24', NULL, 'FB_IMG_16053633234474859.jpg', '{\"FileName\":\"FB_IMG_16053633234474859.jpg\",\"FileDateTime\":\"1605531914\",\"FileSize\":\"54869\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"321\\\"\",\"Height\":\"321\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 526, NULL, 5, 9685, 0, NULL, 0, 0, 1),
(155, 'FB_IMG_1604393742315', 'jpg', 30660, 474, 602, '2020-11-16 16:23:33', '2020-11-16 13:23:33', 'FB IMG 1604393742315', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, 'b48b28b615795b9523ef57e487b6268c', NULL, 'FB_IMG_1604393742315.jpg', '{\"FileName\":\"FB_IMG_1604393742315.jpg\",\"FileDateTime\":\"1605533013\",\"FileSize\":\"30660\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"474\\\" height=\\\"602\\\"\",\"Height\":\"602\",\"Width\":\"474\",\"IsColor\":\"1\"}}', 512, NULL, 5, 14193, 0, NULL, 0, 0, 1),
(157, 'FB_IMG_1604342730424', 'jpg', 21555, 510, 680, '2020-11-16 16:33:41', '2020-11-16 13:33:41', 'FB IMG 1604342730424', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, '64a17ceb52911153220047e1debd2025', NULL, 'FB_IMG_1604342730424.jpg', '{\"FileName\":\"FB_IMG_1604342730424.jpg\",\"FileDateTime\":\"1605533621\",\"FileSize\":\"21555\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"510\\\" height=\\\"680\\\"\",\"Height\":\"680\",\"Width\":\"510\",\"IsColor\":\"1\"}}', 452, NULL, 7, 9592, 50851, NULL, 0, 0, 1),
(158, 'FB_IMG_1604342532003', 'jpg', 23657, 480, 527, '2020-11-16 16:34:15', '2020-11-16 13:34:15', 'FB IMG 1604342532003', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, '9c943d1bdefd37d62236dbc7008884ce', NULL, 'FB_IMG_1604342532003.jpg', '{\"FileName\":\"FB_IMG_1604342532003.jpg\",\"FileDateTime\":\"1605533655\",\"FileSize\":\"23657\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"527\\\"\",\"Height\":\"527\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 449, NULL, 5, 11277, 0, NULL, 0, 0, 1),
(160, 'FB_IMG_1604127806181', 'jpg', 33524, 480, 503, '2020-11-16 16:36:43', '2020-11-16 13:36:43', 'FB IMG 1604127806181', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, '9b00d4cb841121405e84df9a43489fa8', NULL, 'FB_IMG_1604127806181.jpg', '{\"FileName\":\"FB_IMG_1604127806181.jpg\",\"FileDateTime\":\"1605533803\",\"FileSize\":\"33524\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"503\\\"\",\"Height\":\"503\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 460, NULL, 5, 14375, 0, NULL, 0, 0, 1),
(161, 'tmp-cam-936703940931700922', 'jpg', 22029, 283, 320, '2020-11-16 16:38:45', '2020-11-16 13:38:45', 'tmp cam 936703940931700922', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, '8df902b875088112cd4402f6aa55441d', NULL, 'tmp-cam-936703940931700922.jpg', '{\"FileName\":\"tmp-cam-936703940931700922.jpg\",\"FileDateTime\":\"1605533925\",\"FileSize\":\"22029\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"283\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"283\",\"IsColor\":\"1\"}}', 536, NULL, 5, 13695, 0, NULL, 0, 0, 1),
(162, 'FB_IMG_1603738570944', 'jpg', 29693, 720, 636, '2020-11-16 16:39:48', '2020-11-16 13:39:48', 'FB IMG 1603738570944', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, '326b4a7a02a41ea2ca229be251b035aa', NULL, 'FB_IMG_1603738570944.jpg', '{\"FileName\":\"FB_IMG_1603738570944.jpg\",\"FileDateTime\":\"1605533988\",\"FileSize\":\"29693\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"636\\\"\",\"Height\":\"636\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 451, NULL, 7, 9421, 45847, NULL, 0, 0, 1),
(163, 'FB_IMG_16053632031813783', 'jpg', 220885, 720, 720, '2020-11-16 16:58:55', '2020-11-16 13:58:55', 'FB IMG 16053632031813783', NULL, 0, 7, NULL, '102.167.67.89', 'datefolder', NULL, NULL, 'b533238a1514da59b45ce512fce3fe7b', NULL, 'FB_IMG_16053632031813783.jpg', '{\"FileName\":\"FB_IMG_16053632031813783.jpg\",\"FileDateTime\":\"1605535134\",\"FileSize\":\"220885\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 608, NULL, 7, 11416, 59624, NULL, 0, 0, 1),
(166, 'FB_IMG_16053632973906438', 'jpg', 237909, 720, 720, '2020-11-16 18:39:40', '2020-11-16 15:39:40', 'FB IMG 16053632973906438', NULL, 0, 7, NULL, '197.156.137.184', 'datefolder', NULL, NULL, '616fb06868e228bb4bb9c7a422856399', NULL, 'FB_IMG_16053632973906438.jpg', '{\"FileName\":\"FB_IMG_16053632973906438.jpg\",\"FileDateTime\":\"1605541180\",\"FileSize\":\"237909\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 570, NULL, 7, 13446, 67083, NULL, 0, 0, 1),
(167, 'IMG_20201114_094718_131', 'jpg', 54005, 720, 805, '2020-11-16 18:41:17', '2020-11-16 15:41:17', 'IMG 20201114 094718 131', NULL, 0, 7, NULL, '197.156.137.184', 'datefolder', NULL, NULL, '055527bb864031c7b31f2e313ca25410', NULL, 'IMG_20201114_094718_131.jpg', '{\"FileName\":\"IMG_20201114_094718_131.jpg\",\"FileDateTime\":\"1605541276\",\"FileSize\":\"54005\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"805\\\"\",\"Height\":\"805\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 640, NULL, 7, 11709, 63103, NULL, 0, 0, 1),
(169, 'tmp-cam-3764495798268716613', 'jpg', 133183, 635, 640, '2020-11-16 18:46:34', '2020-11-16 15:46:34', 'tmp cam 3764495798268716613', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, 'b8006394536324ef678e5b7de6ad6eda', NULL, 'tmp-cam-3764495798268716613.jpg', '{\"FileName\":\"tmp-cam-3764495798268716613.jpg\",\"FileDateTime\":\"1605541594\",\"FileSize\":\"133183\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"635\\\" height=\\\"640\\\"\",\"Height\":\"640\",\"Width\":\"635\",\"IsColor\":\"1\"}}', 460, NULL, 7, 13832, 73617, NULL, 0, 0, 1),
(170, 'download', 'jpg', 9551, 225, 225, '2020-11-17 12:15:33', '2020-11-17 09:15:33', 'download', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '3445999017e168e9d04496a406982c67', NULL, 'download.jpg', '{\"FileName\":\"download.jpg\",\"FileDateTime\":\"1605604533\",\"FileSize\":\"9551\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"225\\\" height=\\\"225\\\"\",\"Height\":\"225\",\"Width\":\"225\",\"IsColor\":\"1\"}}', 454, NULL, 5, 10199, 0, NULL, 0, 0, 1),
(171, 'Efo1orqXoAAnjw0', 'jpg', 28068, 720, 541, '2020-11-17 15:51:13', '2020-11-17 12:51:13', 'Efo1orqXoAAnjw0', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '3fd6e2ef6adbd663c69f7f2559bc6eb9', NULL, 'Efo1orqXoAAnjw0.jpg', '{\"FileName\":\"Efo1orqXoAAnjw0.jpg\",\"FileDateTime\":\"1605617473\",\"FileSize\":\"28068\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"541\\\"\",\"Height\":\"541\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 510, NULL, 7, 10947, 48456, NULL, 0, 0, 1),
(172, '123310301_2640625036202445_3247167758244283747_o', 'jpg', 249635, 1640, 856, '2020-11-17 15:55:19', '2020-11-17 12:55:19', 'HEHE', NULL, 0, 7, 0, '41.76.168.176', 'datefolder', NULL, NULL, 'ab44bc5c18e5f519de139f61a8ea39c6', NULL, '123310301_2640625036202445_3247167758244283747_o.jpg', '{\"FileName\":\"123310301_2640625036202445_3247167758244283747_o.jpg\",\"FileDateTime\":\"1605617719\",\"FileSize\":\"249635\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1640\\\" height=\\\"856\\\"\",\"Height\":\"856\",\"Width\":\"1640\",\"IsColor\":\"1\"}}', 537, NULL, 7, 13467, 54558, NULL, 0, 0, 1),
(173, '122974388_346171363276950_2013807870553460645_n', 'jpg', 26383, 480, 407, '2020-11-17 17:18:29', '2020-11-17 14:18:29', '122974388 346171363276950 2013807870553460645 n', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '7129bc76124010b91dd039db7799cdf3', NULL, '122974388_346171363276950_2013807870553460645_n.jpg', '{\"FileName\":\"122974388_346171363276950_2013807870553460645_n.jpg\",\"FileDateTime\":\"1605622709\",\"FileSize\":\"26383\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"407\\\"\",\"Height\":\"407\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 451, NULL, 5, 12838, 0, NULL, 0, 0, 1),
(175, 'download-1', 'jpg', 8291, 227, 222, '2020-11-18 11:58:05', '2020-11-18 08:58:05', 'download (1)', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'd3bfbbdbc215126783f57d5c73cc865c', NULL, 'download (1).jpg', '{\"FileName\":\"download (1).jpg\",\"FileDateTime\":\"1605689884\",\"FileSize\":\"8291\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"227\\\" height=\\\"222\\\"\",\"Height\":\"222\",\"Width\":\"227\",\"IsColor\":\"1\"}}', 492, NULL, 5, 10521, 0, NULL, 0, 0, 1),
(176, 'IMG_20201119_180045_316', 'jpg', 88292, 720, 791, '2020-11-19 20:27:21', '2020-11-19 17:27:21', 'IMG 20201119 180045 316', NULL, 0, 7, NULL, '154.122.234.66', 'datefolder', NULL, NULL, 'bbaa9cacaa4b695f55ae4217094c2d4c', NULL, 'IMG_20201119_180045_316.jpg', '{\"FileName\":\"IMG_20201119_180045_316.jpg\",\"FileDateTime\":\"1605806841\",\"FileSize\":\"88292\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"791\\\"\",\"Height\":\"791\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 628, NULL, 7, 11166, 68447, NULL, 0, 0, 1),
(177, 'IMG_20201119_111504_905', 'jpg', 116053, 720, 720, '2020-11-19 21:24:41', '2020-11-19 18:24:41', 'IMG 20201119 111504 905', NULL, 0, 7, NULL, '197.156.137.154', 'datefolder', NULL, NULL, '407de3d25837855c2ccdbe519f1c87b3', NULL, 'IMG_20201119_111504_905.jpg', '{\"FileName\":\"IMG_20201119_111504_905.jpg\",\"FileDateTime\":\"1605810281\",\"FileSize\":\"116053\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 622, NULL, 7, 9711, 60454, NULL, 0, 0, 1),
(178, 'FB_IMG_1603738570944', 'jpg', 29693, 720, 636, '2020-11-19 22:06:32', '2020-11-19 19:06:32', 'FB IMG 1603738570944', NULL, 0, 7, NULL, '197.156.190.237', 'datefolder', NULL, NULL, '326b4a7a02a41ea2ca229be251b035aa', NULL, 'FB_IMG_1603738570944.jpg', '{\"FileName\":\"FB_IMG_1603738570944.jpg\",\"FileDateTime\":\"1605812792\",\"FileSize\":\"29693\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"636\\\"\",\"Height\":\"636\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 629, NULL, 7, 9421, 45847, NULL, 0, 0, 1),
(179, 'FB_IMG_16051192273003485', 'jpg', 269074, 720, 792, '2020-11-20 09:02:34', '2020-11-20 06:02:34', 'FB IMG 16051192273003485', NULL, 0, 7, NULL, '102.166.115.24', 'datefolder', NULL, NULL, 'f1eebe6cad2de81b2bc09ad379b0c6c0', NULL, 'FB_IMG_16051192273003485.jpg', '{\"FileName\":\"FB_IMG_16051192273003485.jpg\",\"FileDateTime\":\"1605852154\",\"FileSize\":\"269074\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"792\\\"\",\"Height\":\"792\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 455, NULL, 7, 12675, 80241, NULL, 0, 0, 1),
(180, 'FB_IMG_16059002803205997', 'jpg', 165723, 600, 583, '2020-11-21 09:48:25', '2020-11-21 06:48:25', 'FB IMG 16059002803205997', NULL, 0, 7, NULL, '197.156.190.213', 'datefolder', NULL, NULL, 'b364af5fd74b4d73a02e07e252167df7', NULL, 'FB_IMG_16059002803205997.jpg', '{\"FileName\":\"FB_IMG_16059002803205997.jpg\",\"FileDateTime\":\"1605941305\",\"FileSize\":\"165723\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"600\\\" height=\\\"583\\\"\",\"Height\":\"583\",\"Width\":\"600\",\"IsColor\":\"1\"}}', 388, NULL, 7, 11249, 60014, NULL, 0, 0, 1),
(181, 'FB_IMG_16059436521990297', 'jpg', 117522, 478, 486, '2020-11-21 11:38:42', '2020-11-21 08:38:42', 'FB IMG 16059436521990297', NULL, 0, 7, NULL, '197.156.190.136', 'datefolder', NULL, NULL, '64fe847cca724666d8e92f01e121c3a5', NULL, 'FB_IMG_16059436521990297.jpg', '{\"FileName\":\"FB_IMG_16059436521990297.jpg\",\"FileDateTime\":\"1605947921\",\"FileSize\":\"117522\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"478\\\" height=\\\"486\\\"\",\"Height\":\"486\",\"Width\":\"478\",\"IsColor\":\"1\"}}', 495, NULL, 5, 10695, 0, NULL, 0, 0, 1),
(182, 'IMG_20201121_204530_750', 'jpg', 71782, 720, 595, '2020-11-21 20:46:33', '2020-11-21 17:46:33', 'IMG 20201121 204530 750', NULL, 0, 7, NULL, '102.167.226.57', 'datefolder', NULL, NULL, '78627661520c03f3f14bf31609214165', NULL, 'IMG_20201121_204530_750.jpg', '{\"FileName\":\"IMG_20201121_204530_750.jpg\",\"FileDateTime\":\"1605980792\",\"FileSize\":\"71782\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"595\\\"\",\"Height\":\"595\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 696, NULL, 7, 12818, 58391, NULL, 0, 0, 1),
(183, 'FB_IMG_16058130322557870', 'jpg', 51913, 286, 330, '2020-11-22 10:50:14', '2020-11-22 07:50:14', 'FB IMG 16058130322557870', NULL, 0, 7, NULL, '154.122.72.238', 'datefolder', NULL, NULL, 'ebaa4918244901072938cbb726c9fa0c', NULL, 'FB_IMG_16058130322557870.jpg', '{\"FileName\":\"FB_IMG_16058130322557870.jpg\",\"FileDateTime\":\"1606031414\",\"FileSize\":\"51913\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"286\\\" height=\\\"330\\\"\",\"Height\":\"330\",\"Width\":\"286\",\"IsColor\":\"1\"}}', 523, NULL, 5, 9616, 0, NULL, 0, 0, 1),
(184, 'IMG_20201122_223759_891', 'jpg', 121730, 686, 728, '2020-11-23 03:24:52', '2020-11-23 00:24:52', 'IMG 20201122 223759 891', NULL, 0, 7, NULL, '197.156.190.249', 'datefolder', NULL, NULL, 'b4a75ee8977f076d56680797a8f9db6c', NULL, 'IMG_20201122_223759_891.jpg', '{\"FileName\":\"IMG_20201122_223759_891.jpg\",\"FileDateTime\":\"1606091091\",\"FileSize\":\"121730\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"686\\\" height=\\\"728\\\"\",\"Height\":\"728\",\"Width\":\"686\",\"IsColor\":\"1\"}}', 674, NULL, 7, 14292, 80661, NULL, 0, 0, 1),
(186, 'inbound2384301524188183421', 'jpg', 166130, 697, 868, '2020-11-23 09:48:25', '2020-11-23 06:48:25', 'inbound2384301524188183421', NULL, 0, 7, NULL, '197.156.190.168', 'datefolder', NULL, NULL, '7b22456322568275f75a0df86f103d07', NULL, 'inbound2384301524188183421.jpg', '{\"FileName\":\"inbound2384301524188183421.jpg\",\"FileDateTime\":\"1606114105\",\"FileSize\":\"166130\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"697\\\" height=\\\"868\\\"\",\"Height\":\"868\",\"Width\":\"697\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"697\",\"ImageLength\":\"868\",\"DateTime\":\"2020:11:23 09:39:33\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"868\",\"ExifImageWidth\":\"697\"}', 508, NULL, 7, 11686, 74811, NULL, 0, 0, 1),
(187, 'FB_IMG_16061207854050785', 'jpg', 193570, 720, 628, '2020-11-23 12:54:07', '2020-11-23 09:54:07', 'FB IMG 16061207854050785', NULL, 0, 7, NULL, '102.166.204.12', 'datefolder', NULL, NULL, '346a942f38fca872d600fa0691dc5f17', NULL, 'FB_IMG_16061207854050785.jpg', '{\"FileName\":\"FB_IMG_16061207854050785.jpg\",\"FileDateTime\":\"1606125247\",\"FileSize\":\"193570\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"628\\\"\",\"Height\":\"628\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 458, NULL, 7, 11808, 57191, NULL, 0, 0, 1),
(188, '5DB8DB5F-D691-4444-95AC-F77F9FF464CF', 'jpg', 42800, 480, 480, '2020-11-24 09:24:10', '2020-11-24 06:24:10', '5DB8DB5F D691 4444 95AC F77F9FF464CF', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '887874834f2ba6dc5ec9b79c2670f20c', NULL, '5DB8DB5F-D691-4444-95AC-F77F9FF464CF.jpeg', '{\"FileName\":\"5DB8DB5F-D691-4444-95AC-F77F9FF464CF.jpeg\",\"FileDateTime\":\"1606199050\",\"FileSize\":\"42800\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"13679\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"480\",\"ExifImageLength\":\"480\",\"SceneCaptureType\":\"0\"}', 508, NULL, 5, 11627, 0, NULL, 0, 0, 1),
(190, '7C8B7FB1-BEBA-43F0-83F7-CFF9FACDDCBF', 'jpg', 40487, 540, 960, '2020-11-24 16:56:24', '2020-11-24 13:56:24', '7C8B7FB1 BEBA 43F0 83F7 CFF9FACDDCBF', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '45da888d71bd1fd837f2135be39b5791', NULL, '7C8B7FB1-BEBA-43F0-83F7-CFF9FACDDCBF.jpeg', '{\"FileName\":\"7C8B7FB1-BEBA-43F0-83F7-CFF9FACDDCBF.jpeg\",\"FileDateTime\":\"1606226184\",\"FileSize\":\"40487\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"540\\\" height=\\\"960\\\"\",\"Height\":\"960\",\"Width\":\"540\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"4555\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"540\",\"ExifImageLength\":\"960\",\"SceneCaptureType\":\"0\"}', 592, NULL, 7, 8117, 50281, NULL, 0, 0, 1),
(191, '45E484E6-AD83-4767-8BE0-59344D180CCC', 'jpg', 69627, 720, 856, '2020-11-24 16:59:43', '2020-11-24 13:59:43', '45E484E6 AD83 4767 8BE0 59344D180CCC', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'fac1da0d0d374ca9413ea4b2fdc0fead', NULL, '45E484E6-AD83-4767-8BE0-59344D180CCC.jpeg', '{\"FileName\":\"45E484E6-AD83-4767-8BE0-59344D180CCC.jpeg\",\"FileDateTime\":\"1606226383\",\"FileSize\":\"69627\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"856\\\"\",\"Height\":\"856\",\"Width\":\"720\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"10167\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"720\",\"ExifImageLength\":\"856\",\"SceneCaptureType\":\"0\"}', 550, NULL, 7, 8901, 59691, NULL, 0, 0, 1),
(192, 'FB_IMG_16061688110864153', 'jpg', 110669, 480, 509, '2020-11-24 17:01:28', '2020-11-24 14:01:28', 'FB IMG 16061688110864153', NULL, 0, 7, NULL, '197.156.190.185', 'datefolder', NULL, NULL, 'cf0c5c79cdf515715fe84f9855116239', NULL, 'FB_IMG_16061688110864153.jpg', '{\"FileName\":\"FB_IMG_16061688110864153.jpg\",\"FileDateTime\":\"1606226488\",\"FileSize\":\"110669\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"509\\\"\",\"Height\":\"509\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 732, NULL, 5, 13092, 0, NULL, 0, 0, 1),
(193, 'IMG_20201123_224603_158', 'jpg', 105050, 720, 797, '2020-11-25 00:06:51', '2020-11-24 21:06:51', 'IMG 20201123 224603 158', NULL, 0, 7, NULL, '154.122.138.125', 'datefolder', NULL, NULL, 'bb576955124541c2d1aad4575639bec4', NULL, 'IMG_20201123_224603_158.jpg', '{\"FileName\":\"IMG_20201123_224603_158.jpg\",\"FileDateTime\":\"1606252011\",\"FileSize\":\"105050\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"797\\\"\",\"Height\":\"797\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 714, NULL, 7, 12238, 67184, NULL, 0, 0, 1),
(194, 'tmp-cam-45318483661654109', 'jpg', 15056, 310, 320, '2020-11-25 00:08:40', '2020-11-24 21:08:40', 'tmp cam 45318483661654109', NULL, 0, 8, NULL, '102.23.98.17', 'datefolder', NULL, NULL, 'ad81853d58b19b38c4288fefc140b1ed', NULL, 'tmp-cam-45318483661654109.jpg', '{\"FileName\":\"tmp-cam-45318483661654109.jpg\",\"FileDateTime\":\"1606252120\",\"FileSize\":\"15056\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"310\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"310\",\"IsColor\":\"1\"}}', 588, NULL, 5, 9707, 0, NULL, 0, 0, 1),
(195, '6178F100-76C9-4D5F-B7D9-83C990926106', 'jpg', 21021, 425, 545, '2020-11-25 09:18:43', '2020-11-25 06:18:43', '6178F100 76C9 4D5F B7D9 83C990926106', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '25fa25c5e1c1eaaa86c98fd4452f76ef', NULL, '6178F100-76C9-4D5F-B7D9-83C990926106.jpeg', '{\"FileName\":\"6178F100-76C9-4D5F-B7D9-83C990926106.jpeg\",\"FileDateTime\":\"1606285123\",\"FileSize\":\"21021\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"425\\\" height=\\\"545\\\"\",\"Height\":\"545\",\"Width\":\"425\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"4675\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"425\",\"ExifImageLength\":\"545\",\"SceneCaptureType\":\"0\"}', 535, NULL, 5, 5290, 0, NULL, 0, 0, 1),
(196, 'AEFC2649-3600-4AF0-AF4A-4FF7C62B3CCA', 'jpg', 121394, 720, 783, '2020-11-25 11:24:31', '2020-11-25 08:24:31', 'AEFC2649 3600 4AF0 AF4A 4FF7C62B3CCA', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '24eb534d7ba13e59d633b3bdf1f8cd4a', NULL, 'AEFC2649-3600-4AF0-AF4A-4FF7C62B3CCA.jpeg', '{\"FileName\":\"AEFC2649-3600-4AF0-AF4A-4FF7C62B3CCA.jpeg\",\"FileDateTime\":\"1606292670\",\"FileSize\":\"121394\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"783\\\"\",\"Height\":\"783\",\"Width\":\"720\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"14615\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"720\",\"ExifImageLength\":\"783\",\"SceneCaptureType\":\"0\"}', 560, NULL, 7, 13700, 94281, NULL, 0, 0, 1),
(197, 'FB_IMG_16061208877935816', 'jpg', 100579, 480, 480, '2020-11-25 13:29:09', '2020-11-25 10:29:09', 'FB IMG 16061208877935816', NULL, 0, 7, NULL, '197.156.190.248', 'datefolder', NULL, NULL, '7805b5fcc64d5a35d9a2b8e0e26ddb7f', NULL, 'FB_IMG_16061208877935816.jpg', '{\"FileName\":\"FB_IMG_16061208877935816.jpg\",\"FileDateTime\":\"1606300149\",\"FileSize\":\"100579\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 655, NULL, 5, 11832, 0, NULL, 0, 0, 1);
INSERT INTO `chv_images` (`image_id`, `image_name`, `image_extension`, `image_size`, `image_width`, `image_height`, `image_date`, `image_date_gmt`, `image_title`, `image_description`, `image_nsfw`, `image_user_id`, `image_album_id`, `image_uploader_ip`, `image_storage_mode`, `image_path`, `image_storage_id`, `image_md5`, `image_source_md5`, `image_original_filename`, `image_original_exifdata`, `image_views`, `image_category_id`, `image_chain`, `image_thumb_size`, `image_medium_size`, `image_expiration_date_gmt`, `image_likes`, `image_is_animated`, `image_is_approved`) VALUES
(198, 'p-3', 'jpg', 49941, 533, 545, '2020-11-25 17:11:38', '2020-11-25 14:11:38', 'p 3', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '41b101a15effcde8a20fa5510b012937', NULL, 'p-3.jpg', '{\"FileName\":\"p-3.jpg\",\"FileDateTime\":\"1606313498\",\"FileSize\":\"49941\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF, WINXP\",\"COMPUTED\":{\"html\":\"width=\\\"533\\\" height=\\\"545\\\"\",\"Height\":\"545\",\"Width\":\"533\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"Artist\":\"\\u042fichee\",\"Exif_IFD_Pointer\":\"2130\",\"Author\":\"??????\",\"UndefinedTag:0xEA1C\":\"\\u001c?\\u0000\\u0000\\u0000\\b\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\",\"DateTimeOriginal\":\"2020:03:24 19:40:19\",\"DateTimeDigitized\":\"2020:03:24 19:40:19\",\"SubSecTimeOriginal\":\"85\",\"SubSecTimeDigitized\":\"85\"}', 787, NULL, 7, 11249, 61901, NULL, 0, 0, 1),
(199, 'maxresdefault', 'jpg', 124505, 1280, 720, '2020-11-25 17:25:30', '2020-11-25 14:25:30', 'maxresdefault', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '1cde7837a58ae8c630a1aadce1a983d6', NULL, 'maxresdefault.jpg', '{\"FileName\":\"maxresdefault.jpg\",\"FileDateTime\":\"1606314330\",\"FileSize\":\"124505\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1280\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"1280\",\"IsColor\":\"1\"}}', 644, NULL, 7, 17259, 64532, NULL, 0, 0, 1),
(200, '45312846._SY475_', 'jpg', 24238, 297, 475, '2020-11-25 17:46:19', '2020-11-25 14:46:19', '45312846. SY475 ', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '45c62256260c8776208b6352368e1867', NULL, '45312846._SY475_.jpg', '{\"FileName\":\"45312846._SY475_.jpg\",\"FileDateTime\":\"1606315579\",\"FileSize\":\"24238\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"297\\\" height=\\\"475\\\"\",\"Height\":\"475\",\"Width\":\"297\",\"IsColor\":\"1\"}}', 585, NULL, 5, 11208, 0, NULL, 0, 0, 1),
(201, 'funny-memes-the-best-of-em', 'jpg', 60550, 700, 528, '2020-11-25 18:13:29', '2020-11-25 15:13:29', 'funny memes the best of em', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '96116ad9db10edcbba02702448000443', NULL, 'funny-memes-the-best-of-em.jpg', '{\"FileName\":\"funny-memes-the-best-of-em.jpg\",\"FileDateTime\":\"1606317209\",\"FileSize\":\"60550\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"700\\\" height=\\\"528\\\"\",\"Height\":\"528\",\"Width\":\"700\",\"IsColor\":\"1\"}}', 468, NULL, 7, 10349, 45418, NULL, 0, 0, 1),
(202, 'IMG_20201125_192057_256', 'jpg', 85444, 601, 431, '2020-11-25 20:10:36', '2020-11-25 17:10:36', 'IMG 20201125 192057 256', NULL, 0, 7, NULL, '154.123.34.184', 'datefolder', NULL, NULL, '9c2cb166f3754645b62ccb151546cfda', NULL, 'IMG_20201125_192057_256.jpg', '{\"FileName\":\"IMG_20201125_192057_256.jpg\",\"FileDateTime\":\"1606324236\",\"FileSize\":\"85444\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"601\\\" height=\\\"431\\\"\",\"Height\":\"431\",\"Width\":\"601\",\"IsColor\":\"1\"}}', 813, NULL, 7, 14364, 63076, NULL, 0, 0, 1),
(203, 'IMG_20201126_081615_731', 'jpg', 43609, 480, 492, '2020-11-26 10:04:56', '2020-11-26 07:04:56', 'IMG 20201126 081615 731', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '207dabaac324d8f3dbecb54955dadf08', NULL, 'IMG_20201126_081615_731.jpg', '{\"FileName\":\"IMG_20201126_081615_731.jpg\",\"FileDateTime\":\"1606374296\",\"FileSize\":\"43609\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"492\\\"\",\"Height\":\"492\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 659, NULL, 5, 11445, 0, NULL, 0, 0, 1),
(204, 'inbound8900625935627639896', 'jpg', 104577, 702, 468, '2020-11-27 08:00:24', '2020-11-27 05:00:24', 'inbound8900625935627639896', NULL, 0, 8, NULL, '154.122.147.174', 'datefolder', NULL, NULL, '32a24b23ca245f89ff3718eb8a32a631', NULL, 'inbound8900625935627639896.jpg', '{\"FileName\":\"inbound8900625935627639896.jpg\",\"FileDateTime\":\"1606453224\",\"FileSize\":\"104577\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"702\\\" height=\\\"468\\\"\",\"Height\":\"468\",\"Width\":\"702\",\"IsColor\":\"1\"}}', 536, NULL, 7, 12912, 58325, NULL, 0, 0, 1),
(205, 'download-3', 'jpg', 7620, 247, 204, '2020-11-27 12:11:24', '2020-11-27 09:11:24', 'download (3)', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '6cc1005c8e1473a4c900fd10f4af02f3', NULL, 'download (3).jpg', '{\"FileName\":\"download (3).jpg\",\"FileDateTime\":\"1606468284\",\"FileSize\":\"7620\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"247\\\" height=\\\"204\\\"\",\"Height\":\"204\",\"Width\":\"247\",\"IsColor\":\"1\"}}', 676, NULL, 5, 9747, 0, NULL, 0, 0, 1),
(206, '7a9c8e5d1f40ffbedb0fdd6976e23821', 'jpg', 13030, 236, 319, '2020-11-27 13:25:42', '2020-11-27 10:25:42', '7a9c8e5d1f40ffbedb0fdd6976e23821', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '90dd1051de34442e7e2f40d528133135', NULL, '7a9c8e5d1f40ffbedb0fdd6976e23821.jpg', '{\"FileName\":\"7a9c8e5d1f40ffbedb0fdd6976e23821.jpg\",\"FileDateTime\":\"1606472742\",\"FileSize\":\"13030\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"236\\\" height=\\\"319\\\"\",\"Height\":\"319\",\"Width\":\"236\",\"IsColor\":\"1\"}}', 625, NULL, 5, 9932, 0, NULL, 0, 0, 1),
(207, 'unnamed', 'jpg', 21148, 480, 323, '2020-11-27 14:42:23', '2020-11-27 11:42:23', 'unnamed', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '31dc2ea4f65cd86c052f2f95afcce902', NULL, 'unnamed.jpg', '{\"FileName\":\"unnamed.jpg\",\"FileDateTime\":\"1606477343\",\"FileSize\":\"21148\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"323\\\"\",\"Height\":\"323\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 683, NULL, 5, 11519, 0, NULL, 0, 0, 1),
(208, '70B9F8D4-53F1-45A6-8AD1-FB06F1A8028A', 'jpg', 39705, 719, 506, '2020-11-27 15:40:14', '2020-11-27 12:40:14', '70B9F8D4 53F1 45A6 8AD1 FB06F1A8028A', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '05918c0270f2f514b588179623ec2c76', NULL, '70B9F8D4-53F1-45A6-8AD1-FB06F1A8028A.jpeg', '{\"FileName\":\"70B9F8D4-53F1-45A6-8AD1-FB06F1A8028A.jpeg\",\"FileDateTime\":\"1606480814\",\"FileSize\":\"39705\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"719\\\" height=\\\"506\\\"\",\"Height\":\"506\",\"Width\":\"719\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"7632\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"719\",\"ExifImageLength\":\"506\",\"SceneCaptureType\":\"0\"}', 553, NULL, 7, 7442, 32611, NULL, 0, 0, 1),
(209, 'download-4', 'jpg', 10267, 258, 195, '2020-11-27 16:12:20', '2020-11-27 13:12:20', 'download (4)', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'b2a2acbdf76687af13898018ba4891c6', NULL, 'download (4).jpg', '{\"FileName\":\"download (4).jpg\",\"FileDateTime\":\"1606482740\",\"FileSize\":\"10267\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"258\\\" height=\\\"195\\\"\",\"Height\":\"195\",\"Width\":\"258\",\"IsColor\":\"1\"}}', 665, NULL, 5, 12714, 0, NULL, 0, 0, 1),
(210, 'Ef32-xEXsAEM1LP', 'jpg', 53425, 720, 720, '2020-11-27 16:49:44', '2020-11-27 13:49:44', 'Ef32 xEXsAEM1LP', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'e8573aa1e4a519f2112d56fd7b2bb276', NULL, 'Ef32-xEXsAEM1LP.jpg', '{\"FileName\":\"Ef32-xEXsAEM1LP.jpg\",\"FileDateTime\":\"1606484984\",\"FileSize\":\"53425\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 698, NULL, 7, 13937, 84099, NULL, 0, 0, 1),
(211, '5665ec95ecba76c6d057ff7052696a17', 'jpg', 11028, 236, 236, '2020-11-28 13:06:44', '2020-11-28 10:06:44', '5665ec95ecba76c6d057ff7052696a17', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'eab5a0eba9b7ce05f249586c3eb98d52', NULL, '5665ec95ecba76c6d057ff7052696a17.jpg', '{\"FileName\":\"5665ec95ecba76c6d057ff7052696a17.jpg\",\"FileDateTime\":\"1606558004\",\"FileSize\":\"11028\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"236\\\" height=\\\"236\\\"\",\"Height\":\"236\",\"Width\":\"236\",\"IsColor\":\"1\"}}', 530, NULL, 5, 9005, 0, NULL, 0, 0, 1),
(212, 'FB_IMG_16065563622603800', 'jpg', 156431, 479, 589, '2020-11-28 17:32:10', '2020-11-28 14:32:10', 'FB IMG 16065563622603800', NULL, 0, 7, NULL, '154.122.253.78', 'datefolder', NULL, NULL, 'd24e06f958415ddad06b8b880f48478c', NULL, 'FB_IMG_16065563622603800.jpg', '{\"FileName\":\"FB_IMG_16065563622603800.jpg\",\"FileDateTime\":\"1606573930\",\"FileSize\":\"156431\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"479\\\" height=\\\"589\\\"\",\"Height\":\"589\",\"Width\":\"479\",\"IsColor\":\"1\"}}', 682, NULL, 5, 15981, 0, NULL, 0, 0, 1),
(213, 'IMG_20201128_224709_050', 'jpg', 84038, 640, 640, '2020-11-28 23:50:14', '2020-11-28 20:50:14', 'IMG 20201128 224709 050', NULL, 0, 7, NULL, '102.166.17.60', 'datefolder', NULL, NULL, '075b1aea5ad4a568782eb651d0b1cd9c', NULL, 'IMG_20201128_224709_050.jpg', '{\"FileName\":\"IMG_20201128_224709_050.jpg\",\"FileDateTime\":\"1606596614\",\"FileSize\":\"84038\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"640\\\" height=\\\"640\\\"\",\"Height\":\"640\",\"Width\":\"640\",\"IsColor\":\"1\"}}', 605, NULL, 7, 11656, 59033, NULL, 0, 0, 1),
(214, 'FB_IMG_16066366362672341', 'jpg', 115557, 480, 463, '2020-11-29 11:18:28', '2020-11-29 08:18:28', 'FB IMG 16066366362672341', NULL, 0, 7, NULL, '102.166.199.128', 'datefolder', NULL, NULL, '1ca3e86a334ce5373548e9ee797f8cb7', NULL, 'FB_IMG_16066366362672341.jpg', '{\"FileName\":\"FB_IMG_16066366362672341.jpg\",\"FileDateTime\":\"1606637908\",\"FileSize\":\"115557\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"463\\\"\",\"Height\":\"463\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 671, NULL, 5, 12321, 0, NULL, 0, 0, 1),
(215, 'FB_IMG_16068489487848207', 'jpg', 195455, 720, 684, '2020-12-02 08:30:01', '2020-12-02 05:30:01', 'FB IMG 16068489487848207', NULL, 0, 7, NULL, '105.61.214.60', 'datefolder', NULL, NULL, '55fc35cfe057b8542a252b839238c52e', NULL, 'FB_IMG_16068489487848207.jpg', '{\"FileName\":\"FB_IMG_16068489487848207.jpg\",\"FileDateTime\":\"1606887001\",\"FileSize\":\"195455\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"684\\\"\",\"Height\":\"684\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 700, NULL, 7, 8883, 48782, NULL, 0, 0, 1),
(216, 'IMG_20201202_215514_343', 'jpg', 35738, 480, 506, '2020-12-02 22:08:48', '2020-12-02 19:08:48', 'IMG 20201202 215514 343', NULL, 0, 7, NULL, '105.160.93.125', 'datefolder', NULL, NULL, 'fc9820e47e9185890c2a4c0b73ea829b', NULL, 'IMG_20201202_215514_343.jpg', '{\"FileName\":\"IMG_20201202_215514_343.jpg\",\"FileDateTime\":\"1606936128\",\"FileSize\":\"35738\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"506\\\"\",\"Height\":\"506\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 609, NULL, 5, 11099, 0, NULL, 0, 0, 1),
(218, 'FB_IMG_16064548316222537', 'jpg', 147144, 540, 632, '2020-12-03 08:12:35', '2020-12-03 05:12:35', 'FB IMG 16064548316222537', NULL, 0, 7, NULL, '197.156.137.188', 'datefolder', NULL, NULL, '4b496180cf364ffcb2cfce997a544005', NULL, 'FB_IMG_16064548316222537.jpg', '{\"FileName\":\"FB_IMG_16064548316222537.jpg\",\"FileDateTime\":\"1606972355\",\"FileSize\":\"147144\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"540\\\" height=\\\"632\\\"\",\"Height\":\"632\",\"Width\":\"540\",\"IsColor\":\"1\"}}', 722, NULL, 7, 13969, 74310, NULL, 0, 0, 1),
(219, 'maxresdefault', 'jpg', 124505, 1280, 720, '2020-12-03 11:04:30', '2020-12-03 08:04:30', 'maxresdefault', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '1cde7837a58ae8c630a1aadce1a983d6', NULL, 'maxresdefault.jpg', '{\"FileName\":\"maxresdefault.jpg\",\"FileDateTime\":\"1606982670\",\"FileSize\":\"124505\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1280\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"1280\",\"IsColor\":\"1\"}}', 607, NULL, 7, 17259, 64532, NULL, 0, 0, 1),
(220, 'IMG_20201203_193917_215', 'jpg', 35928, 480, 504, '2020-12-04 08:32:24', '2020-12-04 05:32:24', 'IMG 20201203 193917 215', NULL, 0, 7, NULL, '102.167.229.38', 'datefolder', NULL, NULL, '8b920f8f3d85d1ee28b483d966b830b3', NULL, 'IMG_20201203_193917_215.jpg', '{\"FileName\":\"IMG_20201203_193917_215.jpg\",\"FileDateTime\":\"1607059944\",\"FileSize\":\"35928\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"504\\\"\",\"Height\":\"504\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 617, NULL, 5, 9752, 0, NULL, 0, 0, 1),
(221, 'FB_IMG_16065073248563415', 'jpg', 167035, 552, 629, '2020-12-05 21:26:32', '2020-12-05 18:26:32', 'FB IMG 16065073248563415', NULL, 0, 7, NULL, '197.156.190.210', 'datefolder', NULL, NULL, '7f3920a9f8c76f37b1454cdb0c664026', NULL, 'FB_IMG_16065073248563415.jpg', '{\"FileName\":\"FB_IMG_16065073248563415.jpg\",\"FileDateTime\":\"1607192792\",\"FileSize\":\"167035\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"552\\\" height=\\\"629\\\"\",\"Height\":\"629\",\"Width\":\"552\",\"IsColor\":\"1\"}}', 658, NULL, 7, 15568, 78029, NULL, 0, 0, 1),
(222, 'IMG_20201205_233727', 'jpg', 211863, 720, 924, '2020-12-06 10:45:40', '2020-12-06 07:45:40', 'IMG 20201205 233727', NULL, 0, 7, NULL, '197.156.190.205', 'datefolder', NULL, NULL, '551b8747ef161402b0999eff4fdf5665', NULL, 'IMG_20201205_233727.jpg', '{\"FileName\":\"IMG_20201205_233727.jpg\",\"FileDateTime\":\"1607240740\",\"FileSize\":\"211863\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"924\\\"\",\"Height\":\"924\",\"Width\":\"720\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"720\",\"ImageLength\":\"924\",\"DateTime\":\"2020:12:05 23:37:27\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"924\",\"ExifImageWidth\":\"720\"}', 604, NULL, 7, 12384, 95168, NULL, 0, 0, 1),
(223, 'FB_IMG_16072422126051042', 'jpg', 80298, 474, 571, '2020-12-06 15:35:14', '2020-12-06 12:35:14', 'FB IMG 16072422126051042', NULL, 0, 7, NULL, '154.123.246.145', 'datefolder', NULL, NULL, 'bff515c5220acdc7ea95acdd5deb2c8d', NULL, 'FB_IMG_16072422126051042.jpg', '{\"FileName\":\"FB_IMG_16072422126051042.jpg\",\"FileDateTime\":\"1607258114\",\"FileSize\":\"80298\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"474\\\" height=\\\"571\\\"\",\"Height\":\"571\",\"Width\":\"474\",\"IsColor\":\"1\"}}', 521, NULL, 5, 10672, 0, NULL, 0, 0, 1),
(224, 'FB_IMG_16062798705994492', 'jpg', 185818, 693, 656, '2020-12-07 08:49:53', '2020-12-07 05:49:53', 'FB IMG 16062798705994492', NULL, 0, 7, NULL, '197.156.190.178', 'datefolder', NULL, NULL, 'f21e28acba3d80782a0f2a1918dbf69a', NULL, 'FB_IMG_16062798705994492.jpg', '{\"FileName\":\"FB_IMG_16062798705994492.jpg\",\"FileDateTime\":\"1607320192\",\"FileSize\":\"185818\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"693\\\" height=\\\"656\\\"\",\"Height\":\"656\",\"Width\":\"693\",\"IsColor\":\"1\"}}', 506, NULL, 7, 11483, 53400, NULL, 0, 0, 1),
(225, 'IMG_20201208_162754_084', 'jpg', 123851, 1125, 1017, '2020-12-08 18:38:22', '2020-12-08 15:38:22', 'IMG 20201208 162754 084', NULL, 0, 7, NULL, '102.167.131.122', 'datefolder', NULL, NULL, 'd27f752a2bdde1388884cf7af74c6740', NULL, 'IMG_20201208_162754_084.jpg', '{\"FileName\":\"IMG_20201208_162754_084.jpg\",\"FileDateTime\":\"1607441902\",\"FileSize\":\"123851\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"1125\\\" height=\\\"1017\\\"\",\"Height\":\"1017\",\"Width\":\"1125\",\"IsColor\":\"1\"}}', 618, NULL, 7, 11146, 54964, NULL, 0, 0, 1),
(226, 'FB_IMG_16073274187593910', 'jpg', 133997, 620, 559, '2020-12-08 21:03:13', '2020-12-08 18:03:13', 'FB IMG 16073274187593910', NULL, 0, 7, NULL, '154.123.20.132', 'datefolder', NULL, NULL, 'e7d215e4f21b3cc56e9923ce3e8061ec', NULL, 'FB_IMG_16073274187593910.jpg', '{\"FileName\":\"FB_IMG_16073274187593910.jpg\",\"FileDateTime\":\"1607450593\",\"FileSize\":\"133997\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"620\\\" height=\\\"559\\\"\",\"Height\":\"559\",\"Width\":\"620\",\"IsColor\":\"1\"}}', 591, NULL, 7, 11627, 51260, NULL, 0, 0, 1),
(227, 'IMG_20201209_182948_061', 'jpg', 80853, 720, 720, '2020-12-09 19:02:21', '2020-12-09 16:02:21', 'IMG 20201209 182948 061', NULL, 0, 7, NULL, '197.156.137.138', 'datefolder', NULL, NULL, '88146dc55bf23b308afdef4650f5aab7', NULL, 'IMG_20201209_182948_061.jpg', '{\"FileName\":\"IMG_20201209_182948_061.jpg\",\"FileDateTime\":\"1607529741\",\"FileSize\":\"80853\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 720, NULL, 7, 9618, 50106, NULL, 0, 0, 1),
(228, 'FB_IMG_16073274628417800', 'jpg', 160222, 480, 551, '2020-12-09 19:02:55', '2020-12-09 16:02:55', 'FB IMG 16073274628417800', NULL, 0, 7, NULL, '197.156.137.138', 'datefolder', NULL, NULL, '9da445190fd22dc0a2a2aa8a7352cfe0', NULL, 'FB_IMG_16073274628417800.jpg', '{\"FileName\":\"FB_IMG_16073274628417800.jpg\",\"FileDateTime\":\"1607529775\",\"FileSize\":\"160222\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"551\\\"\",\"Height\":\"551\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 777, NULL, 5, 15454, 0, NULL, 0, 0, 1),
(229, 'tmp-cam-3873110896513343357', 'jpg', 126293, 640, 640, '2020-12-09 19:04:38', '2020-12-09 16:04:38', 'tmp cam 3873110896513343357', NULL, 0, 8, NULL, '102.23.98.20', 'datefolder', NULL, NULL, '6c10bc748c788cba0a1b36586135bf29', NULL, 'tmp-cam-3873110896513343357.jpg', '{\"FileName\":\"tmp-cam-3873110896513343357.jpg\",\"FileDateTime\":\"1607529877\",\"FileSize\":\"126293\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"640\\\" height=\\\"640\\\"\",\"Height\":\"640\",\"Width\":\"640\",\"IsColor\":\"1\"}}', 681, NULL, 7, 12392, 68713, NULL, 0, 0, 1),
(230, 'FB_IMG_16060921451640919', 'jpg', 99625, 480, 454, '2020-12-10 10:15:14', '2020-12-10 07:15:14', 'FB IMG 16060921451640919', NULL, 0, 7, NULL, '197.156.190.208', 'datefolder', NULL, NULL, '6fac9ad11be53bd20c8e1078b11d3812', NULL, 'FB_IMG_16060921451640919.jpg', '{\"FileName\":\"FB_IMG_16060921451640919.jpg\",\"FileDateTime\":\"1607584514\",\"FileSize\":\"99625\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"454\\\"\",\"Height\":\"454\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 714, NULL, 5, 11252, 0, NULL, 0, 0, 1),
(231, 'tmp-cam-5855886518878524079', 'jpg', 88138, 640, 488, '2020-12-10 13:01:18', '2020-12-10 10:01:18', 'tmp cam 5855886518878524079', NULL, 0, 8, NULL, '102.23.98.12', 'datefolder', NULL, NULL, '246db86d4e8bc438cfba2a2ceadb5bf4', NULL, 'tmp-cam-5855886518878524079.jpg', '{\"FileName\":\"tmp-cam-5855886518878524079.jpg\",\"FileDateTime\":\"1607594478\",\"FileSize\":\"88138\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"640\\\" height=\\\"488\\\"\",\"Height\":\"488\",\"Width\":\"640\",\"IsColor\":\"1\"}}', 822, NULL, 7, 10906, 45450, NULL, 0, 0, 1),
(234, 'IMG_20201212_121953', 'jpg', 71812, 680, 680, '2020-12-12 13:19:43', '2020-12-12 10:19:43', 'IMG 20201212 121953', NULL, 0, 7, NULL, '197.156.137.170', 'datefolder', NULL, NULL, '41c64e9c853248d79020f23cec5a22e1', NULL, 'IMG_20201212_121953.jpg', '{\"FileName\":\"IMG_20201212_121953.jpg\",\"FileDateTime\":\"1607768383\",\"FileSize\":\"71812\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"680\\\" height=\\\"680\\\"\",\"Height\":\"680\",\"Width\":\"680\",\"IsColor\":\"1\"}}', 800, NULL, 7, 12654, 70419, NULL, 0, 0, 1),
(235, 'E84DB454-EA9A-4846-8A88-71DF96BF7CDB', 'jpg', 166431, 1125, 1365, '2020-12-13 15:53:28', '2020-12-13 12:53:28', 'E84DB454 EA9A 4846 8A88 71DF96BF7CDB', NULL, 0, 7, NULL, '197.156.190.190', 'datefolder', NULL, NULL, '4c0f8c2733fb7070fd9ad4493515aeb7', NULL, 'E84DB454-EA9A-4846-8A88-71DF96BF7CDB.jpeg', '{\"FileName\":\"E84DB454-EA9A-4846-8A88-71DF96BF7CDB.jpeg\",\"FileDateTime\":\"1607864008\",\"FileSize\":\"166431\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, THUMBNAIL, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"1125\\\" height=\\\"1365\\\"\",\"Height\":\"1365\",\"Width\":\"1125\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\",\"Thumbnail.FileType\":\"2\",\"Thumbnail.MimeType\":\"image\\/jpeg\"},\"Orientation\":\"1\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"YCbCrPositioning\":\"1\",\"Exif_IFD_Pointer\":\"102\",\"THUMBNAIL\":{\"Compression\":\"6\",\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":\"2\",\"JPEGInterchangeFormat\":\"286\",\"JPEGInterchangeFormatLength\":\"10593\"},\"ExifVersion\":\"0221\",\"ComponentsConfiguration\":\"\\u0001\\u0002\\u0003\\u0000\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":\"1\",\"ExifImageWidth\":\"1125\",\"ExifImageLength\":\"1365\",\"SceneCaptureType\":\"0\"}', 588, NULL, 7, 10957, 67304, NULL, 0, 0, 1),
(236, 'school_meme_3_0', 'jpg', 40904, 620, 420, '2020-12-14 15:33:56', '2020-12-14 12:33:56', 'school meme 3 0', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'd1affa78db27014126b4e09a73ae1c8e', NULL, 'school_meme_3_0.jpg', '{\"FileName\":\"school_meme_3_0.jpg\",\"FileDateTime\":\"1607949236\",\"FileSize\":\"40904\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"COMMENT\",\"COMPUTED\":{\"html\":\"width=\\\"620\\\" height=\\\"420\\\"\",\"Height\":\"420\",\"Width\":\"620\",\"IsColor\":\"1\"},\"COMMENT\":[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 86\\n\"]}', 669, NULL, 7, 11847, 40255, NULL, 0, 0, 1);
INSERT INTO `chv_images` (`image_id`, `image_name`, `image_extension`, `image_size`, `image_width`, `image_height`, `image_date`, `image_date_gmt`, `image_title`, `image_description`, `image_nsfw`, `image_user_id`, `image_album_id`, `image_uploader_ip`, `image_storage_mode`, `image_path`, `image_storage_id`, `image_md5`, `image_source_md5`, `image_original_filename`, `image_original_exifdata`, `image_views`, `image_category_id`, `image_chain`, `image_thumb_size`, `image_medium_size`, `image_expiration_date_gmt`, `image_likes`, `image_is_animated`, `image_is_approved`) VALUES
(237, 'p-2', 'jpg', 40026, 517, 550, '2020-12-14 17:33:11', '2020-12-14 14:33:11', 'p 2', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '180ddec4e8a41bb4ab335e26a586a8cf', NULL, 'p-2.jpg', '{\"FileName\":\"p-2.jpg\",\"FileDateTime\":\"1607956391\",\"FileSize\":\"40026\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF, WINXP\",\"COMPUTED\":{\"html\":\"width=\\\"517\\\" height=\\\"550\\\"\",\"Height\":\"550\",\"Width\":\"517\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"Artist\":\"\\u042fichee\",\"Exif_IFD_Pointer\":\"2130\",\"Author\":\"??????\",\"UndefinedTag:0xEA1C\":\"\\u001c?\\u0000\\u0000\\u0000\\b\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\",\"DateTimeOriginal\":\"2018:12:10 20:07:07\",\"DateTimeDigitized\":\"2018:12:10 20:07:07\",\"SubSecTimeOriginal\":\"93\",\"SubSecTimeDigitized\":\"93\"}', 742, NULL, 7, 10675, 54649, NULL, 0, 0, 1),
(238, 'IMG_20201216_094115_895', 'jpg', 24772, 720, 703, '2020-12-17 13:38:15', '2020-12-17 10:38:15', 'IMG 20201216 094115 895', NULL, 0, 7, NULL, '154.122.50.48', 'datefolder', NULL, NULL, 'a3d9824dbd26fdc66a28646d029b2acb', NULL, 'IMG_20201216_094115_895.jpg', '{\"FileName\":\"IMG_20201216_094115_895.jpg\",\"FileDateTime\":\"1608201495\",\"FileSize\":\"24772\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"703\\\"\",\"Height\":\"703\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 536, NULL, 7, 6492, 30800, NULL, 0, 0, 1),
(239, 'FB_IMG_16082068059638384', 'jpg', 218058, 720, 772, '2020-12-17 19:39:38', '2020-12-17 16:39:38', 'FB IMG 16082068059638384', NULL, 0, 7, NULL, '197.156.190.173', 'datefolder', NULL, NULL, 'f585b17daea26b0d308326f70970865b', NULL, 'FB_IMG_16082068059638384.jpg', '{\"FileName\":\"FB_IMG_16082068059638384.jpg\",\"FileDateTime\":\"1608223178\",\"FileSize\":\"218058\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"772\\\"\",\"Height\":\"772\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 585, NULL, 7, 11054, 58351, NULL, 0, 0, 1),
(240, 'tmp-cam-3621393761824986714', 'jpg', 14549, 260, 320, '2020-12-17 20:02:14', '2020-12-17 17:02:14', 'tmp cam 3621393761824986714', NULL, 0, 8, NULL, '102.23.98.11', 'datefolder', NULL, NULL, '9dd1959dd10a4848d808606449b5f836', NULL, 'tmp-cam-3621393761824986714.jpg', '{\"FileName\":\"tmp-cam-3621393761824986714.jpg\",\"FileDateTime\":\"1608224534\",\"FileSize\":\"14549\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"260\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"260\",\"IsColor\":\"1\"}}', 575, NULL, 5, 9974, 0, NULL, 0, 0, 1),
(241, 'FB_IMG_1607936373055', 'jpg', 29283, 543, 492, '2020-12-17 20:03:32', '2020-12-17 17:03:32', 'FB IMG 1607936373055', NULL, 0, 8, NULL, '102.23.98.15', 'datefolder', NULL, NULL, 'bb7427831371250455acfb8c3bf50cdd', NULL, 'FB_IMG_1607936373055.jpg', '{\"FileName\":\"FB_IMG_1607936373055.jpg\",\"FileDateTime\":\"1608224612\",\"FileSize\":\"29283\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"543\\\" height=\\\"492\\\"\",\"Height\":\"492\",\"Width\":\"543\",\"IsColor\":\"1\"}}', 767, NULL, 7, 10969, 67729, NULL, 0, 0, 1),
(242, 'FB_IMG_1606761467295', 'jpg', 17398, 480, 600, '2020-12-18 10:26:02', '2020-12-18 07:26:02', 'FB IMG 1606761467295', NULL, 0, 8, NULL, '102.23.98.15', 'datefolder', NULL, NULL, '82252d67c765f6bda3602eb54b1adaf1', NULL, 'FB_IMG_1606761467295.jpg', '{\"FileName\":\"FB_IMG_1606761467295.jpg\",\"FileDateTime\":\"1608276361\",\"FileSize\":\"17398\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"600\\\"\",\"Height\":\"600\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 762, NULL, 5, 9922, 0, NULL, 0, 0, 1),
(243, 'FB_IMG_16077170603227239', 'jpg', 244019, 720, 745, '2020-12-18 10:41:31', '2020-12-18 07:41:31', 'FB IMG 16077170603227239', NULL, 0, 7, NULL, '197.156.190.172', 'datefolder', NULL, NULL, '85e0d92a33a73045fbf054cecf8a09c4', NULL, 'FB_IMG_16077170603227239.jpg', '{\"FileName\":\"FB_IMG_16077170603227239.jpg\",\"FileDateTime\":\"1608277291\",\"FileSize\":\"244019\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"745\\\"\",\"Height\":\"745\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 586, NULL, 7, 15317, 81388, NULL, 0, 0, 1),
(244, 'IMG_20201219_185443_326', 'jpg', 58973, 476, 476, '2020-12-19 21:41:47', '2020-12-19 18:41:47', 'IMG 20201219 185443 326', NULL, 0, 7, NULL, '154.122.247.222', 'datefolder', NULL, NULL, '2df9c3bb5be9f08bd8046315fee4e964', NULL, 'IMG_20201219_185443_326.jpg', '{\"FileName\":\"IMG_20201219_185443_326.jpg\",\"FileDateTime\":\"1608403306\",\"FileSize\":\"58973\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"476\\\" height=\\\"476\\\"\",\"Height\":\"476\",\"Width\":\"476\",\"IsColor\":\"1\"}}', 712, NULL, 5, 13670, 0, NULL, 0, 0, 1),
(245, 'tmp-cam-2943174221593227674', 'jpg', 17599, 320, 312, '2020-12-20 17:09:41', '2020-12-20 14:09:41', 'tmp cam 2943174221593227674', NULL, 0, 8, NULL, '102.23.98.20', 'datefolder', NULL, NULL, '559643142b507ba14751ce703a8fb3df', NULL, 'tmp-cam-2943174221593227674.jpg', '{\"FileName\":\"tmp-cam-2943174221593227674.jpg\",\"FileDateTime\":\"1608473381\",\"FileSize\":\"17599\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"312\\\"\",\"Height\":\"312\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 785, NULL, 5, 11227, 0, NULL, 0, 0, 1),
(246, 'FB_IMG_16084072200877479', 'jpg', 159121, 660, 552, '2020-12-20 17:12:17', '2020-12-20 14:12:17', 'FB IMG 16084072200877479', NULL, 0, 7, NULL, '154.122.193.161', 'datefolder', NULL, NULL, '43f0fa59b546e2ac6e26e70e529267e3', NULL, 'FB_IMG_16084072200877479.jpg', '{\"FileName\":\"FB_IMG_16084072200877479.jpg\",\"FileDateTime\":\"1608473537\",\"FileSize\":\"159121\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"660\\\" height=\\\"552\\\"\",\"Height\":\"552\",\"Width\":\"660\",\"IsColor\":\"1\"}}', 845, NULL, 7, 13005, 55189, NULL, 0, 0, 1),
(247, 'download-2', 'jpg', 9337, 207, 243, '2020-12-21 13:20:25', '2020-12-21 10:20:25', 'download (2)', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '73d3d77d0a380c0a3641232a893b725c', NULL, 'download (2).jpg', '{\"FileName\":\"download (2).jpg\",\"FileDateTime\":\"1608546025\",\"FileSize\":\"9337\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"207\\\" height=\\\"243\\\"\",\"Height\":\"243\",\"Width\":\"207\",\"IsColor\":\"1\"}}', 807, NULL, 5, 12144, 0, NULL, 0, 0, 1),
(248, 'IMG_20201221_190513', 'jpg', 72170, 480, 379, '2020-12-21 22:12:00', '2020-12-21 19:12:00', 'IMG 20201221 190513', NULL, 0, NULL, NULL, '197.156.190.160', 'datefolder', NULL, NULL, '22ccaa1d4779b907a2af07d4e99f0a19', NULL, 'IMG_20201221_190513.jpg', '{\"FileName\":\"IMG_20201221_190513.jpg\",\"FileDateTime\":\"1608577920\",\"FileSize\":\"72170\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"379\\\"\",\"Height\":\"379\",\"Width\":\"480\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"480\",\"ImageLength\":\"379\",\"DateTime\":\"2020:12:21 19:05:13\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"379\",\"ExifImageWidth\":\"480\"}', 726, NULL, 5, 14497, 0, NULL, 0, 0, 1),
(249, 'FB_IMG_16085625882233129', 'jpg', 105467, 480, 480, '2020-12-21 22:12:26', '2020-12-21 19:12:26', 'FB IMG 16085625882233129', NULL, 0, NULL, NULL, '197.156.190.169', 'datefolder', NULL, NULL, '319b2b8d8cb179ea6ed1407cac1d8ea2', NULL, 'FB_IMG_16085625882233129.jpg', '{\"FileName\":\"FB_IMG_16085625882233129.jpg\",\"FileDateTime\":\"1608577946\",\"FileSize\":\"105467\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 624, NULL, 5, 10194, 0, NULL, 0, 0, 1),
(250, 'FB_IMG_16087447827130617', 'jpg', 147559, 720, 483, '2020-12-23 23:51:25', '2020-12-23 20:51:25', 'FB IMG 16087447827130617', NULL, 0, 8, NULL, '154.123.248.87', 'datefolder', NULL, NULL, 'dfa18ed966ef1839a4c80bd48405b748', NULL, 'FB_IMG_16087447827130617.jpg', '{\"FileName\":\"FB_IMG_16087447827130617.jpg\",\"FileDateTime\":\"1608756685\",\"FileSize\":\"147559\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"483\\\"\",\"Height\":\"483\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 583, NULL, 7, 13381, 44560, NULL, 0, 0, 1),
(251, 'tmp-cam-708579027306949556', 'jpg', 19406, 320, 315, '2020-12-28 17:08:59', '2020-12-28 14:08:59', 'tmp cam 708579027306949556', NULL, 0, 7, NULL, '102.23.98.14', 'datefolder', NULL, NULL, '732129b0413efa1d104b33c9a32c4997', NULL, 'tmp-cam-708579027306949556.jpg', '{\"FileName\":\"tmp-cam-708579027306949556.jpg\",\"FileDateTime\":\"1609164539\",\"FileSize\":\"19406\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"315\\\"\",\"Height\":\"315\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 625, NULL, 5, 11236, 0, NULL, 0, 0, 1),
(252, 'IMG_20201229_185447_286', 'jpg', 47331, 720, 1280, '2020-12-29 18:59:19', '2020-12-29 15:59:19', 'IMG 20201229 185447 286', NULL, 0, 8, NULL, '196.110.222.81', 'datefolder', NULL, NULL, 'f4f2c979673785957490e3a844a47145', NULL, 'IMG_20201229_185447_286.jpg', '{\"FileName\":\"IMG_20201229_185447_286.jpg\",\"FileDateTime\":\"1609257559\",\"FileSize\":\"47331\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 570, NULL, 7, 10680, 60552, NULL, 0, 0, 1),
(253, 'IMG_20201229_183917_794', 'jpg', 38191, 720, 1280, '2020-12-29 19:00:30', '2020-12-29 16:00:30', 'IMG 20201229 183917 794', NULL, 0, 8, NULL, '196.110.222.81', 'datefolder', NULL, NULL, '91ca71b9332bd9e97711f64366310a8d', NULL, 'IMG_20201229_183917_794.jpg', '{\"FileName\":\"IMG_20201229_183917_794.jpg\",\"FileDateTime\":\"1609257630\",\"FileSize\":\"38191\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 600, NULL, 7, 7951, 48651, NULL, 0, 0, 1),
(254, 'tmp-cam-178251585933112451', 'jpg', 16956, 320, 307, '2020-12-29 19:01:47', '2020-12-29 16:01:47', 'tmp cam 178251585933112451', NULL, 0, 7, NULL, '102.23.98.20', 'datefolder', NULL, NULL, '248a2be430c778b5d64c03e49a35e441', NULL, 'tmp-cam-178251585933112451.jpg', '{\"FileName\":\"tmp-cam-178251585933112451.jpg\",\"FileDateTime\":\"1609257707\",\"FileSize\":\"16956\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"307\\\"\",\"Height\":\"307\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 566, NULL, 5, 11869, 0, NULL, 0, 0, 1),
(255, 'IMG_20210101_095444_740', 'jpg', 71611, 650, 598, '2021-01-01 10:37:27', '2021-01-01 07:37:27', 'IMG 20210101 095444 740', NULL, 0, 8, NULL, '105.63.96.117', 'datefolder', NULL, NULL, '1bf72aad25bea5131afb9bebcfc305d1', NULL, 'IMG_20210101_095444_740.jpg', '{\"FileName\":\"IMG_20210101_095444_740.jpg\",\"FileDateTime\":\"1609486647\",\"FileSize\":\"71611\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"650\\\" height=\\\"598\\\"\",\"Height\":\"598\",\"Width\":\"650\",\"IsColor\":\"1\"}}', 771, NULL, 7, 14936, 68554, NULL, 0, 0, 1),
(256, 'IMG_20210101_113637', 'jpg', 197161, 720, 603, '2021-01-01 11:42:14', '2021-01-01 08:42:14', 'IMG 20210101 113637', NULL, 0, 7, NULL, '102.23.98.11', 'datefolder', NULL, NULL, '4a92a4896e7e8f64e75c3293e13192c0', NULL, 'IMG_20210101_113637.jpg', '{\"FileName\":\"IMG_20210101_113637.jpg\",\"FileDateTime\":\"1609490534\",\"FileSize\":\"197161\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"603\\\"\",\"Height\":\"603\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 1265, NULL, 7, 17138, 90038, NULL, 0, 0, 1),
(257, 'IMG_20210105_183153_565', 'jpg', 55586, 507, 507, '2021-01-06 11:28:04', '2021-01-06 08:28:04', 'IMG 20210105 183153 565', NULL, 0, 8, NULL, '105.160.74.128', 'datefolder', NULL, NULL, '1f4792452f2bfcb07bda12f3f1986d1c', NULL, 'IMG_20210105_183153_565.jpg', '{\"FileName\":\"IMG_20210105_183153_565.jpg\",\"FileDateTime\":\"1609921684\",\"FileSize\":\"55586\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"507\\\" height=\\\"507\\\"\",\"Height\":\"507\",\"Width\":\"507\",\"IsColor\":\"1\"}}', 924, NULL, 7, 11088, 56161, NULL, 0, 0, 1),
(258, 'IMG_20210106_204717_701', 'jpg', 37981, 720, 1280, '2021-01-06 21:57:59', '2021-01-06 18:57:59', 'IMG 20210106 204717 701', NULL, 0, 8, NULL, '154.122.162.228', 'datefolder', NULL, NULL, '04c4711019e5e19228519cfe36d84e76', NULL, 'IMG_20210106_204717_701.jpg', '{\"FileName\":\"IMG_20210106_204717_701.jpg\",\"FileDateTime\":\"1609959479\",\"FileSize\":\"37981\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 963, NULL, 7, 9967, 55045, NULL, 0, 0, 1),
(259, 'tmp-cam-3234645640113983488', 'jpg', 18469, 310, 320, '2021-01-06 21:59:23', '2021-01-06 18:59:23', 'tmp cam 3234645640113983488', NULL, 0, 7, 1, '102.23.98.11', 'datefolder', NULL, NULL, '62962e1c7a874d504c8be398a441a4c5', NULL, 'tmp-cam-3234645640113983488.jpg', '{\"FileName\":\"tmp-cam-3234645640113983488.jpg\",\"FileDateTime\":\"1609959563\",\"FileSize\":\"18469\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"310\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"310\",\"IsColor\":\"1\"}}', 664, NULL, 5, 12188, 0, NULL, 0, 0, 1),
(260, 'IMG_20210107_094803_126', 'jpg', 123152, 770, 770, '2021-01-07 10:08:29', '2021-01-07 07:08:29', 'IMG 20210107 094803 126', NULL, 0, 8, NULL, '154.123.247.156', 'datefolder', NULL, NULL, '14b4919c1b2bbeee44a6b06b1e8fcd21', NULL, 'IMG_20210107_094803_126.jpg', '{\"FileName\":\"IMG_20210107_094803_126.jpg\",\"FileDateTime\":\"1610003309\",\"FileSize\":\"123152\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"770\\\" height=\\\"770\\\"\",\"Height\":\"770\",\"Width\":\"770\",\"IsColor\":\"1\"}}', 745, NULL, 7, 12564, 73929, NULL, 0, 0, 1),
(261, 'tmp-cam-2782553164862772634', 'jpg', 17473, 320, 231, '2021-01-08 01:12:57', '2021-01-07 22:12:57', 'tmp cam 2782553164862772634', NULL, 0, 7, NULL, '102.23.98.19', 'datefolder', NULL, NULL, '5580204369c5916fabeda183ead5aa54', NULL, 'tmp-cam-2782553164862772634.jpg', '{\"FileName\":\"tmp-cam-2782553164862772634.jpg\",\"FileDateTime\":\"1610057577\",\"FileSize\":\"17473\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"231\\\"\",\"Height\":\"231\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 679, NULL, 5, 12455, 0, NULL, 0, 0, 1),
(262, 'IMG_20210108_160713_600', 'jpg', 98283, 720, 720, '2021-01-08 21:01:00', '2021-01-08 18:01:00', 'IMG 20210108 160713 600', NULL, 0, 8, NULL, '102.167.59.204', 'datefolder', NULL, NULL, '1b9720572b211b0f5fdd11372e0c6954', NULL, 'IMG_20210108_160713_600.jpg', '{\"FileName\":\"IMG_20210108_160713_600.jpg\",\"FileDateTime\":\"1610128860\",\"FileSize\":\"98283\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 690, NULL, 7, 12652, 65650, NULL, 0, 0, 1),
(263, 'FB_IMG_16104140486950032', 'jpg', 212816, 651, 601, '2021-01-12 09:43:30', '2021-01-12 06:43:30', 'FB IMG 16104140486950032', NULL, 0, 8, NULL, '102.167.132.215', 'datefolder', NULL, NULL, 'ff677b71d60db58055da953903353e2e', NULL, 'FB_IMG_16104140486950032.jpg', '{\"FileName\":\"FB_IMG_16104140486950032.jpg\",\"FileDateTime\":\"1610433810\",\"FileSize\":\"212816\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"651\\\" height=\\\"601\\\"\",\"Height\":\"601\",\"Width\":\"651\",\"IsColor\":\"1\"}}', 635, NULL, 7, 12244, 62502, NULL, 0, 0, 1),
(264, 'FB_IMG_16103579702938045', 'jpg', 247007, 720, 678, '2021-01-12 09:45:14', '2021-01-12 06:45:14', 'FB IMG 16103579702938045', NULL, 0, 8, NULL, '102.167.132.215', 'datefolder', NULL, NULL, '3286f8a711ecd938ed7203f5d1ed607c', NULL, 'FB_IMG_16103579702938045.jpg', '{\"FileName\":\"FB_IMG_16103579702938045.jpg\",\"FileDateTime\":\"1610433914\",\"FileSize\":\"247007\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"678\\\"\",\"Height\":\"678\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 662, NULL, 7, 11660, 61898, NULL, 0, 0, 1),
(266, 'tmp-cam-8407287408729387955', 'jpg', 14376, 320, 235, '2021-01-13 10:12:03', '2021-01-13 07:12:03', 'tmp cam 8407287408729387955', NULL, 0, 7, NULL, '102.23.98.13', 'datefolder', NULL, NULL, 'e6dfc3a473193558d9f7f1ac9f721912', NULL, 'tmp-cam-8407287408729387955.jpg', '{\"FileName\":\"tmp-cam-8407287408729387955.jpg\",\"FileDateTime\":\"1610521923\",\"FileSize\":\"14376\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"235\\\"\",\"Height\":\"235\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 584, NULL, 5, 11696, 0, NULL, 0, 0, 1),
(267, 'FB_IMG_16105306774314982', 'jpg', 200168, 720, 735, '2021-01-13 18:58:02', '2021-01-13 15:58:02', 'FB IMG 16105306774314982', NULL, 0, 8, NULL, '105.160.63.175', 'datefolder', NULL, NULL, '9079f859b640a043dc2771999eeb1d7d', NULL, 'FB_IMG_16105306774314982.jpg', '{\"FileName\":\"FB_IMG_16105306774314982.jpg\",\"FileDateTime\":\"1610553482\",\"FileSize\":\"200168\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"735\\\"\",\"Height\":\"735\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 695, NULL, 7, 12263, 59593, NULL, 0, 0, 1),
(268, 'IMG_20210112_110455_155', 'jpg', 53456, 720, 1280, '2021-01-14 12:31:53', '2021-01-14 09:31:53', 'IMG 20210112 110455 155', NULL, 0, 8, NULL, '105.160.109.78', 'datefolder', NULL, NULL, 'be39bbedd64929fb6ff6ae3b4259e10e', NULL, 'IMG_20210112_110455_155.jpg', '{\"FileName\":\"IMG_20210112_110455_155.jpg\",\"FileDateTime\":\"1610616713\",\"FileSize\":\"53456\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 649, NULL, 7, 12174, 68455, NULL, 0, 0, 1),
(270, 'FB_IMG_16103677904307530', 'jpg', 41442, 350, 250, '2021-01-15 19:11:41', '2021-01-15 16:11:41', 'FB IMG 16103677904307530', NULL, 0, 8, NULL, '105.49.175.229', 'datefolder', NULL, NULL, 'fbad302d35685675d07cfa3a2b98a065', NULL, 'FB_IMG_16103677904307530.jpg', '{\"FileName\":\"FB_IMG_16103677904307530.jpg\",\"FileDateTime\":\"1610727101\",\"FileSize\":\"41442\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"350\\\" height=\\\"250\\\"\",\"Height\":\"250\",\"Width\":\"350\",\"IsColor\":\"1\"}}', 793, NULL, 5, 9277, 0, NULL, 0, 0, 1),
(271, 'tmp-cam-8296962515824351509', 'jpg', 17040, 315, 320, '2021-01-15 19:41:50', '2021-01-15 16:41:50', 'tmp cam 8296962515824351509', NULL, 0, 7, NULL, '102.23.98.20', 'datefolder', NULL, NULL, '7269b9836f0cfca7ab5957d3449157b7', NULL, 'tmp-cam-8296962515824351509.jpg', '{\"FileName\":\"tmp-cam-8296962515824351509.jpg\",\"FileDateTime\":\"1610728910\",\"FileSize\":\"17040\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"315\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"315\",\"IsColor\":\"1\"}}', 738, NULL, 5, 10745, 0, NULL, 0, 0, 1),
(272, 'FB_IMG_16109948631002413', 'jpg', 87164, 474, 474, '2021-01-18 23:38:40', '2021-01-18 20:38:40', 'FB IMG 16109948631002413', NULL, 0, 8, NULL, '102.166.249.196', 'datefolder', NULL, NULL, 'f3a6f638acb2d88ff60443739b0c1611', NULL, 'FB_IMG_16109948631002413.jpg', '{\"FileName\":\"FB_IMG_16109948631002413.jpg\",\"FileDateTime\":\"1611002320\",\"FileSize\":\"87164\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"474\\\" height=\\\"474\\\"\",\"Height\":\"474\",\"Width\":\"474\",\"IsColor\":\"1\"}}', 606, NULL, 5, 9259, 0, NULL, 0, 0, 1),
(275, 'IMG_20210118_094505_761', 'jpg', 41495, 720, 1280, '2021-01-19 22:16:41', '2021-01-19 19:16:41', NULL, NULL, 0, 8, NULL, '197.156.137.142', 'datefolder', NULL, NULL, 'c8aefce0b4ca41d81154bbf2918cd34e', NULL, 'IMG_20210118_094505_761.jpg', '{\"FileName\":\"IMG_20210118_094505_761.jpg\",\"FileDateTime\":\"1611083801\",\"FileSize\":\"41495\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 597, NULL, 7, 9354, 56074, NULL, 0, 0, 1),
(276, 'FB_IMG_16108539018377645', 'jpg', 93990, 474, 384, '2021-01-19 22:17:24', '2021-01-19 19:17:24', 'FB IMG 16108539018377645', NULL, 0, 8, NULL, '197.156.137.142', 'datefolder', NULL, NULL, 'f3d2bfff03d234ba4ca6309e9edc9e12', NULL, 'FB_IMG_16108539018377645.jpg', '{\"FileName\":\"FB_IMG_16108539018377645.jpg\",\"FileDateTime\":\"1611083844\",\"FileSize\":\"93990\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"474\\\" height=\\\"384\\\"\",\"Height\":\"384\",\"Width\":\"474\",\"IsColor\":\"1\"}}', 629, NULL, 5, 13015, 0, NULL, 0, 0, 1),
(277, 'IMG_20210119_222111_982', 'jpg', 64959, 720, 1280, '2021-01-19 22:24:39', '2021-01-19 19:24:39', 'IMG 20210119 222111 982', NULL, 0, 8, NULL, '197.156.137.142', 'datefolder', NULL, NULL, '2374c76d9836ab869d41f90d6592f6f6', NULL, 'IMG_20210119_222111_982.jpg', '{\"FileName\":\"IMG_20210119_222111_982.jpg\",\"FileDateTime\":\"1611084279\",\"FileSize\":\"64959\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 601, NULL, 7, 11869, 79798, NULL, 0, 0, 1),
(278, 'FB_IMG_16109943723981454', 'jpg', 165875, 720, 610, '2021-01-21 20:50:54', '2021-01-21 17:50:54', 'FB IMG 16109943723981454', NULL, 0, 8, NULL, '102.167.207.41', 'datefolder', NULL, NULL, 'bbf42e495bb7752ca1cd7d289bbe5e52', NULL, 'FB_IMG_16109943723981454.jpg', '{\"FileName\":\"FB_IMG_16109943723981454.jpg\",\"FileDateTime\":\"1611251454\",\"FileSize\":\"165875\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"610\\\"\",\"Height\":\"610\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 500, NULL, 7, 10213, 48762, NULL, 0, 0, 1),
(279, '7a9c8e5d1f40ffbedb0fdd6976e23821', 'jpg', 13030, 236, 319, '2021-01-22 18:06:39', '2021-01-22 15:06:39', '7a9c8e5d1f40ffbedb0fdd6976e23821', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '90dd1051de34442e7e2f40d528133135', NULL, '7a9c8e5d1f40ffbedb0fdd6976e23821.jpg', '{\"FileName\":\"7a9c8e5d1f40ffbedb0fdd6976e23821.jpg\",\"FileDateTime\":\"1611327999\",\"FileSize\":\"13030\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"236\\\" height=\\\"319\\\"\",\"Height\":\"319\",\"Width\":\"236\",\"IsColor\":\"1\"}}', 490, NULL, 5, 9932, 0, NULL, 0, 0, 1),
(280, 'IMG_20210122_125906_986', 'jpg', 68184, 720, 1280, '2021-01-22 21:29:54', '2021-01-22 18:29:54', 'IMG 20210122 125906 986', NULL, 0, 8, NULL, '154.122.89.247', 'datefolder', NULL, NULL, '2e1563e484c70e074955da4d289774ae', NULL, 'IMG_20210122_125906_986.jpg', '{\"FileName\":\"IMG_20210122_125906_986.jpg\",\"FileDateTime\":\"1611340194\",\"FileSize\":\"68184\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 579, NULL, 7, 13106, 83665, NULL, 0, 0, 1),
(282, 'IMG_20210123_163029_671', 'jpg', 46610, 720, 1280, '2021-01-24 19:13:34', '2021-01-24 16:13:34', 'IMG 20210123 163029 671', NULL, 0, 8, NULL, '102.167.178.214', 'datefolder', NULL, NULL, '43679d161930c89c2aea28de9c2622bb', NULL, 'IMG_20210123_163029_671.jpg', '{\"FileName\":\"IMG_20210123_163029_671.jpg\",\"FileDateTime\":\"1611504814\",\"FileSize\":\"46610\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 594, NULL, 7, 11384, 63621, NULL, 0, 0, 1),
(283, 'IMG_20210126_083910_953', 'jpg', 45557, 720, 1280, '2021-01-26 08:48:43', '2021-01-26 05:48:43', 'IMG 20210126 083910 953', NULL, 0, 8, NULL, '197.156.137.141', 'datefolder', NULL, NULL, '9ceb43faf62867e8ff84e6e6022252b0', NULL, 'IMG_20210126_083910_953.jpg', '{\"FileName\":\"IMG_20210126_083910_953.jpg\",\"FileDateTime\":\"1611640123\",\"FileSize\":\"45557\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 553, NULL, 7, 11751, 60106, NULL, 0, 0, 1),
(284, 'IMG_20210127_201249_073', 'jpg', 56412, 720, 1280, '2021-01-27 21:02:47', '2021-01-27 18:02:47', 'IMG 20210127 201249 073', NULL, 0, 8, NULL, '197.156.137.133', 'datefolder', NULL, NULL, '567c9314d9bb0d16eec83a1199a50b4d', NULL, 'IMG_20210127_201249_073.jpg', '{\"FileName\":\"IMG_20210127_201249_073.jpg\",\"FileDateTime\":\"1611770567\",\"FileSize\":\"56412\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 742, NULL, 7, 11743, 67930, NULL, 0, 0, 1),
(286, 'FB_IMG_16115924421667417', 'jpg', 91111, 480, 650, '2021-01-29 09:43:43', '2021-01-29 06:43:43', 'FB IMG 16115924421667417', NULL, 0, 8, NULL, '102.167.58.231', 'datefolder', NULL, NULL, '6a6ad3bad8bcf9a125965d978c181041', NULL, 'FB_IMG_16115924421667417.jpg', '{\"FileName\":\"FB_IMG_16115924421667417.jpg\",\"FileDateTime\":\"1611902623\",\"FileSize\":\"91111\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"650\\\"\",\"Height\":\"650\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 446, NULL, 5, 10547, 0, NULL, 0, 0, 1),
(287, '100576058_2950043968406688_6379670427781824512_n', 'jpg', 37308, 480, 503, '2021-01-29 17:54:45', '2021-01-29 14:54:45', '100576058 2950043968406688 6379670427781824512 n', NULL, 0, 7, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '0478ba33dee8c3d3e072202e9f06e705', NULL, '100576058_2950043968406688_6379670427781824512_n.jpg', '{\"FileName\":\"100576058_2950043968406688_6379670427781824512_n.jpg\",\"FileDateTime\":\"1611932084\",\"FileSize\":\"37308\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"503\\\"\",\"Height\":\"503\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 433, NULL, 5, 14433, 0, NULL, 0, 0, 1),
(288, 'IMG_20210130_131639_279', 'jpg', 52819, 720, 720, '2021-01-30 13:55:34', '2021-01-30 10:55:34', 'IMG 20210130 131639 279', NULL, 0, 8, NULL, '102.167.230.65', 'datefolder', NULL, NULL, 'b175facb28ac938d098a2ef23db32ab2', NULL, 'IMG_20210130_131639_279.jpg', '{\"FileName\":\"IMG_20210130_131639_279.jpg\",\"FileDateTime\":\"1612004133\",\"FileSize\":\"52819\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 563, NULL, 7, 7738, 38087, NULL, 0, 0, 1),
(289, 'IMG_20210130_111356_788', 'jpg', 50380, 720, 1280, '2021-01-30 22:21:21', '2021-01-30 19:21:21', 'IMG 20210130 111356 788', NULL, 0, 8, NULL, '154.123.31.185', 'datefolder', NULL, NULL, 'dd0746e94476fa4977fa8bc1028ea421', NULL, 'IMG_20210130_111356_788.jpg', '{\"FileName\":\"IMG_20210130_111356_788.jpg\",\"FileDateTime\":\"1612034481\",\"FileSize\":\"50380\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 531, NULL, 7, 10723, 64229, NULL, 0, 0, 1),
(290, 'IMG_20210131_124949_076', 'jpg', 40400, 720, 1280, '2021-01-31 13:11:18', '2021-01-31 10:11:18', 'IMG 20210131 124949 076', NULL, 0, 8, NULL, '102.167.28.82', 'datefolder', NULL, NULL, '0ec1afbd0b6e0eb4a678fb70bbd7d7b8', NULL, 'IMG_20210131_124949_076.jpg', '{\"FileName\":\"IMG_20210131_124949_076.jpg\",\"FileDateTime\":\"1612087878\",\"FileSize\":\"40400\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 509, NULL, 7, 9436, 56846, NULL, 0, 0, 1),
(291, 'FB_IMG_16121628273539725', 'jpg', 112940, 454, 436, '2021-02-01 19:57:37', '2021-02-01 16:57:37', 'FB IMG 16121628273539725', NULL, 0, 8, NULL, '154.122.14.26', 'datefolder', NULL, NULL, 'f5c6863494ca1711072c7b70dee78012', NULL, 'FB_IMG_16121628273539725.jpg', '{\"FileName\":\"FB_IMG_16121628273539725.jpg\",\"FileDateTime\":\"1612198657\",\"FileSize\":\"112940\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"454\\\" height=\\\"436\\\"\",\"Height\":\"436\",\"Width\":\"454\",\"IsColor\":\"1\"}}', 501, NULL, 5, 11942, 0, NULL, 0, 0, 1),
(292, 'IMG_20210203_082923_535', 'jpg', 77970, 720, 720, '2021-02-03 09:16:21', '2021-02-03 06:16:21', 'IMG 20210203 082923 535', NULL, 0, 8, NULL, '197.156.137.131', 'datefolder', NULL, NULL, '5bf04f292467915777ec3b1bae48c6b6', NULL, 'IMG_20210203_082923_535.jpg', '{\"FileName\":\"IMG_20210203_082923_535.jpg\",\"FileDateTime\":\"1612332981\",\"FileSize\":\"77970\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 451, NULL, 7, 11962, 63474, NULL, 0, 0, 1),
(293, 'FB_IMG_16122884363625859', 'jpg', 94640, 480, 438, '2021-02-03 21:26:37', '2021-02-03 18:26:37', 'FB IMG 16122884363625859', NULL, 0, 8, NULL, '154.123.21.7', 'datefolder', NULL, NULL, '0daed7f07fb8ac489f8d0bf13b51ea54', NULL, 'FB_IMG_16122884363625859.jpg', '{\"FileName\":\"FB_IMG_16122884363625859.jpg\",\"FileDateTime\":\"1612376797\",\"FileSize\":\"94640\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"438\\\"\",\"Height\":\"438\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 429, NULL, 5, 11221, 0, NULL, 0, 0, 1),
(294, 'FB_IMG_16122884683022495', 'jpg', 155438, 480, 600, '2021-02-04 23:47:03', '2021-02-04 20:47:03', 'FB IMG 16122884683022495', NULL, 0, 8, NULL, '102.167.116.35', 'datefolder', NULL, NULL, '7d9a012be8d7a85ca1d6a6579b7f3302', NULL, 'FB_IMG_16122884683022495.jpg', '{\"FileName\":\"FB_IMG_16122884683022495.jpg\",\"FileDateTime\":\"1612471623\",\"FileSize\":\"155438\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"600\\\"\",\"Height\":\"600\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 521, NULL, 5, 13181, 0, NULL, 0, 0, 1),
(295, 'IMG_20210205_201803_853', 'jpg', 43874, 720, 1280, '2021-02-05 21:04:08', '2021-02-05 18:04:08', 'IMG 20210205 201803 853', NULL, 0, 8, NULL, '102.166.8.61', 'datefolder', NULL, NULL, '6cc558826227a71e3f2ae6b4bf58bdba', NULL, 'IMG_20210205_201803_853.jpg', '{\"FileName\":\"IMG_20210205_201803_853.jpg\",\"FileDateTime\":\"1612548248\",\"FileSize\":\"43874\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 954, NULL, 7, 11893, 61191, NULL, 0, 0, 1),
(296, 'tmp-cam-8875366314236489970', 'jpg', 18499, 320, 318, '2021-02-06 16:50:56', '2021-02-06 13:50:56', 'tmp cam 8875366314236489970', NULL, 0, 8, NULL, '102.23.98.12', 'datefolder', NULL, NULL, 'fc0cf4bcc8da0d4cf54e18d290b6e3b8', NULL, 'tmp-cam-8875366314236489970.jpg', '{\"FileName\":\"tmp-cam-8875366314236489970.jpg\",\"FileDateTime\":\"1612619456\",\"FileSize\":\"18499\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"318\\\"\",\"Height\":\"318\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 374, NULL, 5, 10258, 0, NULL, 0, 0, 1),
(297, 'IMG_20210207_104734_180', 'jpg', 39482, 720, 720, '2021-02-07 12:55:23', '2021-02-07 09:55:23', 'IMG 20210207 104734 180', NULL, 0, NULL, NULL, '102.167.250.247', 'datefolder', NULL, NULL, 'db3e11b7f2045dd5003962b8ea45e372', NULL, 'IMG_20210207_104734_180.jpg', '{\"FileName\":\"IMG_20210207_104734_180.jpg\",\"FileDateTime\":\"1612691723\",\"FileSize\":\"39482\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 436, NULL, 7, 7422, 37203, NULL, 0, 0, 1),
(298, 'FB_IMG_16127027456115831', 'jpg', 110157, 480, 478, '2021-02-08 21:14:36', '2021-02-08 18:14:36', 'FB IMG 16127027456115831', NULL, 0, NULL, NULL, '102.167.7.129', 'datefolder', NULL, NULL, '98869e745d254e8c85109d76460f25bc', NULL, 'FB_IMG_16127027456115831.jpg', '{\"FileName\":\"FB_IMG_16127027456115831.jpg\",\"FileDateTime\":\"1612808076\",\"FileSize\":\"110157\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"478\\\"\",\"Height\":\"478\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 611, NULL, 5, 10647, 0, NULL, 0, 0, 1);
INSERT INTO `chv_images` (`image_id`, `image_name`, `image_extension`, `image_size`, `image_width`, `image_height`, `image_date`, `image_date_gmt`, `image_title`, `image_description`, `image_nsfw`, `image_user_id`, `image_album_id`, `image_uploader_ip`, `image_storage_mode`, `image_path`, `image_storage_id`, `image_md5`, `image_source_md5`, `image_original_filename`, `image_original_exifdata`, `image_views`, `image_category_id`, `image_chain`, `image_thumb_size`, `image_medium_size`, `image_expiration_date_gmt`, `image_likes`, `image_is_animated`, `image_is_approved`) VALUES
(299, 'FB_IMG_16126969291641608', 'jpg', 80749, 407, 400, '2021-02-09 21:36:54', '2021-02-09 18:36:54', 'FB IMG 16126969291641608', NULL, 0, NULL, NULL, '102.167.196.253', 'datefolder', NULL, NULL, '281b0a0d937c324716063316734c7f71', NULL, 'FB_IMG_16126969291641608.jpg', '{\"FileName\":\"FB_IMG_16126969291641608.jpg\",\"FileDateTime\":\"1612895814\",\"FileSize\":\"80749\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"407\\\" height=\\\"400\\\"\",\"Height\":\"400\",\"Width\":\"407\",\"IsColor\":\"1\"}}', 595, NULL, 5, 11328, 0, NULL, 0, 0, 1),
(300, 'IMG_20210210_204845_961', 'jpg', 51996, 720, 1280, '2021-02-11 20:36:43', '2021-02-11 17:36:43', 'IMG 20210210 204845 961', NULL, 0, NULL, NULL, '102.167.101.138', 'datefolder', NULL, NULL, '428a48d449e88c430e7955d7cf844725', NULL, 'IMG_20210210_204845_961.jpg', '{\"FileName\":\"IMG_20210210_204845_961.jpg\",\"FileDateTime\":\"1613065003\",\"FileSize\":\"51996\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 459, NULL, 7, 9693, 62500, NULL, 0, 0, 1),
(301, 'IMG_20210211_210930_689', 'jpg', 39197, 720, 1280, '2021-02-11 23:29:49', '2021-02-11 20:29:49', 'IMG 20210211 210930 689', NULL, 0, NULL, NULL, '102.166.213.254', 'datefolder', NULL, NULL, '8f021ec000f9249a6a9d238f7f258ead', NULL, 'IMG_20210211_210930_689.jpg', '{\"FileName\":\"IMG_20210211_210930_689.jpg\",\"FileDateTime\":\"1613075389\",\"FileSize\":\"39197\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 400, NULL, 7, 11297, 56561, NULL, 0, 0, 1),
(302, 'IMG_20210212_215527_104', 'jpg', 45650, 720, 1280, '2021-02-13 10:39:37', '2021-02-13 07:39:37', 'IMG 20210212 215527 104', NULL, 0, NULL, NULL, '102.166.152.129', 'datefolder', NULL, NULL, '120ee5972e3d48c8f71d141d1c4f5eb3', NULL, 'IMG_20210212_215527_104.jpg', '{\"FileName\":\"IMG_20210212_215527_104.jpg\",\"FileDateTime\":\"1613201977\",\"FileSize\":\"45650\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 467, NULL, 7, 11757, 62539, NULL, 0, 0, 1),
(303, 'tmp-cam-5145304838172206921', 'jpg', 16761, 311, 320, '2021-02-14 17:41:08', '2021-02-14 14:41:08', 'tmp cam 5145304838172206921', NULL, 0, 8, NULL, '102.23.98.19', 'datefolder', NULL, NULL, 'd9fc39a87ce2eddc3b1439c8bdf873e7', NULL, 'tmp-cam-5145304838172206921.jpg', '{\"FileName\":\"tmp-cam-5145304838172206921.jpg\",\"FileDateTime\":\"1613313668\",\"FileSize\":\"16761\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"311\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"311\",\"IsColor\":\"1\"}}', 480, NULL, 5, 10346, 0, NULL, 0, 0, 1),
(304, 'inbound8422018437847072378', 'jpg', 16238, 486, 1080, '2021-02-15 22:49:59', '2021-02-15 19:49:59', 'inbound8422018437847072378', NULL, 0, NULL, NULL, '154.122.8.218', 'datefolder', NULL, NULL, 'aaddfcc72a4d3616efdee46b14e5fae8', NULL, 'inbound8422018437847072378.jpg', '{\"FileName\":\"inbound8422018437847072378.jpg\",\"FileDateTime\":\"1613418599\",\"FileSize\":\"16238\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"486\\\" height=\\\"1080\\\"\",\"Height\":\"1080\",\"Width\":\"486\",\"IsColor\":\"1\"}}', 468, NULL, 5, 9315, 0, NULL, 0, 0, 1),
(305, 'FB_IMG_16141097821232207', 'jpg', 217699, 720, 704, '2021-02-23 23:07:37', '2021-02-23 20:07:37', 'FB IMG 16141097821232207', NULL, 0, NULL, NULL, '102.166.89.128', 'datefolder', NULL, NULL, '10d5697a1313a3834543582afb06479a', NULL, 'FB_IMG_16141097821232207.jpg', '{\"FileName\":\"FB_IMG_16141097821232207.jpg\",\"FileDateTime\":\"1614110857\",\"FileSize\":\"217699\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"704\\\"\",\"Height\":\"704\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 454, NULL, 7, 11199, 57282, NULL, 0, 0, 1),
(307, 'IMG_20210227_192530_872', 'jpg', 26829, 720, 1280, '2021-02-27 20:12:48', '2021-02-27 17:12:48', 'IMG 20210227 192530 872', NULL, 0, 8, NULL, '102.167.84.70', 'datefolder', NULL, NULL, '91d11bb8be231e9f125ae53ed45b5907', NULL, 'IMG_20210227_192530_872.jpg', '{\"FileName\":\"IMG_20210227_192530_872.jpg\",\"FileDateTime\":\"1614445968\",\"FileSize\":\"26829\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 258, NULL, 7, 7717, 42140, NULL, 0, 0, 1),
(309, 'FB_IMG_16142832664513000', 'jpg', 127834, 480, 480, '2021-02-27 22:27:50', '2021-02-27 19:27:50', 'FB IMG 16142832664513000', NULL, 0, 8, NULL, '102.167.22.83', 'datefolder', NULL, NULL, 'f2903eadcbf1bff96eb8ec85bdfeec67', NULL, 'FB_IMG_16142832664513000.jpg', '{\"FileName\":\"FB_IMG_16142832664513000.jpg\",\"FileDateTime\":\"1614454070\",\"FileSize\":\"127834\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 187, NULL, 5, 13721, 0, NULL, 0, 0, 1),
(310, 'FB_IMG_16140923311892116', 'jpg', 183626, 720, 673, '2021-02-27 23:07:16', '2021-02-27 20:07:16', 'FB IMG 16140923311892116', NULL, 0, 8, NULL, '102.167.194.231', 'datefolder', NULL, NULL, '029ba806f0d53e9b42caeb3f87bb8b08', NULL, 'FB_IMG_16140923311892116.jpg', '{\"FileName\":\"FB_IMG_16140923311892116.jpg\",\"FileDateTime\":\"1614456436\",\"FileSize\":\"183626\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"673\\\"\",\"Height\":\"673\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 203, NULL, 7, 10508, 53819, NULL, 0, 0, 1),
(312, 'tmp-cam-7135301254041089315', 'jpg', 14154, 320, 293, '2021-02-28 17:53:08', '2021-02-28 14:53:08', 'tmp cam 7135301254041089315', NULL, 0, 7, NULL, '102.23.98.17', 'datefolder', NULL, NULL, 'ce0b815a7a981fb3bbb33d6aee9d8cee', NULL, 'tmp-cam-7135301254041089315.jpg', '{\"FileName\":\"tmp-cam-7135301254041089315.jpg\",\"FileDateTime\":\"1614523988\",\"FileSize\":\"14154\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"293\\\"\",\"Height\":\"293\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 342, NULL, 5, 9113, 0, NULL, 0, 0, 1),
(313, 'FB_IMG_16146028128245693', 'jpg', 143371, 720, 557, '2021-03-01 17:04:58', '2021-03-01 14:04:58', 'FB IMG 16146028128245693', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'b87c91a87f2831d68f83ab85ad132531', NULL, 'FB_IMG_16146028128245693.jpg', '{\"FileName\":\"FB_IMG_16146028128245693.jpg\",\"FileDateTime\":\"1614607498\",\"FileSize\":\"143371\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"557\\\"\",\"Height\":\"557\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 331, NULL, 7, 9980, 42277, NULL, 0, 0, 1),
(314, 'inbound470760508865686531', 'jpg', 69972, 429, 298, '2021-03-02 08:45:36', '2021-03-02 05:45:36', 'inbound470760508865686531', NULL, 0, NULL, NULL, '102.167.112.16', 'datefolder', NULL, NULL, 'e7a6391e0316a29c5d6b7e6bd3a7df73', NULL, 'inbound470760508865686531.jpg', '{\"FileName\":\"inbound470760508865686531.jpg\",\"FileDateTime\":\"1614663936\",\"FileSize\":\"69972\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"429\\\" height=\\\"298\\\"\",\"Height\":\"298\",\"Width\":\"429\",\"IsColor\":\"1\"}}', 332, NULL, 5, 9786, 0, NULL, 0, 0, 1),
(315, '100647610_2955097151234703_1315267742227496960_n', 'jpg', 40993, 720, 628, '2021-03-03 13:07:49', '2021-03-03 10:07:49', '100647610 2955097151234703 1315267742227496960 n', NULL, 0, 12, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '910e5a8e158fa11c9e3e2d315bf05795', NULL, '100647610_2955097151234703_1315267742227496960_n.jpg', '{\"FileName\":\"100647610_2955097151234703_1315267742227496960_n.jpg\",\"FileDateTime\":\"1614766069\",\"FileSize\":\"40993\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"628\\\"\",\"Height\":\"628\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 247, NULL, 7, 10961, 48632, NULL, 0, 0, 1),
(316, 'IMG_20210303_125455_564', 'jpg', 46475, 720, 1280, '2021-03-05 15:44:29', '2021-03-05 12:44:29', 'IMG 20210303 125455 564', NULL, 0, NULL, NULL, '102.167.1.195', 'datefolder', NULL, NULL, 'c0e22acf6906be5b6f3ccc2e6d50c466', NULL, 'IMG_20210303_125455_564.jpg', '{\"FileName\":\"IMG_20210303_125455_564.jpg\",\"FileDateTime\":\"1614948269\",\"FileSize\":\"46475\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 363, NULL, 7, 11424, 69902, NULL, 0, 0, 1),
(317, 'FB_IMG_16151832754106864', 'jpg', 159103, 720, 914, '2021-03-08 09:38:02', '2021-03-08 06:38:02', 'FB IMG 16151832754106864', NULL, 0, 8, NULL, '102.167.243.127', 'datefolder', NULL, NULL, '94974c438cf824d271bd9c0a1cbfdb4f', NULL, 'FB_IMG_16151832754106864.jpg', '{\"FileName\":\"FB_IMG_16151832754106864.jpg\",\"FileDateTime\":\"1615185482\",\"FileSize\":\"159103\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"914\\\"\",\"Height\":\"914\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 314, NULL, 7, 9575, 52585, NULL, 0, 0, 1),
(318, 'FB_IMG_16153488515095120', 'jpg', 140398, 720, 720, '2021-03-13 11:44:33', '2021-03-13 08:44:33', 'FB IMG 16153488515095120', NULL, 0, 8, NULL, '154.122.63.238', 'datefolder', NULL, NULL, '57d97edfc1e5f620a83e80f640da517c', NULL, 'FB_IMG_16153488515095120.jpg', '{\"FileName\":\"FB_IMG_16153488515095120.jpg\",\"FileDateTime\":\"1615625073\",\"FileSize\":\"140398\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 302, NULL, 7, 8541, 46415, NULL, 0, 0, 1),
(319, 'IMG_20210315_213614_895', 'jpg', 55629, 720, 1280, '2021-03-15 21:57:15', '2021-03-15 18:57:15', 'IMG 20210315 213614 895', NULL, 0, 8, NULL, '197.156.137.160', 'datefolder', NULL, NULL, '98d0020cf2df54f434a69bb82decf265', NULL, 'IMG_20210315_213614_895.jpg', '{\"FileName\":\"IMG_20210315_213614_895.jpg\",\"FileDateTime\":\"1615834635\",\"FileSize\":\"55629\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 280, NULL, 7, 13067, 73568, NULL, 0, 0, 1),
(320, 'IMG_20210315_213603_269', 'jpg', 46361, 720, 1280, '2021-03-15 21:57:51', '2021-03-15 18:57:51', 'IMG 20210315 213603 269', NULL, 0, 8, NULL, '197.156.137.160', 'datefolder', NULL, NULL, 'ef62bc11bc3055a9c421a208f3eae9a5', NULL, 'IMG_20210315_213603_269.jpg', '{\"FileName\":\"IMG_20210315_213603_269.jpg\",\"FileDateTime\":\"1615834671\",\"FileSize\":\"46361\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 425, NULL, 7, 11124, 64952, NULL, 0, 0, 1),
(321, 'FB_IMG_16153552908650608', 'jpg', 60601, 476, 476, '2021-03-16 09:57:40', '2021-03-16 06:57:40', 'FB IMG 16153552908650608', NULL, 0, 8, NULL, '102.166.66.160', 'datefolder', NULL, NULL, '18bd6b1a584548a038c397ec663ce896', NULL, 'FB_IMG_16153552908650608.jpg', '{\"FileName\":\"FB_IMG_16153552908650608.jpg\",\"FileDateTime\":\"1615877860\",\"FileSize\":\"60601\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"476\\\" height=\\\"476\\\"\",\"Height\":\"476\",\"Width\":\"476\",\"IsColor\":\"1\"}}', 313, NULL, 5, 8951, 0, NULL, 0, 0, 1),
(322, 'IMG_20210317_193614_192', 'jpg', 30577, 479, 385, '2021-03-17 20:22:02', '2021-03-17 17:22:02', 'IMG 20210317 193614 192', NULL, 0, 8, NULL, '154.122.76.238', 'datefolder', NULL, NULL, 'cd6593a23d27e575656c80bb719005ff', NULL, 'IMG_20210317_193614_192.jpg', '{\"FileName\":\"IMG_20210317_193614_192.jpg\",\"FileDateTime\":\"1616001722\",\"FileSize\":\"30577\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"479\\\" height=\\\"385\\\"\",\"Height\":\"385\",\"Width\":\"479\",\"IsColor\":\"1\"}}', 375, NULL, 5, 9384, 0, NULL, 0, 0, 1),
(323, 'FB_IMG_16150122467477063', 'jpg', 181056, 720, 704, '2021-03-17 21:01:23', '2021-03-17 18:01:23', 'FB IMG 16150122467477063', NULL, 0, 8, NULL, '154.122.76.238', 'datefolder', NULL, NULL, '4eb49f0b5868c43b331a055bef6449eb', NULL, 'FB_IMG_16150122467477063.jpg', '{\"FileName\":\"FB_IMG_16150122467477063.jpg\",\"FileDateTime\":\"1616004083\",\"FileSize\":\"181056\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"704\\\"\",\"Height\":\"704\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 317, NULL, 7, 11270, 55861, NULL, 0, 0, 1),
(324, 'IMG_20210318_073923', 'jpg', 36812, 360, 335, '2021-03-19 14:00:54', '2021-03-19 11:00:54', 'IMG 20210318 073923', NULL, 0, 8, NULL, '197.156.137.168', 'datefolder', NULL, NULL, 'c0b2eee26cb143c3b75ec79d7efb0ed5', NULL, 'IMG_20210318_073923.jpg', '{\"FileName\":\"IMG_20210318_073923.jpg\",\"FileDateTime\":\"1616151654\",\"FileSize\":\"36812\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"360\\\" height=\\\"335\\\"\",\"Height\":\"335\",\"Width\":\"360\",\"IsColor\":\"1\"}}', 369, NULL, 5, 14312, 0, NULL, 0, 0, 1),
(325, 'FB_IMG_16161530678836108', 'jpg', 83452, 480, 480, '2021-03-19 16:22:15', '2021-03-19 13:22:15', 'FB IMG 16161530678836108', NULL, 0, 8, NULL, '197.156.190.133', 'datefolder', NULL, NULL, '9dec760d8a53fd72d10368b96661e619', NULL, 'FB_IMG_16161530678836108.jpg', '{\"FileName\":\"FB_IMG_16161530678836108.jpg\",\"FileDateTime\":\"1616160135\",\"FileSize\":\"83452\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 233, NULL, 5, 9978, 0, NULL, 0, 0, 1),
(326, 'IMG_20210320_103618', 'jpg', 153004, 687, 634, '2021-03-20 16:02:22', '2021-03-20 13:02:22', 'IMG 20210320 103618', NULL, 0, 8, NULL, '102.166.219.233', 'datefolder', NULL, NULL, '0fe8367c96236197aae8a5270449ab93', NULL, 'IMG_20210320_103618.jpg', '{\"FileName\":\"IMG_20210320_103618.jpg\",\"FileDateTime\":\"1616245342\",\"FileSize\":\"153004\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"687\\\" height=\\\"634\\\"\",\"Height\":\"634\",\"Width\":\"687\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"687\",\"ImageLength\":\"634\",\"DateTime\":\"2021:03:20 10:36:18\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"634\",\"ExifImageWidth\":\"687\"}', 299, NULL, 7, 14332, 69916, NULL, 0, 0, 1),
(327, 'IMG_20210321_125405_142', 'jpg', 114615, 720, 650, '2021-03-21 13:06:12', '2021-03-21 10:06:12', 'IMG 20210321 125405 142', NULL, 0, 8, NULL, '102.166.24.156', 'datefolder', NULL, NULL, '27f12a93be013ecf13a28a2ac237091b', NULL, 'IMG_20210321_125405_142.jpg', '{\"FileName\":\"IMG_20210321_125405_142.jpg\",\"FileDateTime\":\"1616321172\",\"FileSize\":\"114615\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"650\\\"\",\"Height\":\"650\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 269, NULL, 7, 13978, 68421, NULL, 0, 0, 1),
(328, 'FB_IMG_16153553126642633', 'jpg', 77144, 480, 351, '2021-03-24 14:46:02', '2021-03-24 11:46:02', 'FB IMG 16153553126642633', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '1b70e22333d966a5c512c20f0650e1d1', NULL, 'FB_IMG_16153553126642633.jpg', '{\"FileName\":\"FB_IMG_16153553126642633.jpg\",\"FileDateTime\":\"1616586362\",\"FileSize\":\"77144\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"351\\\"\",\"Height\":\"351\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 295, NULL, 5, 11886, 0, NULL, 0, 0, 1),
(329, 'FB_IMG_16151832754106864', 'jpg', 159103, 720, 914, '2021-03-24 14:46:32', '2021-03-24 11:46:32', 'FB IMG 16151832754106864', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, '94974c438cf824d271bd9c0a1cbfdb4f', NULL, 'FB_IMG_16151832754106864.jpg', '{\"FileName\":\"FB_IMG_16151832754106864.jpg\",\"FileDateTime\":\"1616586392\",\"FileSize\":\"159103\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"914\\\"\",\"Height\":\"914\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 209, NULL, 7, 9575, 52585, NULL, 0, 0, 1),
(330, 'tmp-cam-1042503328964024563', 'jpg', 16761, 311, 320, '2021-03-28 17:05:39', '2021-03-28 14:05:39', 'tmp cam 1042503328964024563', NULL, 0, 7, NULL, '102.23.98.20', 'datefolder', NULL, NULL, 'd9fc39a87ce2eddc3b1439c8bdf873e7', NULL, 'tmp-cam-1042503328964024563.jpg', '{\"FileName\":\"tmp-cam-1042503328964024563.jpg\",\"FileDateTime\":\"1616940339\",\"FileSize\":\"16761\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"311\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"311\",\"IsColor\":\"1\"}}', 205, NULL, 5, 10346, 0, NULL, 0, 0, 1),
(331, 'IMG_20210330_190654_736', 'jpg', 80039, 720, 900, '2021-03-31 18:15:30', '2021-03-31 15:15:30', 'IMG 20210330 190654 736', NULL, 0, 8, NULL, '197.156.137.162', 'datefolder', NULL, NULL, 'b0fec14e21ea70e708cfeb0989bc5df1', NULL, 'IMG_20210330_190654_736.jpg', '{\"FileName\":\"IMG_20210330_190654_736.jpg\",\"FileDateTime\":\"1617203730\",\"FileSize\":\"80039\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"900\\\"\",\"Height\":\"900\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 226, NULL, 7, 11755, 58528, NULL, 0, 0, 1),
(332, 'tmp-cam-9053871419964449596', 'jpg', 22671, 320, 320, '2021-04-01 17:13:38', '2021-04-01 14:13:38', 'tmp cam 9053871419964449596', NULL, 0, 7, NULL, '102.23.98.13', 'datefolder', NULL, NULL, '81479355a6a348cfe398fdbe51035da5', NULL, 'tmp-cam-9053871419964449596.jpg', '{\"FileName\":\"tmp-cam-9053871419964449596.jpg\",\"FileDateTime\":\"1617286418\",\"FileSize\":\"22671\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 238, NULL, 5, 12303, 0, NULL, 0, 0, 1),
(333, 'FB_IMG_16172204094620288', 'jpg', 134333, 720, 625, '2021-04-01 17:18:28', '2021-04-01 14:18:28', 'FB IMG 16172204094620288', NULL, 0, 8, NULL, '154.122.5.66', 'datefolder', NULL, NULL, '8489e47512c4b9afe1863865ce8321bd', NULL, 'FB_IMG_16172204094620288.jpg', '{\"FileName\":\"FB_IMG_16172204094620288.jpg\",\"FileDateTime\":\"1617286708\",\"FileSize\":\"134333\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"625\\\"\",\"Height\":\"625\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 148, NULL, 7, 10029, 43834, NULL, 0, 0, 1),
(334, 'FB_IMG_16169289985525666', 'jpg', 50938, 320, 320, '2021-04-02 16:26:39', '2021-04-02 13:26:39', 'FB IMG 16169289985525666', NULL, 0, 8, NULL, '102.166.169.188', 'datefolder', NULL, NULL, '1f3f00e46d509569f3388798dda6b077', NULL, 'FB_IMG_16169289985525666.jpg', '{\"FileName\":\"FB_IMG_16169289985525666.jpg\",\"FileDateTime\":\"1617369999\",\"FileSize\":\"50938\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 183, NULL, 5, 10544, 0, NULL, 0, 0, 1),
(335, 'IMG_20210403_121805_084', 'jpg', 40944, 720, 1280, '2021-04-03 14:06:47', '2021-04-03 11:06:47', 'IMG 20210403 121805 084', NULL, 0, 8, NULL, '197.156.137.147', 'datefolder', NULL, NULL, 'd04a5ea47931a4f9291920c477997934', NULL, 'IMG_20210403_121805_084.jpg', '{\"FileName\":\"IMG_20210403_121805_084.jpg\",\"FileDateTime\":\"1617448006\",\"FileSize\":\"40944\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 226, NULL, 7, 10925, 62630, NULL, 0, 0, 1),
(336, 'tmp-cam-7534169344664724140', 'jpg', 19880, 313, 320, '2021-04-03 14:37:36', '2021-04-03 11:37:36', 'tmp cam 7534169344664724140', NULL, 0, 7, 1, '102.23.98.19', 'datefolder', NULL, NULL, '1396768947f2e4bfee480e5818dcc760', NULL, 'tmp-cam-7534169344664724140.jpg', '{\"FileName\":\"tmp-cam-7534169344664724140.jpg\",\"FileDateTime\":\"1617449856\",\"FileSize\":\"19880\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"313\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"313\",\"IsColor\":\"1\"}}', 273, NULL, 5, 11918, 0, NULL, 0, 0, 1),
(337, 'IMG_20210406_230531_494', 'jpg', 48831, 720, 1280, '2021-04-07 20:20:47', '2021-04-07 17:20:47', 'IMG 20210406 230531 494', NULL, 0, 8, NULL, '154.122.22.195', 'datefolder', NULL, NULL, 'e1f58f145d0ee19b5fe3b05779964639', NULL, 'IMG_20210406_230531_494.jpg', '{\"FileName\":\"IMG_20210406_230531_494.jpg\",\"FileDateTime\":\"1617816047\",\"FileSize\":\"48831\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 224, NULL, 7, 11118, 66283, NULL, 0, 0, 1),
(338, 'IMG_20210406_230524_667', 'jpg', 40154, 720, 1280, '2021-04-08 09:47:30', '2021-04-08 06:47:30', 'IMG 20210406 230524 667', NULL, 0, 8, NULL, '102.167.58.122', 'datefolder', NULL, NULL, 'f5ad16fb4651ddc8943b295b58a9dab7', NULL, 'IMG_20210406_230524_667.jpg', '{\"FileName\":\"IMG_20210406_230524_667.jpg\",\"FileDateTime\":\"1617864450\",\"FileSize\":\"40154\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 278, NULL, 7, 10785, 56337, NULL, 0, 0, 1),
(339, 'IMG_20210406_230430_700', 'jpg', 44405, 720, 1280, '2021-04-09 00:35:48', '2021-04-08 21:35:48', 'IMG 20210406 230430 700', NULL, 0, 8, NULL, '102.167.142.6', 'datefolder', NULL, NULL, '44b5acb25092f3069ea4d08165c7c8cf', NULL, 'IMG_20210406_230430_700.jpg', '{\"FileName\":\"IMG_20210406_230430_700.jpg\",\"FileDateTime\":\"1617917748\",\"FileSize\":\"44405\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 229, NULL, 7, 11233, 63712, NULL, 0, 0, 1),
(340, 'tmp-cam-6973843082991027606', 'jpg', 15007, 320, 290, '2021-04-13 21:12:47', '2021-04-13 18:12:47', 'tmp cam 6973843082991027606', NULL, 0, 7, NULL, '82.145.211.193', 'datefolder', NULL, NULL, '7ee257a660ff9f720b6bc85014216900', NULL, 'tmp-cam-6973843082991027606.jpg', '{\"FileName\":\"tmp-cam-6973843082991027606.jpg\",\"FileDateTime\":\"1618337566\",\"FileSize\":\"15007\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"290\\\"\",\"Height\":\"290\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 133, NULL, 5, 10320, 0, NULL, 0, 0, 1),
(341, 'tmp-cam-4001453018301104582', 'jpg', 13118, 295, 320, '2021-04-13 21:19:16', '2021-04-13 18:19:16', 'tmp cam 4001453018301104582', NULL, 0, 7, NULL, '82.145.212.130', 'datefolder', NULL, NULL, 'adb4e651e4f40264783d30bd77dd62a7', NULL, 'tmp-cam-4001453018301104582.jpg', '{\"FileName\":\"tmp-cam-4001453018301104582.jpg\",\"FileDateTime\":\"1618337956\",\"FileSize\":\"13118\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"295\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"295\",\"IsColor\":\"1\"}}', 295, NULL, 5, 8961, 0, NULL, 0, 0, 1),
(342, 'FB_IMG_1603384454938', 'jpg', 13833, 316, 316, '2021-04-13 21:30:22', '2021-04-13 18:30:22', 'FB IMG 1603384454938', NULL, 0, 7, NULL, '82.145.212.130', 'datefolder', NULL, NULL, '95eeb94cf408e1d7a468beb8e9e49d2a', NULL, 'FB_IMG_1603384454938.jpg', '{\"FileName\":\"FB_IMG_1603384454938.jpg\",\"FileDateTime\":\"1618338621\",\"FileSize\":\"13833\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"316\\\" height=\\\"316\\\"\",\"Height\":\"316\",\"Width\":\"316\",\"IsColor\":\"1\"}}', 213, NULL, 5, 13702, 0, NULL, 0, 0, 1),
(343, 'IMG_20210414_130131_368', 'jpg', 56136, 678, 597, '2021-04-15 14:47:13', '2021-04-15 11:47:13', 'IMG 20210414 130131 368', NULL, 0, 8, NULL, '154.123.54.167', 'datefolder', NULL, NULL, 'af05d3ded072caa72debb8590c5bb0a1', NULL, 'IMG_20210414_130131_368.jpg', '{\"FileName\":\"IMG_20210414_130131_368.jpg\",\"FileDateTime\":\"1618487233\",\"FileSize\":\"56136\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"678\\\" height=\\\"597\\\"\",\"Height\":\"597\",\"Width\":\"678\",\"IsColor\":\"1\"}}', 223, NULL, 7, 11064, 50086, NULL, 0, 0, 1),
(344, 'FB_IMG_16184757938926521', 'jpg', 116099, 480, 480, '2021-04-15 20:46:21', '2021-04-15 17:46:21', 'FB IMG 16184757938926521', NULL, 0, 8, NULL, '41.90.4.251', 'datefolder', NULL, NULL, 'e67aec2bd1e34c92448bd4bd254c951c', NULL, 'FB_IMG_16184757938926521.jpg', '{\"FileName\":\"FB_IMG_16184757938926521.jpg\",\"FileDateTime\":\"1618508781\",\"FileSize\":\"116099\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 221, NULL, 5, 12382, 0, NULL, 0, 0, 1),
(345, 'FB_IMG_16180768786768125', 'jpg', 262552, 720, 709, '2021-04-15 20:49:01', '2021-04-15 17:49:01', 'FB IMG 16180768786768125', NULL, 0, 8, NULL, '41.90.4.251', 'datefolder', NULL, NULL, '7c2b8343777e294aa528bc477f3fa1d8', NULL, 'FB_IMG_16180768786768125.jpg', '{\"FileName\":\"FB_IMG_16180768786768125.jpg\",\"FileDateTime\":\"1618508941\",\"FileSize\":\"262552\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"709\\\"\",\"Height\":\"709\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 224, NULL, 7, 14386, 77016, NULL, 0, 0, 1),
(347, 'FB_IMG_16184758023270933', 'jpg', 119255, 480, 480, '2021-04-17 15:56:44', '2021-04-17 12:56:44', 'FB IMG 16184758023270933', NULL, 0, 8, NULL, '154.122.115.132', 'datefolder', NULL, NULL, '06e3f07b42cb70d8e3ef6cf016cfd81c', NULL, 'FB_IMG_16184758023270933.jpg', '{\"FileName\":\"FB_IMG_16184758023270933.jpg\",\"FileDateTime\":\"1618664204\",\"FileSize\":\"119255\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 148, NULL, 5, 14388, 0, NULL, 0, 0, 1),
(348, 'IMG_20210417_163439_889', 'jpg', 70177, 720, 1280, '2021-04-19 21:51:52', '2021-04-19 18:51:52', 'IMG 20210417 163439 889', NULL, 0, 8, NULL, '102.167.233.113', 'datefolder', NULL, NULL, '5a83044a48820bd15c56e56c259d6a7c', NULL, 'IMG_20210417_163439_889.jpg', '{\"FileName\":\"IMG_20210417_163439_889.jpg\",\"FileDateTime\":\"1618858312\",\"FileSize\":\"70177\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 182, NULL, 7, 13465, 85842, NULL, 0, 0, 1),
(350, 'IMG_20210417_163407_723', 'jpg', 45173, 720, 1280, '2021-04-20 08:33:54', '2021-04-20 05:33:54', 'IMG 20210417 163407 723', NULL, 0, 8, NULL, '154.122.1.52', 'datefolder', NULL, NULL, 'd79c4aa4600eebbe7b2577fb770f97c6', NULL, 'IMG_20210417_163407_723.jpg', '{\"FileName\":\"IMG_20210417_163407_723.jpg\",\"FileDateTime\":\"1618896833\",\"FileSize\":\"45173\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 140, NULL, 7, 11749, 61930, NULL, 0, 0, 1),
(351, 'FB_IMG_16184758125032404', 'jpg', 96898, 480, 480, '2021-04-20 08:39:31', '2021-04-20 05:39:31', 'FB IMG 16184758125032404', NULL, 0, 8, NULL, '154.122.1.52', 'datefolder', NULL, NULL, 'eb8b1197920e2f62f6396bb7d426aea6', NULL, 'FB_IMG_16184758125032404.jpg', '{\"FileName\":\"FB_IMG_16184758125032404.jpg\",\"FileDateTime\":\"1618897171\",\"FileSize\":\"96898\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"480\\\"\",\"Height\":\"480\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 143, NULL, 5, 10263, 0, NULL, 0, 0, 1),
(352, 'tmp-cam-8336259078288301789', 'jpg', 17538, 317, 320, '2021-04-20 11:24:32', '2021-04-20 08:24:32', 'tmp cam 8336259078288301789', NULL, 0, 7, NULL, '102.23.98.16', 'datefolder', NULL, NULL, '5fcdf56fd7893e8344735c1b35a53add', NULL, 'tmp-cam-8336259078288301789.jpg', '{\"FileName\":\"tmp-cam-8336259078288301789.jpg\",\"FileDateTime\":\"1618907072\",\"FileSize\":\"17538\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"317\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"317\",\"IsColor\":\"1\"}}', 131, NULL, 5, 11285, 0, NULL, 0, 0, 1),
(354, 'FB_IMG_16169634131991918', 'jpg', 34724, 333, 223, '2021-04-20 16:34:07', '2021-04-20 13:34:07', 'FB IMG 16169634131991918', NULL, 0, 8, NULL, '102.166.156.203', 'datefolder', NULL, NULL, 'ea1936dc6208ab07f3e4401897f097a3', NULL, 'FB_IMG_16169634131991918.jpg', '{\"FileName\":\"FB_IMG_16169634131991918.jpg\",\"FileDateTime\":\"1618925647\",\"FileSize\":\"34724\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"333\\\" height=\\\"223\\\"\",\"Height\":\"223\",\"Width\":\"333\",\"IsColor\":\"1\"}}', 149, NULL, 5, 11544, 0, NULL, 0, 0, 1),
(355, 'FB_IMG_16169289985525666', 'jpg', 50938, 320, 320, '2021-04-21 09:12:54', '2021-04-21 06:12:54', 'FB IMG 16169289985525666', NULL, 0, 8, NULL, '102.166.209.225', 'datefolder', NULL, NULL, '1f3f00e46d509569f3388798dda6b077', NULL, 'FB_IMG_16169289985525666.jpg', '{\"FileName\":\"FB_IMG_16169289985525666.jpg\",\"FileDateTime\":\"1618985574\",\"FileSize\":\"50938\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 105, NULL, 5, 10544, 0, NULL, 0, 0, 1),
(356, 'tmp-cam-8284043420835988055', 'jpg', 20748, 320, 320, '2021-04-21 09:42:04', '2021-04-21 06:42:04', 'tmp cam 8284043420835988055', NULL, 0, 7, NULL, '102.23.98.19', 'datefolder', NULL, NULL, 'b0cb3e1a6a9c264db5bacb76e58de870', NULL, 'tmp-cam-8284043420835988055.jpg', '{\"FileName\":\"tmp-cam-8284043420835988055.jpg\",\"FileDateTime\":\"1618987324\",\"FileSize\":\"20748\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"320\\\" height=\\\"320\\\"\",\"Height\":\"320\",\"Width\":\"320\",\"IsColor\":\"1\"}}', 144, NULL, 5, 12369, 0, NULL, 0, 0, 1),
(357, 'FB_IMG_16166116535497877', 'jpg', 52649, 330, 297, '2021-04-23 09:56:02', '2021-04-23 06:56:02', 'FB IMG 16166116535497877', NULL, 0, 8, NULL, '102.166.244.216', 'datefolder', NULL, NULL, 'b01a3cc0c6a8d85e10eb90fc30874679', NULL, 'FB_IMG_16166116535497877.jpg', '{\"FileName\":\"FB_IMG_16166116535497877.jpg\",\"FileDateTime\":\"1619160962\",\"FileSize\":\"52649\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"330\\\" height=\\\"297\\\"\",\"Height\":\"297\",\"Width\":\"330\",\"IsColor\":\"1\"}}', 155, NULL, 5, 11603, 0, NULL, 0, 0, 1),
(358, 'FB_IMG_1618251318774', 'jpg', 40193, 720, 615, '2021-04-24 10:33:23', '2021-04-24 07:33:23', 'FB IMG 1618251318774', NULL, 0, 8, NULL, '102.166.204.223', 'datefolder', NULL, NULL, 'f12af2d241058d33a7376b66954911cd', NULL, 'FB_IMG_1618251318774.jpg', '{\"FileName\":\"FB_IMG_1618251318774.jpg\",\"FileDateTime\":\"1619249603\",\"FileSize\":\"40193\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"615\\\"\",\"Height\":\"615\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 99, NULL, 7, 13802, 62880, NULL, 0, 0, 1),
(359, '10b772357c6c4e8fabb85787464bcd61', 'jpg', 18301, 471, 471, '2021-04-24 10:36:51', '2021-04-24 07:36:51', '10b772357c6c4e8fabb85787464bcd61', NULL, 0, 7, NULL, '102.23.98.16', 'datefolder', NULL, NULL, 'db5df3380574e5bd949340a32e3434c8', NULL, '10b772357c6c4e8fabb85787464bcd61.jpg', '{\"FileName\":\"10b772357c6c4e8fabb85787464bcd61.jpg\",\"FileDateTime\":\"1619249811\",\"FileSize\":\"18301\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"471\\\" height=\\\"471\\\"\",\"Height\":\"471\",\"Width\":\"471\",\"IsColor\":\"1\"}}', 115, NULL, 5, 10071, 0, NULL, 0, 0, 1),
(360, 'IMG_20210302_101140', 'jpg', 139857, 720, 836, '2021-04-24 19:55:57', '2021-04-24 16:55:57', 'IMG 20210302 101140', NULL, 0, 8, NULL, '102.166.84.53', 'datefolder', NULL, NULL, '9496be5f3a78ebd32ec8eb52e5fea3b1', NULL, 'IMG_20210302_101140.jpg', '{\"FileName\":\"IMG_20210302_101140.jpg\",\"FileDateTime\":\"1619283357\",\"FileSize\":\"139857\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"836\\\"\",\"Height\":\"836\",\"Width\":\"720\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"720\",\"ImageLength\":\"836\",\"DateTime\":\"2021:03:02 10:11:40\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"836\",\"ExifImageWidth\":\"720\"}', 95, NULL, 7, 9493, 61199, NULL, 0, 0, 1),
(361, 'FB_IMG_16174499657285245', 'jpg', 194517, 600, 889, '2021-04-25 10:26:30', '2021-04-25 07:26:30', 'FB IMG 16174499657285245', NULL, 0, 8, NULL, '102.167.132.231', 'datefolder', NULL, NULL, '4c624b3f32ec2bbeaab07640f7b188a4', NULL, 'FB_IMG_16174499657285245.jpg', '{\"FileName\":\"FB_IMG_16174499657285245.jpg\",\"FileDateTime\":\"1619335590\",\"FileSize\":\"194517\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"600\\\" height=\\\"889\\\"\",\"Height\":\"889\",\"Width\":\"600\",\"IsColor\":\"1\"}}', 40, NULL, 7, 11402, 79715, NULL, 0, 0, 1),
(363, 'IMG_20210425_105741_800', 'jpg', 33299, 720, 1280, '2021-04-25 14:40:05', '2021-04-25 11:40:05', 'IMG 20210425 105741 800', NULL, 0, 8, NULL, '154.122.20.250', 'datefolder', NULL, NULL, 'e4ca45e3eb63237c626596fc818246ff', NULL, 'IMG_20210425_105741_800.jpg', '{\"FileName\":\"IMG_20210425_105741_800.jpg\",\"FileDateTime\":\"1619350805\",\"FileSize\":\"33299\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 70, NULL, 7, 8144, 50401, NULL, 0, 0, 1),
(364, 'IMG_20210426_094852_723', 'jpg', 106252, 718, 732, '2021-04-26 09:50:55', '2021-04-26 06:50:55', 'IMG 20210426 094852 723', NULL, 0, 8, NULL, '154.122.62.92', 'datefolder', NULL, NULL, '5d5291efa50bcb6c6a89247cfeb89c6e', NULL, 'IMG_20210426_094852_723.jpg', '{\"FileName\":\"IMG_20210426_094852_723.jpg\",\"FileDateTime\":\"1619419855\",\"FileSize\":\"106252\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"718\\\" height=\\\"732\\\"\",\"Height\":\"732\",\"Width\":\"718\",\"IsColor\":\"1\"}}', 71, NULL, 7, 12936, 65066, NULL, 0, 0, 1),
(365, 'inbound4929055262381000628', 'jpg', 142615, 702, 709, '2021-04-26 11:33:17', '2021-04-26 08:33:17', 'inbound4929055262381000628', NULL, 0, NULL, NULL, '102.167.28.120', 'datefolder', NULL, NULL, '8295e6cfc5b0e6d7115fb8e6d74c5638', NULL, 'inbound4929055262381000628.jpg', '{\"FileName\":\"inbound4929055262381000628.jpg\",\"FileDateTime\":\"1619425997\",\"FileSize\":\"142615\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"702\\\" height=\\\"709\\\"\",\"Height\":\"709\",\"Width\":\"702\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"702\",\"ImageLength\":\"709\",\"DateTime\":\"2021:04:26 09:44:06\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"709\",\"ExifImageWidth\":\"702\"}', 48, NULL, 7, 12544, 67489, NULL, 0, 0, 1),
(366, 'IMG_20210426_133207_826', 'jpg', 47740, 720, 1280, '2021-04-26 18:49:01', '2021-04-26 15:49:01', 'IMG 20210426 133207 826', NULL, 0, 8, NULL, '102.166.75.164', 'datefolder', NULL, NULL, 'e469f375b07875ceda07122d5c6d2324', NULL, 'IMG_20210426_133207_826.jpg', '{\"FileName\":\"IMG_20210426_133207_826.jpg\",\"FileDateTime\":\"1619452141\",\"FileSize\":\"47740\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 78, NULL, 7, 11235, 65479, NULL, 0, 0, 1),
(367, 'IMG_20210427_113940_617', 'jpg', 92553, 720, 723, '2021-04-27 12:17:33', '2021-04-27 09:17:33', 'IMG 20210427 113940 617', NULL, 0, 7, NULL, '197.156.137.161', 'datefolder', NULL, NULL, '9aa295ef4c17cbf9b27f796b81f1561e', NULL, 'IMG_20210427_113940_617.jpg', '{\"FileName\":\"IMG_20210427_113940_617.jpg\",\"FileDateTime\":\"1619515053\",\"FileSize\":\"92553\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"723\\\"\",\"Height\":\"723\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 112, NULL, 7, 10099, 53981, NULL, 0, 0, 1),
(368, 'IMG_20210426_133306_763', 'jpg', 59940, 720, 1280, '2021-04-27 12:17:56', '2021-04-27 09:17:56', 'IMG 20210426 133306 763', NULL, 0, 7, NULL, '197.156.137.161', 'datefolder', NULL, NULL, '1cdbbe10c6e2153ca6147be6f5198486', NULL, 'IMG_20210426_133306_763.jpg', '{\"FileName\":\"IMG_20210426_133306_763.jpg\",\"FileDateTime\":\"1619515076\",\"FileSize\":\"59940\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 72, NULL, 7, 11245, 71707, NULL, 0, 0, 1),
(369, 'IMG_20210426_132940_866', 'jpg', 45098, 720, 1280, '2021-04-27 12:19:05', '2021-04-27 09:19:05', 'IMG 20210426 132940 866', NULL, 0, 8, NULL, '197.156.137.161', 'datefolder', NULL, NULL, '256b1d005a4ad62c6275772b4925296f', NULL, 'IMG_20210426_132940_866.jpg', '{\"FileName\":\"IMG_20210426_132940_866.jpg\",\"FileDateTime\":\"1619515145\",\"FileSize\":\"45098\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 67, NULL, 7, 10999, 59955, NULL, 0, 0, 1),
(370, 'IMG_20210427_122548', 'jpg', 19774, 360, 339, '2021-04-27 13:15:43', '2021-04-27 10:15:43', 'IMG 20210427 122548', 'Very painful 😢 😢 😢', 0, 8, 0, '197.156.137.161', 'datefolder', NULL, NULL, '869712a0e692d581175e126fe2e83182', NULL, 'IMG_20210427_122548.jpg', '{\"FileName\":\"IMG_20210427_122548.jpg\",\"FileDateTime\":\"1619518543\",\"FileSize\":\"19774\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"360\\\" height=\\\"339\\\"\",\"Height\":\"339\",\"Width\":\"360\",\"IsColor\":\"1\"}}', 105, NULL, 5, 9511, 0, NULL, 0, 0, 1),
(371, 'FB_IMG_16196923002216145', 'jpg', 206453, 720, 697, '2021-04-29 18:18:13', '2021-04-29 15:18:13', 'FB IMG 16196923002216145', NULL, 0, 8, NULL, '154.123.23.50', 'datefolder', NULL, NULL, '96c831debbd49589431c3e347325c600', NULL, 'FB_IMG_16196923002216145.jpg', '{\"FileName\":\"FB_IMG_16196923002216145.jpg\",\"FileDateTime\":\"1619709492\",\"FileSize\":\"206453\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"697\\\"\",\"Height\":\"697\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 72, NULL, 7, 12390, 59332, NULL, 0, 0, 1),
(372, 'IMG_20210429_082508_916', 'jpg', 49784, 720, 1280, '2021-04-29 21:11:28', '2021-04-29 18:11:28', 'IMG 20210429 082508 916', NULL, 0, 8, NULL, '102.167.226.246', 'datefolder', NULL, NULL, '29d10d8199240d345277f2ac39e5ea30', NULL, 'IMG_20210429_082508_916.jpg', '{\"FileName\":\"IMG_20210429_082508_916.jpg\",\"FileDateTime\":\"1619719888\",\"FileSize\":\"49784\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 75, NULL, 7, 11281, 65487, NULL, 0, 0, 1),
(373, 'IMG_20210501_111243_469', 'jpg', 141382, 700, 700, '2021-05-01 11:30:56', '2021-05-01 08:30:56', 'IMG 20210501 111243 469', NULL, 0, 8, NULL, '154.122.117.110', 'datefolder', NULL, NULL, '7bce59c26c500b2b38ce3f7a435049b6', NULL, 'IMG_20210501_111243_469.jpg', '{\"FileName\":\"IMG_20210501_111243_469.jpg\",\"FileDateTime\":\"1619857856\",\"FileSize\":\"141382\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"700\\\" height=\\\"700\\\"\",\"Height\":\"700\",\"Width\":\"700\",\"IsColor\":\"1\"}}', 29, NULL, 7, 14623, 80669, NULL, 0, 0, 1),
(375, 'FB_IMG_16170251288426430', 'jpg', 117147, 480, 394, '2021-05-01 12:10:41', '2021-05-01 09:10:41', 'FB IMG 16170251288426430', NULL, 0, 8, NULL, '102.166.127.218', 'datefolder', NULL, NULL, '1468eed15fe763426630c527599bafbc', NULL, 'FB_IMG_16170251288426430.jpg', '{\"FileName\":\"FB_IMG_16170251288426430.jpg\",\"FileDateTime\":\"1619860241\",\"FileSize\":\"117147\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"480\\\" height=\\\"394\\\"\",\"Height\":\"394\",\"Width\":\"480\",\"IsColor\":\"1\"}}', 163, NULL, 5, 13998, 0, NULL, 0, 0, 1),
(376, 'IMG_20210327_113601', 'jpg', 48472, 444, 741, '2021-05-01 12:19:46', '2021-05-01 09:19:46', 'IMG 20210327 113601', NULL, 0, 8, NULL, '102.166.127.218', 'datefolder', NULL, NULL, 'd78887c128a1e45d726aa8e9161e0013', NULL, 'IMG_20210327_113601.jpg', '{\"FileName\":\"IMG_20210327_113601.jpg\",\"FileDateTime\":\"1619860786\",\"FileSize\":\"48472\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"ANY_TAG, IFD0, EXIF\",\"COMPUTED\":{\"html\":\"width=\\\"444\\\" height=\\\"741\\\"\",\"Height\":\"741\",\"Width\":\"444\",\"IsColor\":\"1\",\"ByteOrderMotorola\":\"1\"},\"ImageWidth\":\"444\",\"ImageLength\":\"741\",\"DateTime\":\"2021:03:27 11:36:01\",\"Orientation\":\"1\",\"Exif_IFD_Pointer\":\"94\",\"ExifImageLength\":\"741\",\"ExifImageWidth\":\"444\"}', 171, NULL, 5, 12092, 0, NULL, 0, 0, 1),
(378, 'IMG_20210501_221826_177', 'jpg', 53671, 720, 1280, '2021-05-01 22:41:15', '2021-05-01 19:41:15', 'IMG 20210501 221826 177', NULL, 0, 8, NULL, '102.167.56.228', 'datefolder', NULL, NULL, '30fe24fad7bc3086aa1a26c9c053abfe', NULL, 'IMG_20210501_221826_177.jpg', '{\"FileName\":\"IMG_20210501_221826_177.jpg\",\"FileDateTime\":\"1619898075\",\"FileSize\":\"53671\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 71, NULL, 7, 11656, 70347, NULL, 0, 0, 1),
(379, 'IMG_20210503_065251_560', 'jpg', 45421, 720, 1280, '2021-05-03 17:26:13', '2021-05-03 14:26:13', 'IMG 20210503 065251 560', NULL, 0, 8, NULL, '102.167.201.207', 'datefolder', NULL, NULL, '1f9af827c31053d6d9c0f9bc84fa7945', NULL, 'IMG_20210503_065251_560.jpg', '{\"FileName\":\"IMG_20210503_065251_560.jpg\",\"FileDateTime\":\"1620051973\",\"FileSize\":\"45421\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 56, NULL, 7, 11487, 61229, NULL, 0, 0, 1),
(381, 'IMG_20210505_094958_378', 'jpg', 59189, 720, 1280, '2021-05-07 15:12:47', '2021-05-07 12:12:47', 'IMG 20210505 094958 378', NULL, 0, 8, NULL, '41.76.168.176', 'datefolder', NULL, NULL, 'c8e1116b8406c988f8978c4a8e639f6e', NULL, 'IMG_20210505_094958_378.jpg', '{\"FileName\":\"IMG_20210505_094958_378.jpg\",\"FileDateTime\":\"1620389567\",\"FileSize\":\"59189\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 70, NULL, 7, 12486, 73350, NULL, 0, 0, 1),
(382, 'IMG_20210510_185837_149', 'jpg', 44095, 720, 1280, '2021-05-10 21:44:03', '2021-05-10 18:44:03', 'IMG 20210510 185837 149', NULL, 0, 8, NULL, '196.97.94.243', 'datefolder', NULL, NULL, 'dbbc4dd6d328c8bcd3ac61c206da7b7e', NULL, 'IMG_20210510_185837_149.jpg', '{\"FileName\":\"IMG_20210510_185837_149.jpg\",\"FileDateTime\":\"1620672243\",\"FileSize\":\"44095\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 12, NULL, 7, 10544, 62998, NULL, 0, 0, 1),
(383, 'FB_IMG_16207336382736228', 'jpg', 177006, 719, 971, '2021-05-14 13:22:28', '2021-05-14 10:22:28', 'FB IMG 16207336382736228', NULL, 0, 8, NULL, '105.160.103.77', 'datefolder', NULL, NULL, '68d69e3dbcc17a51647a06caeb9fa3a9', NULL, 'FB_IMG_16207336382736228.jpg', '{\"FileName\":\"FB_IMG_16207336382736228.jpg\",\"FileDateTime\":\"1620987748\",\"FileSize\":\"177006\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"719\\\" height=\\\"971\\\"\",\"Height\":\"971\",\"Width\":\"719\",\"IsColor\":\"1\"}}', 96, NULL, 7, 9193, 51932, NULL, 0, 0, 1),
(385, 'IMG_20210516_100744_552', 'jpg', 46864, 720, 1280, '2021-05-16 19:23:30', '2021-05-16 16:23:30', 'IMG 20210516 100744 552', NULL, 0, 8, NULL, '105.160.9.182', 'datefolder', NULL, NULL, 'a08dcbb0227e4f76816769fbfa618201', NULL, 'IMG_20210516_100744_552.jpg', '{\"FileName\":\"IMG_20210516_100744_552.jpg\",\"FileDateTime\":\"1621182210\",\"FileSize\":\"46864\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"1280\\\"\",\"Height\":\"1280\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 26, NULL, 7, 10338, 63495, NULL, 0, 0, 1),
(386, 'IMG_20210519_231831_532', 'jpg', 77500, 720, 720, '2021-05-20 12:33:50', '2021-05-20 09:33:50', 'IMG 20210519 231831 532', NULL, 0, 8, NULL, '105.160.54.229', 'datefolder', NULL, NULL, '1c647b9f6d416c4bd81d930630217ecb', NULL, 'IMG_20210519_231831_532.jpg', '{\"FileName\":\"IMG_20210519_231831_532.jpg\",\"FileDateTime\":\"1621503230\",\"FileSize\":\"77500\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"720\\\" height=\\\"720\\\"\",\"Height\":\"720\",\"Width\":\"720\",\"IsColor\":\"1\"}}', 33, NULL, 7, 13311, 64902, NULL, 0, 0, 1),
(387, 'inbound470760508865686531', 'jpg', 69972, 429, 298, '2021-05-23 18:05:58', '2021-05-23 15:05:58', 'inbound470760508865686531', NULL, 0, 8, NULL, '196.201.210.195', 'datefolder', NULL, NULL, 'e7a6391e0316a29c5d6b7e6bd3a7df73', NULL, 'inbound470760508865686531.jpg', '{\"FileName\":\"inbound470760508865686531.jpg\",\"FileDateTime\":\"1621782358\",\"FileSize\":\"69972\",\"FileType\":\"2\",\"MimeType\":\"image\\/jpeg\",\"SectionsFound\":\"\",\"COMPUTED\":{\"html\":\"width=\\\"429\\\" height=\\\"298\\\"\",\"Height\":\"298\",\"Width\":\"429\",\"IsColor\":\"1\"}}', 23, NULL, 5, 9786, 0, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chv_importing`
--

CREATE TABLE `chv_importing` (
  `importing_id` bigint NOT NULL,
  `importing_import_id` bigint NOT NULL,
  `importing_path` varchar(4096) NOT NULL,
  `importing_content_type` enum('user','album','image') NOT NULL,
  `importing_content_id` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chv_imports`
--

CREATE TABLE `chv_imports` (
  `import_id` bigint NOT NULL,
  `import_path` varchar(4096) NOT NULL,
  `import_options` varchar(255) DEFAULT NULL,
  `import_status` enum('queued','working','paused','canceled','completed') NOT NULL,
  `import_users` bigint NOT NULL DEFAULT '0',
  `import_images` bigint NOT NULL DEFAULT '0',
  `import_albums` bigint NOT NULL DEFAULT '0',
  `import_time_created` datetime DEFAULT NULL,
  `import_time_updated` datetime DEFAULT NULL,
  `import_errors` tinyint(1) NOT NULL DEFAULT '0',
  `import_started` tinyint(1) NOT NULL DEFAULT '0',
  `import_continuous` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chv_imports`
--

INSERT INTO `chv_imports` (`import_id`, `import_path`, `import_options`, `import_status`, `import_users`, `import_images`, `import_albums`, `import_time_created`, `import_time_updated`, `import_errors`, `import_started`, `import_continuous`) VALUES
(1, '/opt/lampp/htdocs/test2/importing/no-parse', 'a:1:{s:4:\"root\";s:5:\"plain\";}', 'working', 0, 0, 0, '2020-11-13 09:33:21', '2020-11-13 09:33:21', 0, 1, 1),
(2, '/opt/lampp/htdocs/test2/importing/parse-users', 'a:1:{s:4:\"root\";s:5:\"users\";}', 'working', 0, 0, 0, '2020-11-13 09:33:21', '2020-11-13 09:33:21', 0, 1, 1),
(3, '/opt/lampp/htdocs/test2/importing/parse-albums', 'a:1:{s:4:\"root\";s:6:\"albums\";}', 'working', 0, 0, 0, '2020-11-13 09:33:22', '2020-11-13 09:33:22', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chv_ip_bans`
--

CREATE TABLE `chv_ip_bans` (
  `ip_ban_id` bigint NOT NULL,
  `ip_ban_date` datetime NOT NULL,
  `ip_ban_date_gmt` datetime NOT NULL,
  `ip_ban_expires` datetime DEFAULT NULL,
  `ip_ban_expires_gmt` datetime DEFAULT NULL,
  `ip_ban_ip` varchar(191) NOT NULL,
  `ip_ban_message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chv_likes`
--

CREATE TABLE `chv_likes` (
  `like_id` bigint NOT NULL,
  `like_date` datetime NOT NULL,
  `like_date_gmt` datetime NOT NULL,
  `like_user_id` bigint DEFAULT NULL,
  `like_content_type` enum('image','album') DEFAULT NULL,
  `like_content_id` bigint NOT NULL,
  `like_content_user_id` bigint DEFAULT NULL,
  `like_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chv_locks`
--

CREATE TABLE `chv_locks` (
  `lock_id` bigint NOT NULL,
  `lock_name` varchar(255) NOT NULL,
  `lock_date_gmt` datetime NOT NULL,
  `lock_expires_gmt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chv_logins`
--

CREATE TABLE `chv_logins` (
  `login_id` bigint NOT NULL,
  `login_user_id` bigint NOT NULL,
  `login_type` enum('password','session','cookie','facebook','twitter','google','vk','cookie_facebook','cookie_twitter','cookie_google','cookie_vk') NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `login_hostname` mediumtext,
  `login_date` datetime NOT NULL,
  `login_date_gmt` datetime NOT NULL,
  `login_resource_id` varchar(255) DEFAULT NULL,
  `login_resource_name` mediumtext,
  `login_resource_avatar` mediumtext,
  `login_resource_url` mediumtext,
  `login_secret` mediumtext COMMENT 'The secret part',
  `login_token_hash` mediumtext COMMENT 'Hashed complement to secret if needed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_logins`
--

INSERT INTO `chv_logins` (`login_id`, `login_user_id`, `login_type`, `login_ip`, `login_hostname`, `login_date`, `login_date_gmt`, `login_resource_id`, `login_resource_name`, `login_resource_avatar`, `login_resource_url`, `login_secret`, `login_token_hash`) VALUES
(11, 5, 'password', '197.177.114.139', NULL, '2020-11-16 07:02:07', '2020-11-16 10:02:07', NULL, NULL, NULL, NULL, '$2y$10$f94X6ps3HhR5Dd5.8kp79.3/0wZLPrFJ710FQY/KHBJvny7buUkLK', NULL),
(19, 7, 'password', '154.122.68.158', NULL, '2020-11-16 15:50:26', '2020-11-16 12:50:26', NULL, NULL, NULL, NULL, '$2y$10$iRoUMf/cMM7v4ny8kAOdW.ApR0ms37rp5vs93OxiyYtWkSJtSzXNe', NULL),
(20, 7, 'cookie', '154.122.68.158', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-16 15:50:26', '2020-11-16 12:50:26', NULL, NULL, NULL, NULL, '$2y$10$1JzNverOV09XSmXg0hlcJOd9wkamHsLSLj75zUNkwe50QnQL13xEa', NULL),
(21, 8, 'password', '102.23.98.19', NULL, '2020-11-16 16:32:58', '2020-11-16 13:32:58', NULL, NULL, NULL, NULL, '$2y$10$NlUayIA2aK9dC5e78N/UPe5NN6qL3feuTEPHZzmNuIgSrsEPYvZTG', NULL),
(22, 8, 'cookie', '102.23.98.19', '{\"platform\":\"Android\",\"browser\":\"Opera Next\",\"version\":\"52.1.2254.54298\"}', '2020-11-16 16:32:58', '2020-11-16 13:32:58', NULL, NULL, NULL, NULL, '$2y$10$aTkgL0BVKxUyKnFzZtUWO.eBw1qKL52FsNBXDSq1AgXNLUTDPoUzW', NULL),
(23, 9, 'password', '41.89.96.16', NULL, '2020-11-16 16:50:05', '2020-11-16 13:50:05', NULL, NULL, NULL, NULL, '$2y$10$XC99eRj1XKtANQoTwEiXxOqT2JumgXMBR6byAp900z7B1Vsg9D/Sy', NULL),
(24, 9, 'cookie', '41.89.96.16', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.183\"}', '2020-11-16 16:50:05', '2020-11-16 13:50:05', NULL, NULL, NULL, NULL, '$2y$10$FjFjm.gJdU4SZt1dEpfQYeNoApcVRKOyAbG7rmDD.vCzVWT/8KrSi', NULL),
(28, 5, 'cookie', '197.177.114.139', '{\"platform\":\"Linux\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.198\"}', '2020-11-16 17:31:51', '2020-11-16 14:31:51', NULL, NULL, NULL, NULL, '$2y$10$WlBKyH.cm3pKvahrUa2A7eggprn4q5gptHfXRnvVwTDikI31zov3m', NULL),
(29, 5, 'cookie', '197.177.114.139', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-16 19:11:36', '2020-11-16 16:11:36', NULL, NULL, NULL, NULL, '$2y$10$NZ0ejsHOCRzr/gnmjf4rlO2DuaCRrEbWiJBVUzLsNiSpJP55rYGRi', NULL),
(30, 7, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.198\"}', '2020-11-17 11:41:50', '2020-11-17 08:41:50', NULL, NULL, NULL, NULL, '$2y$10$SHk3AOgYsqvDb3qg854RkuXjzEKq0NbIg8oX9N0EjICDF1f4jGRuW', NULL),
(31, 5, 'cookie', '197.178.121.81', '{\"platform\":\"Linux\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.66\"}', '2020-11-22 16:37:41', '2020-11-22 13:37:41', NULL, NULL, NULL, NULL, '$2y$10$HnYAIWQNW2uUIrIK4LhRq.a/kOz0ZjO9BrWoGglszDIaz5cr0yCXO', NULL),
(32, 7, 'cookie', '197.156.190.193', '{\"platform\":\"Linux\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-23 03:23:52', '2020-11-23 00:23:52', NULL, NULL, NULL, NULL, '$2y$10$kPMorWFzpqJajzvreJQ2xeVs.BWc0MUjp9T75eaFwPT5JgcALI2fO', NULL),
(33, 7, 'cookie', '197.156.137.135', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-23 09:46:06', '2020-11-23 06:46:06', NULL, NULL, NULL, NULL, '$2y$10$ksc.sWaBTvV3XPawY2/0V.uto2SxFMi.J8VmYXVCfZRzigQkCwnN.', NULL),
(34, 8, 'cookie', '102.23.98.17', '{\"platform\":\"Android\",\"browser\":\"Opera Next\",\"version\":\"52.1.2254.54298\"}', '2020-11-23 17:04:44', '2020-11-23 14:04:44', NULL, NULL, NULL, NULL, '$2y$10$w8WNe7jFNEPESbBJFF3JCOkNaP3YjF7FSsApQTjXChP9fpk8RJyAO', NULL),
(35, 7, 'cookie', '41.76.168.176', '{\"platform\":\"iPad\",\"browser\":\"Safari\",\"version\":\"604.1\"}', '2020-11-24 09:23:39', '2020-11-24 06:23:39', NULL, NULL, NULL, NULL, '$2y$10$CmVJ97hDQ7.Yvf4mZzEOz.EhBqaycfgeBIagDBpJ/0Apf/gto4uI.', NULL),
(36, 7, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.198\"}', '2020-11-24 11:16:06', '2020-11-24 08:16:06', NULL, NULL, NULL, NULL, '$2y$10$d.m4kgEVZC1kS9dZWz3u5uFRqytCED19O.4PE9lX7YaprbG.O/CFO', NULL),
(37, 7, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.198\"}', '2020-11-24 16:54:30', '2020-11-24 13:54:30', NULL, NULL, NULL, NULL, '$2y$10$8OdWmw0NTg9OFFcdCXFsD.7jdzPwkv0TvYHurligEDO4RnqRpUTD2', NULL),
(38, 8, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Opera Next\",\"version\":\"72.0.3815.320\"}', '2020-11-24 16:57:25', '2020-11-24 13:57:25', NULL, NULL, NULL, NULL, '$2y$10$.3mO3JbdYBhPJZV3qlhyIOGN3FZzMgwFbMIENZnEqa3gChKtIlQyS', NULL),
(39, 8, 'cookie', '41.76.168.176', '{\"platform\":\"Macintosh\",\"browser\":\"Safari\",\"version\":\"14.0.1\"}', '2020-11-24 16:58:56', '2020-11-24 13:58:56', NULL, NULL, NULL, NULL, '$2y$10$jhdduUIY.uCJJ8d5Ws4SteC.IZQZFFHUfjMe6Yyh7YphKnVCuz7x.', NULL),
(40, 11, 'password', '105.160.30.147', NULL, '2020-11-25 17:48:37', '2020-11-25 14:48:37', NULL, NULL, NULL, NULL, '$2y$10$wdUg3paxxKQI1lyJOmk7Iuv5scKjxCJiE75h4/rzPUZcaYlZiWroK', NULL),
(41, 11, 'cookie', '105.160.30.147', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.198\"}', '2020-11-25 17:48:37', '2020-11-25 14:48:37', NULL, NULL, NULL, NULL, '$2y$10$.DXeIk6X8UYdS6RFCCseiuxpnIo0Mbp0Et0g9s8/WOMjGp4kwmjyu', NULL),
(42, 7, 'cookie', '197.156.190.128', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-26 20:54:27', '2020-11-26 17:54:27', NULL, NULL, NULL, NULL, '$2y$10$FhKhyJYMsOkBuDzpB7aVy.i09LmwNmCqsPbcnSZZAOEqg6Yz6Z7fq', NULL),
(43, 8, 'cookie', '154.122.147.174', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-27 07:59:45', '2020-11-27 04:59:45', NULL, NULL, NULL, NULL, '$2y$10$TMmUDafI2TaugzjcfQmTLuawUjpTsV2k.hNbfPFt6hQ0cTp3TzOka', NULL),
(44, 7, 'cookie', '154.122.253.78', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"86.0.4240.185\"}', '2020-11-28 17:31:27', '2020-11-28 14:31:27', NULL, NULL, NULL, NULL, '$2y$10$4WYHBIoF3B77o/F5Tf4owOY0azMBXovrmjKMA8STf2Ug0nUfGSfG.', NULL),
(45, 5, 'cookie', '197.177.41.37', '{\"platform\":\"Linux\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.66\"}', '2020-11-30 14:33:57', '2020-11-30 11:33:57', NULL, NULL, NULL, NULL, '$2y$10$U8TZwz6qCVaG6Bte5pwHB.ZnsMUURDdNqn/nE7VF1M7GizPK8zdh2', NULL),
(46, 7, 'cookie', '102.23.98.16', '{\"platform\":\"Android\",\"browser\":\"Opera Next\",\"version\":\"52.2.2254.54723\"}', '2020-12-23 23:50:07', '2020-12-23 20:50:07', NULL, NULL, NULL, NULL, '$2y$10$b3iGmVjpnx0lYrueYjDP/O8u/s7p/m4lxyTNk3I7BMqNHRoPfvRIG', NULL),
(47, 8, 'cookie', '154.123.248.87', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.101\"}', '2020-12-23 23:50:42', '2020-12-23 20:50:42', NULL, NULL, NULL, NULL, '$2y$10$/rbwdpmtuHsdv0oV1VSkl.laEjXd3p2C/F9cAqQr6B4J3LqBcfAji', NULL),
(49, 8, 'cookie', '102.166.249.196', '{\"platform\":\"iPad\",\"browser\":\"Safari\",\"version\":\"604.1\"}', '2021-01-18 23:02:21', '2021-01-18 20:02:21', NULL, NULL, NULL, NULL, '$2y$10$zrDn.rVFOHojAo6WLDKR6u6ewLUQUPfFCIVYH7/Q.Nb6.l4SUaf5m', NULL),
(50, 7, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-01-22 16:38:43', '2021-01-22 13:38:43', NULL, NULL, NULL, NULL, '$2y$10$iQ4iBRL4mmqDh1JiciD1wuWF3xzLJgdjUKEbO5n0lf7KoFq0VKAqq', NULL),
(52, 8, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Opera Next\",\"version\":\"73.0.3856.344\"}', '2021-01-26 11:15:34', '2021-01-26 08:15:34', NULL, NULL, NULL, NULL, '$2y$10$ZIEb25y09kOx4qyu6izq9OFTQ7kDUXVUvlSznpeufO8krvwLz.U5C', NULL),
(54, 7, 'cookie', '102.167.252.231', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-02-06 16:46:46', '2021-02-06 13:46:46', NULL, NULL, NULL, NULL, '$2y$10$img0OIjf7UV/iK/WkLJyBeBqBQC7hoZrK1EeJOZFnfg7cd7iMzwoK', NULL),
(55, 7, 'cookie', '102.167.252.231', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-02-06 16:47:00', '2021-02-06 13:47:00', NULL, NULL, NULL, NULL, '$2y$10$ruQu/O8z7T1LTJWsFxtm6ecYh11m67rEjEjmFuoI5gmYbI03NjHuq', NULL),
(56, 7, 'cookie', '102.167.252.231', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-02-06 16:47:51', '2021-02-06 13:47:51', NULL, NULL, NULL, NULL, '$2y$10$XJXpUMrR7rI5T85NsmUAN.PqG5y/uVEzkpHnEggNjQZ5J.SpkQVGK', NULL),
(57, 8, 'cookie', '102.167.252.231', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-02-06 16:48:44', '2021-02-06 13:48:44', NULL, NULL, NULL, NULL, '$2y$10$uAH1M4dxjj3uMJUGTUZIUeCrMWhWf5/Dv90pDH9uFRvcVgbAq6OqW', NULL),
(58, 7, 'cookie', '102.167.252.231', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-02-06 16:49:05', '2021-02-06 13:49:05', NULL, NULL, NULL, NULL, '$2y$10$EzeSHzAzjYsb9keXAFnh7eJn1qGWxxSIHxcAbRuLxGr0xcK3QIDRa', NULL),
(59, 7, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"88.0.4324.182\"}', '2021-02-23 17:51:32', '2021-02-23 14:51:32', NULL, NULL, NULL, NULL, '$2y$10$rrWFIHjRslyf2LvleiB.PenkbyvvWd8E7d5mIO8upxtmhhQaeEHJS', NULL),
(60, 8, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Opera Next\",\"version\":\"74.0.3911.75\"}', '2021-02-26 13:26:22', '2021-02-26 10:26:22', NULL, NULL, NULL, NULL, '$2y$10$oRoVQ5r.GSRstkADXE4Br.mwhMUZ7GF0iFq0ZQDPq0kuG6B/0p2Uq', NULL),
(63, 12, 'password', '41.76.168.176', NULL, '2021-02-26 17:36:08', '2021-02-26 14:36:08', NULL, NULL, NULL, NULL, '$2y$10$H0QwOZqw6COvVuV49X2W9e3.IQswqizONe39.A2CIHClrS.J.mjTG', NULL),
(64, 12, 'cookie', '41.76.168.176', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"88.0.4324.190\"}', '2021-02-26 17:36:08', '2021-02-26 14:36:08', NULL, NULL, NULL, NULL, '$2y$10$LIkg9i0kD1qO/VSYPfVFDeAiPSpWP2hye0vJkBLURl33cc.Nbx9qq', NULL),
(65, 8, 'cookie', '102.167.84.70', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-02-27 20:11:07', '2021-02-27 17:11:07', NULL, NULL, NULL, NULL, '$2y$10$QgV/.BCfd4slTlG2WoeKJOuX/ww7frGwnb1MnSfV0cNya2nsSlGlC', NULL),
(67, 7, 'cookie', '102.23.98.17', '{\"platform\":\"Android\",\"browser\":\"Opera Next\",\"version\":\"53.1.2254.55490\"}', '2021-02-28 17:50:45', '2021-02-28 14:50:45', NULL, NULL, NULL, NULL, '$2y$10$1pSNb3vl3lZKgYjsAUna3.7kPCnyvUivEzrY02YpeYeOT4fcTKD3O', NULL),
(68, 8, 'cookie', '154.122.63.238', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-03-13 11:43:55', '2021-03-13 08:43:55', NULL, NULL, NULL, NULL, '$2y$10$g4WiHxqoB5U3RXKMtuxVle8y/6U9t4jQIZYpRXUEi0ggFehCuB4B6', NULL),
(69, 5, 'cookie', '105.160.37.154', '{\"platform\":\"Linux\",\"browser\":\"Chrome\",\"version\":\"89.0.4389.90\"}', '2021-03-26 02:46:05', '2021-03-25 23:46:05', NULL, NULL, NULL, NULL, '$2y$10$M8X4WM9Xj/OW3SOzyn0C2e8KqGPuo5ZWuACVaGWIQ5x4zjz72GiaS', NULL),
(70, 7, 'cookie', '102.23.98.16', '{\"platform\":\"Android\",\"browser\":\"Opera Next\",\"version\":\"53.1.2254.55490\"}', '2021-04-01 17:12:45', '2021-04-01 14:12:45', NULL, NULL, NULL, NULL, '$2y$10$4vT8H/86VbXxYcgTVMx0Q.nY.PZ3P7d1aoMtoB46ZGIfmCEpwvPIK', NULL),
(72, 8, 'cookie', '154.123.54.167', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-04-15 14:45:15', '2021-04-15 11:45:15', NULL, NULL, NULL, NULL, '$2y$10$YglYnWaK9mnqh8TpBVRJhOBXFXyJgU/6VatAyx.im78rm1Tb8uiha', NULL),
(73, 13, 'password', '154.153.233.242', NULL, '2021-04-24 20:13:39', '2021-04-24 17:13:39', NULL, NULL, NULL, NULL, '$2y$10$ffK4bCvyI32JcVBAeJl8auJ0YYqSFQ3jQy1IB2/P9Y1bdxjXGZvoq', NULL),
(74, 13, 'cookie', '154.153.233.242', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"89.0.4389.105\"}', '2021-04-24 20:13:39', '2021-04-24 17:13:39', NULL, NULL, NULL, NULL, '$2y$10$uMN/N.7cDeg3ehId.o3i4OrvV1ybX6cjMKSgrkpYs/AUVLCJII.bm', NULL),
(75, 5, 'cookie', '41.90.69.211', '{\"platform\":\"Linux\",\"browser\":\"Chrome\",\"version\":\"90.0.4430.85\"}', '2021-04-26 12:16:28', '2021-04-26 09:16:28', NULL, NULL, NULL, NULL, '$2y$10$t3sDh/C7UpheafKioZatdOkoQTNkD3p4ZMWcvZi8iODSHIXDK4fza', NULL),
(76, 7, 'cookie', '197.156.137.161', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-04-27 12:17:09', '2021-04-27 09:17:09', NULL, NULL, NULL, NULL, '$2y$10$iEwkFI9yZDg4WyFgc9l4yeeFNS7SkdN/1G0D7JLLaBECeLbWuG002', NULL),
(77, 8, 'cookie', '105.160.9.182', '{\"platform\":\"Android\",\"browser\":\"Chrome\",\"version\":\"87.0.4280.141\"}', '2021-05-16 19:22:12', '2021-05-16 16:22:12', NULL, NULL, NULL, NULL, '$2y$10$UhnoTNlxPbDo/fDMEyV58OzYDwKGMriR3VTHlohOddn1KPi6MSEry', NULL),
(78, 7, 'cookie', '41.76.168.179', '{\"platform\":\"Windows\",\"browser\":\"Chrome\",\"version\":\"89.0.4389.90\"}', '2021-05-17 11:45:36', '2021-05-17 08:45:36', NULL, NULL, NULL, NULL, '$2y$10$mYzf5AIExaU8lNJEyBEH1uxMFEUUW5989VtZhqWhpL9JbJdx4Vn/O', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chv_notifications`
--

CREATE TABLE `chv_notifications` (
  `notification_id` bigint NOT NULL,
  `notification_date_gmt` datetime NOT NULL,
  `notification_user_id` bigint NOT NULL,
  `notification_trigger_user_id` bigint DEFAULT NULL,
  `notification_type` enum('follow','like') NOT NULL,
  `notification_content_type` enum('user','image','album') NOT NULL,
  `notification_type_id` bigint NOT NULL COMMENT 'type_id based on action (type) table',
  `notification_is_read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chv_pages`
--

CREATE TABLE `chv_pages` (
  `page_id` bigint NOT NULL,
  `page_url_key` varchar(32) DEFAULT NULL,
  `page_type` enum('internal','link') NOT NULL DEFAULT 'internal',
  `page_file_path` varchar(255) DEFAULT NULL,
  `page_link_url` mediumtext,
  `page_icon` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_description` mediumtext,
  `page_keywords` mediumtext,
  `page_is_active` tinyint(1) NOT NULL DEFAULT '1',
  `page_is_link_visible` tinyint(1) NOT NULL DEFAULT '1',
  `page_attr_target` enum('_self','_blank') DEFAULT '_self',
  `page_attr_rel` varchar(255) DEFAULT NULL,
  `page_sort_display` int DEFAULT NULL,
  `page_internal` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_pages`
--

INSERT INTO `chv_pages` (`page_id`, `page_url_key`, `page_type`, `page_file_path`, `page_link_url`, `page_icon`, `page_title`, `page_description`, `page_keywords`, `page_is_active`, `page_is_link_visible`, `page_attr_target`, `page_attr_rel`, `page_sort_display`, `page_internal`) VALUES
(3, 'contact', 'internal', NULL, NULL, 'icon-mail', 'Contact', NULL, NULL, 1, 1, '_self', NULL, 3, 'contact');

-- --------------------------------------------------------

--
-- Table structure for table `chv_queues`
--

CREATE TABLE `chv_queues` (
  `queue_id` bigint NOT NULL,
  `queue_type` enum('storage-delete') NOT NULL,
  `queue_date_gmt` datetime NOT NULL,
  `queue_args` longtext NOT NULL,
  `queue_join` bigint NOT NULL,
  `queue_attempts` varchar(255) DEFAULT '0',
  `queue_status` enum('pending','failed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chv_redirects`
--

CREATE TABLE `chv_redirects` (
  `redirect_id` bigint NOT NULL,
  `redirect_from` varchar(2083) NOT NULL,
  `redirect_content_id` bigint NOT NULL,
  `redirect_content_type` enum('image','user','album') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chv_requests`
--

CREATE TABLE `chv_requests` (
  `request_id` bigint NOT NULL,
  `request_type` enum('upload','signup','account-edit','account-password-forgot','account-password-reset','account-resend-activation','account-email-needed','account-change-email','account-activate','login','content-password') NOT NULL,
  `request_user_id` bigint DEFAULT NULL,
  `request_content_id` bigint DEFAULT NULL,
  `request_ip` varchar(255) NOT NULL,
  `request_date` datetime NOT NULL,
  `request_date_gmt` datetime NOT NULL,
  `request_result` enum('success','fail') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chv_requests`
--

INSERT INTO `chv_requests` (`request_id`, `request_type`, `request_user_id`, `request_content_id`, `request_ip`, `request_date`, `request_date_gmt`, `request_result`) VALUES
(1, 'login', 1, NULL, '::1', '2020-11-13 06:35:10', '2020-11-13 09:35:10', 'success'),
(2, 'login', 2, NULL, '::1', '2020-11-13 13:03:49', '2020-11-13 10:03:49', 'success'),
(3, 'account-activate', 3, NULL, '::1', '2020-11-13 13:32:27', '2020-11-13 10:32:27', 'fail'),
(4, 'account-activate', 3, NULL, '::1', '2020-11-13 13:34:43', '2020-11-13 10:34:43', 'fail'),
(5, 'account-activate', NULL, NULL, '::1', '2020-11-13 13:35:41', '2020-11-13 10:35:41', 'fail'),
(6, 'login', 1, NULL, '::1', '2020-11-13 13:36:04', '2020-11-13 10:36:04', 'success'),
(7, 'login', 4, NULL, '::1', '2020-11-13 13:41:18', '2020-11-13 10:41:18', 'success'),
(8, 'login', 1, NULL, '::1', '2020-11-13 13:42:03', '2020-11-13 10:42:03', 'success'),
(9, 'login', NULL, NULL, '197.177.114.139', '2020-11-16 13:00:22', '2020-11-16 10:00:22', 'fail'),
(10, 'login', 1, NULL, '197.177.114.139', '2020-11-16 13:00:33', '2020-11-16 10:00:33', 'success'),
(11, 'login', 5, NULL, '197.177.114.139', '2020-11-16 13:02:42', '2020-11-16 10:02:42', 'success'),
(12, 'login', 5, NULL, '197.177.114.139', '2020-11-16 13:49:43', '2020-11-16 10:49:43', 'success'),
(13, 'login', 2, NULL, '197.177.114.139', '2020-11-16 14:33:27', '2020-11-16 11:33:27', 'success'),
(14, 'login', 5, NULL, '197.177.114.139', '2020-11-16 14:38:08', '2020-11-16 11:38:08', 'success'),
(15, 'login', 5, NULL, '197.177.114.139', '2020-11-16 14:46:05', '2020-11-16 11:46:05', 'success'),
(16, 'login', 5, NULL, '197.177.114.139', '2020-11-16 16:58:46', '2020-11-16 13:58:46', 'success'),
(17, 'login', 10, NULL, '197.177.114.139', '2020-11-16 17:30:34', '2020-11-16 14:30:34', 'success'),
(18, 'login', 5, NULL, '197.177.114.139', '2020-11-16 17:31:51', '2020-11-16 14:31:51', 'success'),
(19, 'login', 5, NULL, '197.177.114.139', '2020-11-16 19:11:36', '2020-11-16 16:11:36', 'success'),
(22, 'login', 7, NULL, '41.76.168.176', '2020-11-17 11:41:50', '2020-11-17 08:41:50', 'success'),
(23, 'login', 5, NULL, '197.178.121.81', '2020-11-22 16:37:41', '2020-11-22 13:37:41', 'success'),
(24, 'login', 7, NULL, '197.156.190.193', '2020-11-23 03:23:52', '2020-11-23 00:23:52', 'success'),
(25, 'login', 7, NULL, '197.156.137.135', '2020-11-23 09:46:06', '2020-11-23 06:46:06', 'success'),
(26, 'login', 8, NULL, '102.23.98.17', '2020-11-23 17:04:44', '2020-11-23 14:04:44', 'success'),
(27, 'login', 7, NULL, '41.76.168.176', '2020-11-24 09:23:39', '2020-11-24 06:23:39', 'success'),
(28, 'login', 7, NULL, '41.76.168.176', '2020-11-24 11:16:06', '2020-11-24 08:16:06', 'success'),
(29, 'login', 7, NULL, '41.76.168.176', '2020-11-24 16:54:30', '2020-11-24 13:54:30', 'success'),
(30, 'login', 8, NULL, '41.76.168.176', '2020-11-24 16:57:25', '2020-11-24 13:57:25', 'success'),
(31, 'login', 8, NULL, '41.76.168.176', '2020-11-24 16:58:56', '2020-11-24 13:58:56', 'success'),
(32, 'login', 7, NULL, '197.156.190.128', '2020-11-26 20:54:27', '2020-11-26 17:54:27', 'success'),
(33, 'login', 8, NULL, '154.122.147.174', '2020-11-27 07:59:45', '2020-11-27 04:59:45', 'success'),
(34, 'login', 7, NULL, '154.122.253.78', '2020-11-28 17:31:27', '2020-11-28 14:31:27', 'success'),
(35, 'login', 5, NULL, '197.177.41.37', '2020-11-30 14:33:57', '2020-11-30 11:33:57', 'success'),
(37, 'login', 7, NULL, '102.23.98.16', '2020-12-23 23:50:07', '2020-12-23 20:50:07', 'success'),
(38, 'login', 8, NULL, '154.123.248.87', '2020-12-23 23:50:42', '2020-12-23 20:50:42', 'success'),
(39, 'login', 8, NULL, '102.167.132.215', '2021-01-12 09:42:54', '2021-01-12 06:42:54', 'success'),
(40, 'login', 7, NULL, '102.166.249.196', '2021-01-18 23:00:39', '2021-01-18 20:00:39', 'fail'),
(41, 'login', 7, NULL, '102.166.249.196', '2021-01-18 23:01:05', '2021-01-18 20:01:05', 'fail'),
(43, 'login', 8, NULL, '102.166.249.196', '2021-01-18 23:02:21', '2021-01-18 20:02:21', 'success'),
(44, 'login', 7, NULL, '41.76.168.176', '2021-01-22 16:38:43', '2021-01-22 13:38:43', 'success'),
(45, 'login', 8, NULL, '102.23.98.16', '2021-01-24 13:33:45', '2021-01-24 10:33:45', 'fail'),
(46, 'login', 8, NULL, '102.23.98.16', '2021-01-24 13:34:08', '2021-01-24 10:34:08', 'fail'),
(47, 'login', 7, NULL, '41.76.168.176', '2021-01-26 11:13:17', '2021-01-26 08:13:17', 'success'),
(48, 'login', 8, NULL, '41.76.168.176', '2021-01-26 11:15:34', '2021-01-26 08:15:34', 'success'),
(49, 'login', 8, NULL, '102.23.98.18', '2021-02-06 16:45:35', '2021-02-06 13:45:35', 'success'),
(53, 'login', 7, NULL, '102.167.252.231', '2021-02-06 16:46:46', '2021-02-06 13:46:46', 'success'),
(57, 'login', 7, NULL, '102.167.252.231', '2021-02-06 16:47:00', '2021-02-06 13:47:00', 'success'),
(63, 'login', 7, NULL, '102.167.252.231', '2021-02-06 16:47:51', '2021-02-06 13:47:51', 'success'),
(68, 'login', 8, NULL, '102.167.252.231', '2021-02-06 16:48:44', '2021-02-06 13:48:44', 'success'),
(72, 'login', 7, NULL, '102.167.252.231', '2021-02-06 16:49:05', '2021-02-06 13:49:05', 'success'),
(75, 'login', 8, NULL, '102.166.9.58', '2021-02-06 22:19:56', '2021-02-06 19:19:56', 'fail'),
(76, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:54:57', '2021-02-07 09:54:57', 'fail'),
(77, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:55:13', '2021-02-07 09:55:13', 'fail'),
(78, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:55:23', '2021-02-07 09:55:23', 'fail'),
(79, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:55:24', '2021-02-07 09:55:24', 'fail'),
(80, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:55:27', '2021-02-07 09:55:27', 'fail'),
(81, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:55:51', '2021-02-07 09:55:51', 'fail'),
(82, 'login', 8, NULL, '102.167.250.247', '2021-02-07 12:55:55', '2021-02-07 09:55:55', 'fail'),
(83, 'login', 8, NULL, '102.167.7.129', '2021-02-08 21:14:07', '2021-02-08 18:14:07', 'fail'),
(84, 'login', 8, NULL, '102.167.7.129', '2021-02-08 21:14:23', '2021-02-08 18:14:23', 'fail'),
(85, 'login', 8, NULL, '102.167.7.129', '2021-02-08 21:14:36', '2021-02-08 18:14:36', 'fail'),
(86, 'login', 8, NULL, '102.167.7.129', '2021-02-08 21:14:36', '2021-02-08 18:14:36', 'fail'),
(87, 'login', 8, NULL, '102.167.7.129', '2021-02-08 21:14:39', '2021-02-08 18:14:39', 'fail'),
(88, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:35:51', '2021-02-09 18:35:51', 'fail'),
(89, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:36:13', '2021-02-09 18:36:13', 'fail'),
(90, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:36:31', '2021-02-09 18:36:31', 'fail'),
(91, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:36:39', '2021-02-09 18:36:39', 'fail'),
(92, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:36:54', '2021-02-09 18:36:54', 'fail'),
(93, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:36:54', '2021-02-09 18:36:54', 'fail'),
(94, 'login', 8, NULL, '102.167.196.253', '2021-02-09 21:36:58', '2021-02-09 18:36:58', 'fail'),
(95, 'login', 7, NULL, '41.76.168.176', '2021-02-23 17:51:32', '2021-02-23 14:51:32', 'success'),
(96, 'login', 8, NULL, '41.76.168.176', '2021-02-26 13:26:22', '2021-02-26 10:26:22', 'success'),
(97, 'login', 7, NULL, '41.76.168.176', '2021-02-26 17:00:03', '2021-02-26 14:00:03', 'success'),
(100, 'login', 8, NULL, '41.76.168.176', '2021-02-26 17:02:11', '2021-02-26 14:02:11', 'success'),
(101, 'signup', NULL, NULL, '41.76.168.176', '2021-02-26 17:35:36', '2021-02-26 14:35:36', 'fail'),
(102, 'login', 12, NULL, '102.167.84.70', '2021-02-27 20:05:10', '2021-02-27 17:05:10', 'fail'),
(103, 'login', 8, NULL, '102.167.84.70', '2021-02-27 20:11:07', '2021-02-27 17:11:07', 'success'),
(104, 'login', 8, NULL, '102.23.98.20', '2021-02-28 17:47:26', '2021-02-28 14:47:26', 'fail'),
(106, 'login', 8, NULL, '82.145.220.64', '2021-02-28 17:48:32', '2021-02-28 14:48:32', 'fail'),
(109, 'login', 8, NULL, '102.23.98.17', '2021-02-28 17:49:41', '2021-02-28 14:49:41', 'success'),
(110, 'login', 7, NULL, '102.23.98.17', '2021-02-28 17:50:45', '2021-02-28 14:50:45', 'success'),
(111, 'login', 8, NULL, '154.122.63.238', '2021-03-13 11:43:55', '2021-03-13 08:43:55', 'success'),
(113, 'login', 5, NULL, '105.160.37.154', '2021-03-26 02:46:05', '2021-03-25 23:46:05', 'success'),
(115, 'login', 7, NULL, '102.23.98.16', '2021-04-01 17:12:45', '2021-04-01 14:12:45', 'success'),
(116, 'login', 7, NULL, '154.123.54.167', '2021-04-15 14:44:30', '2021-04-15 11:44:30', 'success'),
(117, 'login', 8, NULL, '154.123.54.167', '2021-04-15 14:45:15', '2021-04-15 11:45:15', 'success'),
(118, 'login', 5, NULL, '41.90.69.211', '2021-04-26 12:16:28', '2021-04-26 09:16:28', 'success'),
(119, 'login', 7, NULL, '197.156.137.161', '2021-04-27 12:17:09', '2021-04-27 09:17:09', 'success'),
(120, 'login', 8, NULL, '105.160.9.182', '2021-05-16 19:22:12', '2021-05-16 16:22:12', 'success'),
(121, 'login', 7, NULL, '41.76.168.179', '2021-05-17 11:45:36', '2021-05-17 08:45:36', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `chv_settings`
--

CREATE TABLE `chv_settings` (
  `setting_id` int NOT NULL,
  `setting_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `setting_value` mediumtext,
  `setting_default` mediumtext,
  `setting_typeset` enum('string','bool') DEFAULT 'string'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_settings`
--

INSERT INTO `chv_settings` (`setting_id`, `setting_name`, `setting_value`, `setting_default`, `setting_typeset`) VALUES
(1, 'analytics_code', NULL, NULL, 'string'),
(2, 'auto_language', '1', '1', 'bool'),
(3, 'chevereto_version_installed', '1.3.0', '1.3.0', 'string'),
(4, 'cloudflare', NULL, NULL, 'string'),
(5, 'comment_code', NULL, NULL, 'string'),
(6, 'crypt_salt', '4885bf78', '4885bf78', 'string'),
(7, 'default_language', 'en', 'en', 'string'),
(8, 'default_timezone', 'Africa/Nairobi', 'America/Santiago', 'string'),
(9, 'email_from_email', 'rashid.david12@gmail.com', '', 'string'),
(10, 'email_from_name', 'Katchy', 'Chevereto', 'string'),
(11, 'email_incoming_email', 'rashid.david12@gmail.com', '', 'string'),
(12, 'email_mode', 'mail', 'mail', 'string'),
(13, 'email_smtp_server', NULL, NULL, 'string'),
(14, 'email_smtp_server_password', NULL, NULL, 'string'),
(15, 'email_smtp_server_port', '25', NULL, 'string'),
(16, 'email_smtp_server_security', 'tls', NULL, 'string'),
(17, 'email_smtp_server_username', NULL, NULL, 'string'),
(18, 'enable_uploads', '1', '1', 'bool'),
(19, 'error_reporting', '0', '0', 'bool'),
(20, 'facebook', '0', '0', 'bool'),
(21, 'facebook_app_id', NULL, NULL, 'string'),
(22, 'facebook_app_secret', NULL, NULL, 'string'),
(23, 'flood_uploads_day', '1000', '1000', 'string'),
(24, 'flood_uploads_hour', '500', '500', 'string'),
(25, 'flood_uploads_minute', '50', '50', 'string'),
(26, 'flood_uploads_month', '10000', '10000', 'string'),
(27, 'flood_uploads_notify', '0', '0', 'bool'),
(28, 'flood_uploads_protection', '1', '1', 'bool'),
(29, 'flood_uploads_week', '5000', '5000', 'string'),
(30, 'google', '0', '0', 'bool'),
(31, 'google_client_id', NULL, NULL, 'string'),
(32, 'google_client_secret', NULL, NULL, 'string'),
(33, 'guest_uploads', '1', '1', 'bool'),
(34, 'listing_items_per_page', '24', '24', 'string'),
(35, 'maintenance', '0', '0', 'bool'),
(36, 'recaptcha', '0', '0', 'bool'),
(37, 'recaptcha_private_key', NULL, NULL, 'string'),
(38, 'recaptcha_public_key', NULL, NULL, 'string'),
(39, 'recaptcha_threshold', '5', '5', 'string'),
(40, 'theme', 'Peafowl', 'Peafowl', 'string'),
(41, 'twitter', '0', '0', 'bool'),
(42, 'twitter_api_key', NULL, NULL, 'string'),
(43, 'twitter_api_secret', NULL, NULL, 'string'),
(44, 'upload_filenaming', 'original', 'original', 'string'),
(45, 'upload_image_path', 'images', 'images', 'string'),
(46, 'upload_max_filesize_mb', '2', '10', 'string'),
(47, 'upload_storage_mode', 'datefolder', 'datefolder', 'string'),
(48, 'upload_thumb_height', '160', '160', 'string'),
(49, 'upload_thumb_width', '160', '160', 'string'),
(50, 'website_description', 'A free meme hosting service powered by katchy', 'A free image hosting service powered by Chevereto', 'string'),
(51, 'website_doctitle', 'Katchy meme sharing', 'Chevereto image hosting', 'string'),
(52, 'website_name', 'Katchy', 'Chevereto', 'string'),
(53, 'website_explore_page', '1', '1', 'bool'),
(54, 'twitter_account', 'chevereto', 'chevereto', 'string'),
(55, 'enable_signups', '1', '1', 'bool'),
(56, 'favicon_image', 'favicon.png', 'favicon.png', 'string'),
(57, 'logo_image', 'logo_1606736127335_a82e67.png', 'logo.png', 'string'),
(58, 'logo_vector', 'logo.svg', 'logo.svg', 'string'),
(59, 'theme_custom_css_code', NULL, NULL, 'string'),
(60, 'theme_custom_js_code', NULL, NULL, 'string'),
(61, 'website_keywords', 'image sharing, image hosting, chevereto', 'image sharing, image hosting, chevereto', 'string'),
(62, 'logo_vector_enable', '0', '0', 'bool'),
(63, 'watermark_enable', '0', '0', 'bool'),
(64, 'watermark_image', 'watermark.png', 'watermark.png', 'string'),
(65, 'watermark_position', 'center center', 'center center', 'string'),
(66, 'watermark_margin', '10', '10', 'string'),
(67, 'watermark_opacity', '50', '50', 'string'),
(68, 'api_v1_key', '8d51ff2fecd9c01f694f1eef74252a51', '8d51ff2fecd9c01f694f1eef74252a51', 'string'),
(69, 'listing_pagination_mode', 'classic', 'classic', 'string'),
(70, 'show_nsfw_in_listings', '0', '0', 'bool'),
(71, 'show_banners_in_nsfw', '0', '0', 'bool'),
(72, 'website_privacy_mode', 'public', 'public', 'string'),
(73, 'website_content_privacy_mode', 'default', 'default', 'string'),
(74, 'show_nsfw_in_random_mode', '0', '0', 'bool'),
(75, 'cdn', '0', '0', 'bool'),
(76, 'cdn_url', NULL, NULL, 'string'),
(77, 'website_search', '1', '1', 'bool'),
(78, 'website_random', '1', '1', 'bool'),
(79, 'theme_logo_height', NULL, NULL, 'string'),
(80, 'theme_show_social_share', '1', '1', 'bool'),
(81, 'theme_show_embed_content', '1', '1', 'bool'),
(82, 'theme_show_embed_uploader', '1', '1', 'bool'),
(83, 'user_routing', '1', '1', 'bool'),
(84, 'require_user_email_confirmation', '0', '1', 'bool'),
(85, 'require_user_email_social_signup', '1', '1', 'bool'),
(86, 'last_used_storage', NULL, NULL, 'string'),
(87, 'vk', '0', '0', 'bool'),
(88, 'vk_client_id', NULL, NULL, 'string'),
(89, 'vk_client_secret', NULL, NULL, 'string'),
(90, 'theme_download_button', '1', '1', 'bool'),
(91, 'theme_nsfw_upload_checkbox', '1', '1', 'bool'),
(92, 'theme_tone', 'dark', 'light', 'string'),
(93, 'theme_image_listing_sizing', 'fixed', 'fixed', 'string'),
(94, 'listing_columns_phone', '1', '1', 'string'),
(95, 'listing_columns_phablet', '3', '3', 'string'),
(96, 'listing_columns_tablet', '4', '4', 'string'),
(97, 'listing_columns_laptop', '3', '5', 'string'),
(98, 'listing_columns_desktop', '3', '6', 'string'),
(99, 'homepage_style', 'route_explore', 'landing', 'string'),
(100, 'homepage_cover_image', NULL, NULL, 'string'),
(101, 'homepage_uids', '1', '1', 'string'),
(102, 'homepage_endless_mode', '0', '0', 'bool'),
(103, 'user_image_avatar_max_filesize_mb', '1', '1', 'string'),
(104, 'user_image_background_max_filesize_mb', '2', '2', 'string'),
(105, 'theme_image_right_click', '0', '0', 'bool'),
(106, 'minify_enable', '1', '1', 'bool'),
(107, 'theme_show_exif_data', '1', '1', 'bool'),
(108, 'theme_top_bar_color', 'white', 'white', 'string'),
(109, 'theme_main_color', NULL, NULL, 'string'),
(110, 'theme_top_bar_button_color', 'blue', 'blue', 'string'),
(111, 'logo_image_homepage', NULL, NULL, 'string'),
(112, 'logo_vector_homepage', NULL, NULL, 'string'),
(113, 'homepage_cta_color', 'green', 'green', 'string'),
(114, 'homepage_cta_outline', '0', '0', 'bool'),
(115, 'watermark_enable_guest', '1', '1', 'bool'),
(116, 'watermark_enable_user', '1', '1', 'bool'),
(117, 'watermark_enable_admin', '1', '1', 'bool'),
(118, 'homepage_title_html', NULL, NULL, 'string'),
(119, 'homepage_paragraph_html', NULL, NULL, 'string'),
(120, 'homepage_cta_html', NULL, NULL, 'string'),
(121, 'homepage_cta_fn', NULL, NULL, 'string'),
(122, 'homepage_cta_fn_extra', NULL, NULL, 'string'),
(123, 'language_chooser_enable', '1', '1', 'bool'),
(124, 'languages_disable', NULL, NULL, 'string'),
(125, 'website_mode', 'community', 'community', 'string'),
(126, 'website_mode_personal_routing', NULL, NULL, 'string'),
(127, 'website_mode_personal_uid', NULL, NULL, 'string'),
(128, 'enable_cookie_law', '0', '0', 'bool'),
(129, 'theme_nsfw_blur', '0', '0', 'bool'),
(130, 'watermark_target_min_width', '100', '100', 'string'),
(131, 'watermark_target_min_height', '100', '100', 'string'),
(132, 'watermark_percentage', '4', '4', 'string'),
(133, 'watermark_enable_file_gif', '0', '0', 'bool'),
(134, 'id_padding', '5000', '5000', 'string'),
(135, 'upload_image_exif', '1', '1', 'bool'),
(136, 'upload_image_exif_user_setting', '1', '1', 'bool'),
(137, 'enable_expirable_uploads', '1', '1', 'bool'),
(138, 'upload_medium_size', '500', '500', 'string'),
(139, 'upload_medium_fixed_dimension', 'width', 'width', 'string'),
(140, 'enable_followers', '0', '0', 'bool'),
(141, 'enable_likes', '0', '0', 'bool'),
(142, 'enable_consent_screen', '0', '0', 'bool'),
(143, 'user_minimum_age', NULL, NULL, 'string'),
(144, 'consent_screen_cover_image', NULL, NULL, 'string'),
(145, 'enable_redirect_single_upload', '1', '1', 'bool'),
(146, 'route_image', 'image', 'image', 'string'),
(147, 'route_album', 'album', 'album', 'string'),
(148, 'enable_duplicate_uploads', '0', '0', 'bool'),
(149, 'update_check_datetimegmt', '2021-05-25 11:39:26', NULL, 'string'),
(150, 'update_check_notified_release', '1.3.0', '1.3.0', 'string'),
(151, 'update_check_display_notification', '1', '1', 'bool'),
(152, 'upload_enabled_image_formats', 'jpg,png,bmp,gif', 'jpg,png,bmp,gif', 'string'),
(153, 'upload_threads', '2', '2', 'string'),
(154, 'enable_automatic_updates_check', '1', '1', 'bool'),
(155, 'comments_api', 'js', 'js', 'string'),
(156, 'disqus_shortname', NULL, NULL, 'string'),
(157, 'disqus_public_key', NULL, NULL, 'string'),
(158, 'disqus_secret_key', NULL, NULL, 'string'),
(159, 'image_load_max_filesize_mb', '3', '3', 'string'),
(160, 'upload_max_image_width', '0', '0', 'string'),
(161, 'upload_max_image_height', '0', '0', 'string'),
(162, 'auto_delete_guest_uploads', NULL, NULL, 'string'),
(163, 'enable_user_content_delete', '1', '1', 'bool'),
(164, 'enable_plugin_route', '1', '1', 'bool'),
(165, 'sdk_pup_url', NULL, NULL, 'string'),
(166, 'website_explore_page_guest', '1', '1', 'bool'),
(167, 'explore_albums_min_image_count', '5', '5', 'string'),
(168, 'upload_max_filesize_mb_guest', '0.5', '0.5', 'string'),
(169, 'notify_user_signups', '0', '0', 'bool'),
(170, 'listing_viewer', '1', '1', 'bool'),
(171, 'seo_image_urls', '1', '1', 'bool'),
(172, 'seo_album_urls', '1', '1', 'bool'),
(173, 'lang_subdomain_wildcard', '0', '0', 'bool'),
(174, 'user_subdomain_wildcard', '0', '0', 'bool'),
(175, 'website_https', 'auto', 'auto', 'string'),
(176, 'upload_gui', 'page', 'page', 'string'),
(177, 'recaptcha_version', '2', '2', 'string'),
(178, 'force_recaptcha_contact_page', '1', '1', 'bool'),
(179, 'dump_update_query', '0', '0', 'bool'),
(180, 'enable_powered_by', '0', '1', 'bool'),
(181, 'akismet', '0', '0', 'bool'),
(182, 'akismet_api_key', NULL, NULL, 'string'),
(183, 'stopforumspam', '0', '0', 'bool'),
(184, 'hostname', NULL, NULL, 'string'),
(185, 'theme_show_embed_content_for', 'all', 'all', 'string'),
(186, 'moderatecontent', '0', '0', 'bool'),
(187, 'moderatecontent_key', '', '', 'string'),
(188, 'moderatecontent_block_rating', 'a', 'a', 'string'),
(189, 'moderatecontent_flag_nsfw', 'a', 'a', 'string'),
(190, 'moderatecontent_auto_approve', '0', '0', 'bool'),
(191, 'moderate_uploads', '', '', 'string'),
(192, 'image_lock_nsfw_editing', '0', '0', 'bool');

-- --------------------------------------------------------

--
-- Table structure for table `chv_stats`
--

CREATE TABLE `chv_stats` (
  `stat_id` bigint NOT NULL,
  `stat_type` enum('total','date') NOT NULL,
  `stat_date_gmt` date DEFAULT NULL,
  `stat_users` bigint NOT NULL DEFAULT '0',
  `stat_images` bigint NOT NULL DEFAULT '0',
  `stat_albums` bigint NOT NULL DEFAULT '0',
  `stat_image_views` bigint NOT NULL DEFAULT '0',
  `stat_album_views` bigint NOT NULL DEFAULT '0',
  `stat_image_likes` bigint NOT NULL DEFAULT '0',
  `stat_album_likes` bigint NOT NULL DEFAULT '0',
  `stat_disk_used` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chv_stats`
--

INSERT INTO `chv_stats` (`stat_id`, `stat_type`, `stat_date_gmt`, `stat_users`, `stat_images`, `stat_albums`, `stat_image_views`, `stat_album_views`, `stat_image_likes`, `stat_album_likes`, `stat_disk_used`) VALUES
(1, 'total', NULL, 7, 224, 1, 104085, 2249, 0, 0, 29498633),
(2, 'date', '2020-11-13', 0, 0, 0, 10, 0, 0, 0, 0),
(23, 'date', '2020-11-16', 4, 29, 1, 64, 3, 0, 0, 4240378),
(259, 'date', '2020-11-17', 0, 4, 0, 7, 0, 0, 0, 464102),
(270, 'date', '2020-11-18', 0, 1, 0, 2, 0, 0, 0, 18812),
(274, 'date', '2020-11-19', 0, 3, 0, 6, 0, 0, 0, 439084),
(283, 'date', '2020-11-20', 0, 1, 0, 0, 0, 0, 0, 361990),
(284, 'date', '2020-11-21', 0, 3, 0, 5, 0, 0, 0, 508194),
(292, 'date', '2020-11-22', 0, 1, 0, 1, 0, 0, 0, 61529),
(294, 'date', '2020-11-23', 0, 3, 0, 13, 0, 0, 0, 731879),
(311, 'date', '2020-11-24', 0, 6, 0, 84, 0, 0, 0, 624527),
(402, 'date', '2020-11-25', 1, 8, 0, 131, 0, 0, 0, 1012131),
(542, 'date', '2020-11-26', 0, 1, 0, 3, 0, 0, 0, 55054),
(546, 'date', '2020-11-27', 0, 7, 0, 45, 0, 0, 0, 503010),
(598, 'date', '2020-11-28', 0, 3, 0, 900, 0, 0, 0, 347172),
(1501, 'date', '2020-11-29', 0, 1, 0, 25, 0, 0, 0, 127878),
(1527, 'date', '2020-11-30', 0, 0, 0, 926, 0, 0, 0, 0),
(2453, 'date', '2020-12-01', 0, 0, 0, 4119, 43, 0, 0, 0),
(6615, 'date', '2020-12-02', 0, 2, 0, 597, 137, 0, 0, 299957),
(7351, 'date', '2020-12-03', 0, 2, 0, 590, 1, 0, 0, 441719),
(7945, 'date', '2020-12-04', 0, 1, 0, 368, 3, 0, 0, 45680),
(8317, 'date', '2020-12-05', 0, 1, 0, 488, 0, 0, 0, 260632),
(8806, 'date', '2020-12-06', 0, 2, 0, 1094, 0, 0, 0, 410385),
(9902, 'date', '2020-12-07', 0, 1, 0, 520, 0, 0, 0, 250701),
(10423, 'date', '2020-12-08', 0, 2, 0, 449, 0, 0, 0, 386845),
(10874, 'date', '2020-12-09', 0, 3, 0, 343, 0, 0, 0, 523651),
(11220, 'date', '2020-12-10', 0, 2, 0, 257, 0, 0, 0, 255371),
(11479, 'date', '2020-12-11', 0, 0, 0, 444, 0, 0, 0, 0),
(11925, 'date', '2020-12-12', 0, 1, 0, 1018, 0, 0, 0, 154885),
(12944, 'date', '2020-12-13', 0, 1, 0, 525, 0, 0, 0, 244692),
(13470, 'date', '2020-12-14', 0, 2, 0, 133, 0, 0, 0, 198356),
(13605, 'date', '2020-12-15', 0, 0, 0, 133, 0, 0, 0, 0),
(13738, 'date', '2020-12-16', 0, 0, 0, 73, 0, 0, 0, 0),
(13811, 'date', '2020-12-17', 0, 4, 0, 147, 1, 0, 0, 482031),
(13963, 'date', '2020-12-18', 0, 2, 0, 335, 0, 0, 0, 368044),
(14300, 'date', '2020-12-19', 0, 1, 0, 931, 0, 0, 0, 72643),
(15232, 'date', '2020-12-20', 0, 2, 0, 92, 38, 0, 0, 256141),
(15364, 'date', '2020-12-21', 0, 3, 0, 204, 1, 0, 0, 223809),
(15572, 'date', '2020-12-22', 0, 0, 0, 313, 0, 0, 0, 0),
(15885, 'date', '2020-12-23', 0, 1, 0, 148, 0, 0, 0, 205500),
(16034, 'date', '2020-12-24', 0, 0, 0, 199, 2, 0, 0, 0),
(16235, 'date', '2020-12-25', 0, 0, 0, 679, 1, 0, 0, 0),
(16915, 'date', '2020-12-26', 0, 0, 0, 221, 0, 0, 0, 0),
(17136, 'date', '2020-12-27', 0, 0, 0, 96, 0, 0, 0, 0),
(17232, 'date', '2020-12-28', 0, 1, 0, 1772, 0, 0, 0, 30642),
(19005, 'date', '2020-12-29', 0, 3, 0, 100, 0, 0, 0, 242181),
(19108, 'date', '2020-12-30', 0, 0, 0, 194, 0, 0, 0, 0),
(19302, 'date', '2020-12-31', 0, 0, 0, 200, 0, 0, 0, 0),
(19502, 'date', '2021-01-01', 0, 2, 0, 386, 0, 0, 0, 459438),
(19890, 'date', '2021-01-02', 0, 0, 0, 257, 33, 0, 0, 0),
(20180, 'date', '2021-01-03', 0, 0, 0, 193, 0, 0, 0, 0),
(20373, 'date', '2021-01-04', 0, 0, 0, 75, 2, 0, 0, 0),
(20450, 'date', '2021-01-05', 0, 0, 0, 67, 0, 0, 0, 0),
(20517, 'date', '2021-01-06', 0, 3, 0, 300, 0, 0, 0, 256485),
(20820, 'date', '2021-01-07', 0, 2, 0, 298, 5, 0, 0, 239573),
(21125, 'date', '2021-01-08', 0, 1, 0, 2411, 1, 0, 0, 176585),
(23538, 'date', '2021-01-09', 0, 0, 0, 5633, 177, 0, 0, 0),
(29348, 'date', '2021-01-10', 0, 0, 0, 128, 0, 0, 0, 0),
(29476, 'date', '2021-01-11', 0, 0, 0, 362, 0, 0, 0, 0),
(29838, 'date', '2021-01-12', 0, 2, 0, 1745, 273, 0, 0, 608127),
(31858, 'date', '2021-01-13', 0, 2, 0, 214, 65, 0, 0, 298096),
(32140, 'date', '2021-01-14', 0, 1, 0, 245, 34, 0, 0, 134085),
(32420, 'date', '2021-01-15', 0, 2, 0, 618, 2, 0, 0, 78504),
(33043, 'date', '2021-01-16', 0, 0, 0, 290, 0, 0, 0, 0),
(33333, 'date', '2021-01-17', 0, 0, 0, 350, 0, 0, 0, 0),
(33683, 'date', '2021-01-18', 0, 1, 0, 281, 1, 0, 0, 96423),
(33966, 'date', '2021-01-19', 0, 3, 0, 495, 0, 0, 0, 370554),
(34466, 'date', '2021-01-20', 0, 0, 0, 496, 0, 0, 0, 0),
(34962, 'date', '2021-01-21', 0, 1, 0, 558, 0, 0, 0, 224850),
(35521, 'date', '2021-01-22', 0, 2, 0, 899, 4, 0, 0, 187917),
(36426, 'date', '2021-01-23', 0, 0, 0, 343, 2, 0, 0, 0),
(36771, 'date', '2021-01-24', 0, 1, 0, 522, 2, 0, 0, 121615),
(37297, 'date', '2021-01-25', 0, 0, 0, 358, 3, 0, 0, 0),
(37658, 'date', '2021-01-26', 0, 1, 0, 356, 2, 0, 0, 117414),
(38017, 'date', '2021-01-27', 0, 1, 0, 2637, 2, 0, 0, 136085),
(40657, 'date', '2021-01-28', 0, 0, 0, 121, 5, 0, 0, 0),
(40784, 'date', '2021-01-29', 0, 2, 0, 256, 5, 0, 0, 153399),
(41047, 'date', '2021-01-30', 0, 2, 0, 690, 2, 0, 0, 223976),
(41741, 'date', '2021-01-31', 0, 1, 0, 310, 1, 0, 0, 106682),
(42053, 'date', '2021-02-01', 0, 1, 0, 178, 0, 0, 0, 124882),
(42232, 'date', '2021-02-02', 0, 0, 0, 135, 0, 0, 0, 0),
(42367, 'date', '2021-02-03', 0, 2, 0, 191, 0, 0, 0, 259267),
(42560, 'date', '2021-02-04', 0, 1, 0, 299, 0, 0, 0, 168619),
(42860, 'date', '2021-02-05', 0, 1, 0, 886, 0, 0, 0, 116958),
(43747, 'date', '2021-02-06', 0, 1, 0, 396, 133, 0, 0, 28757),
(44277, 'date', '2021-02-07', 0, 1, 0, 331, 3, 0, 0, 84107),
(44612, 'date', '2021-02-08', 0, 1, 0, 464, 0, 0, 0, 120804),
(45077, 'date', '2021-02-09', 0, 1, 0, 378, 34, 0, 0, 92077),
(45490, 'date', '2021-02-10', 0, 0, 0, 212, 0, 0, 0, 0),
(45702, 'date', '2021-02-11', 0, 2, 0, 225, 0, 0, 0, 231244),
(45929, 'date', '2021-02-12', 0, 0, 0, 815, 0, 0, 0, 0),
(46744, 'date', '2021-02-13', 0, 1, 0, 58, 0, 0, 0, 119946),
(46803, 'date', '2021-02-14', 0, 1, 0, 222, 0, 0, 0, 27107),
(47026, 'date', '2021-02-15', 0, 1, 0, 172, 2, 0, 0, 25553),
(47201, 'date', '2021-02-16', 0, 0, 0, 235, 0, 0, 0, 0),
(47436, 'date', '2021-02-17', 0, 0, 0, 152, 1, 0, 0, 0),
(47589, 'date', '2021-02-18', 0, 0, 0, 419, 1, 0, 0, 0),
(48009, 'date', '2021-02-19', 0, 0, 0, 3782, 47, 0, 0, 0),
(51838, 'date', '2021-02-20', 0, 0, 0, 234, 0, 0, 0, 0),
(52072, 'date', '2021-02-21', 0, 0, 0, 300, 134, 0, 0, 0),
(52506, 'date', '2021-02-22', 0, 0, 0, 520, 0, 0, 0, 0),
(53026, 'date', '2021-02-23', 0, 1, 0, 201, 0, 0, 0, 286180),
(53228, 'date', '2021-02-24', 0, 0, 0, 675, 4, 0, 0, 0),
(53907, 'date', '2021-02-25', 0, 0, 0, 519, 0, 0, 0, 0),
(54426, 'date', '2021-02-26', 1, 0, 0, 28, 0, 0, 0, 0),
(54455, 'date', '2021-02-27', 0, 3, 0, 35, 0, 0, 0, 466194),
(54495, 'date', '2021-02-28', 0, 1, 0, 429, 0, 0, 0, 23267),
(54926, 'date', '2021-03-01', 0, 1, 0, 241, 0, 0, 0, 195628),
(55168, 'date', '2021-03-02', 0, 1, 0, 310, 0, 0, 0, 79758),
(55479, 'date', '2021-03-03', 0, 1, 0, 485, 0, 0, 0, 100586),
(55965, 'date', '2021-03-04', 0, 0, 0, 1053, 0, 0, 0, 0),
(57018, 'date', '2021-03-05', 0, 1, 0, 432, 1, 0, 0, 127801),
(57452, 'date', '2021-03-06', 0, 0, 0, 224, 0, 0, 0, 0),
(57676, 'date', '2021-03-07', 0, 0, 0, 185, 1, 0, 0, 0),
(57862, 'date', '2021-03-08', 0, 1, 0, 496, 135, 0, 0, 221263),
(58494, 'date', '2021-03-09', 0, 0, 0, 960, 2, 0, 0, 0),
(59456, 'date', '2021-03-10', 0, 0, 0, 261, 0, 0, 0, 0),
(59717, 'date', '2021-03-11', 0, 0, 0, 141, 35, 0, 0, 0),
(59893, 'date', '2021-03-12', 0, 0, 0, 128, 1, 0, 0, 0),
(60022, 'date', '2021-03-13', 0, 1, 0, 259, 5, 0, 0, 195354),
(60287, 'date', '2021-03-14', 0, 0, 0, 137, 4, 0, 0, 0),
(60428, 'date', '2021-03-15', 0, 2, 0, 711, 0, 0, 0, 264701),
(61141, 'date', '2021-03-16', 0, 1, 0, 689, 0, 0, 0, 69552),
(61831, 'date', '2021-03-17', 0, 2, 0, 477, 0, 0, 0, 288148),
(62310, 'date', '2021-03-18', 0, 0, 0, 823, 1, 0, 0, 0),
(63134, 'date', '2021-03-19', 0, 2, 0, 642, 3, 0, 0, 144554),
(63781, 'date', '2021-03-20', 0, 1, 0, 365, 10, 0, 0, 237252),
(64157, 'date', '2021-03-21', 0, 1, 0, 819, 9, 0, 0, 197014),
(64986, 'date', '2021-03-22', 0, 0, 0, 608, 7, 0, 0, 0),
(65601, 'date', '2021-03-23', 0, 0, 0, 292, 9, 0, 0, 0),
(65902, 'date', '2021-03-24', 0, 2, 0, 279, 2, 0, 0, 310293),
(66185, 'date', '2021-03-25', 0, 0, 0, 399, 7, 0, 0, 0),
(66591, 'date', '2021-03-26', 0, 0, 0, 1099, 2, 0, 0, 0),
(67692, 'date', '2021-03-27', 0, 0, 0, 308, 1, 0, 0, 0),
(68001, 'date', '2021-03-28', 0, 1, 0, 377, 1, 0, 0, 27107),
(68380, 'date', '2021-03-29', 0, 0, 0, 2917, 1, 0, 0, 0),
(71298, 'date', '2021-03-30', 0, 0, 0, 5240, 109, 0, 0, 0),
(76647, 'date', '2021-03-31', 0, 1, 0, 168, 35, 0, 0, 150322),
(76851, 'date', '2021-04-01', 0, 2, 0, 632, 29, 0, 0, 223170),
(77514, 'date', '2021-04-02', 0, 1, 0, 796, 0, 0, 0, 61482),
(78311, 'date', '2021-04-03', 0, 2, 0, 424, 12, 0, 0, 146297),
(78749, 'date', '2021-04-04', 0, 0, 0, 625, 0, 0, 0, 0),
(79374, 'date', '2021-04-05', 0, 0, 0, 751, 0, 0, 0, 0),
(80125, 'date', '2021-04-06', 0, 0, 0, 539, 0, 0, 0, 0),
(80664, 'date', '2021-04-07', 0, 1, 0, 66, 34, 0, 0, 126232),
(80765, 'date', '2021-04-08', 0, 2, 0, 352, 106, 0, 0, 226626),
(81225, 'date', '2021-04-09', 0, 0, 0, 436, 0, 0, 0, 0),
(81661, 'date', '2021-04-10', 0, 0, 0, 90, 0, 0, 0, 0),
(81751, 'date', '2021-04-11', 0, 0, 0, 177, 7, 0, 0, 0),
(81935, 'date', '2021-04-12', 0, 0, 0, 651, 27, 0, 0, 0),
(82613, 'date', '2021-04-13', 0, 3, 0, 214, 0, 0, 0, 74941),
(82830, 'date', '2021-04-14', 0, 0, 0, 418, 0, 0, 0, 0),
(83248, 'date', '2021-04-15', 0, 3, 0, 342, 0, 0, 0, 599721),
(83593, 'date', '2021-04-16', 0, 0, 0, 72, 0, 0, 0, 0),
(83665, 'date', '2021-04-17', 0, 1, 0, 619, 0, 0, 0, 133643),
(84286, 'date', '2021-04-18', 0, 0, 0, 376, 0, 0, 0, 0),
(84662, 'date', '2021-04-19', 0, 1, 0, 363, 0, 0, 0, 169484),
(85026, 'date', '2021-04-20', 0, 4, 0, 973, 3, 0, 0, 301104),
(86008, 'date', '2021-04-21', 0, 2, 0, 896, 6, 0, 0, 94599),
(86912, 'date', '2021-04-22', 0, 0, 0, 341, 25, 0, 0, 0),
(87278, 'date', '2021-04-23', 0, 1, 0, 426, 34, 0, 0, 64252),
(87739, 'date', '2021-04-24', 1, 3, 0, 309, 8, 0, 0, 355796),
(88060, 'date', '2021-04-25', 0, 2, 0, 401, 2, 0, 0, 377478),
(88466, 'date', '2021-04-26', 0, 3, 0, 391, 11, 0, 0, 531356),
(88871, 'date', '2021-04-27', 0, 4, 0, 983, 0, 0, 0, 444862),
(89858, 'date', '2021-04-28', 0, 0, 0, 109, 0, 0, 0, 0),
(89967, 'date', '2021-04-29', 0, 2, 0, 328, 0, 0, 0, 404727),
(90297, 'date', '2021-04-30', 0, 0, 0, 154, 1, 0, 0, 0),
(90452, 'date', '2021-05-01', 0, 4, 0, 214, 3, 0, 0, 564057),
(90675, 'date', '2021-05-02', 0, 0, 0, 71, 0, 0, 0, 0),
(90746, 'date', '2021-05-03', 0, 1, 0, 293, 1, 0, 0, 118137),
(91041, 'date', '2021-05-04', 0, 0, 0, 425, 0, 0, 0, 0),
(91466, 'date', '2021-05-05', 0, 0, 0, 264, 2, 0, 0, 0),
(91732, 'date', '2021-05-06', 0, 0, 0, 700, 2, 0, 0, 0),
(92434, 'date', '2021-05-07', 0, 1, 0, 241, 0, 0, 0, 145025),
(92677, 'date', '2021-05-08', 0, 0, 0, 245, 0, 0, 0, 0),
(92922, 'date', '2021-05-09', 0, 0, 0, 577, 1, 0, 0, 0),
(93500, 'date', '2021-05-10', 0, 1, 0, 1931, 0, 0, 0, 117637),
(95432, 'date', '2021-05-11', 0, 0, 0, 1684, 53, 0, 0, 0),
(97169, 'date', '2021-05-12', 0, 0, 0, 1353, 101, 0, 0, 0),
(98623, 'date', '2021-05-13', 0, 0, 0, 620, 0, 0, 0, 0),
(99243, 'date', '2021-05-14', 0, 1, 0, 621, 23, 0, 0, 238131),
(99888, 'date', '2021-05-15', 0, 0, 0, 588, 91, 0, 0, 0),
(100567, 'date', '2021-05-16', 0, 1, 0, 434, 46, 0, 0, 120697),
(101049, 'date', '2021-05-17', 0, 0, 0, 1067, 26, 0, 0, 0),
(102142, 'date', '2021-05-18', 0, 0, 0, 621, 0, 0, 0, 0),
(102763, 'date', '2021-05-19', 0, 0, 0, 521, 3, 0, 0, 0),
(103287, 'date', '2021-05-20', 0, 1, 0, 505, 0, 0, 0, 155713),
(103793, 'date', '2021-05-21', 0, 0, 0, 475, 1, 0, 0, 0),
(104269, 'date', '2021-05-22', 0, 0, 0, 763, 0, 0, 0, 0),
(105032, 'date', '2021-05-23', 0, 1, 0, 356, 0, 0, 0, 79758),
(105389, 'date', '2021-05-24', 0, 0, 0, 363, 0, 0, 0, 0),
(105752, 'date', '2021-05-25', 0, 0, 0, 964, 0, 0, 0, 0),
(106716, 'date', '2021-05-26', 0, 0, 0, 21, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chv_storages`
--

CREATE TABLE `chv_storages` (
  `storage_id` bigint NOT NULL,
  `storage_api_id` bigint NOT NULL,
  `storage_name` varchar(255) NOT NULL,
  `storage_service` varchar(255) DEFAULT NULL,
  `storage_url` varchar(255) NOT NULL,
  `storage_bucket` varchar(255) DEFAULT NULL,
  `storage_region` varchar(255) DEFAULT NULL,
  `storage_server` varchar(255) DEFAULT NULL,
  `storage_account_id` varchar(255) DEFAULT NULL,
  `storage_account_name` varchar(255) DEFAULT NULL,
  `storage_key` mediumtext,
  `storage_secret` mediumtext,
  `storage_is_https` tinyint(1) NOT NULL DEFAULT '0',
  `storage_is_active` tinyint(1) NOT NULL DEFAULT '0',
  `storage_capacity` bigint DEFAULT NULL,
  `storage_space_used` bigint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chv_storage_apis`
--

CREATE TABLE `chv_storage_apis` (
  `storage_api_id` bigint NOT NULL,
  `storage_api_name` varchar(255) NOT NULL,
  `storage_api_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chv_storage_apis`
--

INSERT INTO `chv_storage_apis` (`storage_api_id`, `storage_api_name`, `storage_api_type`) VALUES
(1, 'Amazon S3', 's3'),
(2, 'Google Cloud', 'gcloud'),
(3, 'Microsoft Azure', 'azure'),
(4, 'Chevereto Grid', 'chvgrid'),
(5, 'FTP', 'ftp'),
(6, 'SFTP', 'sftp'),
(7, 'OpenStack', 'openstack'),
(8, 'Local', 'local'),
(9, 'S3 compatible', 's3compatible'),
(10, 'Alibaba Cloud OSS', 'oss'),
(11, 'Backblaze B2', 'b2');

-- --------------------------------------------------------

--
-- Table structure for table `chv_users`
--

CREATE TABLE `chv_users` (
  `user_id` bigint NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_username` varchar(191) NOT NULL,
  `user_date` datetime NOT NULL,
  `user_date_gmt` datetime NOT NULL,
  `user_email` varchar(191) DEFAULT NULL,
  `user_avatar_filename` varchar(255) DEFAULT NULL,
  `user_facebook_username` varchar(255) DEFAULT NULL,
  `user_twitter_username` varchar(255) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `user_background_filename` varchar(255) DEFAULT NULL,
  `user_bio` varchar(255) DEFAULT NULL,
  `user_timezone` varchar(255) NOT NULL,
  `user_language` varchar(255) DEFAULT NULL,
  `user_status` enum('valid','awaiting-confirmation','awaiting-email','banned') NOT NULL,
  `user_is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `user_is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `user_is_private` tinyint(1) NOT NULL DEFAULT '0',
  `user_is_dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `user_newsletter_subscribe` tinyint(1) NOT NULL DEFAULT '1',
  `user_show_nsfw_listings` tinyint(1) NOT NULL DEFAULT '0',
  `user_image_count` bigint NOT NULL DEFAULT '0',
  `user_album_count` bigint NOT NULL DEFAULT '0',
  `user_image_keep_exif` tinyint(1) NOT NULL DEFAULT '1',
  `user_image_expiration` varchar(191) DEFAULT NULL,
  `user_registration_ip` varchar(191) NOT NULL,
  `user_likes` bigint NOT NULL DEFAULT '0' COMMENT 'Likes made to content owned by this user',
  `user_liked` bigint NOT NULL DEFAULT '0' COMMENT 'Likes made by this user',
  `user_following` bigint NOT NULL DEFAULT '0',
  `user_followers` bigint NOT NULL DEFAULT '0',
  `user_content_views` bigint NOT NULL DEFAULT '0',
  `user_notifications_unread` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chv_users`
--

INSERT INTO `chv_users` (`user_id`, `user_name`, `user_username`, `user_date`, `user_date_gmt`, `user_email`, `user_avatar_filename`, `user_facebook_username`, `user_twitter_username`, `user_website`, `user_background_filename`, `user_bio`, `user_timezone`, `user_language`, `user_status`, `user_is_admin`, `user_is_manager`, `user_is_private`, `user_is_dark_mode`, `user_newsletter_subscribe`, `user_show_nsfw_listings`, `user_image_count`, `user_album_count`, `user_image_keep_exif`, `user_image_expiration`, `user_registration_ip`, `user_likes`, `user_liked`, `user_following`, `user_followers`, `user_content_views`, `user_notifications_unread`) VALUES
(5, 'Katchy', 'katchy', '2020-11-16 07:02:07', '2020-11-16 10:02:07', 'webmaster@katchyl.com', 'av_1605525161.jpg', NULL, NULL, 'https://r3klaw.github.io/r3klaw-resume/', 'bkg_1605510291.png', 'imagination is knowledge and knowledge is power', 'Africa/Nairobi', 'en', 'valid', 1, 0, 0, 1, 1, 0, 15, 0, 1, NULL, '197.177.114.139', 0, 0, 0, 0, 6961, 0),
(7, NULL, 'fila_boss', '2020-11-16 15:50:26', '2020-11-16 12:50:26', 'filalovi@gmail.com', NULL, NULL, NULL, NULL, 'bkg_1605520256.jpg', NULL, 'Africa/Nairobi', 'en', 'valid', 0, 0, 0, 0, 1, 0, 86, 1, 1, NULL, '154.122.68.158', 0, 0, 0, 0, 50362, 0),
(8, NULL, 'one_love', '2020-11-16 16:32:58', '2020-11-16 13:32:58', 'daonlywan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Africa/Nairobi', 'en', 'valid', 0, 0, 0, 0, 1, 0, 109, 0, 1, NULL, '102.23.98.19', 0, 0, 0, 0, 42764, 0),
(9, NULL, 'professor', '2020-11-16 16:50:05', '2020-11-16 13:50:05', 'katchkibiwott@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Africa/Nairobi', 'en', 'valid', 0, 0, 0, 1, 1, 0, 0, 0, 1, NULL, '41.89.96.16', 0, 0, 0, 0, 0, 0),
(11, NULL, 'levi', '2020-11-25 17:48:37', '2020-11-25 14:48:37', 'levimateba@gmail.com', NULL, NULL, NULL, NULL, 'bkg_1606304977.jpg', NULL, 'Africa/Nairobi', 'en', 'valid', 0, 0, 0, 1, 1, 0, 0, 0, 1, NULL, '105.160.30.147', 0, 0, 0, 0, 0, 0),
(12, NULL, 'online24', '2021-02-26 17:36:08', '2021-02-26 14:36:08', 'katchy.ke@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Africa/Nairobi', 'en', 'valid', 0, 0, 0, 0, 1, 0, 1, 0, 1, NULL, '41.76.168.176', 0, 0, 0, 0, 247, 0),
(13, NULL, 'jozy', '2021-04-24 20:13:38', '2021-04-24 17:13:38', 'mwangijosphat108@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Africa/Nairobi', 'en', 'valid', 0, 0, 0, 1, 1, 0, 0, 0, 1, NULL, '154.153.233.242', 0, 0, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chv_albums`
--
ALTER TABLE `chv_albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `album_name` (`album_name`),
  ADD KEY `album_user_id` (`album_user_id`),
  ADD KEY `album_date_gmt` (`album_date_gmt`),
  ADD KEY `album_privacy` (`album_privacy`),
  ADD KEY `album_image_count` (`album_image_count`),
  ADD KEY `album_creation_ip` (`album_creation_ip`(191));
ALTER TABLE `chv_albums` ADD FULLTEXT KEY `searchindex` (`album_name`,`album_description`);

--
-- Indexes for table `chv_categories`
--
ALTER TABLE `chv_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `url_key` (`category_url_key`) USING BTREE;

--
-- Indexes for table `chv_confirmations`
--
ALTER TABLE `chv_confirmations`
  ADD PRIMARY KEY (`confirmation_id`);

--
-- Indexes for table `chv_deletions`
--
ALTER TABLE `chv_deletions`
  ADD PRIMARY KEY (`deleted_id`),
  ADD KEY `deleted_content_id` (`deleted_content_id`),
  ADD KEY `deleted_content_user_id` (`deleted_content_user_id`),
  ADD KEY `deleted_content_ip` (`deleted_content_ip`),
  ADD KEY `deleted_content_md5` (`deleted_content_md5`),
  ADD KEY `deleted_content_views` (`deleted_content_views`),
  ADD KEY `deleted_content_likes` (`deleted_content_likes`);

--
-- Indexes for table `chv_follows`
--
ALTER TABLE `chv_follows`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `follow_user_id` (`follow_user_id`),
  ADD KEY `follow_followed_user_id` (`follow_followed_user_id`);

--
-- Indexes for table `chv_images`
--
ALTER TABLE `chv_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `image_name` (`image_name`(191)),
  ADD KEY `image_extension` (`image_extension`(191)),
  ADD KEY `image_size` (`image_size`),
  ADD KEY `image_width` (`image_width`),
  ADD KEY `image_height` (`image_height`),
  ADD KEY `image_date_gmt` (`image_date_gmt`),
  ADD KEY `image_nsfw` (`image_nsfw`),
  ADD KEY `image_user_id` (`image_user_id`),
  ADD KEY `image_album_id` (`image_album_id`),
  ADD KEY `image_uploader_ip` (`image_uploader_ip`(191)),
  ADD KEY `image_storage_mode` (`image_storage_mode`),
  ADD KEY `image_path` (`image_path`(191)),
  ADD KEY `image_storage_id` (`image_storage_id`),
  ADD KEY `image_md5` (`image_md5`),
  ADD KEY `image_source_md5` (`image_source_md5`),
  ADD KEY `image_views` (`image_views`),
  ADD KEY `image_category_id` (`image_category_id`),
  ADD KEY `image_chain` (`image_chain`),
  ADD KEY `image_expiration_date_gmt` (`image_expiration_date_gmt`),
  ADD KEY `image_likes` (`image_likes`),
  ADD KEY `image_is_animated` (`image_is_animated`),
  ADD KEY `image_is_approved` (`image_is_approved`),
  ADD KEY `image_album_id_image_id` (`image_album_id`,`image_id`);
ALTER TABLE `chv_images` ADD FULLTEXT KEY `searchindex` (`image_name`,`image_title`,`image_description`,`image_original_filename`);

--
-- Indexes for table `chv_importing`
--
ALTER TABLE `chv_importing`
  ADD PRIMARY KEY (`importing_id`),
  ADD UNIQUE KEY `importing_path` (`importing_path`(255));

--
-- Indexes for table `chv_imports`
--
ALTER TABLE `chv_imports`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `import_path` (`import_path`(255)) USING BTREE;

--
-- Indexes for table `chv_ip_bans`
--
ALTER TABLE `chv_ip_bans`
  ADD PRIMARY KEY (`ip_ban_id`),
  ADD UNIQUE KEY `ip_ban_ip` (`ip_ban_ip`) USING BTREE,
  ADD KEY `ip_ban_date_gmt` (`ip_ban_date_gmt`);

--
-- Indexes for table `chv_likes`
--
ALTER TABLE `chv_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `like_date_gmt` (`like_date_gmt`),
  ADD KEY `like_user_id` (`like_user_id`),
  ADD KEY `like_content_type` (`like_content_type`),
  ADD KEY `like_content_id` (`like_content_id`),
  ADD KEY `like_content_user_id` (`like_content_user_id`),
  ADD KEY `like_ip` (`like_ip`);

--
-- Indexes for table `chv_locks`
--
ALTER TABLE `chv_locks`
  ADD PRIMARY KEY (`lock_id`),
  ADD UNIQUE KEY `lock_name` (`lock_name`(191)) USING BTREE,
  ADD KEY `lock_date_gmt` (`lock_date_gmt`),
  ADD KEY `lock_expires_gmt` (`lock_expires_gmt`);

--
-- Indexes for table `chv_logins`
--
ALTER TABLE `chv_logins`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `login_user_id` (`login_user_id`);

--
-- Indexes for table `chv_notifications`
--
ALTER TABLE `chv_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_date_gmt` (`notification_date_gmt`),
  ADD KEY `notification_user_id` (`notification_user_id`),
  ADD KEY `notification_trigger_user_id` (`notification_trigger_user_id`),
  ADD KEY `notification_type` (`notification_type`),
  ADD KEY `notification_content_type` (`notification_content_type`),
  ADD KEY `notification_type_id` (`notification_type_id`),
  ADD KEY `notification_is_read` (`notification_is_read`);

--
-- Indexes for table `chv_pages`
--
ALTER TABLE `chv_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_internal` (`page_internal`),
  ADD KEY `page_url_key` (`page_url_key`),
  ADD KEY `page_type` (`page_type`),
  ADD KEY `page_is_active` (`page_is_active`),
  ADD KEY `page_is_link_visible` (`page_is_link_visible`),
  ADD KEY `page_sort_display` (`page_sort_display`);

--
-- Indexes for table `chv_queues`
--
ALTER TABLE `chv_queues`
  ADD PRIMARY KEY (`queue_id`);

--
-- Indexes for table `chv_redirects`
--
ALTER TABLE `chv_redirects`
  ADD PRIMARY KEY (`redirect_id`),
  ADD UNIQUE KEY `redirect_from` (`redirect_from`(255)),
  ADD KEY `redirect_content_id` (`redirect_content_id`);

--
-- Indexes for table `chv_requests`
--
ALTER TABLE `chv_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `request_type` (`request_type`),
  ADD KEY `request_user_id` (`request_user_id`),
  ADD KEY `request_content_id` (`request_content_id`),
  ADD KEY `request_ip` (`request_ip`),
  ADD KEY `request_date_gmt` (`request_date_gmt`),
  ADD KEY `request_result` (`request_result`);

--
-- Indexes for table `chv_settings`
--
ALTER TABLE `chv_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD KEY `setting_name` (`setting_name`);

--
-- Indexes for table `chv_stats`
--
ALTER TABLE `chv_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD UNIQUE KEY `stat_date_gmt` (`stat_date_gmt`) USING BTREE,
  ADD KEY `stat_type` (`stat_type`);

--
-- Indexes for table `chv_storages`
--
ALTER TABLE `chv_storages`
  ADD PRIMARY KEY (`storage_id`),
  ADD KEY `storage_api_id` (`storage_api_id`),
  ADD KEY `storage_is_active` (`storage_is_active`);

--
-- Indexes for table `chv_storage_apis`
--
ALTER TABLE `chv_storage_apis`
  ADD PRIMARY KEY (`storage_api_id`);

--
-- Indexes for table `chv_users`
--
ALTER TABLE `chv_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`user_username`) USING BTREE,
  ADD UNIQUE KEY `email` (`user_email`) USING BTREE,
  ADD KEY `user_date_gmt` (`user_date_gmt`),
  ADD KEY `user_status` (`user_status`),
  ADD KEY `user_is_admin` (`user_is_admin`),
  ADD KEY `user_is_manager` (`user_is_manager`),
  ADD KEY `user_is_private` (`user_is_private`),
  ADD KEY `user_is_dark_mode` (`user_is_dark_mode`),
  ADD KEY `user_newsletter_subscribe` (`user_newsletter_subscribe`),
  ADD KEY `user_show_nsfw_listings` (`user_show_nsfw_listings`),
  ADD KEY `user_image_count` (`user_image_count`),
  ADD KEY `user_album_count` (`user_album_count`),
  ADD KEY `user_image_keep_exif` (`user_image_keep_exif`),
  ADD KEY `user_image_expiration` (`user_image_expiration`),
  ADD KEY `user_registration_ip` (`user_registration_ip`),
  ADD KEY `user_likes` (`user_likes`),
  ADD KEY `user_following` (`user_following`),
  ADD KEY `user_followers` (`user_followers`),
  ADD KEY `user_liked` (`user_liked`),
  ADD KEY `user_content_views` (`user_content_views`);
ALTER TABLE `chv_users` ADD FULLTEXT KEY `searchindex` (`user_name`,`user_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chv_albums`
--
ALTER TABLE `chv_albums`
  MODIFY `album_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chv_categories`
--
ALTER TABLE `chv_categories`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_confirmations`
--
ALTER TABLE `chv_confirmations`
  MODIFY `confirmation_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chv_deletions`
--
ALTER TABLE `chv_deletions`
  MODIFY `deleted_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `chv_follows`
--
ALTER TABLE `chv_follows`
  MODIFY `follow_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_images`
--
ALTER TABLE `chv_images`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;

--
-- AUTO_INCREMENT for table `chv_importing`
--
ALTER TABLE `chv_importing`
  MODIFY `importing_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_imports`
--
ALTER TABLE `chv_imports`
  MODIFY `import_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chv_ip_bans`
--
ALTER TABLE `chv_ip_bans`
  MODIFY `ip_ban_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_likes`
--
ALTER TABLE `chv_likes`
  MODIFY `like_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_locks`
--
ALTER TABLE `chv_locks`
  MODIFY `lock_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=682502;

--
-- AUTO_INCREMENT for table `chv_logins`
--
ALTER TABLE `chv_logins`
  MODIFY `login_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `chv_notifications`
--
ALTER TABLE `chv_notifications`
  MODIFY `notification_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_pages`
--
ALTER TABLE `chv_pages`
  MODIFY `page_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chv_queues`
--
ALTER TABLE `chv_queues`
  MODIFY `queue_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_redirects`
--
ALTER TABLE `chv_redirects`
  MODIFY `redirect_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_requests`
--
ALTER TABLE `chv_requests`
  MODIFY `request_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `chv_settings`
--
ALTER TABLE `chv_settings`
  MODIFY `setting_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `chv_stats`
--
ALTER TABLE `chv_stats`
  MODIFY `stat_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106737;

--
-- AUTO_INCREMENT for table `chv_storages`
--
ALTER TABLE `chv_storages`
  MODIFY `storage_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chv_storage_apis`
--
ALTER TABLE `chv_storage_apis`
  MODIFY `storage_api_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chv_users`
--
ALTER TABLE `chv_users`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
