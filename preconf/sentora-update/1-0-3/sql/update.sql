USE `sentora_postfix`;

CREATE TABLE IF NOT EXISTS `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Postfix - Virtual Vacation/ autoresponder';

CREATE TABLE IF NOT EXISTS `vacation_notification` (
  `on_vacation` varchar(255) CHARACTER SET utf8 NOT NULL,
  `notified` varchar(255) CHARACTER SET utf8 NOT NULL,
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`on_vacation`,`notified`),
  CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Postfix - Virtual Vacation Notifications LOG';

/* Update Sentora Version */
USE `sentora_core`;

/* Update the sentora database version number */
UPDATE `x_settings` SET `so_value_tx` = '1.0.3' WHERE `so_name_vc` = 'dbversion';
