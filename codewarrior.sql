-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2022 at 04:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codewarrior`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `msg` text NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'jd', '7226085897', 'hii this is jd', '2022-01-09', 'jd123@gmail.com'),
(2, '', '', '', '2022-01-09', ''),
(3, 'Dayaben Manojbhai Padashala', '7226085897', 'd', '2022-01-09', 'jdesai087@gmail.com'),
(4, 'ashish desai', '7787877854', 'dd', '2022-01-09', 'ad123@gmail.com'),
(5, 'ashish desai', '7787877854', 'dd', '2022-01-09', 'ad123@gmail.com'),
(6, 'ashish desai', '7787877854', 'dd', '2022-01-09', 'ad123@gmail.com'),
(7, 'ashish desai', '7787877854', 'dd', '2022-01-09', 'ad123@gmail.com'),
(8, 'ddsss', '9879722158', 'ss', '2022-01-09', 'darshakkanpariya07@g'),
(9, 'Jayesh Desai', '07226085897', 'ddd', '2022-01-10', 'ggg@gmail.com'),
(10, 'Jayesh Desai', '07226085897', 'jhh', '2022-01-10', 'jdesai087@gmail.com'),
(11, 'Jayesh Desai', '07226085897', 'xx', '2022-01-10', 'jdesai087@gmail.com'),
(12, 'Jayesh Desai', '07226085897', 'password', '2022-01-10', 'jdesai087@gmail.com'),
(13, 'Jayesh Desai', '07226085897', 'js', '2022-01-10', 'jdesai087@gmail.com'),
(14, 'Jayesh Desai', '07226085897', 'ss', '2022-01-10', 'jdesai087@gmail.com'),
(15, 'Jayesh Desai', '07226085897', 'ss', '2022-01-10', 'jdesai087@gmail.com'),
(20, 'Jayesh Desai', '07226085897', 's', '2022-01-10', 'darshakkanpariya07@g'),
(24, 'Jayesh Desai', '7226085897', 'smtplib.SMTPServerDisconnected', '2022-01-10', 'jdesai087@gmail.com'),
(26, 'Jayesh Desai', '7226085897', 'smtplib.SMTPServerDisconnected', '2022-01-10', 'jdesai087@gmail.com'),
(27, 'Jayesh Desai', '7226085897', 'smtplib.SMTPServerDisconnected', '2022-01-10', 'jdesai087@gmail.com'),
(28, 'Jayesh Desai', '07226085897', 'h', '2022-01-10', 'hgfd@gmail.com'),
(29, 'Jayesh Desai', '07226085897', 's', '2022-01-10', 'darshakkanpariya07@g'),
(30, 'Jayesh Desai', '7226085897', 'liu', '2022-01-10', 'jdesai087@gmail.com'),
(31, 'Dayaben Manojbhai Padashala', '7226085897', 'c', '2022-01-10', 'jdesai087@gmail.com'),
(32, 'zzx', '8787777788', 'ddad@gmail.com', '2022-01-10', 'ddad@gmail.com'),
(33, 'zzx', '8787777788', 'kjhgf', '2022-01-10', 'ddad@gmail.com'),
(34, 's', '7226085897', 'ss', '2022-01-10', 'jdesai087@gmail.com'),
(35, 'Jayesh Desai', '07226085897', 'h', '2022-01-10', 'jdesai087@gmail.com'),
(36, 'Jayesh Desai', '07226085897', 'j', '2022-01-10', 'jdesai087@gmail.com'),
(37, 'Jayesh Desai', '07226085897', 'j', '2022-01-10', 'jdesai087@gmail.com'),
(38, 'Jayesh Desai', '07226085897', 'param', '2022-01-10', 'jdesai087@gmail.com'),
(39, 'Jayesh Desai', '07226085897', 'h', '2022-01-10', 'darshakkanpariya07@g'),
(40, 'Jayesh Desai', '07226085897', 'j', '2022-01-10', 'jdesai087@gmail.com'),
(41, 'jay', '4545125263', 'hii\r\n', '2022-01-10', 'abc@gmail.com'),
(42, 'Dayaben Manojbhai Padashala', '7226085897', 'ai0', '2022-01-11', 'jdes87@gmail.com'),
(43, 'ashish', '4445556668', 'hii this is aesai', '2022-01-11', 'ad@gmail.com'),
(44, 'Jayesh Desai', '07226085897', 'e', '2022-01-16', 'jdesai087@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_file` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `content`, `tagline`, `slug`, `date`, `image_file`) VALUES
(1, 'Cyclone', 'The Croatian Spring was a political conflict that took place from 1967 to 1971 in the Socialist Republic of Croatia, at the time one of six republics comprising Yugoslavia and ruled by the League of Communists of Croatia (SKH). It was marked by a series of economic reforms. Reformers within the SKH, aligned with the Croatian cultural society Matica hrvatska, came into conflict with conservatives. A variety of grievances were aired, including demands for increased autonomy, opposition to real or perceived overrepresentation of Croatian Serbs in Croatia and disagreement over whether the Croatian language was distinct from Serbo-Croatian', 'The Croatian Spring wa', 'first-post', '2022-01-15 02:53:57', 'home-bg.jpg'),
(2, 'Coronavirus', 'Coronaviruses are a group of related RNA viruses that cause diseases in mammals and birds. In humans and birds, they cause respiratory tract infections that can range from mild to lethal. Mild illnesses in humans include some cases of the common cold (which is also caused by other viruses, predominantly rhinoviruses), while more lethal varieties can cause SARS, MERS and COVID-19, which is causing an ongoing pandemic. In cows and pigs they cause diarrhea, while in mice they cause hepatitis and encephalomyelitis.', ' RNA viruses ', 'second-post', '2022-01-12 02:46:55', 'corona.jpg'),
(3, 'Germany', 'Germany (German: Deutschland, pronounced [ˈdɔʏtʃlant] (About this soundlisten)), officially the Federal Republic of Germany,[e] is a country in Central Europe. It is the second-most populous country in Europe after Russia, and the most populous member state of the European Union. Germany is situated between the Baltic and North seas to the north, and the Alps to the south; it covers an area of 357,022 square kilometres (137,847 sq mi), with a population of over 83 million within its 16 constituent states. It borders Denmark to the north, Poland and the Czech Republic to the east, Austria and Switzerland to the south, and France, Luxembourg, Belgium, and the Netherlands to the west. The nation\'s capital and largest city is Berlin, and its financial centre is Frankfurt; the largest urban area is the Ruhr.', 'European Union', 'third-post', '2022-01-12 02:49:39', 'germany.jpg'),
(4, 'Gujarat', 'Gujarat (/ˌɡʊdʒəˈrɑːt/, Gujarati: [ˈɡudʒəɾɑt] (About this soundlisten)) is a state on the western coast of India with a coastline of 1,600 km (990 mi) – most of which lies on the Kathiawar peninsula – and a population of 60.4 million. It is the fifth-largest Indian state by area and the ninth-largest state by population. Gujarat is bordered by Rajasthan to the northeast, Dadra and Nagar Haveli and Daman and Diu to the south, Maharashtra to the southeast, Madhya Pradesh to the east, and the Arabian Sea and the Pakistani province of Sindh to the west. Its capital city is Gandhinagar, while its largest city is Ahmedabad.[9] The Gujarati people of India are indigenous to the state and their language, Gujarati, is the state\'s official language. The economy of Gujarat is the fifth-largest in India, with a gross state domestic product (GSDP) of ₹16.48 trillion (US$220 billion) and has the country\'s 10th-highest GSDP per capita of ₹243,761 (US$3,200).[1] Gujarat ranks 21st among Indian states in human development index.[4] The state traditionally has low unemployment and is widely considered one of the most industrially developed states of India and a manufacturing hub', 'Gujju the Great', 'fourth-post', '2022-01-12 02:52:02', 'gujarat.png'),
(5, 'WWE', 'World Wrestling Entertainment, Inc., commonly shortened to WWE, is an American integrated media and entertainment company[6][7] that is primarily known for professional wrestling. WWE has also branched out into other fields, including film, American football, and various other business ventures. The WWE name also refers to the professional wrestling promotion itself, which was founded in 1953 as the Capitol Wrestling Corporation. It is the largest wrestling promotion in the world with the roster divided up into two primary traveling brands, and a secondary developmental brand. Overall, WWE is available to 900 million homes worldwide in 28 languages. The company\'s global headquarters is located in Stamford, Connecticut,[8] with offices in New York, Los Angeles, Mexico City, Mumbai, Shanghai, Singapore, Dubai and Munich.[9]As in other professional wrestling promotions, WWE shows are not legitimate contests but entertainment-based performance theater, featuring storyline-driven, scripted, and partially-choreographed matches; however, matches often include moves that can put performers at risk of injury, even death, if not performed correctly. The pre-determined aspect of professional wrestling was publicly acknowledged by WWE\'s owner Vince McMahon in 1989 in order to avoid taxes from athletic commissions. WWE brands its product as sports entertainment, acknowledging wrestling\'s roots in competitive sport and dramatic theater.', 'Roman Reigns and Brock Lesnar', 'fifth-post', '2022-01-13 13:51:19', 'wwe.jpg'),
(6, 'AEW', 'All Elite Wrestling, commonly abbreviated to AEW, is an American entertainment company and professional wrestling promotion based in Jacksonville, Florida. It is considered the second largest wrestling promotion in the United States behind WWE.[7]\r\n\r\nAEW is owned by Shahid Khan and his son Tony, who founded the company in 2019; in-ring performers Cody Rhodes, Matt and Nick Jackson, Kenny Omega, and Brandi Rhodes also serve as company executives. Its global headquarters are located at TIAA Bank Field, the home stadium of the NFL\'s Jacksonville Jaguars, a team also owned by Shahid Khan.', 'Revolution', 'sixth-post', '2022-01-12 02:58:32', 'aew.jpg'),
(7, 'jay', 'handsome', 'jd', 'jay-post', '2022-01-13 11:52:57', 'jak.jpg'),
(10, 'ss', 's', 'Roman Reigns and Brock Lesnar', 'shadi', '2022-01-13 14:00:17', 'wwe-bg.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
