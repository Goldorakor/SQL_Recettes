-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recettes_michael
CREATE DATABASE IF NOT EXISTS `recettes_michael` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes_michael`;

-- Listage de la structure de table recettes_michael. composition
CREATE TABLE IF NOT EXISTS `composition` (
  `quantiteIngredient` float NOT NULL,
  `uniteMesure` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `idRecette` int NOT NULL,
  `idIngredient` int NOT NULL,
  KEY `idRecette` (`idRecette`),
  KEY `idIngredient` (`idIngredient`),
  CONSTRAINT `FK_composition_ingredient` FOREIGN KEY (`idIngredient`) REFERENCES `ingredient` (`idIngredient`),
  CONSTRAINT `FK_composition_recette` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='table associative qui permet de relier une recette à des ingrédients, dont on connait la quantité utilisée (un chiffre) et en quelle unité on évalue cette quantité.';

-- Listage des données de la table recettes_michael.composition : ~122 rows (environ)
INSERT INTO `composition` (`quantiteIngredient`, `uniteMesure`, `idRecette`, `idIngredient`) VALUES
	(700, 'gramme(s)', 1, 26),
	(400, 'gramme(s)', 1, 9),
	(100, 'gramme(s)', 1, 14),
	(40, 'gramme(s)', 1, 11),
	(2, 'gramme(s)', 1, 36),
	(1, 'gramme(s)', 1, 37),
	(5, 'cl', 1, 27),
	(2, 'brin(s)', 1, 23),
	(2, 'brin(s)', 1, 24),
	(3, 'feuille(s)', 1, 25),
	(700, 'gramme(s)', 2, 26),
	(300, 'gramme(s)', 2, 14),
	(20, 'gramme(s)', 2, 11),
	(2, 'gramme(s)', 2, 36),
	(1, 'gramme(s)', 2, 37),
	(8, 'cl', 2, 27),
	(2, 'feuille(s)', 2, 25),
	(700, 'gramme(s)', 3, 26),
	(120, 'gramme(s)', 3, 14),
	(4, 'brin(s)', 3, 23),
	(2, 'gramme(s)', 3, 36),
	(1, 'gramme(s)', 3, 37),
	(5, 'cl', 3, 27),
	(700, 'gramme(s)', 4, 26),
	(20, 'gramme(s)', 4, 9),
	(20, 'gramme(s)', 4, 11),
	(100, 'gramme(s)', 4, 14),
	(2, 'gramme(s)', 4, 36),
	(1, 'gramme(s)', 4, 37),
	(8, 'cl', 4, 27),
	(200, 'gramme(s)', 4, 50),
	(1, 'feuille(s)', 4, 22),
	(500, 'gramme(s)', 14, 41),
	(5, 'unité(s)', 14, 7),
	(80, 'cl', 14, 30),
	(200, 'gramme(s)', 14, 35),
	(8, 'gramme(s)', 14, 36),
	(60, 'gramme(s)', 14, 31),
	(500, 'gramme(s)', 15, 41),
	(500, 'gramme(s)', 16, 41),
	(500, 'gramme(s)', 17, 41),
	(500, 'gramme(s)', 18, 41),
	(500, 'gramme(s)', 19, 41),
	(500, 'gramme(s)', 21, 41),
	(500, 'gramme(s)', 13, 41),
	(500, 'gramme(s)', 22, 41),
	(500, 'gramme(s)', 23, 41),
	(500, 'gramme(s)', 24, 41),
	(500, 'gramme(s)', 20, 41),
	(5, 'unité(s)', 15, 7),
	(5, 'unité(s)', 16, 7),
	(5, 'unité(s)', 17, 7),
	(5, 'unité(s)', 18, 7),
	(5, 'unité(s)', 19, 7),
	(5, 'unité(s)', 20, 7),
	(5, 'unité(s)', 21, 7),
	(5, 'unité(s)', 22, 7),
	(5, 'unité(s)', 23, 7),
	(5, 'unité(s)', 13, 7),
	(5, 'unité(s)', 24, 7),
	(80, 'cl', 15, 30),
	(80, 'cl', 16, 30),
	(80, 'cl', 17, 30),
	(80, 'cl', 18, 30),
	(80, 'cl', 19, 30),
	(80, 'cl', 20, 30),
	(80, 'cl', 21, 30),
	(80, 'cl', 22, 30),
	(80, 'cl', 23, 30),
	(80, 'cl', 24, 30),
	(80, 'cl', 13, 30),
	(200, 'gramme(s)', 15, 35),
	(200, 'gramme(s)', 18, 35),
	(200, 'gramme(s)', 16, 35),
	(200, 'gramme(s)', 17, 35),
	(200, 'gramme(s)', 19, 35),
	(200, 'gramme(s)', 20, 35),
	(200, 'gramme(s)', 21, 35),
	(200, 'gramme(s)', 22, 35),
	(200, 'gramme(s)', 23, 35),
	(200, 'gramme(s)', 24, 35),
	(8, 'gramme(s)', 15, 36),
	(8, 'gramme(s)', 16, 36),
	(8, 'gramme(s)', 17, 36),
	(8, 'gramme(s)', 18, 36),
	(8, 'gramme(s)', 19, 36),
	(8, 'gramme(s)', 20, 36),
	(8, 'gramme(s)', 21, 36),
	(8, 'gramme(s)', 22, 36),
	(8, 'gramme(s)', 23, 36),
	(8, 'gramme(s)', 24, 36),
	(8, 'gramme(s)', 13, 36),
	(60, 'gramme(s)', 15, 31),
	(60, 'gramme(s)', 16, 31),
	(60, 'gramme(s)', 17, 31),
	(60, 'gramme(s)', 18, 31),
	(60, 'gramme(s)', 19, 31),
	(60, 'gramme(s)', 20, 31),
	(60, 'gramme(s)', 21, 31),
	(60, 'gramme(s)', 22, 31),
	(60, 'gramme(s)', 23, 31),
	(60, 'gramme(s)', 24, 31),
	(60, 'gramme(s)', 13, 31),
	(200, 'gramme(s)', 13, 35),
	(50, 'gramme(s)', 14, 31),
	(50, 'gramme(s)', 15, 35),
	(30, 'grammes', 16, 43),
	(30, 'grammes', 17, 42),
	(30, 'grammes', 18, 46),
	(30, 'grammes', 19, 44),
	(30, 'grammes', 21, 47),
	(50, 'grammes', 22, 50),
	(30, 'grammes', 23, 11),
	(30, 'grammes', 20, 45),
	(30, 'grammes', 24, 9),
	(500, 'gramme(s)', 31, 40),
	(100, 'gramme(s)', 31, 51),
	(3, 'unité(s)', 31, 2),
	(5, 'cl', 31, 30),
	(2, 'gramme(s)', 31, 36),
	(1, 'gramme(s)', 31, 37),
	(80, 'gramme(s)', 31, 50);

-- Listage de la structure de table recettes_michael. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `idGenre` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Table pour classer nos recettes en 3 catégories : entrée, plat ou dessert.';

-- Listage des données de la table recettes_michael.genre : ~3 rows (environ)
INSERT INTO `genre` (`idGenre`, `categorie`) VALUES
	(1, 'entree'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage de la structure de table recettes_michael. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `idIngredient` int NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `prixKilo_unite` float NOT NULL,
  PRIMARY KEY (`idIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettes_michael.ingredient : ~50 rows (environ)
