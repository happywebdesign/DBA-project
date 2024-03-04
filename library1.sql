-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 09:56 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library1`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `authors_id` int NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authors_id`, `author_name`, `nationality`, `birth_date`) VALUES
(1, 'ahmad', 'afghan', '1990-03-12'),
(2, 'jamal', 'german', '1999-01-02'),
(3, 'khan baba', 'pakistani', '1979-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `author_id` int NOT NULL,
  `genre` varchar(100) NOT NULL,
  `publication_year` date NOT NULL,
  `isbn` int NOT NULL,
  `available_copies` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author_id`, `genre`, `publication_year`, `isbn`, `available_copies`) VALUES
(1001, 'Introduction to BCS', 1, 'Computer Science', '2012-12-06', 1234567, 10),
(1002, 'Computer Science History', 2, 'Computer Science', '2013-07-09', 1234567890, 20),
(1003, 'Computer Science Fundamentals', 3, 'Computer Science', '2015-03-01', 1234567890, 11),
(1004, 'Introduction to SE', 1, 'Computer Science - Software Engineering', '2024-03-05', 12, 10);

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `borrower_id` int NOT NULL,
  `borrower_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`borrower_id`, `borrower_name`, `address`, `email`, `phone_number`) VALUES
(1, 'Romanullah Gorzang', 'Sayed Abad, Wardak, Afghanistan', 'roman@gmail.com', '0775678567'),
(2, 'Qudratullah', 'Kabul, Afghanistan', 'Sar@hotmail.com', '0777777777');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `book_id` int NOT NULL,
  `borrower_id` int NOT NULL,
  `transaction_date` date NOT NULL,
  `return_date` date NOT NULL,
  `fine_amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authors_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_books` (`author_id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `fk_2` (`author_id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`borrower_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_transactions` (`book_id`),
  ADD KEY `fk_trasactions2` (`borrower_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books` FOREIGN KEY (`author_id`) REFERENCES `authors` (`authors_id`);

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`authors_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `fk_trasactions2` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
