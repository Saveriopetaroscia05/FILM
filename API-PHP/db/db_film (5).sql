-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 04, 2024 alle 09:56
-- Versione del server: 8.0.35
-- Versione PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_film`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `actor`
--

CREATE TABLE `actor` (
  `id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthday_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `actor`
--

INSERT INTO `actor` (`id`, `first_name`, `last_name`, `birthday_date`) VALUES
(1, 'Brad', 'Pitt', '1963-12-18'),
(2, 'Meryl', 'Streep', '1949-06-22'),
(3, 'Tom', 'Hanks', '1956-07-09'),
(4, 'Natalie', 'Portman', '1981-06-09'),
(5, 'Denzel', 'Washington', '1954-12-28'),
(6, 'Julia', 'Roberts', '1967-10-28'),
(7, 'Leonardo', 'DiCaprio', '1974-11-11'),
(8, 'Charlize', 'Theron', '1975-08-07'),
(9, 'Johnny', 'Depp', '1963-06-09'),
(10, 'Scarlett', 'Johansson', '1984-11-22');

-- --------------------------------------------------------

--
-- Struttura della tabella `director`
--

CREATE TABLE `director` (
  `id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthday_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `director`
--

INSERT INTO `director` (`id`, `first_name`, `last_name`, `birthday_date`) VALUES
(1, 'Steven', 'Spielberg', '1946-12-18'),
(2, 'Quentin', 'Tarantino', '1963-03-27'),
(3, 'Martin', 'Scorsese', '1942-11-17'),
(4, 'Christopher', 'Nolan', '1970-07-30'),
(5, 'Sofia', 'Coppola', '1971-05-14'),
(6, 'Alfred', 'Hitchcock', '1899-08-13'),
(7, 'Tim', 'Burton', '1958-08-25'),
(8, 'Francis Ford', 'Coppola', '1939-04-07'),
(9, 'Woody', 'Allen', '1935-12-01'),
(10, 'Clint', 'Eastwood', '1930-05-31');

-- --------------------------------------------------------

--
-- Struttura della tabella `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `genre`
--

INSERT INTO `genre` (`id`, `name`, `slug`) VALUES
(1, 'Il Padrino', 'il_padrino'),
(2, 'Inception', 'inception'),
(3, 'La La Land', 'la_la_land'),
(4, 'Il Signore degli Anelli', 'il_signore_degli_anelli'),
(5, 'Shutter Island', 'shutter_island'),
(6, 'Notting Hill', 'notting_hill'),
(7, 'Mad Max: Fury Road', 'mad_max_fury_road'),
(8, 'Forrest Gump', 'forrest_gump'),
(9, 'Seven', 'seven'),
(10, 'Blade Runner 2049', 'blade_runner_2049');

-- --------------------------------------------------------

--
-- Struttura della tabella `movie`
--

CREATE TABLE `movie` (
  `id` int NOT NULL,
  `synopsis` text COLLATE utf8mb4_general_ci,
  `title` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `released_year` date DEFAULT NULL,
  `poster` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `movie`
--

INSERT INTO `movie` (`id`, `synopsis`, `title`, `duration`, `released_year`, `poster`) VALUES
(1, 'Un classico del cinema gangster', 'Il Padrino', 175, '1972-03-24', 'il_padrino.jpg'),
(2, 'In un mondo di sogno e realtà', 'Inception', 148, '2010-07-16', 'inception.jpg'),
(3, 'Un musical romantico a Los Angeles', 'La La Land', 128, '2016-12-09', 'la_la_land.jpg'),
(4, 'Un\'avventura epica fantasy', 'Il Signore degli Anelli', 201, '2001-12-19', 'il_signore_degli_anelli.jpg'),
(5, 'Un thriller psicologico avvincente', 'Shutter Island', 138, '2010-02-19', 'shutter_island.jpg'),
(6, 'Una commedia romantica indimenticabile', 'Notting Hill', 124, '1999-05-28', 'notting_hill.jpg'),
(7, 'Un film d\'azione adrenalinico', 'Mad Max: Fury Road', 120, '2015-05-15', 'mad_max_fury_road.jpg'),
(8, 'Un dramma toccante sulla resilienza umana', 'Forrest Gump', 142, '1994-07-06', 'forrest_gump.jpg'),
(9, 'Un thriller investigativo avvincente', 'Seven', 127, '1995-09-22', 'seven.jpg'),
(10, 'Un film di fantascienza mozzafiato', 'Blade Runner 2049', 164, '2017-10-06', 'blade_runner_2049.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `movie_actor`
--

CREATE TABLE `movie_actor` (
  `movie_id` int DEFAULT NULL,
  `actor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `movie_actor`
--

INSERT INTO `movie_actor` (`movie_id`, `actor_id`) VALUES
(1, 7),
(2, 7),
(3, 6),
(4, 9),
(5, 7),
(6, 6),
(7, 7),
(8, 3),
(9, 5),
(10, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `movie_director`
--

CREATE TABLE `movie_director` (
  `movie_id` int DEFAULT NULL,
  `director_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `movie_director`
--

INSERT INTO `movie_director` (`movie_id`, `director_id`) VALUES
(1, 8),
(2, 4),
(3, 5),
(4, 8),
(5, 3),
(6, 7),
(7, 1),
(8, 1),
(9, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `movie_genre`
--

CREATE TABLE `movie_genre` (
  `movie_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indici per le tabelle `movie_director`
--
ALTER TABLE `movie_director`
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indici per le tabelle `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `director`
--
ALTER TABLE `director`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`);

--
-- Limiti per la tabella `movie_director`
--
ALTER TABLE `movie_director`
  ADD CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`);

--
-- Limiti per la tabella `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