INSERT INTO `ingredient` (`idIngredient`, `nomIngredient`, `prixKilo_unite`) VALUES
	(1, 'boeuf', 15),
	(2, 'veau', 20),
	(3, 'agneau', 22),
	(4, 'truite', 18),
	(5, 'cabillaud', 28),
	(6, 'saumon fumé', 40),
	(7, 'oeuf', 8),
	(8, 'haricots', 7),
	(9, 'carotte', 3),
	(10, 'salsifi', 4),
	(11, 'poireau', 2.4),
	(12, 'céleri', 3.6),
	(13, 'navet', 4.8),
	(14, 'oignon', 2),
	(15, 'échalotte', 3),
	(16, 'ail', 5.7),
	(17, 'persil', 2),
	(18, 'coriandre', 3),
	(19, 'ciboulette', 2.6),
	(20, 'basilic', 2),
	(21, 'menthe', 1.4),
	(22, 'sauge', 4),
	(23, 'thym', 3),
	(24, 'romarin', 3.8),
	(25, 'laurier', 1),
	(26, 'patate', 0.6),
	(27, 'huile', 4),
	(28, 'vinaigre', 3),
	(29, 'crème liquide', 2.5),
	(30, 'lait', 0.8),
	(31, 'beurre', 7),
	(32, 'fromage blanc', 2),
	(34, 'crème épaisse', 3.5),
	(35, 'sucre', 1),
	(36, 'sel', 1),
	(37, 'poivre', 10),
	(38, 'cumin', 15),
	(39, 'curry', 12),
	(40, 'pâtes', 2),
	(41, 'farine', 0.7),
	(42, 'confiture fraise', 3),
	(43, 'confiture abricot', 2.8),
	(44, 'confiture mûre', 4),
	(45, 'confiture myrtille', 6),
	(46, 'confiture pêche', 2.5),
	(47, 'confiture kiwi', 2.8),
	(48, 'confiture tomate', 3),
	(49, 'tomates', 4.2),
	(50, 'parmesan', 28),
	(51, 'lardons', 10);

