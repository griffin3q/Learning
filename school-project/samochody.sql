-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 22, 2023 at 08:15 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `samochody`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_KLI` int(4) NOT NULL,
  `NAZWISKO` varchar(15) DEFAULT NULL,
  `IMIE` varchar(15) DEFAULT NULL,
  `NR_DOWODU` varchar(9) DEFAULT NULL,
  `MIEJSCOWOSC` varchar(25) DEFAULT NULL,
  `ULICA` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`ID_KLI`, `NAZWISKO`, `IMIE`, `NR_DOWODU`, `MIEJSCOWOSC`, `ULICA`) VALUES
(10, 'KOWALSKI', 'PIOTR', 'AA1234567', 'WARSZAWA', 'DLUGA 8/12'),
(15, 'NOWAK', 'JAN', 'BC2343561', 'WROCLAW', 'NORWIDA 2/1'),
(20, 'ADAMCZYK', 'PAWEL', 'AG8967452', 'POZNAN', 'KROTKA 2'),
(25, 'BRACKI', 'BOGDAN', 'CC3478690', 'GDANSK', 'BALTYCKA 67/4'),
(30, 'LIPKA', 'JAKUB', 'CE6712098', 'KATOWICE', 'POLNA 9');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `ID_SAM` int(4) NOT NULL,
  `NR_REJ` varchar(8) DEFAULT NULL,
  `MARKA` varchar(12) DEFAULT NULL,
  `MODEL` varchar(12) DEFAULT NULL,
  `ROK_PROD` int(4) DEFAULT NULL,
  `KRAJ_PROD` varchar(15) DEFAULT NULL,
  `POJ_SIL` int(3) DEFAULT NULL,
  `KOSZT_DNIA` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `samochody`
--

INSERT INTO `samochody` (`ID_SAM`, `NR_REJ`, `MARKA`, `MODEL`, `ROK_PROD`, `KRAJ_PROD`, `POJ_SIL`, `KOSZT_DNIA`) VALUES
(100, 'KRA-1023', 'OPEL', 'ASTRA', 1995, 'NIEMCY', 1, 45),
(110, 'KRC-A120', 'MERCEDES', 'S600', 1998, 'NIEMCY', 6, 200),
(120, 'TAV-1909', 'FORD', 'Ka', 2000, 'USA', 1, 40),
(130, 'WAW-8967', 'TOYOTA', 'YARIS', 2001, 'JAPONIA', 1, 45),
(140, 'WRE-4509', 'OPEL', 'VECTRA', 1997, 'NIEMCY', 3, 80),
(150, 'GDA-A890', 'OPEL', 'ASTRA', 1995, 'NIEMCY', 2, 60),
(160, 'PKT-0967', 'VOLVO', '440', 1984, 'SZWECJA', 1, 30),
(170, 'TAW-6598', 'FIAT', 'PUNTO', 1991, 'WLOCHY', 1, 40),
(180, 'KRC-4590', 'NISSAN', 'MICRA', 1998, 'JAPONIA', 1, 45),
(190, 'POK-9089', 'OPEL', 'CALIBRA', 1990, 'NIEMCY', 2, 55);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `ID_WYP` int(4) NOT NULL,
  `ID_SAM` int(4) DEFAULT NULL,
  `ID_KLI` int(4) DEFAULT NULL,
  `DATA_WYP` date DEFAULT NULL,
  `DATA_ZWR` date DEFAULT NULL,
  `KOSZT` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`ID_WYP`, `ID_SAM`, `ID_KLI`, `DATA_WYP`, `DATA_ZWR`, `KOSZT`) VALUES
(1, 150, 15, '2003-01-16', '2003-02-15', 1800),
(2, 120, 30, '2003-04-08', '2004-04-17', 360),
(3, 180, 25, '2004-09-10', '2005-01-11', 5535),
(4, 130, 20, '2004-12-30', '2005-01-14', 675),
(5, 190, 15, '2005-01-10', '2005-01-29', 1045),
(6, 100, 30, '2005-11-27', '2006-02-05', 3150),
(7, 140, 10, '2006-01-01', '2006-01-02', 80),
(8, 110, 10, '2006-01-02', '2006-12-30', 72400),
(9, 170, 15, '2006-02-15', '2007-01-01', 8000),
(10, 160, 25, '2006-02-16', '2006-12-01', 4590);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_KLI`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`ID_SAM`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`ID_WYP`);
COMMIT;

CREATE USER 'wypozyczajacy'@'%' IDENTI
ALTER TABLE wypozyczenia MODIFY id_wyp INT AUTO_INCREMENT PRIMARY KEY;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
