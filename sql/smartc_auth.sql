-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table smartc_auth.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_description` text NOT NULL,
  `created_on` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.groups: ~2 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`group_id`, `group_name`, `group_description`, `created_on`) VALUES
	(1, 'admin', 'Super User', 1534158217),
	(2, 'user', 'User', 1534158217);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table smartc_auth.group_permissions
CREATE TABLE IF NOT EXISTS `group_permissions` (
  `group_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `fk_permission_id` (`permission_id`),
  KEY `fk_group_id` (`group_id`),
  CONSTRAINT `fk_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.group_permissions: ~6 rows (approximately)
DELETE FROM `group_permissions`;
/*!40000 ALTER TABLE `group_permissions` DISABLE KEYS */;
INSERT INTO `group_permissions` (`group_id`, `permission_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 2),
	(2, 3);
/*!40000 ALTER TABLE `group_permissions` ENABLE KEYS */;

-- Dumping structure for table smartc_auth.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `attempt_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attempt_id`),
  KEY `ip_address` (`ip_address`),
  KEY `fk_attempts_user_id` (`user_id`),
  CONSTRAINT `fk_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.login_attempts: ~0 rows (approximately)
DELETE FROM `login_attempts`;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

-- Dumping structure for table smartc_auth.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) NOT NULL,
  `permission_description` text NOT NULL,
  `created_on` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.permissions: ~5 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`permission_id`, `permission_name`, `permission_description`, `created_on`) VALUES
	(1, 'view_user_data', '', 1534160585),
	(2, 'change_user_data', '', 1534160592),
	(3, 'delete_user_data', '', 1534160589),
	(4, 'manage_user_permissions', '', 1534160579),
	(5, 'view_only', '', 1534160562);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table smartc_auth.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `created_on` int(10) unsigned NOT NULL,
  `user_activation_code` varchar(128) DEFAULT NULL,
  `user_forgot_password_code` varchar(128) DEFAULT NULL,
  `user_status` tinyint(1) NOT NULL,
  `user_fullname` text NOT NULL,
  `user_identity_number` varchar(255) NOT NULL,
  `user_address` text NOT NULL,
  `user_gender` varchar(24) NOT NULL,
  `user_religion` varchar(20) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_birthday` date NOT NULL,
  `user_photo_file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `username`, `user_email`, `user_password`, `created_on`, `user_activation_code`, `user_forgot_password_code`, `user_status`, `user_fullname`, `user_identity_number`, `user_address`, `user_gender`, `user_religion`, `user_phone`, `user_birthday`, `user_photo_file_path`) VALUES
	(1, 'admin', 'demo@localhost.com', '$2y$10$9pwjiH37FhLoVBwm3YTyZuVKSI7vtdU7sZZvAWBnrfqJfOMb5xTOi', 1517734607, 'NULL', 'NULL', 1, 'Super Admin', '', '', '0', '', '', '2018-04-04', ''),
	(2, 'user2', 'user2@localhost', '$2y$10$vJR54ZobnetIshAzv6KdIuCU.oMXOFTTY3956v.NlbHyabNWwqNhu', 1534606134, 'NULL', 'NULL', 1, '', '', '', '', '', '', '2018-08-18', '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table smartc_auth.user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `fk_user_groups_user_id` (`user_id`),
  KEY `fk_user_groups_group_id` (`group_id`),
  CONSTRAINT `fk_user_groups_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.user_groups: ~1 rows (approximately)
DELETE FROM `user_groups`;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` (`user_id`, `group_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 2);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;

-- Dumping structure for table smartc_auth.user_logins
CREATE TABLE IF NOT EXISTS `user_logins` (
  `login_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `platform` varchar(64) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `fk_user_logins_user_id` (`user_id`),
  CONSTRAINT `fk_user_logins_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table smartc_auth.user_logins: ~0 rows (approximately)
DELETE FROM `user_logins`;
/*!40000 ALTER TABLE `user_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_logins` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