-- Listage de la structure de table recettes_michael. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `idRecette` int NOT NULL AUTO_INCREMENT,
  `nomRecette` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tempsPrepa` int NOT NULL,
  `instructions` text COLLATE utf8mb4_bin,
  `idGenre` int NOT NULL,
  PRIMARY KEY (`idRecette`),
  KEY `idGenre` (`idGenre`),
  CONSTRAINT `FK_recette_genre` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='cette table regroupe les caractéristiques des recettes';

-- Listage des données de la table recettes_michael.recette : ~25 rows (environ)
INSERT INTO `recette` (`idRecette`, `nomRecette`, `tempsPrepa`, `instructions`, `idGenre`) VALUES
	(1, 'patate à la carotte', 45, NULL, 2),
	(2, 'patate aux oignons', 40, NULL, 2),
	(3, 'patate au thym de France', 40, NULL, 2),
	(4, 'patate au fromage', 42, NULL, 2),
	(5, 'pâtes à la crème', 20, NULL, 2),
	(6, 'pâtes aux poireaux', 28, NULL, 2),
	(7, 'pâtes au beurre', 15, NULL, 2),
	(8, 'pâtes à l\'huile', 15, NULL, 2),
	(9, 'pâtes aux légumes', 18, NULL, 2),
	(10, 'pâtes aux tomates', 29, NULL, 2),
	(11, 'pâtes au parmesan', 15, NULL, 2),
	(12, 'pâtes tomates parmesan', 32, NULL, 2),
	(13, 'crêpes', 40, NULL, 3),
	(14, 'crêpes au beurre', 40, NULL, 3),
	(15, 'crêpes au sucre', 40, NULL, 3),
	(16, 'crêpes à l\'abricot', 40, NULL, 3),
	(17, 'crêpes à la fraise', 40, NULL, 3),
	(18, 'crêpes à la pêche', 40, NULL, 3),
	(19, 'crêpes à la mûre', 40, NULL, 3),
	(20, 'crêpes à la myrtille', 40, NULL, 3),
	(21, 'crêpes au kiwi', 40, NULL, 3),
	(22, 'crêpes au parmesan', 40, NULL, 1),
	(23, 'crêpes au poireau', 50, NULL, 1),
	(24, 'crêpes à la carotte', 65, NULL, 1),
	(31, 'pâtes à la carbonara', 20, '', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
