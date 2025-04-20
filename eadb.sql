-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2025 at 02:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyappointments`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `color` varchar(256) DEFAULT '#7cbae8',
  `status` varchar(512) DEFAULT '',
  `is_unavailability` tinyint(4) NOT NULL DEFAULT 0,
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text DEFAULT NULL,
  `id_caldav_calendar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_appointments`
--

INSERT INTO `ea_appointments` (`id`, `create_datetime`, `update_datetime`, `book_datetime`, `start_datetime`, `end_datetime`, `location`, `notes`, `hash`, `color`, `status`, `is_unavailability`, `id_users_provider`, `id_users_customer`, `id_services`, `id_google_calendar`, `id_caldav_calendar`) VALUES
(1, '2025-04-16 13:39:59', '2025-04-16 13:39:59', '2025-04-16 13:39:59', '2025-04-17 09:30:00', '2025-04-17 10:00:00', NULL, 'booking from FE', 'rNO4vD83GynY', '#7cbae8', 'Booked', 0, 2, 5, 1, NULL, NULL),
(2, '2025-04-16 13:45:29', '2025-04-16 13:45:29', '2025-04-16 13:45:29', '2025-04-21 09:30:00', '2025-04-21 10:00:00', NULL, 'clietn for shoeb 2 agent', 'lwcPWKfEAUav', '#7cbae8', 'Booked', 0, 6, 7, 2, NULL, NULL),
(3, '2025-04-17 09:05:54', '2025-04-17 09:05:54', '2025-04-17 09:05:54', '2025-04-24 10:00:00', '2025-04-24 10:30:00', NULL, '', 'xl2TucRYJ5hH', '#7cbae8', 'Booked', 0, 6, 8, 2, NULL, NULL),
(4, '2025-04-17 13:38:42', '2025-04-17 13:38:42', '2025-04-17 13:38:42', '2025-04-28 09:30:00', '2025-04-28 10:00:00', NULL, 'new appoint new appoint new appointnew appoint', 'r1obDEU0v6z4', '#7cbae8', 'Booked', 0, 6, 9, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_blocked_periods`
--

CREATE TABLE `ea_blocked_periods` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

CREATE TABLE `ea_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(60);

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL,
  `webhooks` int(11) DEFAULT NULL,
  `blocked_periods` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `create_datetime`, `update_datetime`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`, `webhooks`, `blocked_periods`) VALUES
