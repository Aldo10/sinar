-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2018 at 04:56 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppl`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `title`, `seotitle`, `active`) VALUES
(1, 'Mobil', 'mobil', 'Y'),
(2, 'Perbaikan Mobil', 'perbaikan-mobil', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_category` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT '0',
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_category`, `id_parent`, `seotitle`, `picture`, `active`) VALUES
(9, 0, 'tugas-dan-fungsi', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `category_description`
--

CREATE TABLE `category_description` (
  `id_category_description` int(5) NOT NULL,
  `id_category` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_description`
--

INSERT INTO `category_description` (`id_category_description`, `id_category`, `id_language`, `title`) VALUES
(17, 9, 1, 'Tugas dan Fungsi'),
(18, 9, 2, 'Tugas dan Fungsi');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT '0',
  `id_post` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id_comment`, `id_parent`, `id_post`, `name`, `email`, `url`, `comment`, `date`, `time`, `active`, `status`) VALUES
(1, 0, 8, 'Jenuar Dalapang', 'djenuar@gmail.com', '', 'Edukasi keuangan terhadap anak memang penting sejak dini', '2016-07-28', '12:40:24', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE `component` (
  `id_component` int(5) NOT NULL,
  `component` varchar(100) NOT NULL,
  `type` enum('component','widget') NOT NULL DEFAULT 'component',
  `datetime` datetime NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`id_component`, `component`, `type`, `datetime`, `active`) VALUES
(1, 'gallery', 'component', '2016-03-11 10:00:00', 'Y'),
(2, 'contact', 'component', '2016-03-11 10:00:00', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `title`, `content`, `picture`) VALUES
(9, 2, 'Perbaikan Shock', '', 'img_20181018_091513.png'),
(10, 2, 'Pengecekan Mobil', '', 'img_20181018_091202_1.png'),
(11, 2, 'Pendempulan Mobil', '', 'img_20181018_091240.png'),
(12, 1, 'Mobil Parkir', '', 'img_20181018_091133.png'),
(13, 1, 'Stand by', '', 'img_20181018_091246.png'),
(14, 2, 'Pengelasan Mobil', '', 'img_20181018_091303.png');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id_language` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id_language`, `title`, `code`, `active`) VALUES
(1, 'Indonesia', 'id', 'Y'),
(2, 'English', 'gb', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `target` varchar(10) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`, `target`) VALUES
(1, 0, 'dashboard', 'admin.php?mod=home', 'fa-home', 1, 1, 'Y', 'none'),
(2, 0, 'post', 'admin.php?mod=post', 'fa-book', 2, 1, 'Y', 'none'),
(3, 2, 'addnew', 'admin.php?mod=post&act=addnew', '', 2, 1, 'Y', 'none'),
(4, 2, 'allpost', 'admin.php?mod=post', '', 1, 1, 'Y', 'none'),
(5, 0, 'category', 'admin.php?mod=category', 'fa-tasks', 3, 1, 'Y', 'none'),
(6, 5, 'allcategory', 'admin.php?mod=category', '', 1, 1, 'Y', 'none'),
(7, 5, 'addnew', 'admin.php?mod=category&act=addnew', '', 2, 1, 'Y', 'none'),
(8, 0, 'tag', 'admin.php?mod=tag', 'fa-tags', 4, 1, 'Y', 'none'),
(9, 8, 'alltag', 'admin.php?mod=tag', '', 1, 1, 'Y', 'none'),
(19, 8, 'addnew', 'admin.php?mod=tag&act=addnew', '', 2, 1, 'Y', 'none'),
(20, 0, 'pages', 'admin.php?mod=pages', 'fa-file', 6, 1, 'Y', 'none'),
(21, 20, 'allpages', 'admin.php?mod=pages', '', 1, 1, 'Y', 'none'),
(22, 20, 'addnew', 'admin.php?mod=pages&act=addnew', '', 2, 1, 'Y', 'none'),
(23, 0, 'library', 'admin.php?mod=library', 'fa-picture-o', 7, 1, 'Y', 'none'),
(27, 0, 'setting', 'admin.php?mod=setting', 'fa-cog', 8, 1, 'Y', 'none'),
(28, 0, 'theme', 'admin.php?mod=theme', 'fa-desktop', 9, 1, 'Y', 'none'),
(29, 28, 'alltheme', 'admin.php?mod=theme', '', 1, 1, 'Y', 'none'),
(30, 28, 'addnew', 'admin.php?mod=theme&act=addnew', '', 2, 1, 'Y', 'none'),
(31, 0, 'menumanager', 'admin.php?mod=menumanager', 'fa-sitemap', 10, 1, 'Y', 'none'),
(32, 0, 'component', 'admin.php?mod=component', 'fa-puzzle-piece', 11, 1, 'Y', 'none'),
(33, 32, 'allcomponent', 'admin.php?mod=component', '', 1, 1, 'Y', 'none'),
(34, 32, 'addnew', 'admin.php?mod=component&act=addnew', '', 2, 1, 'Y', 'none'),
(42, 0, 'comment', 'admin.php?mod=comment', 'fa-comments', 5, 1, 'Y', 'none'),
(43, 32, 'Galeri', 'admin.php?mod=gallery', '', 3, 1, 'Y', 'none'),
(44, 32, 'Kontak', 'admin.php?mod=contact', '', 4, 1, 'Y', 'none'),
(45, 0, 'user', 'admin.php?mod=user', 'fa-group', 12, 1, 'Y', 'none'),
(46, 45, 'alluser', 'admin.php?mod=user', '', 1, 1, 'Y', 'none'),
(47, 45, 'addnew', 'admin.php?mod=user&act=addnew', '', 2, 1, 'Y', 'none'),
(48, 0, 'Beranda', './', '', 1, 2, 'Y', 'none'),
(49, 0, 'Home', './', '', 1, 3, 'Y', 'none'),
(50, 0, 'Profil', 'pages/profil', '', 3, 2, 'Y', 'none'),
(51, 50, 'Visi & Misi', 'pages/visi-misi', '', 1, 2, 'Y', 'none'),
(56, 0, 'Galeri', 'album', '', 5, 2, 'Y', 'none'),
(57, 0, 'Kontak', 'contact', '', 6, 2, 'Y', 'none'),
(58, 0, 'About Us', 'pages/tentang-kami', '', 2, 3, 'Y', 'none'),
(59, 58, 'Services', 'pages/layanan', '', 1, 3, 'Y', 'none'),
(60, 0, 'Indonesiaku', 'category/indonesiaku', '', 50, 3, 'Y', 'none'),
(61, 0, 'Motivation', 'category/motivasi', '', 50, 3, 'Y', 'none'),
(62, 0, 'Relationship', 'category/hubungan', '', 50, 3, 'Y', 'none'),
(63, 0, 'Success', 'category/sukses', '', 50, 3, 'Y', 'none'),
(64, 0, 'Gallery', 'album', '', 50, 3, 'Y', 'none'),
(65, 0, 'Contact', 'contact', '', 50, 3, 'Y', 'none'),
(66, 0, 'Sejarah', 'pages/sejarah', '', 2, 2, 'Y', 'none'),
(67, 0, 'Tugas dan Fungsi', 'category/tugas-dan-fungsi', '', 4, 2, 'Y', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `menu_group`
--

CREATE TABLE `menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_group`
--

INSERT INTO `menu_group` (`id`, `title`) VALUES
(1, 'Dashboard'),
(2, 'id'),
(3, 'gb');

-- --------------------------------------------------------

--
-- Table structure for table `oauth`
--

CREATE TABLE `oauth` (
  `id_oauth` int(5) NOT NULL,
  `oauth_type` varchar(10) NOT NULL,
  `oauth_key` text NOT NULL,
  `oauth_secret` text NOT NULL,
  `oauth_id` varchar(100) NOT NULL,
  `oauth_user` varchar(100) NOT NULL,
  `oauth_token1` text NOT NULL,
  `oauth_token2` text NOT NULL,
  `oauth_fbtype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth`
--

INSERT INTO `oauth` (`id_oauth`, `oauth_type`, `oauth_key`, `oauth_secret`, `oauth_id`, `oauth_user`, `oauth_token1`, `oauth_token2`, `oauth_fbtype`) VALUES
(1, 'facebook', '1379700562291163', '8fecea44bbbca74ce2cc1f0129f004bf', '', '', '', '', ''),
(2, 'twitter', 'uPXZGTJI2xcMcviHJdZxw', '9Jacq3buOEY39dWgCnuREbe5vMUnuDLP86daS7b1uw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id_pages` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id_pages`, `seotitle`, `picture`, `active`) VALUES
(1, 'profil', '', 'Y'),
(2, 'visi-misi', '', 'Y'),
(3, 'sejarah', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `pages_description`
--

CREATE TABLE `pages_description` (
  `id_pages_description` int(5) NOT NULL,
  `id_pages` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages_description`
--

INSERT INTO `pages_description` (`id_pages_description`, `id_pages`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Profil', ''),
(2, 1, 2, 'Profile', ''),
(3, 2, 1, 'Visi &amp; Misi', '&lt;p style=&quot;margin: 0in 0in 7.9pt; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;&lt;img src=&quot;http://localhost/sinar/po-content/uploads/img_20181018_091056.png&quot; alt=&quot;&quot; width=&quot;521&quot; height=&quot;391&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;Visi Perusahaan:&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;Menjadi salah satu perusahaan jasa angkutan yang terpercaya di bidang ekspedisi angkutan darat yang berfokus pada pelayanan, standart kualitas, dan mengutamakan kepuasan pelanggan.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;Misi Perusahaan:&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;1.&amp;nbsp;Menerapkan sistem dan prosedur pelayanan jasa secara profesional.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;2.&amp;nbsp;Mengutamakan kepuasan konsumen dengan memberikan pelayanan terbaik&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;3.&amp;nbsp;Membangun kemitraan yang saling mendukung dan menguntungkan&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;4. Membentuk tenaga kerja dengan etos kerja yang tinggi sehingga menciptakan rasa aman dan tenang bagi rekan bisnis sehingga terciptanya kepercayaan publik&lt;/span&gt;&lt;/p&gt;'),
(4, 2, 2, 'Visi &amp; Misi', ''),
(5, 3, 1, 'Sejarah', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://localhost/sinar/po-content/uploads/img_20181018_092234.png&quot; alt=&quot;&quot; width=&quot;493&quot; height=&quot;370&quot; /&gt;&lt;/p&gt;\r\n&lt;p style=&quot;margin: 0in 0in 7.9pt 0in;&quot;&gt;&lt;span style=&quot;font-size: 11.5pt; font-family: &#039;Lato&#039;,&#039;sans-serif&#039;; color: #2c3e50;&quot;&gt;Pemilik PT Sinar Sakti Sampoera ini adalah Bapak Sugiharto. Beliau adalah pengusaha yang sangat gigih dalam berjuang untuk mendapatkan kesuksesan seperti sekarang ini. PT Sinar Sakti Sampoerna ini dibangun pada tahun 1998 pada saat itu hanya mempunyai 4 mobil saja untuk menjalankan usaha sebagai angkutan darat (ekspedisi), 1 mobil milik pribadi dan 3 mobilnya milik orang tuanya. dan Pada tahun 2000 Bapak Sugiharto bertemu dengan rekan bisinis yang dimana disini diberikan kepercayaan untuk bisa mengambil mobil tanpa adanya DP, bapak tersebuk Bernama Hastono iyalah pemilih Showroom mobil. Lambat tahun usaha berjalan dan sehingga sudah banyak yang tahu dengan PT Sinar Sakti Sampoerna ini menyiapkan mobil untuk keperluan perusahaan-perusahaan. Pada saat itu memasarkannya hanya dengan dari mulut kemulut saja, tidak ada perantara apapun. dan pada saat ini tahun 2018 PT Sinar Sakti Sampoerna yang dipimpin oleh Bapak Sugiharto sudah memiliki kurang lebih 45 mobil diantaranya: Ragassa, Engkel, dan Tronton).&amp;nbsp;&lt;/span&gt;&lt;/p&gt;'),
(6, 3, 2, 'Sejarah', '');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `publishdate` datetime NOT NULL,
  `editor` int(5) NOT NULL DEFAULT '1',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `headline` enum('Y','N') NOT NULL DEFAULT 'N',
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `picture` varchar(255) NOT NULL,
  `picture_description` varchar(255) NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id_post`, `seotitle`, `tag`, `date`, `time`, `publishdate`, `editor`, `active`, `headline`, `comment`, `picture`, `picture_description`, `hits`) VALUES
(1, 'montir-bengkel', 'montir', '2018-10-22', '11:43:11', '2018-10-22 11:43:11', 1, 'Y', 'N', 'Y', 'img_20181018_091202.png', '', 1),
(2, 'operator', 'operator', '2018-10-22', '11:44:53', '2018-10-22 11:44:53', 1, 'Y', 'N', 'Y', 'img_20181018_092338.png', '', 1),
(3, 'bengkel-mobil', 'bengkel', '2018-10-22', '12:00:03', '2018-10-22 12:00:03', 1, 'Y', 'N', 'Y', 'img_20181018_092820.png', '', 3),
(4, 'tempat-parkir-mobil', 'parkir', '2018-10-22', '12:03:19', '2018-10-22 12:03:19', 1, 'Y', 'N', 'Y', 'img_20181018_091556.png', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `id_post_category` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_category` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`id_post_category`, `id_post`, `id_category`) VALUES
(1, 1, 9),
(2, 2, 9),
(3, 3, 9),
(4, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `post_description`
--

CREATE TABLE `post_description` (
  `id_post_description` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_description`
--

INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Montir Bengkel', '&lt;p&gt;Mobil yang ada di PT Sinar Sakti Sampoerna ini diperbaiki atau diservice sendiri oleh montir yang ada di Kantor. Sehingga mobil yang ingin dipakaii bisa berjalan tanpa ada kendala dan terhindar dari kerusakan yang parah.&lt;/p&gt;'),
(2, 1, 2, 'Montir Bengkel', '&lt;p&gt;Mobil yang ada di PT Sinar Sakti Sampoerna ini diperbaiki atau diservice sendiri oleh montir yang ada di Kantor. Sehingga mobil yang ingin dipakaii bisa berjalan tanpa ada kendala dan terhindar dari kerusakan yang parah.&lt;/p&gt;'),
(3, 2, 1, 'Operator', '&lt;p&gt;Pekerjaan yang dilakukan operator di PT Sinar Sakti Sampoerna ini membuatkan surat jalan pada mobil dan memberikan uang jalan pada sopir yang ingin melakukan aktivitasnya. operator juga melakuakan interaksi/hubungan pada perusahaan yang ingin bekerja sama atau yang sudah bekerja sama oleh PT Sinar Sakti Sampoerna&lt;/p&gt;'),
(4, 2, 2, 'Operator', '&lt;p&gt;Pekerjaan yang dilakukan operator di PT Sinar Sakti Sampoerna ini membuatkan surat jalan pada mobil dan memberikan uang jalan pada sopir yang ingin melakukan aktivitasnya. operator juga melakuakan interaksi/hubungan pada perusahaan yang ingin bekerja sama atau yang sudah bekerja sama oleh PT Sinar Sakti Sampoerna&lt;/p&gt;'),
(5, 3, 1, 'Bengkel Mobil', '&lt;p&gt;Tempat mobil pada saat akan diperbaiki oleh montir, dan tempat prasarana untuk perbaikan mobil&lt;/p&gt;'),
(6, 3, 2, 'Bengkel Mobil', '&lt;p&gt;Tempat mobil pada saat akan diperbaiki oleh montir, dan tempat prasarana untuk perbaikan mobil&lt;/p&gt;'),
(7, 4, 1, 'Tempat Parkir Mobil', '&lt;p&gt;Lahan kosong atau tempat untuk parkir mobil yang ada di PT Sinar Sakti Sampoerna pada saat mobil tidak dalah beraktivitas&lt;/p&gt;'),
(8, 4, 2, 'Tempat Parkir Mobil', '&lt;p&gt;Lahan kosong atau tempat untuk parkir mobil yang ada di PT Sinar Sakti Sampoerna pada saat mobil tidak dalah beraktivitas&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `post_gallery`
--

CREATE TABLE `post_gallery` (
  `id_post_gallery` int(5) NOT NULL,
  `id_post` int(5) NOT NULL DEFAULT '0',
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `groups` varchar(50) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `groups`, `options`, `value`) VALUES
(1, 'general', 'web_name', 'PT. Sinar Sakti Sampoerna'),
(2, 'general', 'web_url', 'http://localhost/sinar'),
(3, 'general', 'web_meta', 'Ekspedisi Angkutan Darat'),
(4, 'general', 'web_keyword', 'PT. Sinar Sakti Sampoerna  Ekspedisi Angkutan Darat'),
(5, 'general', 'web_owner', 'Team.Ruby'),
(6, 'general', 'email', 'ptsinarsakti9@gmail.com'),
(7, 'general', 'telephone', '0812-7814-1199'),
(8, 'general', 'fax', '0812-7814-1199'),
(9, 'general', 'address', '&lt;strong&gt;Alamat:&lt;/strong&gt;&lt;br&gt;\nBranti Raya, Branti, Kecamatan Natar Kabupaten Lampung Selatan&lt;br&gt;Lampung'),
(10, 'general', 'geocode', 'latitude:-5.2325541, longitude: 105.1723954,'),
(11, 'image', 'favicon', 'favicon.png'),
(12, 'image', 'logo', 'logo.png'),
(13, 'image', 'img_medium', '640x480'),
(14, 'local', 'country', 'Indonesia'),
(15, 'local', 'region_state', 'Sulawesi Utara'),
(16, 'local', 'timezone', 'Asia/Jakarta'),
(17, 'config', 'maintenance', 'N'),
(18, 'config', 'member_registration', 'N'),
(19, 'config', 'comment', 'N'),
(20, 'config', 'item_per_page', '5'),
(21, 'config', 'google_analytics', ''),
(22, 'config', 'recaptcha_sitekey', '6LckEgETAAAAAPdqrQSY_boMDLZRL1vpkAatVqKf'),
(23, 'config', 'recaptcha_secretkey', '6LckEgETAAAAAHqx4VFD4zNL96P9UEikD8BHfT28'),
(24, 'mail', 'mail_protocol', 'Mail'),
(25, 'mail', 'mail_hostname', ''),
(26, 'mail', 'mail_username', ''),
(27, 'mail', 'mail_password', ''),
(28, 'mail', 'mail_port', ''),
(29, 'config', 'permalink', 'slug/post-title'),
(30, 'config', 'slug_permalink', 'detailpost');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id_subscribe` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tag_seo` varchar(100) NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id_tag`, `title`, `tag_seo`, `count`) VALUES
(1, 'montir', 'montir', 1),
(2, 'operator', 'operator', 1),
(3, 'bengkel', 'bengkel', 1),
(4, 'parkir', 'parkir', 1);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`id_theme`, `title`, `author`, `folder`, `active`) VALUES
(1, 'Chingsy', 'PopojiCMS', 'chingsy', 'N'),
(2, 'Tema', 'zaqi', 'xampp', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `traffic`
--

CREATE TABLE `traffic` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `traffic`
--

INSERT INTO `traffic` (`ip`, `browser`, `os`, `platform`, `country`, `city`, `date`, `hits`, `online`) VALUES
('::1', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'Windows', '', '', '2018-10-13', 29, '1539432604'),
('::1', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'Windows', '', '', '2018-10-17', 47, '1539787916'),
('::1', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'Windows', '', '', '2018-10-18', 38, '1539865391'),
('::1', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'Windows', '', '', '2018-10-22', 24, '1540184899'),
('::1', 'Chrome', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', 'Windows', '', '', '2018-10-30', 29, '1540907781'),
('::1', 'Chrome', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', 'Windows', '', '', '2018-11-03', 10, '1541260434');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `bio` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT '2',
  `block` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `forget_key` varchar(100) DEFAULT NULL,
  `locktype` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telp`, `bio`, `picture`, `level`, `block`, `id_session`, `tgl_daftar`, `forget_key`, `locktype`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Super Administrator', 'dikyardianto8@gmail.com', '000-0000-0000', 'No matter how exciting or significant a person\'s life is, a poorly written biography will make it seem like a snore. On the other hand, a good biographer can draw insight from an ordinary life-because they recognize that even the most exciting life is an ordinary life! After all, a biography isn\'t supposed to be a collection of facts assembled in chronological order; it\'s the biographer\'s interpretation of how that life was different and important.', '', '1', 'N', 'e0qs4mukmb5qai358p435dms6h', '2018-10-13', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id_level` int(5) NOT NULL,
  `level` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `menu` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id_level`, `level`, `title`, `role`, `menu`) VALUES
(1, 'superadmin', 'Super Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1),
(2, 'admin', 'Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"1\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(3, 'manager', 'Manager', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(4, 'member', 'Member', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"component\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"contact\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"menumanager\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"oauth\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"user\",\"create\":\"0\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`id_category_description`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id_component`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_group`
--
ALTER TABLE `menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth`
--
ALTER TABLE `oauth`
  ADD PRIMARY KEY (`id_oauth`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id_pages`);

--
-- Indexes for table `pages_description`
--
ALTER TABLE `pages_description`
  ADD PRIMARY KEY (`id_pages_description`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id_post_category`);

--
-- Indexes for table `post_description`
--
ALTER TABLE `post_description`
  ADD PRIMARY KEY (`id_post_description`);

--
-- Indexes for table `post_gallery`
--
ALTER TABLE `post_gallery`
  ADD PRIMARY KEY (`id_post_gallery`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id_subscribe`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `category_description`
--
ALTER TABLE `category_description`
  MODIFY `id_category_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `component`
--
ALTER TABLE `component`
  MODIFY `id_component` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id_language` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oauth`
--
ALTER TABLE `oauth`
  MODIFY `id_oauth` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id_pages` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pages_description`
--
ALTER TABLE `pages_description`
  MODIFY `id_pages_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id_post_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `post_description`
--
ALTER TABLE `post_description`
  MODIFY `id_post_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `post_gallery`
--
ALTER TABLE `post_gallery`
  MODIFY `id_post_gallery` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id_subscribe` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
