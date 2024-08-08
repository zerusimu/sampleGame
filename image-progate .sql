-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2024 年 8 月 07 日 05:14
-- サーバのバージョン： 5.7.39
-- PHP のバージョン: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `image-progate`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bougu`
--

CREATE TABLE `bougu` (
  `id` int(11) NOT NULL,
  `namae` text NOT NULL,
  `bougyo` int(11) NOT NULL,
  `nedan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `bougu`
--

INSERT INTO `bougu` (`id`, `namae`, `bougyo`, `nedan`) VALUES
(1, '木の盾', 5, 3000);

-- --------------------------------------------------------

--
-- テーブルの構造 `buki`
--

CREATE TABLE `buki` (
  `id` int(11) NOT NULL,
  `namae` text NOT NULL,
  `kougeki` int(11) NOT NULL,
  `nedan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `buki`
--

INSERT INTO `buki` (`id`, `namae`, `kougeki`, `nedan`) VALUES
(1, '木の棒', 5, 3000),
(2, '高級なはたき', 10, 5000);

-- --------------------------------------------------------

--
-- テーブルの構造 `hata`
--

CREATE TABLE `hata` (
  `id` int(11) NOT NULL,
  `namae` text NOT NULL,
  `iryoku` int(11) NOT NULL,
  `nedan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `hata`
--

INSERT INTO `hata` (`id`, `namae`, `iryoku`, `nedan`) VALUES
(1, '白旗', 5, 2000);

-- --------------------------------------------------------

--
-- テーブルの構造 `hei`
--

CREATE TABLE `hei` (
  `id` int(11) NOT NULL,
  `namae` text NOT NULL,
  `kougeki` int(11) NOT NULL,
  `bougyo` int(11) NOT NULL,
  `hiyou` int(11) NOT NULL,
  `kaikyuu` int(11) NOT NULL,
  `hituyousute` int(11) NOT NULL,
  `nouryokumemo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `hei`
--

INSERT INTO `hei` (`id`, `namae`, `kougeki`, `bougyo`, `hiyou`, `kaikyuu`, `hituyousute`, `nouryokumemo`) VALUES
(1, '農民', 80, 0, 50, 0, 0, '攻撃力を参照して物理攻撃をする'),
(2, '武士(歩兵）', 100, 20, 70, 5000, 0, '攻撃力を参照して物理攻撃をする'),
(3, '弓兵（弓）', 40, 50, 50, 100, 0, '攻撃力を参照して物理攻撃をする');

-- --------------------------------------------------------

--
-- テーブルの構造 `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `imageName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `image`
--

INSERT INTO `image` (`id`, `imageName`) VALUES
(116, 'neko.jpeg'),
(117, 'è±è.jpeg'),
(118, 'gapu.jpg');

-- --------------------------------------------------------

--
-- テーブルの構造 `syomotu`
--

CREATE TABLE `syomotu` (
  `id` int(11) NOT NULL,
  `namae` text NOT NULL,
  `iryoku` int(11) NOT NULL,
  `nedan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `syomotu`
--

INSERT INTO `syomotu` (`id`, `namae`, `iryoku`, `nedan`) VALUES
(1, '初心者向けの指南書', 5, 2000);

-- --------------------------------------------------------

--
-- テーブルの構造 `teki`
--

CREATE TABLE `teki` (
  `id` int(11) NOT NULL,
  `reberu` int(11) NOT NULL,
  `namae2` varchar(15) NOT NULL,
  `kougeki2` int(11) NOT NULL,
  `bougyo2` int(11) NOT NULL,
  `heisuu2` int(11) NOT NULL,
  `okane` int(11) NOT NULL,
  `kome` int(11) NOT NULL,
  `keikenti` int(11) NOT NULL,
  `memo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `teki`
--

INSERT INTO `teki` (`id`, `reberu`, `namae2`, `kougeki2`, `bougyo2`, `heisuu2`, `okane`, `kome`, `keikenti`, `memo`) VALUES
(1, 1, 'スライム', 20, 0, 15, 100, 0, 8, '物理攻撃を仕掛けてくる相手\r\nとても弱い'),
(2, 3, 'ゴブリン', 30, 10, 20, 200, 100, 10, '物理攻撃を仕掛けてくる相手\r\nお米を落としてくれる');

-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `userID` text NOT NULL,
  `pass` text NOT NULL,
  `gazou` varchar(50) NOT NULL DEFAULT 'neko.jpeg',
  `kougekiryoku` int(11) NOT NULL DEFAULT '100',
  `bougyoryoku` int(11) NOT NULL DEFAULT '100',
  `mahoukougeki` int(11) NOT NULL DEFAULT '100',
  `mahoubougyo` int(11) NOT NULL DEFAULT '100',
  `syozikin` int(11) NOT NULL DEFAULT '3000',
  `kome` int(11) NOT NULL DEFAULT '3000',
  `bukinonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `buki` int(11) NOT NULL DEFAULT '0',
  `bougunonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `bougu` int(11) NOT NULL DEFAULT '0',
  `syomotunonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `syomotu` int(11) NOT NULL DEFAULT '0',
  `hatanonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `hata` int(11) NOT NULL DEFAULT '0',
  `heisyu` varchar(15) NOT NULL DEFAULT 'なし',
  `heisuu` int(11) NOT NULL DEFAULT '0',
  `kaikyuu` int(11) NOT NULL DEFAULT '0',
  `sentou` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `user`
--

INSERT INTO `user` (`id`, `username`, `userID`, `pass`, `gazou`, `kougekiryoku`, `bougyoryoku`, `mahoukougeki`, `mahoubougyo`, `syozikin`, `kome`, `bukinonamae`, `buki`, `bougunonamae`, `bougu`, `syomotunonamae`, `syomotu`, `hatanonamae`, `hata`, `heisyu`, `heisuu`, `kaikyuu`, `sentou`) VALUES
(9, 'es', 'es', '$2b$10$A2eBE3tYVbZqurAI11eQ7u9h9Quu7v.GVRAEJCxVBeQuIY/ofYIja', 'neko.jpeg', 144, 112, 105, 102, 10000, 3000, '木の棒', 5, '木の盾', 5, '初心者向けの指南書', 5, '白旗', 5, '農民', 25, 166, 1);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `bougu`
--
ALTER TABLE `bougu`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `buki`
--
ALTER TABLE `buki`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `hata`
--
ALTER TABLE `hata`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `hei`
--
ALTER TABLE `hei`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `syomotu`
--
ALTER TABLE `syomotu`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `teki`
--
ALTER TABLE `teki`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `bougu`
--
ALTER TABLE `bougu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `buki`
--
ALTER TABLE `buki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `hata`
--
ALTER TABLE `hata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `hei`
--
ALTER TABLE `hei`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- テーブルの AUTO_INCREMENT `syomotu`
--
ALTER TABLE `syomotu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `teki`
--
ALTER TABLE `teki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
