-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 27 2021 г., 00:35
-- Версия сервера: 10.4.8-MariaDB
-- Версия PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Classes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `ID` int(5) NOT NULL,
  `Teacher` int(5) NOT NULL,
  `Subject` int(5) NOT NULL,
  `Day` varchar(15) NOT NULL,
  `classroom` varchar(10) NOT NULL,
  `Quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`ID`, `Teacher`, `Subject`, `Day`, `classroom`, `Quantity`) VALUES
(1, 5, 1, 'Понедельник', '09', 32),
(2, 3, 3, 'Понедельник', '07', 31),
(3, 2, 5, 'Понедельник', '05', 30),
(4, 3, 2, 'Вторник', '08', 30),
(5, 6, 4, 'Вторник', '06', 32),
(6, 1, 6, 'Вторник', '04', 32),
(7, 5, 1, 'Среда', '09', 29),
(8, 3, 2, 'Среда', '08', 29),
(9, 1, 7, 'Среда', '03', 30),
(10, 3, 2, 'Четверг', '08', 32),
(11, 3, 3, 'Четверг', '07', 30),
(12, 7, 8, 'Четверг', '02', 29),
(13, 5, 1, 'Пятница', '09', 31),
(14, 4, 9, 'Пятница', '01', 31),
(15, 6, 4, 'Суббота', '06', 31),
(16, 7, 8, 'Суббота', '02', 31);

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `ID` int(5) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`ID`, `Name`) VALUES
(1, 'Математика'),
(2, 'Русский язык'),
(3, 'Литература'),
(4, 'Информатика'),
(5, 'История'),
(6, 'Физика'),
(7, 'Химия'),
(8, 'Английский язык'),
(9, 'Физическая культура');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `ID` int(11) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Patronymic` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`ID`, `Surname`, `Name`, `Patronymic`) VALUES
(1, 'Магомедов', 'Сергей', 'Сергеевич'),
(2, 'Ермаков', 'Роман', 'Романович'),
(3, 'Емельянова', 'Александра', 'Евгеньевна'),
(4, 'Королев', 'Виктор', 'Викторович'),
(5, 'Иванов', 'Иван', 'Иванович'),
(6, 'Сидорова', 'Елена', 'Александровна'),
(7, 'Федорова', 'Марина', 'Анатольевна');
--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Teacher` (`Teacher`),
  ADD KEY `Subject` (`Subject`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Teacher`) REFERENCES `teachers` (`ID`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`Subject`) REFERENCES `subjects` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;