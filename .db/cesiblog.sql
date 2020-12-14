-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 11:46 AM
-- Server version: 8.0.22
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cesiblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint NOT NULL,
  `Titre` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `DateAjout` date NOT NULL,
  `Auteur` varchar(50) NOT NULL,
  `ImageRepository` varchar(50) DEFAULT NULL,
  `ImageFileName` varchar(255) DEFAULT NULL,
  `categorie_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `Titre`, `Description`, `DateAjout`, `Auteur`, `ImageRepository`, `ImageFileName`, `categorie_id`) VALUES
(190, 'La dune du pillat', 'une description qui va bien', '2021-04-03', 'Maeva', NULL, NULL, NULL),
(219, 'Un titre vouala', 'Bonjour les amis ceci est une description intéressante pour introduire le cours de php objet', '2020-09-25', 'Moi même', './upload/', 'machin.jpg', NULL),
(220, 'Un titre vouala', 'Bonjour les amis ceci est une description intéressante pour introduire le cours de php objet', '2020-09-25', 'Moi même', './upload/', 'machin.jpg', NULL),
(221, 'ceci est un article', '        test', '2020-12-10', 'Léo', NULL, NULL, 1),
(222, 'ceci est un article', '        help', '2020-12-22', 'Emilie', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `Libelle` varchar(255) NOT NULL,
  `Icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Libelle`, `Icon`) VALUES
(1, 'Anonyme', '<i class=\"fas fa-home\"></i>'),
(2, 'Tesssst', '<i class=\"fas fa-home\"></i>'),
(3, 'Maison', '<i class=\"fas fa-home\"></i>');

-- --------------------------------------------------------

--
-- Table structure for table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` bigint NOT NULL,
  `Texte` longtext NOT NULL,
  `Auteur` varchar(255) NOT NULL,
  `Mail` varchar(150) NOT NULL,
  `Date` date DEFAULT NULL,
  `Article_Id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commentaires`
--

INSERT INTO `commentaires` (`id`, `Texte`, `Auteur`, `Mail`, `Date`, `Article_Id`) VALUES
(11, 'Je sais pas', 'Moi', 'julia@leclerc.fr', '2020-10-12', 190),
(12, 'test', 'test', 'ju.jo14@yahoo.fr', NULL, NULL),
(13, 'hey', 'moi', 'moi@moi.fr', '2020-12-14', 222);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`categorie_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `com_id` (`Article_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `cat_id` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `com_id` FOREIGN KEY (`Article_Id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