(1, NULL, NULL, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15, 15, 15),
(2, NULL, NULL, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15, 0, 0),
(3, NULL, NULL, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, NULL, NULL, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(256) DEFAULT '#7cbae8',
  `location` text DEFAULT NULL,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT 1,
  `is_private` tinyint(4) DEFAULT 0,
  `id_service_categories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `create_datetime`, `update_datetime`, `name`, `duration`, `price`, `currency`, `description`, `color`, `location`, `availabilities_type`, `attendants_number`, `is_private`, `id_service_categories`) VALUES
(1, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'Service', 30, 0.00, '', NULL, '#7cbae8', NULL, 'flexible', 1, 0, NULL),
(2, '2025-04-16 13:33:11', '2025-04-16 13:33:11', 'Customer Call', 30, 100.00, '', '', '#7cbae8', '', 'fixed', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(2, 1),
(4, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `create_datetime`, `update_datetime`, `name`, `value`) VALUES
(1, NULL, NULL, 'company_working_plan', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}'),
(2, NULL, NULL, 'book_advance_timeout', '30'),
(3, NULL, NULL, 'google_analytics_code', ''),
(4, NULL, NULL, 'customer_notifications', '1'),
(5, NULL, NULL, 'date_format', 'DMY'),
(6, NULL, NULL, 'require_captcha', '0'),
(7, NULL, NULL, 'time_format', 'regular'),
(8, NULL, NULL, 'display_cookie_notice', '0'),
(9, NULL, NULL, 'cookie_notice_content', 'Cookie notice content.'),
(10, NULL, NULL, 'display_terms_and_conditions', '0'),
(11, NULL, NULL, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, NULL, NULL, 'display_privacy_policy', '0'),
(13, NULL, NULL, 'privacy_policy_content', 'Privacy policy content.'),
(14, NULL, NULL, 'first_weekday', 'sunday'),
(16, NULL, NULL, 'api_token', ''),
(17, NULL, NULL, 'display_any_provider', '1'),
(18, NULL, NULL, 'display_first_name', '1'),
(19, NULL, NULL, 'require_first_name', '1'),
(20, NULL, NULL, 'display_last_name', '1'),
(21, NULL, NULL, 'require_last_name', '1'),
(22, NULL, NULL, 'display_email', '1'),
(23, NULL, NULL, 'require_email', '1'),
(24, NULL, NULL, 'display_phone_number', '1'),
(25, NULL, NULL, 'require_phone_number', '1'),
(26, NULL, NULL, 'display_address', '1'),
(27, NULL, NULL, 'require_address', '0'),
(28, NULL, NULL, 'display_city', '1'),
(29, NULL, NULL, 'require_city', '0'),
(30, NULL, NULL, 'display_zip_code', '1'),
(31, NULL, NULL, 'require_zip_code', '0'),
(32, NULL, NULL, 'display_notes', '1'),
(33, NULL, NULL, 'require_notes', '0'),
(34, NULL, NULL, 'matomo_analytics_url', ''),
(35, NULL, NULL, 'display_delete_personal_information', '0'),
(36, NULL, NULL, 'disable_booking', '0'),
(37, NULL, NULL, 'disable_booking_message', '<p style=\"text-align: center;\">Thanks for stopping by!</p><p style=\"text-align: center;\">We are not accepting new appointments at the moment, please check back again later.</p>'),
(38, NULL, NULL, 'company_logo', ''),
(39, NULL, NULL, 'company_color', '#ffffff'),
(40, NULL, NULL, 'display_login_button', '1'),
(41, NULL, NULL, 'theme', 'default'),
(42, '2025-04-16 13:27:32', '2025-04-16 13:27:32', 'limit_customer_access', '0'),
(43, NULL, NULL, 'future_booking_limit', '90'),
(44, NULL, NULL, 'appointment_status_options', '[\"Booked\", \"Confirmed\", \"Rescheduled\", \"Cancelled\", \"Draft\"]'),
(45, NULL, NULL, 'display_custom_field_1', '0'),
(46, NULL, NULL, 'require_custom_field_1', '0'),
(47, NULL, NULL, 'label_custom_field_1', ''),
(48, NULL, NULL, 'display_custom_field_2', '0'),
(49, NULL, NULL, 'require_custom_field_2', '0'),
(50, NULL, NULL, 'label_custom_field_2', ''),
(51, NULL, NULL, 'display_custom_field_3', '0'),
(52, NULL, NULL, 'require_custom_field_3', '0'),
(53, NULL, NULL, 'label_custom_field_3', ''),
(54, NULL, NULL, 'display_custom_field_4', '0'),
(55, NULL, NULL, 'require_custom_field_4', '0'),
(56, NULL, NULL, 'label_custom_field_4', ''),
(57, NULL, NULL, 'display_custom_field_5', '0'),
(58, NULL, NULL, 'require_custom_field_5', '0'),
(59, NULL, NULL, 'label_custom_field_5', ''),
(60, NULL, NULL, 'matomo_analytics_site_id', '1'),
(61, NULL, NULL, 'default_language', 'english'),
(62, NULL, NULL, 'default_timezone', 'Europe/Berlin'),
(63, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_is_active', '0'),
(64, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_host', ''),
(65, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_port', ''),
(66, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_user_dn', ''),
(67, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_password', ''),
(68, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_base_dn', ''),
(69, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_filter', '(&(objectClass=*)(|(cn={{KEYWORD}})(sn={{KEYWORD}})(mail={{KEYWORD}})(givenName={{KEYWORD}})(uid={{KEYWORD}})))'),
(70, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'ldap_field_mapping', '{\n    \"first_name\": \"givenname\",\n    \"last_name\": \"sn\",\n    \"email\": \"mail\",\n    \"phone_number\": \"telephonenumber\",\n    \"username\": \"cn\"\n}'),
(71, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'company_name', 'demo company'),
(72, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'company_email', 'mike@gmail.com'),
(73, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'company_link', 'http://democompany.com');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `timezone` varchar(256) DEFAULT 'UTC',
  `language` varchar(256) DEFAULT 'english',
  `custom_field_1` text DEFAULT NULL,
  `custom_field_2` text DEFAULT NULL,
  `custom_field_3` text DEFAULT NULL,
  `custom_field_4` text DEFAULT NULL,
  `custom_field_5` text DEFAULT NULL,
  `is_private` tinyint(4) DEFAULT 0,
  `ldap_dn` text DEFAULT NULL,
  `id_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `create_datetime`, `update_datetime`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `is_private`, `ldap_dn`, `id_roles`) VALUES
