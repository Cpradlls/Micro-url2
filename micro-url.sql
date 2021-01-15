-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  ven. 15 jan. 2021 à 08:58
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `micro-url`
--

-- --------------------------------------------------------

--
-- Structure de la table `assoc_url_keyword`
--

CREATE TABLE `assoc_url_keyword` (
  `id_assoc_u_k` int(11) NOT NULL,
  `id_assoc_url` int(11) NOT NULL,
  `id_assoc_keyword` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assoc_url_keyword`
--

INSERT INTO `assoc_url_keyword` (`id_assoc_u_k`, `id_assoc_url`, `id_assoc_keyword`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 5),
(4, 4, 6),
(5, 5, 2),
(6, 6, 8),
(7, 7, 3),
(9, 7, 19),
(10, 7, 19);

-- --------------------------------------------------------

--
-- Structure de la table `keyword`
--

CREATE TABLE `keyword` (
  `id_keyword` int(11) NOT NULL,
  `keyword_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `keyword`
--

INSERT INTO `keyword` (`id_keyword`, `keyword_name`) VALUES
(1, 'twitter'),
(2, 'instagram'),
(3, 'facebook'),
(4, 'html'),
(5, 'css'),
(6, 'php'),
(7, 'javascript'),
(8, 'sql'),
(9, 'cms'),
(11, 'linkedin'),
(12, 'LinkedIn'),
(19, 'piratage');

-- --------------------------------------------------------

--
-- Structure de la table `url`
--

CREATE TABLE `url` (
  `id_url` int(11) NOT NULL,
  `url` text NOT NULL,
  `shortcut` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `url`
--

INSERT INTO `url` (`id_url`, `url`, `shortcut`, `datetime`, `description`) VALUES
(1, 'https://blog.journalduhacker.net/index.php?article303/fermeture-du-compte-twitter-du-journal-du-hacker', 'jdh-bye-twitter', '2021-01-06 00:00:00', 'le journal du hacker ferme son compte Twitter (mais reste présent sur Mastodon)'),
(2, 'https://developer.mozilla.org/fr/docs/Web/HTML', 'html-explication', '2021-01-06 00:00:00', 'HTML signifie « HyperText Markup Language » qu\'on peut traduire par « langage de balises pour l\'hypertexte ».'),
(3, 'https://css-tricks.com/snippets/css/complete-guide-grid/', 'tricks-css', '2021-01-07 00:00:00', 'Our comprehensive guide to CSS grid, focusing on all the settings both for the grid parent container and the grid child elements.'),
(4, 'https://www.php.net/manual/fr/', 'docu-php', '2021-01-07 00:00:00', 'Lorsque PHP traite un fichier, il cherche les balises d\'ouverture et de fermeture (<?php et ?>) qui délimitent le code qu\'il doit interpréter. '),
(5, 'https://www.instagram.com/?hl=fr', 'instagram', '2021-01-07 00:00:00', 'Un des réseaux sociaux les plus important de notre siècle'),
(6, 'https://www.culture-informatique.net/cest-quoi-sql/', 'sql-docu', '2021-01-07 00:00:00', 'Documentation à propos du langage SQL, le langage des bases de données'),
(7, 'https://www.facebook.com/Developpeur.w', 'facebook', '2021-01-07 00:00:00', 'Page pour les développeurs '),
(8, 'https://www.zataz.com/total-energie-direct-obligee-de-stopper-un-jeu-en-ligne-suite-a-une-fuite-de-donnees/', 'ztz7', '2021-01-15 00:00:00', 'L\'entreprise Total Energie Direct avait lancé un jeu en ligne. Le concours a dû être stoppé. Il était possible d\'accéder aux données des autres joueurs.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assoc_url_keyword`
--
ALTER TABLE `assoc_url_keyword`
  ADD PRIMARY KEY (`id_assoc_u_k`),
  ADD KEY `id_assoc_keyword` (`id_assoc_keyword`),
  ADD KEY `id_assoc_url` (`id_assoc_url`);

--
-- Index pour la table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`id_keyword`);

--
-- Index pour la table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`id_url`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `assoc_url_keyword`
--
ALTER TABLE `assoc_url_keyword`
  MODIFY `id_assoc_u_k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `id_keyword` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `url`
--
ALTER TABLE `url`
  MODIFY `id_url` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assoc_url_keyword`
--
ALTER TABLE `assoc_url_keyword`
  ADD CONSTRAINT `assoc_url_keyword_ibfk_1` FOREIGN KEY (`id_assoc_keyword`) REFERENCES `keyword` (`id_keyword`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_url_keyword_ibfk_2` FOREIGN KEY (`id_assoc_url`) REFERENCES `url` (`id_url`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
