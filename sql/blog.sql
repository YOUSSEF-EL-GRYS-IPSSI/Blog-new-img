-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 15 avr. 2019 à 03:55
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `published_at` date NOT NULL,
  `summary` text,
  `content` longtext,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `category_id`, `title`, `published_at`, `summary`, `content`, `is_published`, `image`) VALUES
(1, 47, 'Hellfest 2018, l\'affiche quasi-complète', '2017-01-06', 'Résumé de l\'article Hellfest', '<p>Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. </p>', 1, NULL),
(2, 9, 'Critique « Star Wars 8 – Les derniers Jedi » de Rian Johnson : le renouveau de la saga ?', '2017-01-07', 'Résumé de l\'article Star Wars 8', '<p>Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue.</p>', 1, NULL),
(3, 47, 'Revue - The Ramones', '2017-01-01', 'Résumé de l\'article The Ramones', '<p>Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh.</p>', 1, NULL),
(4, 108, 'De “Skyrim” à “L.A. Noire” ou “Doom” : pourquoi les vieux jeux sont meilleurs sur la Switch', '2017-01-03', 'Résumé de l\'article Switch', '<p>Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.</p>', 1, NULL),
(5, 108, 'Comment “Assassin’s Creed” trouve un nouveau souffle en Egypte', '2017-01-04', 'Résumé de l\'article Assassin’s Creed', '<p>Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar.</p>', 1, NULL),
(6, 47, 'BO de « Les seigneurs de Dogtown » : l’époque bénie du rock.', '2017-01-05', 'Résumé de l\'article Les seigneurs de Dogtown', '<p>Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula.</p>', 1, NULL),
(7, 108, 'Pourquoi \"Destiny 2\" est un remède à l’ultra-moderne solitude', '2019-04-01', 'Résumé de l\'article Destiny 2', '<p>Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam.</p>', 1, '163415912.jpg'),
(8, 108, 'Pourquoi \"Mario + Lapins Crétins : Kingdom Battle\" est le jeu de la rentrée', '2017-01-08', 'Résumé de l\'article Mario + Lapins Crétins', '<p>Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>', 1, '897332199.jpg'),
(9, 9, '« Le Crime de l’Orient Express » : rencontre avec Kenneth Branagh', '2017-01-17', 'Résumé de l\'article Le Crime de l’Orient Express', '<p>Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat.</p>', 1, '897332199.jpg'),
(37, NULL, 'jQuery Multiple Select Plugin For Bootstrap - Bootstrap Multiselect', '2019-04-15', 'vvv', 'dklkldkl', 1, '554382109.jpeg'),
(38, NULL, 'jQuery Multiple Select Plugin For Bootstrap - Bootstrap Multiselect', '2019-04-15', 'vvv', 'kkklklklklkl', 1, '755929561.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `article_category`
--

CREATE TABLE `article_category` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article_category`
--

INSERT INTO `article_category` (`id`, `article_id`, `category_id`) VALUES
(47, 38, 108),
(46, 38, 47),
(45, 37, 47),
(44, 37, 9);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(9, 'Cinéma', 'Trailers, infos, sorties...'),
(47, 'Musique', 'Concerts, sorties d\'albums, festivals...'),
(52, 'Théâtre', 'Dates, représentations, avis...'),
(108, 'Jeux vidéos', 'Videos, tests...');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `caption`, `name`, `article_id`) VALUES
(19, 'View 4', 'ebe4361baf7318a92facaec817c6d0d9.jpg', 15),
(18, 'View 3', '832353270aacb6e3322f493a66aaf5b9.jpg', 15),
(16, 'View 1', 'f50ebce922538b3c57a3e6b7bbb6d628.jpg', 15),
(17, 'View 2', '1aaa7438a59157a0f21ad30dda4d4088.jpg', 15);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `bio` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `lastname`, `firstname`, `email`, `password`, `is_admin`, `bio`) VALUES
(17, 'GRYS', 'YOUSSEF', 'Elgrysyousseff78@gmail.com', '5d41402abc4b2a76b9719d911017c592', 1, 'hello'),
(18, 'flanord', 'flanord', 'flanord@gmail.com', '6831ec7f7391a716a0d6f5d312c0c605', 1, 'vv');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