(1, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'SHoeb', 'Shaikh', 'mike@gmail.com', NULL, '1112223333', NULL, NULL, NULL, NULL, NULL, 'Europe/Berlin', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1),
(2, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'Jane', 'Doe', 'jane@example.org', NULL, '+1 (000) 000-0000', NULL, NULL, NULL, NULL, NULL, 'Europe/Berlin', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
(3, '2025-04-16 13:27:33', '2025-04-16 13:27:33', 'James', 'Doe', 'james@example.org', NULL, '+1 (000) 000-0000', NULL, NULL, NULL, NULL, NULL, 'UTC', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 3),
(4, '2025-04-16 13:38:12', '2025-04-16 13:38:27', 'SHoeb', 'Agent', 'Mike@gmail.com', NULL, '1112223333', '', '', '', '', '', 'UTC', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
(5, '2025-04-16 13:39:59', '2025-04-16 13:39:59', 'shoebdemo', 'client', 'info@demo.in', NULL, '1112223333', '', '', NULL, '', NULL, 'Asia/Dubai', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 3),
(6, '2025-04-16 13:44:18', '2025-04-16 13:44:18', 'shoeb  2', 'agent', 'info@agent2.in', NULL, '1112223333', '', '', '', '', '', 'Europe/Berlin', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
(7, '2025-04-16 13:45:29', '2025-04-16 13:45:29', 'client for shoeb 2 agent', 'shoeb 2 agent', 'info@clietn2.in', NULL, '1112223333', '', '', NULL, '', NULL, 'Asia/Calcutta', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 3),
(8, '2025-04-17 09:05:54', '2025-04-17 09:05:54', 'clietn 3', 'clietn 33', 'info@clietn3.in', NULL, '1112223333', '', '', NULL, '', NULL, 'Asia/Calcutta', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 3),
(9, '2025-04-17 13:38:42', '2025-04-17 13:38:42', 'new appoint', 'new appoint', 'Mike@gmail.com', NULL, '1112223333', '', '', NULL, '', NULL, 'Asia/Calcutta', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text DEFAULT NULL,
  `working_plan_exceptions` text DEFAULT NULL,
  `notifications` tinyint(4) DEFAULT NULL,
  `google_sync` tinyint(4) DEFAULT NULL,
  `google_token` text DEFAULT NULL,
  `google_calendar` varchar(128) DEFAULT NULL,
  `caldav_sync` tinyint(4) DEFAULT 0,
  `caldav_url` varchar(512) DEFAULT NULL,
  `caldav_username` varchar(256) DEFAULT NULL,
  `caldav_password` varchar(256) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT 30,
  `sync_future_days` int(11) DEFAULT 90,
  `calendar_view` varchar(32) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `caldav_sync`, `caldav_url`, `caldav_username`, `caldav_password`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'ShoebSK', '777000efbcb26902206fc14274a510247550efbbbd4e460e4afe4cabdb82c5be', '6fb212781c00d530f7859e7a2c9bb20675bec09557acbda652d0c00970e41175', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(2, 'janedoe', 'fa3c8af2e847218585d4a04728c309ca64a5c333b4e8d985b810f13a8c7743f9', '80ff56e006fc22448adf8dcf23e23867e215f88447bd2cf4efacad15850effb3', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(4, 'Shoeb Agent', '4030d52b7f17457fa07658c58675c6c14ccf908ecb9a7d84d2503c91f5e11ce9', 'ae58777d98496a8c136c15034dc20a7e2da6474940d76f618e60c7e2b47cb570', '{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', '{}', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(6, 'shoeb agent 2', 'e2858bcdadeb29ebc1b8511cdaf5da158c7685b4ba7881d819eb7dd328a3a47b', '21a9ef290aff7165aa5b113511c9559acc69e36f6f5c46e4c588454a9b24fa09', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', '{}', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `ea_webhooks`
--

CREATE TABLE `ea_webhooks` (
  `id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `actions` text DEFAULT NULL,
  `secret_header` varchar(256) DEFAULT 'X-Ea-Token',
  `secret_token` varchar(512) DEFAULT NULL,
  `is_ssl_verified` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_blocked_periods`
--
ALTER TABLE `ea_blocked_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `secretaries_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `services_providers_services` (`id_services`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `ea_webhooks`
--
ALTER TABLE `ea_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_blocked_periods`
--
ALTER TABLE `ea_blocked_periods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ea_webhooks`
--
ALTER TABLE `ea_webhooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
