-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 16, 2016 at 08:45 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hvtv`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id_account` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(128) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `favorite_category` int(11) DEFAULT NULL,
  `past` text,
  `present` text,
  `future` text,
  `why_register` text,
  `skills` text,
  `interests` text,
  `other` text,
  `newsletter` int(11) DEFAULT NULL,
  `avatar` int(11) DEFAULT NULL,
  `active_avatar` int(1) NOT NULL DEFAULT '0' COMMENT 'défaut : 0 / upload : 1 / gravatar : 2',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_account`),
  KEY `user_id` (`user_id`),
  KEY `avatar` (`avatar`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id_account`, `sex`, `age`, `favorite_category`, `past`, `present`, `future`, `why_register`, `skills`, `interests`, `other`, `newsletter`, `avatar`, `active_avatar`, `user_id`) VALUES
(1, 'female', 2015, NULL, 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', NULL, NULL, 0, 2),
(2, 'female', 2015, NULL, 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ', NULL, 9, 2, 3),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 17),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 22),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 23);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(120) COLLATE utf8_bin NOT NULL,
  `h1` text COLLATE utf8_bin NOT NULL,
  `h2` text COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meta_description` text COLLATE utf8_bin,
  `meta_keywords` text COLLATE utf8_bin,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE IF NOT EXISTS `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `meta_description` text COLLATE utf8_bin,
  `meta_keywords` text COLLATE utf8_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE IF NOT EXISTS `article_tag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `fk_auth_user_item` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', 1, 1453025048),
('admin', 17, NULL),
('admin', 21, NULL),
('editeur', 22, NULL),
('membre', 20, NULL),
('user', 23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1453025048, 1453025048),
('adminForum', 2, 'Création/Modification de thèmes et catégories du forum', NULL, NULL, 1453757949, 1453757949),
('connectBackoffice', 2, 'Connexion au backoffice', NULL, NULL, 1453557453, 1453557453),
('createPost', 2, 'Create a post', NULL, NULL, 1453025048, 1453025048),
('createTopic', 2, 'Créer un sujet', NULL, NULL, 1453757574, 1453757574),
('editeur', 1, 'Editeur d''articles', NULL, NULL, 1453756177, 1453756177),
('manageRbac', 2, 'Gestion des droits et des rôles', NULL, NULL, 1453758055, 1453758055),
('membre', 1, 'Membre de l''asso', NULL, NULL, 1453557393, 1453557393),
('modoComments', 1, 'Modérateurs de commentaires', NULL, NULL, 1453758392, 1453758392),
('updateOwnUser', 2, 'Modification des attributs User', NULL, NULL, 1453763327, 1453764202),
('updatePost', 2, 'Update post', NULL, NULL, 1453025048, 1453025048),
('updateUser', 2, 'Modification des Users', NULL, NULL, 1453763438, 1453763438),
('user', 1, 'Utilisateur identifié', NULL, NULL, 1453755968, 1453755968),
('vote', 2, 'Voter', NULL, NULL, 1453757751, 1453757751);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('membre', 'adminForum'),
('membre', 'connectBackoffice'),
('membre', 'createPost'),
('user', 'createPost'),
('membre', 'createTopic'),
('user', 'createTopic'),
('membre', 'editeur'),
('admin', 'manageRbac'),
('admin', 'membre'),
('admin', 'modoComments'),
('updateUser', 'updateOwnUser'),
('user', 'updateOwnUser'),
('membre', 'updatePost'),
('admin', 'updateUser'),
('modoComments', 'user'),
('membre', 'vote'),
('user', 'vote');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isOwn', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forum_category`
--

CREATE TABLE IF NOT EXISTS `forum_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` float NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_category` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `forum_category`
--

INSERT INTO `forum_category` (`id`, `title`, `description`, `status`, `id_user`, `id_category`, `createdAt`, `updatedAt`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 'Thème 1', 'dffsdmk', 1, 2, NULL, '2015-12-01 20:48:32', '0000-00-00 00:00:00', NULL, NULL, NULL),
(2, 'Catégorie 1', 'fdsdfds', 1, 1, 1, '2015-12-01 20:48:57', '0000-00-00 00:00:00', NULL, NULL, NULL),
(3, 'Terre d''échange', 'Sujets relatifs à la Terre', 1, 17, NULL, '2016-01-24 10:11:31', '2016-01-24 10:11:31', NULL, NULL, NULL),
(4, 'Agriculture', 'Sujets relatifs à l''agriculture', 1, 17, 3, '2016-01-24 10:12:23', '2016-01-24 10:12:23', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

CREATE TABLE IF NOT EXISTS `forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `score` float NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meta_title` text CHARACTER SET latin1,
  `meta_description` text CHARACTER SET latin1,
  `meta_keyword` text CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`,`id_topic`),
  KEY `id_user_2` (`id_user`),
  KEY `id_topic` (`id_topic`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forum_post`
--

INSERT INTO `forum_post` (`id`, `title`, `content`, `score`, `id_user`, `id_topic`, `createdAt`, `updatedAt`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 'Topic 1', 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ', 1, 2, 1, '2016-01-12 19:20:57', '2015-12-01 19:49:54', NULL, NULL, NULL),
(2, NULL, 'fsdfsf', 0, 3, 1, '2016-01-03 17:17:54', '2016-01-03 17:17:54', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE IF NOT EXISTS `forum_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` float NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`,`id_category`),
  KEY `id_user_2` (`id_user`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `forum_topic`
--

INSERT INTO `forum_topic` (`id`, `title`, `status`, `slug`, `id_user`, `id_category`, `createdAt`, `updatedAt`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 'Topic 1', 0, NULL, 2, 2, '2015-12-01 19:49:31', '2015-12-01 19:49:31', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `adhesion` date NOT NULL,
  `position` varchar(255) NOT NULL,
  `paid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_member`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `adhesion`, `position`, `paid`, `user_id`) VALUES
(1, '2015-11-11', 'Président', 1, 2),
(2, '2015-11-11', 'Président', 1, 3),
(3, '2016-01-18', 'Secrétaire', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1442339891),
('m130524_201442_init', 1442339926),
('m140506_102106_rbac_init', 1452632532),
('m140608_173539_create_user_table', 1447366467),
('m140611_133903_init_rbac', 1447366468),
('m140808_073114_create_auth_item_group_table', 1447366468),
('m140809_072112_insert_superadmin_to_user', 1447366469),
('m140809_073114_insert_common_permisison_to_auth_item', 1447366469),
('m141023_141535_create_user_visit_log', 1447366469),
('m141116_115804_add_bind_to_ip_and_registration_ip_to_user', 1447366470),
('m141121_194858_split_browser_and_os_column', 1447366470),
('m141201_220516_add_email_and_email_confirmed_to_user', 1447366471),
('m141207_001649_create_basic_user_permissions', 1447366472);

-- --------------------------------------------------------

--
-- Table structure for table `post_has_tag`
--

CREATE TABLE IF NOT EXISTS `post_has_tag` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `ID_project` bigint(11) NOT NULL AUTO_INCREMENT,
  `project_post_id_projectpost` bigint(11) NOT NULL,
  PRIMARY KEY (`ID_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE IF NOT EXISTS `project_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `meta_description` text COLLATE utf8_bin,
  `meta_keywords` text COLLATE utf8_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_post`
--

CREATE TABLE IF NOT EXISTS `project_post` (
  `post_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `project_id_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `site_category`
--

CREATE TABLE IF NOT EXISTS `site_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `meta_description` text COLLATE utf8_bin,
  `meta_keywords` text COLLATE utf8_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `site_category`
--

INSERT INTO `site_category` (`id`, `title`, `content`, `status`, `slug`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Echos-Libres', 'Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou ', 1, 'association-echos-libres', NULL, NULL, '2016-02-14 18:59:52', '0000-00-00 00:00:00', 17),
(2, 'Page générale', 'Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou ', 0, NULL, NULL, NULL, '2016-02-14 19:00:59', '0000-00-00 00:00:00', 17);

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8_bin NOT NULL,
  `h1` text COLLATE utf8_bin NOT NULL,
  `h2` text COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `slug` varchar(150) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meta_description` text COLLATE utf8_bin,
  `meta_keywords` text COLLATE utf8_bin,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `site_page`
--

INSERT INTO `site_page` (`id`, `title`, `h1`, `h2`, `content`, `slug`, `status`, `created_at`, `updated_at`, `meta_description`, `meta_keywords`, `category_id`, `user_id`) VALUES
(1, 'Les Echos Libres', 'Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou ', 'Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou ', 'Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou Echos Didou ', 'echos-libres', 3, '2016-02-14 19:02:14', '0000-00-00 00:00:00', NULL, NULL, 1, 17),
(2, 'Contact', 'Echo Didou Contact Echo Didou Contact ', 'Echo Didou Contact Echo Didou Contact Echo Didou Contact Echo Didou Contact Echo Didou Contact ', 'Echo Didou Contact Echo Didou Contact Echo Didou Contact Echo Didou Contact Echo Didou Contact Echo Didou Contact ', 'contactez-les-echos', 3, '2016-02-14 19:03:37', '0000-00-00 00:00:00', NULL, NULL, 2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `site_page_tag`
--

CREATE TABLE IF NOT EXISTS `site_page_tag` (
  `page_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`page_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `view` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `upload_file`
--

CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `extension` varchar(20) NOT NULL,
  `alt` text,
  `size` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `upload_file`
--

INSERT INTO `upload_file` (`id`, `name`, `filename`, `extension`, `alt`, `size`, `type`) VALUES
(1, 'TW4FQVeq', 'TW4FQVeq.jpg', 'jpg', 'TW4FQVeq', 32796, 'image/jpeg'),
(2, '005-jean-michel-basquiat-theredlist', '005-jean-michel-basquiat-theredlist.jpg', 'jpg', '005-jean-michel-basquiat-theredlist', 57521, 'image/jpeg'),
(3, '005-jean-michel-basquiat-theredlist', '005-jean-michel-basquiat-theredlist.jpg', 'jpg', '005-jean-michel-basquiat-theredlist', 57521, 'image/jpeg'),
(4, 'TW4FQVeq', 'TW4FQVeq.jpg', 'jpg', 'TW4FQVeq', 32796, 'image/jpeg'),
(5, 'TW4FQVeq', 'TW4FQVeq.jpg', 'jpg', 'TW4FQVeq', 32796, 'image/jpeg'),
(6, 'avatar', 'avatar.jpg', 'v', 'avatar', 32796, 'image/jpeg'),
(7, 'avatar', 'avatar.jpg', 'jpg', NULL, 57521, 'image/jpeg'),
(8, 'avatar', 'avatar.jpg', 'jpg', NULL, 32796, 'image/jpeg'),
(9, 'avatar', 'avatar.jpg', 'jpg', NULL, 780831, 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `superadmin` smallint(6) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT '0',
  `password_reset_token` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `confirmation_token`, `status`, `superadmin`, `created_at`, `updated_at`, `registration_ip`, `bind_to_ip`, `email`, `email_confirmed`, `password_reset_token`) VALUES
(1, 'superadmin', '7sQpMph15IysCRCh5j3yWJBHU25RZcRD', '$2y$13$8HJVIoJ6DTJ8J1z6i6AmVeaCkcNteBqVsvlbog/PqVX8uaZfdc.aS', NULL, 10, 1, 1447366469, 1447366469, NULL, NULL, NULL, 0, NULL),
(2, 'jeanmichel', 'w3RcSMHrBbgz3Bx8sKr09oZqBphIXDs8', '$2y$13$w8uH9svsLwUg5SKLlU5yc.4oHgnJhL47cKEjRsAYB9Bn7hbYmTE6q', NULL, 10, 0, 1449002855, 1454443072, NULL, NULL, 'auchalet@didou.local', 0, NULL),
(3, 'testi', 'TLlYtFAoAFv1EBm2ZvhaWNDJsj7Kr00A', '$2y$13$uns4ilxbg0QRFI/7ZMqVieUx5B6Oz2WBKo2dvyYGi89JKSx4ynNsi', NULL, 10, 0, 1449339861, 1454442401, NULL, NULL, 'alexis.michallet@protonmail.com', 0, 'iV1qVHEnhEuwnvxcUcyyPbjd-FLu7icQ_1452939452'),
(4, 'bla', 'uMAB-DJIXj30YnaG4J092ZBnixlTxuTf', '$2y$13$pr/R79RJWsQt5cEv0h9wQeEnXsU48mz/KtfTRxnUfQCgdc4GkFKF6', NULL, 10, 0, 1452634876, 1452640455, NULL, NULL, 'alexis.michallet@didou.com', 0, 'E7gMLSgNnUJy0snhCUdyTlvCPKdd6bAt_1452640455'),
(8, 'hdkjfh', 'XC5AQSW_iVVXqOXAVnAbuJ9uWD0xW-ON', '$2y$13$S76lm/pkqZmkNOBeX/LcWuaO3qHoA.ny2CRegf6CtHw6cl3LPgeAa', NULL, 10, 0, 1452942070, 1452942151, NULL, NULL, 'alexis.michallet@blabla.com', 0, NULL),
(9, 'dfsdfdsfdsf', 'C1JN5CEq-1nNyxpYfT0h6ZIbTikZ1rNT', '$2y$13$vDz1zCh2qU2CzcZoik6qJuaHseOPJ0uJRI5OSXW91asPQnvYG70wi', NULL, 10, 0, 1452942203, 1452942212, NULL, NULL, 'alexis.michallet@dofhs.com', 0, NULL),
(10, 'fsjfhdsfjsdhjf', 'MoY_NIpbWKMikg0-V4i6mliX_Oh8yOIp', '$2y$13$J7q7UC0XXUUJMVgxUowqlewTLHfEwCsxcilOBTzBp3KUGQ4BrVyMC', NULL, 10, 0, 1452942340, 1452942365, NULL, NULL, 'quader-42@hotmaisqd.fr', 0, NULL),
(11, 'fdsjf', 'K_1mA5LJ2KvLDm3rFPcpENI7EteWTb-o', '$2y$13$2ylQTa/9F6xJ4HTfBESpY.tY7H36g4cmf4NBXssZd4PLw7LQlcV.q', NULL, 0, 0, 1452942666, 1452942666, NULL, NULL, 'alexis.michallet@dfsdfd.com', 0, NULL),
(12, 'cindy', 'cU_nEUmZcbE3YM7dO4xkq3k3TnG1F10G', '$2y$13$Hq1ntbJ4f9bJ4JLuYWH5se8Z3kpYds9rxOSlgvgfP0dQRW21Tffb2', NULL, 10, 0, 1453149837, 1453149859, NULL, NULL, 'alexis.michallet@gmaifsfl.com', 0, NULL),
(17, 'auchalet', 'MzZqcHa1yBwXiBLZczq0j_FYG5wplRcL', '$2y$13$P.WDV4AGYCqS9yQ2P1T8wOd2/LPQyZLvSeJ6KV1qx6793S.nAj0MO', NULL, 10, 1, 1453157540, 1455049470, NULL, NULL, 'alexis.michallet@gmail.com', 0, NULL),
(18, 'testaa', '7dbRBZZJyXLga-QiHRwhHAFqfVOyL6Ry', '$2y$13$hH5pb8JEzVRVWPMFeb6WH.FbkbMLH3CTTEyhKpDDtOEA1.B8af73a', NULL, 0, 0, 1453549111, 1453549111, NULL, NULL, 'quader-42@hotmailsqdqs.fr', 0, NULL),
(19, 'blabladsqd', 'dbWphgRS7HZ6_0xFcM3ZK4mP7Xf7EIs_', '$2y$13$Roq4B79HEh3U4j8k5E55r./qDoooqyFMBI2StQ/rEOuYCC9GfC7u.', NULL, 10, 0, 1453549177, 1453549194, NULL, NULL, 'quader-42@hotmail.fr', 0, NULL),
(20, 'membre', 'ADAcnGNjgJ4XmmL0YZ5R-xLsfbbAvSmM', '$2y$13$j2gHoBHIaWmF5vQsrDh8J.ZiHinalfE8gSjfPJc5.eQAoUEj24WmK', NULL, 10, 0, 1453758857, 1453758857, NULL, NULL, 'membre@membre.com', 0, NULL),
(21, 'admin', '13dWVV68CgRNIWxpLiD64v0ejtpk5W8O', '$2y$13$Z0QnoUkg1Icf0NaoJDj.eeo8ENFW8SPk4xAVo0ihhzGCjSWmiDSKq', NULL, 10, 1, 1453758890, 1453758890, NULL, NULL, 'admin@admin.com', 0, NULL),
(22, 'editeur', '19htMT3bCg8xXdxbHOC_o_aaX_XWUlNa', '$2y$13$VNCGRHHM/hlhQfjjXyj.KeDUHPiOpdwLtmDW.cjs5uvyb6LuLbife', NULL, 10, 0, 1453758907, 1453758907, NULL, NULL, 'editeur@editeur.com', 0, NULL),
(23, 'userbase', '2BHhbIA19FQOPR_zxkTQemua_jBIB5dq', '$2y$13$fW.PJlonsHT.BaDvQUkp1.tt9dCBzDqeJ1HMmf/jfghynOZIykvWC', NULL, 10, 0, 1453758946, 1453758946, NULL, NULL, 'user@user.com', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_project`
--

CREATE TABLE IF NOT EXISTS `user_has_project` (
  `ID_user` int(11) NOT NULL AUTO_INCREMENT,
  `ID_project` bigint(11) NOT NULL,
  PRIMARY KEY (`ID_user`,`ID_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `moderation_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_bin NOT NULL,
  `vote` tinyint(1) NOT NULL COMMENT '1 : a voté, 0 : n''a pas voté',
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_avatar_file` FOREIGN KEY (`avatar`) REFERENCES `upload_file` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_user_id_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD CONSTRAINT `article_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `article_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auth_user_item` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum_category`
--
ALTER TABLE `forum_category`
  ADD CONSTRAINT `theme` FOREIGN KEY (`id_category`) REFERENCES `forum_category` (`id`),
  ADD CONSTRAINT `user_category` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD CONSTRAINT `category_topic` FOREIGN KEY (`id_topic`) REFERENCES `forum_topic` (`id`),
  ADD CONSTRAINT `user_post` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD CONSTRAINT `topic_category` FOREIGN KEY (`id_category`) REFERENCES `forum_category` (`id`),
  ADD CONSTRAINT `topic_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_user_id_member` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `fk_category_page` FOREIGN KEY (`category_id`) REFERENCES `site_category` (`id`);

--
-- Constraints for table `site_page_tag`
--
ALTER TABLE `site_page_tag`
  ADD CONSTRAINT `site_page_tag_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`),
  ADD CONSTRAINT `site_page_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);


--
-- Constraints for table `moderation_page`
--
ALTER TABLE `moderation_page`
  ADD CONSTRAINT `fk_page_moderation` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_moderation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
