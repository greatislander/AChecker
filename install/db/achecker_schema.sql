#####################################################
# Database setup SQL for a new install of AChecker
#####################################################

# --------------------------------------------------------
# Table structure for table `checks`
# since 0.1

CREATE TABLE `checks` (
  `check_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default 0,
  `html_tag` varchar(50) NOT NULL,
  `confidence` mediumint(8) NOT NULL,
  `note` varchar(500) default NULL,
  `name` text,
  `err` text,
  `description` text,
  `search_str` text,
  `long_description` text,
  `rationale` text,
  `how_to_repair` text,
  `repair_example` text,
  `question` text,
  `decision_pass` text,
  `decision_fail` text,
  `test_procedure` text,
  `test_expected_result` text,
  `test_failed_result` text,
  `func` text,
  `open_to_public` tinyint(4) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  PRIMARY KEY  (`check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# --------------------------------------------------------
# Table structure for table `check_examples`
# since 0.1

CREATE TABLE `check_examples` (
  `check_example_id` mediumint(8) unsigned NOT NULL auto_increment,
  `check_id` mediumint(8) unsigned NOT NULL,
  `type` varchar(50) default NULL COMMENT 'Values: pass, fail',
  `description` text,
  `content` text COMMENT 'Example content',
  PRIMARY KEY  (`check_example_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `check_prerequisites`
# since 0.1

CREATE TABLE `check_prerequisites` (
  `check_id` mediumint(8) unsigned NOT NULL,
  `prerequisite_check_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`check_id`,`prerequisite_check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `color_mapping`
# since 0.1

CREATE TABLE `color_mapping` (
  `color_name` varchar(50) NOT NULL default '',
  `color_code` varchar(6) default NULL,
  PRIMARY KEY  (`color_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `config`
# since 0.1

CREATE TABLE `config` (
  `name` CHAR( 30 ) NOT NULL default '',
  `value` CHAR( 255 ) NOT NULL default '',
  PRIMARY KEY ( `name` )
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `guidelines`
# since 0.1

CREATE TABLE `guidelines` (
  `guideline_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default 0,
  `title` varchar(255) default NULL,
  `abbr` varchar(100) default NULL,
  `long_name` varchar(255) default NULL,
  `published_date` date default NULL,
  `earlid` varchar(255) default NULL,
  `preamble` text,
  `status` tinyint(3) unsigned NOT NULL default '0',
  `open_to_public` tinyint(4) NOT NULL DEFAULT 0,
  `seal_icon_name` varchar(255),
  `subset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Value 0 means this guideline is not a subset of any other guidelines. Non-zero value means this guideline is the subset of others. The guideline with lower value is the subset of the guidelines with higher value.',
  PRIMARY KEY  (`guideline_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10;

# --------------------------------------------------------
# Table structure for table `guideline_groups`
# since 0.1

CREATE TABLE `guideline_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `guideline_id` mediumint(8) unsigned default NULL,
  `name` varchar(255) default NULL,
  `abbr` varchar(100) default NULL,
  `principle` varchar(100) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

# --------------------------------------------------------
# Table structure for table `guideline_subgroups`
# since 0.1

CREATE TABLE `guideline_subgroups` (
  `subgroup_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned default NULL,
  `name` varchar(255) default NULL,
  `abbr` varchar(100) default NULL,
  PRIMARY KEY  (`subgroup_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=330 ;

# --------------------------------------------------------
# Table structure for table `languages`
# since 0.1

CREATE TABLE `languages` (
  `language_code` varchar(20) NOT NULL default '',
  `charset` varchar(80) NOT NULL default '',
  `reg_exp` varchar(124) NOT NULL default '',
  `native_name` varchar(80) NOT NULL default '',
  `english_name` varchar(80) NOT NULL default '',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `lang_codes`
# since 0.1

CREATE TABLE `lang_codes` (
  `code_3letters` varchar(3) NOT NULL default '',
  `direction` varchar(16) NOT NULL default '',
  `code_2letters` varchar(2) default NULL,
  `description` varchar(50) default NULL,
  PRIMARY KEY  (`code_3letters`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `mail_queue`
# since 0.2

CREATE TABLE `mail_queue` (
  `mail_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `to_email` VARCHAR( 50 ) NOT NULL default '',
  `to_name` VARCHAR( 50 ) NOT NULL default '',
  `from_email` VARCHAR( 50 ) NOT NULL default '',
  `from_name` VARCHAR( 50 ) NOT NULL default '',
  `char_set` VARCHAR( 20 ) NOT NULL default '',
  `subject` VARCHAR(255) NOT NULL ,
  `body` TEXT NOT NULL ,
  PRIMARY KEY ( `mail_id` )
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `privileges`
# since 0.1

CREATE TABLE `privileges` (
  `privilege_id` mediumint(8) unsigned NOT NULL auto_increment,
  `title_var` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `last_update` datetime,
  `link` varchar(255) NOT NULL DEFAULT '',
  `menu_sequence` tinyint(4) NOT NULL,
  `open_to_public` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY  (`privilege_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

# --------------------------------------------------------
# Table structure for table `subgroup_checks`
# since 0.1

CREATE TABLE `subgroup_checks` (
  `subgroup_id` mediumint(8) unsigned NOT NULL default '0',
  `check_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`subgroup_id`,`check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `techniques`
# since 0.1

CREATE TABLE `techniques` (
  `subgroup_id` mediumint(8) unsigned NOT NULL default '0',
  `check_id` mediumint(8) unsigned NOT NULL default '0',
  `technique` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`subgroup_id`,`check_id`,`technique`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `test_pass`
# since 0.1

CREATE TABLE `test_pass` (
  `check_id` mediumint(8) unsigned NOT NULL,
  `next_check_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`check_id`,`next_check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `themes`
# since 0.1

CREATE TABLE `themes` (
  `title` varchar(80) NOT NULL default '',
  `version` varchar(10) NOT NULL default '',
  `dir_name` varchar(20) NOT NULL default '',
  `last_updated` date NOT NULL default '0000-00-00',
  `extra_info` TEXT NOT NULL ,
  `status` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `users`
# since 0.1
CREATE TABLE `users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `login` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `user_group_id` mediumint(8) NOT NULL,
  `first_name` varchar(100),
  `last_name` varchar(100),
  `email` varchar(50),
  `web_service_id` varchar(40) NOT NULL,
  `status` tinyint(3) NOT NULL default '1',
  `create_date` datetime NOT NULL,
  `last_login` datetime,
  `preferences` text,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

# --------------------------------------------------------
# Table structure for table `user_decisions`
# since 0.2
CREATE TABLE `user_decisions` (
  `user_link_id` mediumint(8) NOT NULL,
  `line_num` int(10) NOT NULL,
  `column_num` int(10) NOT NULL,
  `check_id` mediumint(8) NOT NULL,
  `sequence_id` int(8) NOT NULL,
  `decision` varchar(50) NOT NULL DEFAULT 'N',
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`user_link_id`, `line_num`, `column_num`, `check_id`),
  INDEX IDX_SEQUENCE (`user_link_id`, `sequence_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

# --------------------------------------------------------
# Table structure for table `user_groups`
# since 0.1

CREATE TABLE `user_groups` (
  `user_group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `last_update` datetime,
  PRIMARY KEY  (`user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

# --------------------------------------------------------
# Table structure for table `user_group_privilege`
# since 0.1

CREATE TABLE `user_group_privilege` (
  `user_group_id` mediumint(8) unsigned NOT NULL,
  `privilege_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`user_group_id`, `privilege_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
# Table structure for table `user_links`
# since 0.2
CREATE TABLE `user_links` (
  `user_link_id` mediumint(8) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL,
  `URI` text NOT NULL,
  `last_guideline_ids` varchar(50) NOT NULL,
  `last_sessionID` varchar(40) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`user_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

# Dumping data for table `checks`


INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(1, 0, 'img', 0, '', '_CNAME_1', '_ERR_1', '_DESC_1', NULL, NULL, '_RATIONALE_1', '_HOWTOREPAIR_1', '_REPAIREXAMPLE_1', '', '', '', '_PROCEDURE_1', '_EXPECTEDRESULT_1', '_FAILEDRESULT_1', 'return BasicFunctions::hasAttribute(''alt'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(2, 0, 'img', 1, '_NOTE_2', '_CNAME_2', '_ERR_2', '_DESC_2', NULL, NULL, '_RATIONALE_2', '', '', '_QUESTION_2', '_DECISIONPASS_2', '_DECISIONFAIL_2', '_PROCEDURE_2', '_EXPECTEDRESULT_2', '_FAILEDRESULT_2', 'if (!BasicFunctions::hasAttribute(''alt'') || !BasicFunctions::hasAttribute(''src'')) \r\n   return true;\r\nelse\r\n   return (BasicFunctions::getAttributeValue(''alt'') <> BasicFunctions::getAttributeValue(''src''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(3, 0, 'img', 1, '', '_CNAME_3', '_ERR_3', '_DESC_3', NULL, NULL, '_RATIONALE_3', '', '', '_QUESTION_3', '_DECISIONPASS_3', '_DECISIONFAIL_3', '_PROCEDURE_3', '_EXPECTEDRESULT_3', '_FAILEDRESULT_3', 'return (BasicFunctions::getAttributeTrimedValueLength(''alt'') <= 100);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(4, 0, 'img', 1, '_NOTE_4', '_CNAME_4', '_ERR_4', '_DESC_4', NULL, NULL, '_RATIONALE_4', '', '', '_QUESTION_4', '_DECISIONPASS_4', '_DECISIONFAIL_4', '_PROCEDURE_4', '_EXPECTEDRESULT_4', '_FAILEDRESULT_4', 'return !(BasicFunctions::getAttributeValueAsNumber(''width'') > 25 && BasicFunctions::getAttributeValueAsNumber(''height'') > 25 && BasicFunctions::getAttributeValue(''alt'') == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(5, 0, 'img', 1, '', '_CNAME_5', '_ERR_5', '_DESC_5', NULL, NULL, '_RATIONALE_5', '', '', '_QUESTION_5', '_DECISIONPASS_5', '_DECISIONFAIL_5', '_PROCEDURE_5', '_EXPECTEDRESULT_5', '_FAILEDRESULT_5', 'return !(BasicFunctions::getAttributeValueAsNumber(''width'') > 25 && BasicFunctions::getAttributeValueAsNumber(''height'') > 25 && BasicFunctions::getAttributeValue(''alt'') == "" && BasicFunctions::getAttributeValueLength(''alt'') > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(6, 0, 'img', 1, '_NOTE_6', '_CNAME_6', '_ERR_6', '_DESC_6', NULL, NULL, '_RATIONALE_6', '', '', '_QUESTION_6', '_DECISIONPASS_6', '_DECISIONFAIL_6', '_PROCEDURE_6', '_EXPECTEDRESULT_6', '_FAILEDRESULT_6', 'return !(BasicFunctions::getAttributeValue(''alt'') == ''&nbsp;'' || BasicFunctions::getAttributeValue(''alt'') == "spacer");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(7, 0, 'img', 0, '_NOTE_7', '_CNAME_7', '_ERR_7', '_DESC_7', NULL, NULL, '_RATIONALE_7', '_HOWTOREPAIR_7', '', '', '', '', '_PROCEDURE_7', '_EXPECTEDRESULT_7', '_FAILEDRESULT_7', 'return !(BasicFunctions::getParentHTMLTag() == "a" && BasicFunctions::getAttributeValue(''alt'') == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(8, 0, 'img', 2, '', '_CNAME_8', '_ERR_8', '_DESC_8', NULL, NULL, '_RATIONALE_8', '', '', '_QUESTION_8', '_DECISIONPASS_8', '_DECISIONFAIL_8', '_PROCEDURE_8', '_EXPECTEDRESULT_8', '_FAILEDRESULT_8', 'if (!BasicFunctions::isFileExists(''src'')) return BasicFunctions::hasAttribute(''longdesc'');\r\n\r\nlist($width, $height) = BasicFunctions::getImageWidthAndHeight(''src'');\r\n\r\nreturn !($width > 50 && $height > 50 && !BasicFunctions::hasAttribute(''longdesc''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(9, 0, 'img', 0, '_NOTE_9', '_CNAME_9', '_ERR_9', '_DESC_9', NULL, NULL, '_RATIONALE_9', '_HOWTOREPAIR_9', '', '', '', '', '_PROCEDURE_9', '_EXPECTEDRESULT_9', '_FAILEDRESULT_9', 'if (!BasicFunctions::hasAttribute(''longdesc'')) \r\n   return true;\r\nelse\r\n   return (BasicFunctions::getNextSiblingTag() == "a" && BasicFunctions::getNextSiblingInnerText() == "[d]");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(10, 0, 'img', 2, '_NOTE_10', '_CNAME_10', '_ERR_10', '_DESC_10', NULL, NULL, '_RATIONALE_10', '', '', '_QUESTION_10', '_DECISIONPASS_10', '_DECISIONFAIL_10', '_PROCEDURE_10', '_EXPECTEDRESULT_10', '_FAILEDRESULT_10', 'return !(BasicFunctions::getLast4CharsFromAttributeValue(''src'') == ".gif" && BasicFunctions::getAttributeValueAsNumber(''width'') > 25 && BasicFunctions::getAttributeValueAsNumber(''height'') > 25);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(11, 0, 'img', 2, '', '_CNAME_11', '_ERR_11', '_DESC_11', NULL, NULL, '', '', '', '_QUESTION_11', '_DECISIONPASS_11', '_DECISIONFAIL_11', '_PROCEDURE_11', '_EXPECTEDRESULT_11', '_FAILEDRESULT_11', 'if (!BasicFunctions::isFileExists(''src'')) \r\n   return false;\r\nelse\r\n{\r\n   list($width, $height) = BasicFunctions::getImageWidthAndHeight(''src'');\r\n   return !($width > 50 && $height > 50);\r\n}', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(12, 0, 'img', 0, '_NOTE_12', '_CNAME_12', '_ERR_12', '_DESC_12', NULL, NULL, '', '_HOWTOREPAIR_12', '', '', '', '', '_PROCEDURE_12', '_EXPECTEDRESULT_12', '_FAILEDRESULT_12', 'return !BasicFunctions::hasAttribute(''ismap'') || (BasicFunctions::hasAttribute(''ismap'') && BasicFunctions::hasAttribute(''usemap''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(13, 0, 'img', 0, '', '_CNAME_13', '_ERR_13', '_DESC_13', NULL, NULL, '_RATIONALE_13', '_HOWTOREPAIR_13', '', '', '', '', '_PROCEDURE_13', '_EXPECTEDRESULT_13', '_FAILEDRESULT_13', 'if (!BasicFunctions::hasAttribute(''usemap'')) \r\n   return true;\r\nelse\r\n   return BasicFunctions::hasTextLinkEquivalents(''usemap'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(14, 0, 'img', 2, '', '_CNAME_14', '_ERR_14', '_DESC_14', NULL, NULL, '_RATIONALE_14', '', '', '_QUESTION_14', '_DECISIONPASS_14', '_DECISIONFAIL_14', '_PROCEDURE_14', '_EXPECTEDRESULT_14', '_FAILEDRESULT_14', 'if (!BasicFunctions::isFileExists(''src'')) \r\n   return false;\r\nelse\r\n{\r\n   list($width, $height) = BasicFunctions::getImageWidthAndHeight(''src'');\r\n   return !($width > 100 && $height > 100);\r\n}', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(15, 0, 'img', 2, '_NOTE_15', '_CNAME_15', '_ERR_15', '_DESC_15', NULL, NULL, '', '', '', '_QUESTION_15', '_DECISIONPASS_15', '_DECISIONFAIL_15', '_PROCEDURE_15', '_EXPECTEDRESULT_15', '_FAILEDRESULT_15', 'return (BasicFunctions::getParentHTMLTag() == ''a'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(16, 0, 'img', 2, '', '_CNAME_16', '_ERR_16', '_DESC_16', NULL, NULL, '', '', '', '_QUESTION_16', '_DECISIONPASS_16', '_DECISIONFAIL_16', '_PROCEDURE_16', '_EXPECTEDRESULT_16', '_FAILEDRESULT_16', 'return (BasicFunctions::getAttributeTrimedValueLength(''alt'') == 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(17, 0, 'a', 2, '', '_CNAME_17', '_ERR_17', '_DESC_17', NULL, NULL, '', '', '', '_QUESTION_17', '_DECISIONPASS_17', '_DECISIONFAIL_17', '_PROCEDURE_17', '_EXPECTEDRESULT_17', '_FAILEDRESULT_17', '$ext = BasicFunctions::getLast4CharsFromAttributeValue(''href'');\r\n		\r\nreturn !($ext == ".wav" || $ext == ".snd" || $ext == ".mp3" || $ext == ".iff" || $ext == ".svx" || $ext == ".sam" || \r\n         $ext == ".vce" || $ext == ".vox" || $ext == ".pcm" || $ext == ".aif" || $ext == ".smp");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(18, 0, 'a', 1, '', '_CNAME_18', '_ERR_18', '_DESC_18', NULL, NULL, '', '', '', '_QUESTION_18', '_DECISIONPASS_18', '_DECISIONFAIL_18', '_PROCEDURE_18', '_EXPECTEDRESULT_18', '_FAILEDRESULT_18', '$target_val = BasicFunctions::getAttributeValueInLowerCase(''target'');\r\n\r\nreturn (BasicFunctions::hasAttribute(''target'') && ($target_val == "_self" || $target_val == "_top" || $target_val == "_parent"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(19, 0, 'a', 1, '', '_CNAME_19', '_ERR_19', '_DESC_19', NULL, NULL, '', '', '', '_QUESTION_19', '_DECISIONPASS_19', '_DECISIONFAIL_19', '_PROCEDURE_19', '_EXPECTEDRESULT_19', '_FAILEDRESULT_19', 'return (BasicFunctions::getInnerTextLength() == 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(20, 0, 'a', 1, '', '_CNAME_20', '_ERR_20', '_DESC_20', NULL, NULL, '', '', '', '_QUESTION_20', '_DECISIONPASS_20', '_DECISIONFAIL_20', '_PROCEDURE_20', '_EXPECTEDRESULT_20', '_FAILEDRESULT_20', '$ext = BasicFunctions::getLast4CharsFromAttributeValue(''href'');\r\n\r\nreturn !($ext == ".wmv" || $ext == ".mpg" || $ext == ".mov" || $ext == ".ram" || $ext == ".aif");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(21, 0, 'applet', 2, '', '_CNAME_21', '_ERR_21', '_DESC_21', NULL, NULL, '', '', '', '_QUESTION_21', '_DECISIONPASS_21', '_DECISIONFAIL_21', '_PROCEDURE_21', '_EXPECTEDRESULT_21', '_FAILEDRESULT_21', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(22, 0, 'applet', 2, '', '_CNAME_22', '_ERR_22', '_DESC_22', NULL, NULL, '', '', '', '_QUESTION_22', '_DECISIONPASS_22', '_DECISIONFAIL_22', '_PROCEDURE_22', '_EXPECTEDRESULT_22', '_FAILEDRESULT_22', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(23, 0, 'applet', 2, '', '_CNAME_23', '_ERR_23', '_DESC_23', NULL, NULL, '', '', '', '_QUESTION_23', '_DECISIONPASS_23', '_DECISIONFAIL_23', '_PROCEDURE_23', '_EXPECTEDRESULT_23', '_FAILEDRESULT_23', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(24, 0, 'applet', 2, '', '_CNAME_24', '_ERR_24', '_DESC_24', NULL, NULL, '', '', '', '_QUESTION_24', '_DECISIONPASS_24', '_DECISIONFAIL_24', '_PROCEDURE_24', '_EXPECTEDRESULT_24', '_FAILEDRESULT_24', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(25, 0, 'applet', 2, '', '_CNAME_25', '_ERR_25', '_DESC_25', NULL, NULL, '', '', '', '_QUESTION_25', '_DECISIONPASS_25', '_DECISIONFAIL_25', '_PROCEDURE_25', '_EXPECTEDRESULT_25', '_FAILEDRESULT_25', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(26, 0, 'applet', 2, '', '_CNAME_26', '_ERR_26', '_DESC_26', NULL, NULL, '', '', '', '_QUESTION_26', '_DECISIONPASS_26', '_DECISIONFAIL_26', '_PROCEDURE_26', '_EXPECTEDRESULT_26', '_FAILEDRESULT_26', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(27, 0, 'blink', 0, '', '_CNAME_27', '_ERR_27', '_DESC_27', NULL, NULL, '', '_HOWTOREPAIR_27', '', '', '', '', '_PROCEDURE_27', '_EXPECTEDRESULT_27', '_FAILEDRESULT_27', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(28, 0, 'body', 2, '', '_CNAME_28', '_ERR_28', '_DESC_28', NULL, NULL, '', '', '', '_QUESTION_28', '_DECISIONPASS_28', '_DECISIONFAIL_28', '_PROCEDURE_28', '_EXPECTEDRESULT_28', '_FAILEDRESULT_28', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(29, 0, 'html', 0, '', '_CNAME_29', '_ERR_29', '_DESC_29', NULL, NULL, '', '_HOWTOREPAIR_29', '', '', '', '', '_PROCEDURE_29', '_EXPECTEDRESULT_29', '_FAILEDRESULT_29', 'return (BasicFunctions::getNumOfTagInWholeContent(''doctype'') > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(30, 0, 'object', 2, '', '_CNAME_30', '_ERR_30', '_DESC_30', NULL, NULL, '', '', '', '_QUESTION_30', '_DECISIONPASS_30', '_DECISIONFAIL_30', '_PROCEDURE_30', '_EXPECTEDRESULT_30', '_FAILEDRESULT_30', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(31, 0, 'frame', 0, '', '_CNAME_31', '_ERR_31', '_DESC_31', NULL, NULL, '', '_HOWTOREPAIR_31', '_REPAIREXAMPLE_31', '', '', '', '_PROCEDURE_31', '_EXPECTEDRESULT_31', '_FAILEDRESULT_31', 'return BasicFunctions::hasAttribute(''title'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(32, 0, 'frame', 2, '', '_CNAME_32', '_ERR_32', '_DESC_32', NULL, NULL, '', '', '', '_QUESTION_32', '_DECISIONPASS_32', '_DECISIONFAIL_32', '_PROCEDURE_32', '_EXPECTEDRESULT_32', '_FAILEDRESULT_32', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(33, 0, 'frame', 2, '', '_CNAME_33', '_ERR_33', '_DESC_33', NULL, NULL, '', '', '', '_QUESTION_33', '_DECISIONPASS_33', '_DECISIONFAIL_33', '_PROCEDURE_33', '_EXPECTEDRESULT_33', '_FAILEDRESULT_33', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(34, 0, 'frameset', 1, '_NOTE_34', '_CNAME_34', '_ERR_34', '_DESC_34', NULL, NULL, '', '', '', '_QUESTION_34', '_DECISIONPASS_34', '_DECISIONFAIL_34', '_PROCEDURE_34', '_EXPECTEDRESULT_34', '_FAILEDRESULT_34', '$num_of_frame = BasicFunctions::getNumOfTagInChildren(''frame'');\r\n\r\nif ($num_of_frame>=3) \r\n   return BasicFunctions::hasAttribute(''longdesc'');\r\nelse\r\n   return true;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(35, 0, 'frameset', 0, '_NOTE_35', '_CNAME_35', '_ERR_35', '_DESC_35', NULL, NULL, '', '_HOWTOREPAIR_35', '', '', '', '', '_PROCEDURE_35', '_EXPECTEDRESULT_35', '_FAILEDRESULT_35', '$num_of_noframes = BasicFunctions::getNumOfTagInChildren(''noframes'');\r\n\r\nreturn ($num_of_noframes>=1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(36, 0, 'noframes', 2, '_NOTE_36', '_CNAME_36', '_ERR_36', '_DESC_36', NULL, NULL, '', '', '', '_QUESTION_36', '_DECISIONPASS_36', '_DECISIONFAIL_36', '_PROCEDURE_36', '_EXPECTEDRESULT_36', '_FAILEDRESULT_36', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(37, 0, 'h1', 0, '', '_CNAME_37', '_ERR_37', '_DESC_37', NULL, NULL, '', '_HOWTOREPAIR_37', '', '', '', '', '_PROCEDURE_37', '_EXPECTEDRESULT_37', '_FAILEDRESULT_37', 'return BasicFunctions::isNextTagNotIn(array("h1", "h2"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(38, 0, 'h2', 0, '', '_CNAME_38', '_ERR_38', '_DESC_38', NULL, NULL, '', '_HOWTOREPAIR_38', '', '', '', '', '_PROCEDURE_38', '_EXPECTEDRESULT_38', '_FAILEDRESULT_38', 'return BasicFunctions::isNextTagNotIn(array("h1", "h2", "h3"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(39, 0, 'h3', 0, '', '_CNAME_39', '_ERR_39', '_DESC_39', NULL, NULL, '', '_HOWTOREPAIR_39', '', '', '', '', '_PROCEDURE_39', '_EXPECTEDRESULT_39', '_FAILEDRESULT_39', 'return BasicFunctions::isNextTagNotIn(array("h1", "h2", "h3", "h4"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(40, 0, 'h4', 0, '', '_CNAME_40', '_ERR_40', '_DESC_40', NULL, NULL, '', '_HOWTOREPAIR_40', '', '', '', '', '_PROCEDURE_40', '_EXPECTEDRESULT_40', '_FAILEDRESULT_40', 'return BasicFunctions::isNextTagNotIn(array("h1", "h2", "h3", "h4", "h5"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(41, 0, 'h5', 0, '_NOTE_41', '_CNAME_41', '_ERR_41', '_DESC_41', NULL, NULL, '', '_HOWTOREPAIR_41', '', '', '', '', '_PROCEDURE_41', '_EXPECTEDRESULT_41', '_FAILEDRESULT_41', 'return BasicFunctions::isNextTagNotIn(array("h1", "h2", "h3", "h4", "h5", "h6"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(42, 0, 'h1', 2, '', '_CNAME_42', '_ERR_42', '_DESC_42', NULL, NULL, '', '', '', '_QUESTION_42', '_DECISIONPASS_42', '_DECISIONFAIL_42', '_PROCEDURE_42', '_EXPECTEDRESULT_42', '_FAILEDRESULT_42', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(43, 0, 'h2', 2, '', '_CNAME_43', '_ERR_43', '_DESC_43', NULL, NULL, '', '', '', '_QUESTION_43', '_DECISIONPASS_43', '_DECISIONFAIL_43', '_PROCEDURE_43', '_EXPECTEDRESULT_43', '_FAILEDRESULT_43', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(44, 0, 'h3', 2, '', '_CNAME_44', '_ERR_44', '_DESC_44', NULL, NULL, '', '', '', '_QUESTION_44', '_DECISIONPASS_44', '_DECISIONFAIL_44', '_PROCEDURE_44', '_EXPECTEDRESULT_44', '_FAILEDRESULT_44', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(45, 0, 'h4', 2, '', '_CNAME_45', '_ERR_45', '_DESC_45', NULL, NULL, '', '', '', '_QUESTION_45', '_DECISIONPASS_45', '_DECISIONFAIL_45', '_PROCEDURE_45', '_EXPECTEDRESULT_45', '_FAILEDRESULT_45', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(46, 0, 'h5', 2, '', '_CNAME_46', '_ERR_46', '_DESC_46', NULL, NULL, '', '', '', '_QUESTION_46', '_DECISIONPASS_46', '_DECISIONFAIL_46', '_PROCEDURE_46', '_EXPECTEDRESULT_46', '_FAILEDRESULT_46', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(47, 0, 'h6', 2, '', '_CNAME_47', '_ERR_47', '_DESC_47', NULL, NULL, '', '', '', '_QUESTION_47', '_DECISIONPASS_47', '_DECISIONFAIL_47', '_PROCEDURE_47', '_EXPECTEDRESULT_47', '_FAILEDRESULT_47', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(48, 0, 'html', 0, '', '_CNAME_48', '_ERR_48', '_DESC_48', NULL, NULL, '_RATIONALE_48', '_HOWTOREPAIR_48', '_REPAIREXAMPLE_48', '', '', '', '_PROCEDURE_48', '_EXPECTEDRESULT_48', '_FAILEDRESULT_48', 'return (BasicFunctions::hasAttribute(''lang'') || BasicFunctions::hasAttribute(''xml:lang''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(49, 0, 'html', 0, '', '_CNAME_49', '_ERR_49', '_DESC_49', NULL, NULL, '_RATIONALE_49', '_HOWTOREPAIR_49', '', '', '', '', '_PROCEDURE_49', '_EXPECTEDRESULT_49', '_FAILEDRESULT_49', 'return BasicFunctions::isValidLangCode();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(50, 0, 'head', 0, '', '_CNAME_50', '_ERR_50', '_DESC_50', NULL, NULL, '', '_HOWTOREPAIR_50', '_REPAIREXAMPLE_50', '', '', '', '_PROCEDURE_50', '_EXPECTEDRESULT_50', '_FAILEDRESULT_50', 'return (BasicFunctions::getNumOfTagInChildren(''title'') > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(51, 0, 'title', 0, '', '_CNAME_51', '_ERR_51', '_DESC_51', NULL, NULL, '', '_HOWTOREPAIR_51', '', '', '', '', '_PROCEDURE_51', '_EXPECTEDRESULT_51', '_FAILEDRESULT_51', 'return (BasicFunctions::getInnerTextLength() > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(52, 0, 'title', 1, '', '_CNAME_52', '_ERR_52', '_DESC_52', NULL, NULL, '', '', '', '_QUESTION_52', '_DECISIONPASS_52', '_DECISIONFAIL_52', '_PROCEDURE_52', '_EXPECTEDRESULT_52', '_FAILEDRESULT_52', 'return (BasicFunctions::getInnerTextLength() < 150);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(53, 0, 'title', 1, '', '_CNAME_53', '_ERR_53', '_DESC_53', '_SEARCHSTR_53', NULL, '', '', '', '_QUESTION_53', '_DECISIONPASS_53', '_DECISIONFAIL_53', '_PROCEDURE_53', '_EXPECTEDRESULT_53', '_FAILEDRESULT_53', 'return !BasicFunctions::isInnerTextInSearchString();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(54, 0, 'title', 2, '', '_CNAME_54', '_ERR_54', '_DESC_54', NULL, NULL, '_RATIONALE_54', '', '', '_QUESTION_54', '_DECISIONPASS_54', '_DECISIONFAIL_54', '_PROCEDURE_54', '_EXPECTEDRESULT_54', '_FAILEDRESULT_54', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(55, 0, 'input', 2, '', '_CNAME_55', '_ERR_55', '_DESC_55', NULL, NULL, '', '', '', '_QUESTION_55', '_DECISIONPASS_55', '_DECISIONFAIL_55', '_PROCEDURE_55', '_EXPECTEDRESULT_55', '_FAILEDRESULT_55', 'return (BasicFunctions::getAttributeValue(''type'') == ''hidden'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(57, 0, 'input', 0, '', '_CNAME_57', '_ERR_57', '_DESC_57', NULL, NULL, '', '_HOWTOREPAIR_57', '', '', '', '', '_PROCEDURE_57', '_EXPECTEDRESULT_57', '_FAILEDRESULT_57', 'if (BasicFunctions::getAttributeValue(''type'') <> ''text'')\r\n   return true;\r\nelse\r\n   return BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(58, 0, 'input', 0, '', '_CNAME_58', '_ERR_58', '_DESC_58', NULL, NULL, '', '_HOWTOREPAIR_58', '', '', '', '', '_PROCEDURE_58', '_EXPECTEDRESULT_58', '_FAILEDRESULT_58', 'return (BasicFunctions::getAttributeValue(''type'') <> ''image'' || (BasicFunctions::getAttributeValue(''type'') == ''image'' && BasicFunctions::hasAttribute(''alt'')));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(59, 0, 'input', 2, '', '_CNAME_59', '_ERR_59', '_DESC_59', NULL, NULL, '', '', '', '_QUESTION_59', '_DECISIONPASS_59', '_DECISIONFAIL_59', '_PROCEDURE_59', '_EXPECTEDRESULT_59', '_FAILEDRESULT_59', 'return (BasicFunctions::getAttributeValue(''type'') <> ''image'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(60, 0, 'input', 1, '_NOTE_60', '_CNAME_60', '_ERR_60', '_DESC_60', NULL, NULL, '', '', '', '_QUESTION_60', '_DECISIONPASS_60', '_DECISIONFAIL_60', '_PROCEDURE_60', '_EXPECTEDRESULT_60', '_FAILEDRESULT_60', 'if (BasicFunctions::getAttributeValue(''type'') <> ''image'') return true;\r\n\r\n$lang_code = BasicFunctions::getLangCode();\r\n\r\nif ($lang_code == "ger" || $lang_code == "de")\r\n   return (BasicFunctions::getAttributeTrimedValueLength("alt") <= 115);\r\nelse if ($lang_code == "kor" || $lang_code == "ko")\r\n   return (BasicFunctions::getAttributeTrimedValueLength("alt") <= 90);\r\nelse\r\n   return (BasicFunctions::getAttributeTrimedValueLength("alt") <= 100);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(61, 0, 'input', 1, '', '_CNAME_61', '_ERR_61', '_DESC_61', NULL, NULL, '', '', '', '_QUESTION_61', '_DECISIONPASS_61', '_DECISIONFAIL_61', '_PROCEDURE_61', '_EXPECTEDRESULT_61', '_FAILEDRESULT_61', 'if (BasicFunctions::getAttributeValue(''type'') <> ''image'') return true;\r\n\r\n$src = BasicFunctions::getAttributeValue(''src'');\r\n$alt = BasicFunctions::getAttributeValue(''alt'');\r\n		\r\nif ($src <> "" && $alt <> "")\r\n   return ($src <> $alt);\r\nelse\r\n   return true;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(62, 0, 'input', 1, '', '_CNAME_62', '_ERR_62', '_DESC_62', '_SEARCHSTR_62', NULL, '', '', '', '_QUESTION_62', '_DECISIONPASS_62', '_DECISIONFAIL_62', '_PROCEDURE_62', '_EXPECTEDRESULT_62', '_FAILEDRESULT_62', 'if (BasicFunctions::getAttributeValue(''type'') <> ''image'') \r\n   return true;\r\nelse\r\n   return !BasicFunctions::isAttributeValueInSearchString(''alt'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(63, 0, 'input', 0, '_NOTE_63', '_CNAME_63', '_ERR_63', '_DESC_63', NULL, NULL, '', '_HOWTOREPAIR_63', '', '', '', '', '_PROCEDURE_63', '_EXPECTEDRESULT_63', '_FAILEDRESULT_63', 'if (BasicFunctions::getAttributeValue(''type'') <> ''text'') \r\n   return true;\r\nelse\r\n   return (BasicFunctions::hasAttribute(''value'') && BasicFunctions::getAttributeTrimedValueLength(''value'') > 3);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(64, 0, 'area', 0, '', '_CNAME_64', '_ERR_64', '_DESC_64', NULL, NULL, '', '_HOWTOREPAIR_64', '', '', '', '', '_PROCEDURE_64', '_EXPECTEDRESULT_64', '_FAILEDRESULT_64', 'return BasicFunctions::hasAttribute(''alt'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(65, 0, 'area', 2, '', '_CNAME_65', '_ERR_65', '_DESC_65', NULL, NULL, '', '', '', '_QUESTION_65', '_DECISIONPASS_65', '_DECISIONFAIL_65', '_PROCEDURE_65', '_EXPECTEDRESULT_65', '_FAILEDRESULT_65', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(66, 0, 'area', 1, '', '_CNAME_66', '_ERR_66', '_DESC_66', NULL, NULL, '', '', '', '_QUESTION_66', '_DECISIONPASS_66', '_DECISIONFAIL_66', '_PROCEDURE_66', '_EXPECTEDRESULT_66', '_FAILEDRESULT_66', '$ext = BasicFunctions::getLast4CharsFromAttributeValue(''href'');\r\n\r\nreturn !($ext == ".wav" || $ext == ".snd" || $ext == ".mp3" || $ext == ".iff" || $ext == ".svx" || $ext == ".sam" || \r\n         $ext == ".vce" || $ext == ".vox" || $ext == ".pcm" || $ext == ".aif" || $ext == ".smp");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(68, 0, 'area', 1, '', '_CNAME_68', '_ERR_68', '_DESC_68', NULL, NULL, '', '', '', '_QUESTION_68', '_DECISIONPASS_68', '_DECISIONFAIL_68', '_PROCEDURE_68', '_EXPECTEDRESULT_68', '_FAILEDRESULT_68', '$target_val = BasicFunctions::getAttributeValueInLowerCase("target");\r\n\r\nreturn (BasicFunctions::hasAttribute("target") && ($target_val == "_self" || $target_val == "_top" || $target_val == "_parent"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(69, 0, 'marquee', 0, '', '_CNAME_69', '_ERR_69', '_DESC_69', NULL, NULL, '', '_HOWTOREPAIR_69', '', '', '', '', '_PROCEDURE_69', '_EXPECTEDRESULT_69', '_FAILEDRESULT_69', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(70, 0, 'menu', 1, '_NOTE_70', '_CNAME_70', '_ERR_70', '_DESC_70', NULL, NULL, '', '', '', '_QUESTION_70', '_DECISIONPASS_70', '_DECISIONFAIL_70', '_PROCEDURE_70', '_EXPECTEDRESULT_70', '_FAILEDRESULT_70', 'return (BasicFunctions::getNumOfTagInChildrenWithInnerText(''li'') <> 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(71, 0, 'meta', 0, '', '_CNAME_71', '_ERR_71', '_DESC_71', NULL, NULL, '_RATIONALE_71', '_HOWTOREPAIR_71', '', '', '', '', '_PROCEDURE_71', '_EXPECTEDRESULT_71', '_FAILEDRESULT_71', 'return !(BasicFunctions::getAttributeValueInLowerCase("http-equiv")=="refresh" && BasicFunctions::getSubstring(BasicFunctions::getAttributeValueInLowerCase("content"), 0, 7)=="http://");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(72, 0, 'meta', 0, '', '_CNAME_72', '_ERR_72', '_DESC_72', NULL, NULL, '_RATIONALE_72', '_HOWTOREPAIR_72', '', '', '', '', '_PROCEDURE_72', '_EXPECTEDRESULT_72', '_FAILEDRESULT_72', 'return !(BasicFunctions::getAttributeValueInLowerCase("http-equiv")=="refresh" && BasicFunctions::getAttributeValueAsNumber("content") > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(73, 0, 'object', 2, '', '_CNAME_73', '_ERR_73', '_DESC_73', NULL, NULL, '', '', '', '_QUESTION_73', '_DECISIONPASS_73', '_DECISIONFAIL_73', '_PROCEDURE_73', '_EXPECTEDRESULT_73', '_FAILEDRESULT_73', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(74, 0, 'object', 2, '', '_CNAME_74', '_ERR_74', '_DESC_74', NULL, NULL, '', '', '', '_QUESTION_74', '_DECISIONPASS_74', '_DECISIONFAIL_74', '_PROCEDURE_74', '_EXPECTEDRESULT_74', '_FAILEDRESULT_74', 'return (!BasicFunctions::hasAttribute(''codebase'') || BasicFunctions::getAttributeValue(''codebase'') == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(75, 0, 'object', 2, '', '_CNAME_75', '_ERR_75', '_DESC_75', NULL, NULL, '', '', '', '_QUESTION_75', '_DECISIONPASS_75', '_DECISIONFAIL_75', '_PROCEDURE_75', '_EXPECTEDRESULT_75', '_FAILEDRESULT_75', 'return (!BasicFunctions::hasAttribute(''codebase'') || BasicFunctions::getAttributeValue(''codebase'') == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(76, 0, 'object', 2, '', '_CNAME_76', '_ERR_76', '_DESC_76', NULL, NULL, '', '', '', '_QUESTION_76', '_DECISIONPASS_76', '_DECISIONFAIL_76', '_PROCEDURE_76', '_EXPECTEDRESULT_76', '_FAILEDRESULT_76', 'return (!BasicFunctions::hasAttribute(''codebase'') || BasicFunctions::getAttributeValue(''codebase'') == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(77, 0, 'object', 2, '', '_CNAME_77', '_ERR_77', '_DESC_77', NULL, NULL, '', '', '', '_QUESTION_77', '_DECISIONPASS_77', '_DECISIONFAIL_77', '_PROCEDURE_77', '_EXPECTEDRESULT_77', '_FAILEDRESULT_77', 'return BasicFunctions::getAttributeValueInLowerCase(''type'') <> ''video'';', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(78, 0, 'object', 0, '', '_CNAME_78', '_ERR_78', '_DESC_78', NULL, NULL, '', '_HOWTOREPAIR_78', '', '', '', '', '_PROCEDURE_78', '_EXPECTEDRESULT_78', '_FAILEDRESULT_78', 'return BasicFunctions::hasAttribute(''title'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(79, 0, 'object', 0, '', '_CNAME_79', '_ERR_79', '_DESC_79', NULL, NULL, '', '_HOWTOREPAIR_79', '', '', '', '', '_PROCEDURE_79', '_EXPECTEDRESULT_79', '_FAILEDRESULT_79', 'return (BasicFunctions::getAttributeValue(''title'') <> '''');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(80, 0, 'object', 2, '', '_CNAME_80', '_ERR_80', '_DESC_80', NULL, NULL, '_RATIONALE_80', '', '', '_QUESTION_80', '_DECISIONPASS_80', '_DECISIONFAIL_80', '_PROCEDURE_80', '_EXPECTEDRESULT_80', '_FAILEDRESULT_80', 'return (BasicFunctions::getInnerText() <> '''');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(81, 0, 'ol', 1, '', '_CNAME_81', '_ERR_81', '_DESC_81', NULL, NULL, '', '', '', '_QUESTION_81', '_DECISIONPASS_81', '_DECISIONFAIL_81', '_PROCEDURE_81', '_EXPECTEDRESULT_81', '_FAILEDRESULT_81', 'return (BasicFunctions::getNumOfTagInChildrenWithInnerText(''li'') > 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(82, 0, 'p', 1, '', '_CNAME_82', '_ERR_82', '_DESC_82', NULL, NULL, '', '', '', '_QUESTION_82', '_DECISIONPASS_82', '_DECISIONFAIL_82', '_PROCEDURE_82', '_EXPECTEDRESULT_82', '_FAILEDRESULT_82', 'return BasicFunctions::isTextMarked(array(''b'', ''i'', ''u'', ''strong'', ''font'', ''em''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(83, 0, 'pre', 1, '', '_CNAME_83', '_ERR_83', '_DESC_83', NULL, NULL, '', '', '', '_QUESTION_83', '_DECISIONPASS_83', '_DECISIONFAIL_83', '_PROCEDURE_83', '_EXPECTEDRESULT_83', '_FAILEDRESULT_83', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(84, 0, 'pre', 1, '', '_CNAME_84', '_ERR_84', '_DESC_84', NULL, NULL, '', '', '', '_QUESTION_84', '_DECISIONPASS_84', '_DECISIONFAIL_84', '_PROCEDURE_84', '_EXPECTEDRESULT_84', '_FAILEDRESULT_84', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(86, 0, 'script', 2, '', '_CNAME_86', '_ERR_86', '_DESC_86', NULL, NULL, '', '', '', '_QUESTION_86', '_DECISIONPASS_86', '_DECISIONFAIL_86', '_PROCEDURE_86', '_EXPECTEDRESULT_86', '_FAILEDRESULT_86', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(87, 0, 'script', 2, '', '_CNAME_87', '_ERR_87', '_DESC_87', NULL, NULL, '', '', '', '_QUESTION_87', '_DECISIONPASS_87', '_DECISIONFAIL_87', '_PROCEDURE_87', '_EXPECTEDRESULT_87', '_FAILEDRESULT_87', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(88, 0, 'script', 2, '', '_CNAME_88', '_ERR_88', '_DESC_88', NULL, NULL, '', '', '', '_QUESTION_88', '_DECISIONPASS_88', '_DECISIONFAIL_88', '_PROCEDURE_88', '_EXPECTEDRESULT_88', '_FAILEDRESULT_88', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(89, 0, 'script', 2, '', '_CNAME_89', '_ERR_89', '_DESC_89', NULL, NULL, '', '', '', '_QUESTION_89', '_DECISIONPASS_89', '_DECISIONFAIL_89', '_PROCEDURE_89', '_EXPECTEDRESULT_89', '_FAILEDRESULT_89', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(90, 0, 'script', 0, '', '_CNAME_90', '_ERR_90', '_DESC_90', NULL, NULL, '', '_HOWTOREPAIR_90', '', '', '', '', '_PROCEDURE_90', '_EXPECTEDRESULT_90', '_FAILEDRESULT_90', 'return !(BasicFunctions::hasParent("body") && BasicFunctions::getNextSiblingTag() <> "noscript");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(91, 0, 'select', 0, '', '_CNAME_91', '_ERR_91', '_DESC_91', NULL, NULL, '', '_HOWTOREPAIR_91', '', '', '', '', '_PROCEDURE_91', '_EXPECTEDRESULT_91', '_FAILEDRESULT_91', 'return BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(92, 0, 'select', 1, '', '_CNAME_92', '_ERR_92', '_DESC_92', NULL, NULL, '', '', '', '_QUESTION_92', '_DECISIONPASS_92', '_DECISIONFAIL_92', '_PROCEDURE_92', '_EXPECTEDRESULT_92', '_FAILEDRESULT_92', 'return !BasicFunctions::hasAttribute(''onchange'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(94, 0, 'script', 1, '', '_CNAME_94', '_ERR_94', '_DESC_94', NULL, NULL, '', '', '', '_QUESTION_94', '_DECISIONPASS_94', '_DECISIONFAIL_94', '_PROCEDURE_94', '_EXPECTEDRESULT_94', '_FAILEDRESULT_94', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(95, 0, 'textarea', 0, '', '_CNAME_95', '_ERR_95', '_DESC_95', NULL, NULL, '', '_HOWTOREPAIR_95', '', '', '', '', '_PROCEDURE_95', '_EXPECTEDRESULT_95', '_FAILEDRESULT_95', 'return BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(96, 0, 'textarea', 2, '', '_CNAME_96', '_ERR_96', '_DESC_96', NULL, NULL, '', '_HOWTOREPAIR_96', '', '', '', '', '_PROCEDURE_96', '_EXPECTEDRESULT_96', '_FAILEDRESULT_96', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(97, 0, 'link', 2, '_NOTE_97', '_CNAME_97', '_ERR_97', '_DESC_97', NULL, NULL, '', '', '', '_QUESTION_97', '_DECISIONPASS_97', '_DECISIONFAIL_97', '_PROCEDURE_97', '_EXPECTEDRESULT_97', '_FAILEDRESULT_97', 'return !(BasicFunctions::hasAttribute(''rel'') && BasicFunctions::getAttributeValueInLowerCase(''rel'') == "stylesheet");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(98, 0, 'body', 2, '', '_CNAME_98', '_ERR_98', '_DESC_98', NULL, NULL, '_RATIONALE_98', '', '', '_QUESTION_98', '_DECISIONPASS_98', '_DECISIONFAIL_98', '_PROCEDURE_98', '_EXPECTEDRESULT_98', '_FAILEDRESULT_98', 'return (BasicFunctions::getPlainTextLength() <= 10);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(99, 0, 'body', 2, '', '_CNAME_99', '_ERR_99', '_DESC_99', NULL, NULL, '_RATIONALE_99', '', '', '_QUESTION_99', '_DECISIONPASS_99', '_DECISIONFAIL_99', '_PROCEDURE_99', '_EXPECTEDRESULT_99', '_FAILEDRESULT_99', 'return (BasicFunctions::getPlainTextLength() <= 10);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(100, 0, 'blockquote', 2, '', '_CNAME_100', '_ERR_100', '_DESC_100', NULL, NULL, '_RATIONALE_100', '', '', '_QUESTION_100', '_DECISIONPASS_100', '_DECISIONFAIL_100', '_PROCEDURE_100', '_EXPECTEDRESULT_100', '_FAILEDRESULT_100', 'return BasicFunctions::hasAttribute(''cite'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(101, 0, 'iframe', 1, '', '_CNAME_101', '_ERR_101', '_DESC_101', NULL, NULL, '', '', '', '', '', '', '_PROCEDURE_101', '_EXPECTEDRESULT_101', '_FAILEDRESULT_101', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(102, 0, 'all elements', 0, '', '_CNAME_102', '_ERR_102', '_DESC_102', NULL, NULL, '', '_HOWTOREPAIR_102', '', '', '', '', '_PROCEDURE_102', '_EXPECTEDRESULT_102', '_FAILEDRESULT_102', 'return !(BasicFunctions::hasAttribute("onclick") && !BasicFunctions::hasAttribute("onkeypress"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(103, 0, 'all elements', 2, '', '_CNAME_103', '_ERR_103', '_DESC_103', NULL, NULL, '', '', '', '_QUESTION_103', '_DECISIONPASS_103', '_DECISIONFAIL_103', '_PROCEDURE_103', '_EXPECTEDRESULT_103', '_FAILEDRESULT_103', 'return !BasicFunctions::hasAttribute(''ondblclick'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(104, 0, 'all elements', 0, '', '_CNAME_104', '_ERR_104', '_DESC_104', NULL, NULL, '', '_HOWTOREPAIR_104', '', '', '', '', '_PROCEDURE_104', '_EXPECTEDRESULT_104', '_FAILEDRESULT_104', 'return !(BasicFunctions::hasAttribute(''onmousedown'') && !BasicFunctions::hasAttribute(''onkeydown''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(105, 0, 'all elements', 2, '', '_CNAME_105', '_ERR_105', '_DESC_105', NULL, NULL, '', '', '', '_QUESTION_105', '_DECISIONPASS_105', '_DECISIONFAIL_105', '_PROCEDURE_105', '_EXPECTEDRESULT_105', '_FAILEDRESULT_105', 'return !BasicFunctions::hasAttribute(''onmousemove'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(106, 0, 'all elements', 0, '', '_CNAME_106', '_ERR_106', '_DESC_106', NULL, NULL, '', '_HOWTOREPAIR_106', '', '', '', '', '_PROCEDURE_106', '_EXPECTEDRESULT_106', '_FAILEDRESULT_106', 'return !(BasicFunctions::hasAttribute(''onmouseout'') && !BasicFunctions::hasAttribute(''onblur''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(107, 0, 'all elements', 0, '', '_CNAME_107', '_ERR_107', '_DESC_107', NULL, NULL, '', '_HOWTOREPAIR_107', '', '', '', '', '_PROCEDURE_107', '_EXPECTEDRESULT_107', '_FAILEDRESULT_107', 'return !(BasicFunctions::hasAttribute(''onmouseover'') && !BasicFunctions::hasAttribute(''onfocus''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(108, 0, 'all elements', 0, '', '_CNAME_108', '_ERR_108', '_DESC_108', NULL, NULL, '', '_HOWTOREPAIR_108', '', '', '', '', '_PROCEDURE_108', '_EXPECTEDRESULT_108', '_FAILEDRESULT_108', 'return !(BasicFunctions::hasAttribute(''onmouseup'') && !BasicFunctions::hasAttribute(''onkeyup''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(109, 0, 'all elements', 1, '_NOTE_109', '_CNAME_109', '_ERR_109', '_DESC_109', NULL, NULL, '', '', '', '_QUESTION_109', '_DECISIONPASS_109', '_DECISIONFAIL_109', '_PROCEDURE_109', '_EXPECTEDRESULT_109', '_FAILEDRESULT_109', 'return !BasicFunctions::hasAttribute(''style'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(110, 0, 'body', 2, '', '_CNAME_110', '_ERR_110', '_DESC_110', NULL, NULL, '_RATIONALE_110', '', '', '_QUESTION_110', '_DECISIONPASS_110', '_DECISIONFAIL_110', '_PROCEDURE_110', '_EXPECTEDRESULT_110', '_FAILEDRESULT_110', '$lang_code = BasicFunctions::getLangCode();\r\n\r\nif ($lang_code == "en" || $lang_code == "eng")\r\n   return (BasicFunctions::getPlainTextLength() <= 10);\r\nelse\r\n   return true;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(111, 0, 'table', 2, '', '_CNAME_111', '_ERR_111', '_DESC_111', NULL, NULL, '', '', '', '_QUESTION_111', '_DECISIONPASS_111', '_DECISIONFAIL_111', '_PROCEDURE_111', '_EXPECTEDRESULT_111', '_FAILEDRESULT_111', 'return !(BasicFunctions::isDataTable() && !BasicFunctions::hasAttribute(''summary''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(112, 0, 'table', 0, '', '_CNAME_112', '_ERR_112', '_DESC_112', NULL, NULL, '', '_HOWTOREPAIR_112', '_REPAIREXAMPLE_112', '', '', '', '_PROCEDURE_112', '_EXPECTEDRESULT_112', '_FAILEDRESULT_112', 'return !(BasicFunctions::isDataTable() && BasicFunctions::hasAttribute(''summary'') && BasicFunctions::getAttributeValue(''summary'') == '''');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(113, 0, 'table', 1, '', '_CNAME_113', '_ERR_113', '_DESC_113', NULL, NULL, '', '', '', '_QUESTION_113', '_DECISIONPASS_113', '_DECISIONFAIL_113', '_PROCEDURE_113', '_EXPECTEDRESULT_113', '_FAILEDRESULT_113', 'return !(BasicFunctions::isDataTable() && BasicFunctions::hasAttribute(''summary'') && BasicFunctions::getAttributeValueLength(''summary'') < 11);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(114, 0, 'table', 0, '', '_CNAME_114', '_ERR_114', '_DESC_114', NULL, NULL, '', '_HOWTOREPAIR_114', '_REPAIREXAMPLE_114', '', '', '', '_PROCEDURE_114', '_EXPECTEDRESULT_114', '_FAILEDRESULT_114', 'return !(!BasicFunctions::isDataTable() && BasicFunctions::getAttributeValueLength(''summary'') > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(115, 0, 'table', 0, '', '_CNAME_115', '_ERR_115', '_DESC_115', NULL, NULL, '', '_HOWTOREPAIR_115', '', '', '', '', '_PROCEDURE_115', '_EXPECTEDRESULT_115', '_FAILEDRESULT_115', 'if (BasicFunctions::isDataTable()) return true;\r\n		\r\nif (BasicFunctions::getFirstChildTag() == "caption") \r\n   return false;\r\nelse \r\n   return true;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(116, 0, 'b', 0, '_NOTE_116', '_CNAME_116', '_ERR_116', '_DESC_116', NULL, NULL, '_RATIONALE_116', '_HOWTOREPAIR_116', '', '', '', '', '_PROCEDURE_116', '_EXPECTEDRESULT_116', '_FAILEDRESULT_116', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(117, 0, 'i', 0, '_NOTE_117', '_CNAME_117', '_ERR_117', '_DESC_117', NULL, NULL, '_RATIONALE_117', '_HOWTOREPAIR_117', '', '', '', '', '_PROCEDURE_117', '_EXPECTEDRESULT_117', '_FAILEDRESULT_117', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(118, 0, 'input', 0, '', '_CNAME_118', '_ERR_118', '_DESC_118', NULL, NULL, '', '_HOWTOREPAIR_118', '', '', '', '', '_PROCEDURE_118', '_EXPECTEDRESULT_118', '_FAILEDRESULT_118', 'if (BasicFunctions::getAttributeValueInLowerCase(''type'') <> "password") return true;\r\n\r\nreturn BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(119, 0, 'input', 0, '', '_CNAME_119', '_ERR_119', '_DESC_119', NULL, NULL, '', '_HOWTOREPAIR_119', '', '', '', '', '_PROCEDURE_119', '_EXPECTEDRESULT_119', '_FAILEDRESULT_119', 'if (BasicFunctions::getAttributeValueInLowerCase(''type'') <> "checkbox") return true;\r\n\r\nreturn BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(120, 0, 'input', 0, '', '_CNAME_120', '_ERR_120', '_DESC_120', NULL, NULL, '', '_HOWTOREPAIR_120', '', '', '', '', '_PROCEDURE_120', '_EXPECTEDRESULT_120', '_FAILEDRESULT_120', 'if (BasicFunctions::getAttributeValueInLowerCase(''type'') <> "file") return true;\r\n\r\nreturn BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(121, 0, 'input', 0, '', '_CNAME_121', '_ERR_121', '_DESC_121', NULL, NULL, '', '_HOWTOREPAIR_121', '', '', '', '', '_PROCEDURE_121', '_EXPECTEDRESULT_121', '_FAILEDRESULT_121', 'if (BasicFunctions::getAttributeValueInLowerCase(''type'') <> "radio") return true;\r\n\r\nreturn BasicFunctions::hasAssociatedLabel();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(122, 1, 'input', 2, '', '_CNAME_122', '_ERR_122', '_DESC_122', NULL, NULL, '', '', '', '', '', '', '_PROCEDURE_122', '_EXPECTEDRESULT_122', '_FAILEDRESULT_122', 'return !(BasicFunctions::getAttributeValueInLowerCase(''type'') == "password");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(123, 1, 'input', 2, '', '_CNAME_123', '_ERR_123', '_DESC_123', NULL, NULL, '', '', '', '', '', '', '_PROCEDURE_123', '_EXPECTEDRESULT_123', '_FAILEDRESULT_123', 'return !(BasicFunctions::getAttributeValueInLowerCase(''type'') == "checkbox");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(124, 1, 'input', 2, '', '_CNAME_124', '_ERR_124', '_DESC_124', NULL, NULL, '', '', '', '', '', '', '_PROCEDURE_124', '_EXPECTEDRESULT_124', '_FAILEDRESULT_124', 'return !(BasicFunctions::getAttributeValueInLowerCase(''type'') == "file");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(125, 1, 'input', 2, '', '_CNAME_125', '_ERR_125', '_DESC_125', NULL, NULL, '', '', '', '', '', '', '_PROCEDURE_125', '_EXPECTEDRESULT_125', '_FAILEDRESULT_125', 'return !(BasicFunctions::getAttributeValueInLowerCase(''type'') == "radio");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(126, 0, 'input', 0, '_NOTE_126', '_CNAME_126', '_ERR_126', '_DESC_126', NULL, NULL, '', '_HOWTOREPAIR_126', '', '', '', '', '_PROCEDURE_126', '_EXPECTEDRESULT_126', '_FAILEDRESULT_126', 'return !(BasicFunctions::getAttributeValueInLowerCase(''type'') == "text" && BasicFunctions::getAttributeTrimedValueLength(''value'') == 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(127, 0, 'object', 2, '', '_CNAME_127', '_ERR_127', '_DESC_127', NULL, NULL, '', '', '', '_QUESTION_127', '_DECISIONPASS_127', '_DECISIONFAIL_127', '_PROCEDURE_127', '_EXPECTEDRESULT_127', '_FAILEDRESULT_127', 'return !(BasicFunctions::hasAttribute(''classid'') && BasicFunctions::getPlainTextLength() > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(128, 0, 'object', 2, '', '_CNAME_128', '_ERR_128', '_DESC_128', NULL, NULL, '', '', '', '_QUESTION_128', '_DECISIONPASS_128', '_DECISIONFAIL_128', '_PROCEDURE_128', '_EXPECTEDRESULT_128', '_FAILEDRESULT_128', 'return !(BasicFunctions::hasAttribute(''classid'') && BasicFunctions::getPlainTextLength() > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(129, 0, 'object', 2, '', '_CNAME_129', '_ERR_129', '_DESC_129', NULL, NULL, '', '', '', '_QUESTION_129', '_DECISIONPASS_129', '_DECISIONFAIL_129', '_PROCEDURE_129', '_EXPECTEDRESULT_129', '_FAILEDRESULT_129', 'return !(BasicFunctions::hasAttribute(''classid'') && BasicFunctions::getPlainTextLength() > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(131, 0, 'body', 2, '', '_CNAME_131', '_ERR_131', '_DESC_131', NULL, NULL, '_RATIONALE_131', '', '', '_QUESTION_131', '_DECISIONPASS_131', '_DECISIONFAIL_131', '_PROCEDURE_131', '_EXPECTEDRESULT_131', '_FAILEDRESULT_131', 'return (BasicFunctions::getPlainTextLength() <= 10);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(132, 0, 'img', 2, '_NOTE_132', '_CNAME_132', '_ERR_132', '_DESC_132', NULL, NULL, '_RATIONALE_132', '', '', '_QUESTION_132', '_DECISIONPASS_132', '_DECISIONFAIL_132', '_PROCEDURE_132', '_EXPECTEDRESULT_132', '_FAILEDRESULT_132', 'return !BasicFunctions::hasAttribute(''ismap'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(133, 0, 'table', 2, '', '_CNAME_133', '_ERR_133', '_DESC_133', NULL, NULL, '', '', '', '_QUESTION_133', '_DECISIONPASS_133', '_DECISIONFAIL_133', '_PROCEDURE_133', '_EXPECTEDRESULT_133', '_FAILEDRESULT_133', 'return BasicFunctions::isDataTable();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(134, 0, 'a', 0, '', '_CNAME_134', '_ERR_134', '_DESC_134', NULL, NULL, '', '_HOWTOREPAIR_134', '_REPAIREXAMPLE_134', '', '', '', '_PROCEDURE_134', '_EXPECTEDRESULT_134', '_FAILEDRESULT_134', 'return BasicFunctions::hasTextInBtw();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(135, 0, 'img', 2, '_NOTE_135', '_CNAME_135', '_ERR_135', '_DESC_135', NULL, NULL, '', '', '', '_QUESTION_135', '_DECISIONPASS_135', '_DECISIONFAIL_135', '_PROCEDURE_135', '_EXPECTEDRESULT_135', '_FAILEDRESULT_135', 'return !(BasicFunctions::getAttributeValueAsNumber(''width'') > 100 && BasicFunctions::getAttributeValueAsNumber(''height'') > 100 );', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(136, 0, 'table', 2, '', '_CNAME_136', '_ERR_136', '_DESC_136', NULL, NULL, '', '', '', '_QUESTION_136', '_DECISIONPASS_136', '_DECISIONFAIL_136', '_PROCEDURE_136', '_EXPECTEDRESULT_136', '_FAILEDRESULT_136', 'return BasicFunctions::isDataTable();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(137, 0, 'table', 2, '', '_CNAME_137', '_ERR_137', '_DESC_137', NULL, NULL, '', '', '', '_QUESTION_137', '_DECISIONPASS_137', '_DECISIONFAIL_137', '_PROCEDURE_137', '_EXPECTEDRESULT_137', '_FAILEDRESULT_137', 'return BasicFunctions::isDataTable();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(138, 0, 'input', 0, '_NOTE_138', '_CNAME_138', '_ERR_138', '_DESC_138', NULL, NULL, '', '_HOWTOREPAIR_138', '', '', '', '', '_PROCEDURE_138', '_EXPECTEDRESULT_138', '_FAILEDRESULT_138', 'return !(BasicFunctions::getAttributeValue(''type'')==''text'' && BasicFunctions::getAttributeTrimedValueLength(''tabindex'') < 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(139, 0, 'input', 0, '_NOTE_139', '_CNAME_139', '_ERR_139', '_DESC_139', NULL, NULL, '', '_HOWTOREPAIR_139', '', '', '', '', '_PROCEDURE_139', '_EXPECTEDRESULT_139', '_FAILEDRESULT_139', 'return !(BasicFunctions::getAttributeValue(''type'')==''radio'' && BasicFunctions::getAttributeTrimedValueLength(''tabindex'') < 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(140, 0, 'input', 0, '_NOTE_140', '_CNAME_140', '_ERR_140', '_DESC_140', NULL, NULL, '', '_HOWTOREPAIR_140', '', '', '', '', '_PROCEDURE_140', '_EXPECTEDRESULT_140', '_FAILEDRESULT_140', 'return !(BasicFunctions::getAttributeValue(''type'')==''password'' && BasicFunctions::getAttributeTrimedValueLength(''tabindex'') < 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(141, 0, 'input', 0, '_NOTE_141', '_CNAME_141', '_ERR_141', '_DESC_141', NULL, NULL, '', '_HOWTOREPAIR_141', '', '', '', '', '_PROCEDURE_141', '_EXPECTEDRESULT_141', '_FAILEDRESULT_141', 'return !(BasicFunctions::getAttributeValue(''type'')==''checkbox'' && BasicFunctions::getAttributeTrimedValueLength(''tabindex'') < 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(142, 0, 'input', 0, '_NOTE_142', '_CNAME_142', '_ERR_142', '_DESC_142', NULL, NULL, '', '_HOWTOREPAIR_142', '', '', '', '', '_PROCEDURE_142', '_EXPECTEDRESULT_142', '_FAILEDRESULT_142', 'return !(BasicFunctions::getAttributeValue(''type'')==''file'' && BasicFunctions::getAttributeTrimedValueLength(''tabindex'') < 1);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(143, 0, 'html', 0, '_NOTE_143', '_CNAME_143', '_ERR_143', '_DESC_143', NULL, NULL, '', '_HOWTOREPAIR_143', '', '', '', '', '_PROCEDURE_143', '_EXPECTEDRESULT_143', '_FAILEDRESULT_143', 'return BasicFunctions::hasTagInChildren(''address'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(144, 0, 'address', 2, '_NOTE_144', '_CNAME_144', '_ERR_144', '_DESC_144', NULL, NULL, '', '', '', '_QUESTION_144', '_DECISIONPASS_144', '_DECISIONFAIL_144', '_PROCEDURE_144', '_EXPECTEDRESULT_144', '_FAILEDRESULT_144', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(145, 0, 'a', 1, '', '_CNAME_145', '_ERR_145', '_DESC_145', NULL, NULL, '', '', '', '_QUESTION_145', '_DECISIONPASS_145', '_DECISIONFAIL_145', '_PROCEDURE_145', '_EXPECTEDRESULT_145', '_FAILEDRESULT_145', '$ext = BasicFunctions::getLast4CharsFromAttributeValue(''href'');\r\n\r\nreturn !($ext == ".wmv" || $ext == ".mpg" || $ext == ".mov" || $ext == ".ram" || $ext == ".aif");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(146, 0, 'object', 2, '', '_CNAME_146', '_ERR_146', '_DESC_146', NULL, NULL, '', '', '', '_QUESTION_146', '_DECISIONPASS_146', '_DECISIONFAIL_146', '_PROCEDURE_146', '_EXPECTEDRESULT_146', '_FAILEDRESULT_146', 'return !BasicFunctions::getAttributeValueInLowerCase(''type'') == "video";', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(147, 0, 'head', 2, '', '_CNAME_147', '_ERR_147', '_DESC_147', NULL, NULL, '', '', '', '_QUESTION_147', '_DECISIONPASS_147', '_DECISIONFAIL_147', '_PROCEDURE_147', '_EXPECTEDRESULT_147', '_FAILEDRESULT_147', 'if (!BasicFunctions::hasTagInChildren(''link''))\r\n   return false;\r\nelse\r\n   return !BasicFunctions::hasTextInChild(''link'', ''rel'', array(''stylesheet'', ''alternate''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(148, 0, 'head', 2, '', '_CNAME_148', '_ERR_148', '_DESC_148', NULL, NULL, '', '', '', '_QUESTION_148', '_DECISIONPASS_148', '_DECISIONFAIL_148', '_PROCEDURE_148', '_EXPECTEDRESULT_148', '_FAILEDRESULT_148', 'if (!BasicFunctions::hasTagInChildren(''link''))\r\n   return false;\r\nelse\r\n   return BasicFunctions::hasTextInChild(''link'', ''rel'', array(''alternate''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(149, 0, 'ol', 1, '', '_CNAME_149', '_ERR_149', '_DESC_149', NULL, NULL, '', '', '', '_QUESTION_149', '_DECISIONPASS_149', '_DECISIONFAIL_149', '_PROCEDURE_149', '_EXPECTEDRESULT_149', '_FAILEDRESULT_149', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(150, 0, 'ol', 1, '', '_CNAME_150', '_ERR_150', '_DESC_150', NULL, NULL, '', '', '', '_QUESTION_150', '_DECISIONPASS_150', '_DECISIONFAIL_150', '_PROCEDURE_150', '_EXPECTEDRESULT_150', '_FAILEDRESULT_150', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(151, 0, 'table', 2, '', '_CNAME_151', '_ERR_151', '_DESC_151', NULL, NULL, '', '', '', '_QUESTION_151', '_DECISIONPASS_151', '_DECISIONFAIL_151', '_PROCEDURE_151', '_EXPECTEDRESULT_151', '_FAILEDRESULT_151', 'if (!BasicFunctions::isDataTable()) \r\n   return true;\r\nelse \r\n   return BasicFunctions::hasTagInChildren("caption");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(152, 0, 'th', 0, '', '_CNAME_152', '_ERR_152', '_DESC_152', NULL, NULL, '', '_HOWTOREPAIR_152', '', '', '', '', '_PROCEDURE_152', '_EXPECTEDRESULT_152', '_FAILEDRESULT_152', 'return !(BasicFunctions::getPlainTextLength() > 20 && !BasicFunctions::hasAttribute(''abbr''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(153, 0, 'th', 0, '', '_CNAME_153', '_ERR_153', '_DESC_153', NULL, NULL, '', '_HOWTOREPAIR_153', '', '', '', '', '_PROCEDURE_153', '_EXPECTEDRESULT_153', '_FAILEDRESULT_153', 'return (BasicFunctions::getAttributeTrimedValueLength(''abbr'') <= 20);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(154, 0, 'pre', 2, '', '_CNAME_154', '_ERR_154', '_DESC_154', NULL, NULL, '', '', '', '_QUESTION_154', '_DECISIONPASS_154', '_DECISIONFAIL_154', '_PROCEDURE_154', '_EXPECTEDRESULT_154', '_FAILEDRESULT_154', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(155, 0, 'a', 0, '', '_CNAME_155', '_ERR_155', '_DESC_155', NULL, NULL, '', '_HOWTOREPAIR_155', '', '', '', '', '_PROCEDURE_155', '_EXPECTEDRESULT_155', '_FAILEDRESULT_155', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(156, 0, 'ol', 0, '', '_CNAME_156', '_ERR_156', '_DESC_156', NULL, NULL, '', '_HOWTOREPAIR_156', '', '', '', '', '_PROCEDURE_156', '_EXPECTEDRESULT_156', '_FAILEDRESULT_156', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(157, 0, 'ol', 2, '', '_CNAME_157', '_ERR_157', '_DESC_157', NULL, NULL, '', '', '', '_QUESTION_157', '_DECISIONPASS_157', '_DECISIONFAIL_157', '_PROCEDURE_157', '_EXPECTEDRESULT_157', '_FAILEDRESULT_157', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(158, 0, 'ol', 2, '', '_CNAME_158', '_ERR_158', '_DESC_158', NULL, NULL, '', '', '', '_QUESTION_158', '_DECISIONPASS_158', '_DECISIONFAIL_158', '_PROCEDURE_158', '_EXPECTEDRESULT_158', '_FAILEDRESULT_158', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(159, 0, 'img', 0, '_NOTE_159', '_CNAME_159', '_ERR_159', '_DESC_159', NULL, NULL, '', '_HOWTOREPAIR_159', '', '', '', '', '_PROCEDURE_159', '_EXPECTEDRESULT_159', '_FAILEDRESULT_159', 'return !BasicFunctions::hasAttribute(''title'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(160, 0, 'object', 2, '', '_CNAME_160', '_ERR_160', '_DESC_160', NULL, NULL, '', '', '', '_QUESTION_160', '_DECISIONPASS_160', '_DECISIONFAIL_160', '_PROCEDURE_160', '_EXPECTEDRESULT_160', '_FAILEDRESULT_160', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(161, 0, 'body', 0, '', '_CNAME_161', '_ERR_161', '_DESC_161', NULL, NULL, '', '_HOWTOREPAIR_161', '', '', '', '', '_PROCEDURE_161', '_EXPECTEDRESULT_161', '_FAILEDRESULT_161', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(162, 0, 'body', 0, '', '_CNAME_162', '_ERR_162', '_DESC_162', NULL, NULL, '', '_HOWTOREPAIR_162', '_REPAIREXAMPLE_162', '', '', '', '_PROCEDURE_162', '_EXPECTEDRESULT_162', '_FAILEDRESULT_162', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(163, 0, 'embed', 0, '', '_CNAME_163', '_ERR_163', '_DESC_163', NULL, NULL, '', '_HOWTOREPAIR_163', '_REPAIREXAMPLE_163', '', '', '', '_PROCEDURE_163', '_EXPECTEDRESULT_163', '_FAILEDRESULT_163', 'if (BasicFunctions::getNextSiblingTag() == "noembed") return true;\r\n\r\nif (BasicFunctions::hasTagInChildren("noembed")) \r\n   return true;\r\nelse\r\n   return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(164, 0, 'noembed', 2, '', '_CNAME_164', '_ERR_164', '_DESC_164', NULL, NULL, '', '', '', '_QUESTION_164', '_DECISIONPASS_164', '_DECISIONFAIL_164', '_PROCEDURE_164', '_EXPECTEDRESULT_164', '_FAILEDRESULT_164', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(165, 0, 'embed', 0, '', '_CNAME_165', '_ERR_165', '_DESC_165', NULL, NULL, '', '_HOWTOREPAIR_165', '', '', '', '', '_PROCEDURE_165', '_EXPECTEDRESULT_165', '_FAILEDRESULT_165', 'return BasicFunctions::hasAttribute(''alt'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(166, 0, 'embed', 0, '', '_CNAME_166', '_ERR_166', '_DESC_166', NULL, NULL, '', '_HOWTOREPAIR_166', '', '', '', '', '_PROCEDURE_166', '_EXPECTEDRESULT_166', '_FAILEDRESULT_166', 'return (BasicFunctions::getAttributeValue(''alt'') <> "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(167, 0, 'iframe', 0, '', '_CNAME_167', '_ERR_167', '_DESC_167', NULL, NULL, '', '_HOWTOREPAIR_167', '', '', '', '', '_PROCEDURE_167', '_EXPECTEDRESULT_167', '_FAILEDRESULT_167', 'return !BasicFunctions::hasAttribute(''longdesc'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(168, 0, 'form', 0, '', '_CNAME_168', '_ERR_168', '_DESC_168', NULL, NULL, '', '_HOWTOREPAIR_168', '', '', '', '', '_PROCEDURE_168', '_EXPECTEDRESULT_168', '_FAILEDRESULT_168', 'return BasicFunctions::isRadioButtonsGrouped();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(169, 0, 'select', 1, '', '_CNAME_169', '_ERR_169', '_DESC_169', NULL, NULL, '', '', '', '_QUESTION_169', '_DECISIONPASS_169', '_DECISIONFAIL_169', '_PROCEDURE_169', '_EXPECTEDRESULT_169', '_FAILEDRESULT_169', '$num_of_options = BasicFunctions::getNumOfTagRecursiveInChildren("option");\r\n$num_of_optgroups = BasicFunctions::getNumOfTagRecursiveInChildren("optgroup");\r\n\r\nreturn !($num_of_options > 3 && $num_of_optgroups < 2);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(173, 0, 'a', 1, '', '_CNAME_173', '_ERR_173', '_DESC_173', '_SEARCHSTR_173', NULL, '', '', '', '_QUESTION_173', '_DECISIONPASS_173', '_DECISIONFAIL_173', '_PROCEDURE_173', '_EXPECTEDRESULT_173', '_FAILEDRESULT_173', 'return !BasicFunctions::isPlainTextInSearchString();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(174, 0, 'a', 0, '', '_CNAME_174', '_ERR_174', '_DESC_174', NULL, NULL, '', '_HOWTOREPAIR_174', '', '', '', '', '_PROCEDURE_174', '_EXPECTEDRESULT_174', '_FAILEDRESULT_174', 'return (BasicFunctions::getPlainTextLength() > 0 || BasicFunctions::getAttributeTrimedValueLength(''title'') > 0 || BasicFunctions::getLengthOfAttributeValueWithGivenTagInChildren(''img'', ''alt'') > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(175, 0, 'a', 0, '', '_CNAME_175', '_ERR_175', '_DESC_175', NULL, NULL, '', '_HOWTOREPAIR_175', '', '', '', '', '_PROCEDURE_175', '_EXPECTEDRESULT_175', '_FAILEDRESULT_175', '$alt_value = BasicFunctions::getLowerCaseAttributeValueWithGivenTagInChildren(''img'', ''alt'');\r\n\r\nreturn !($alt_value <> "" && $alt_value == BasicFunctions::getPlainTextInLowerCase());', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(176, 0, 'basefont', 0, '', '_CNAME_176', '_ERR_176', '_DESC_176', NULL, NULL, '', '_HOWTOREPAIR_176', '', '', '', '', '_PROCEDURE_176', '_EXPECTEDRESULT_176', '_FAILEDRESULT_176', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(177, 0, 'font', 0, '', '_CNAME_177', '_ERR_177', '_DESC_177', NULL, NULL, '', '_HOWTOREPAIR_177', '', '', '', '', '_PROCEDURE_177', '_EXPECTEDRESULT_177', '_FAILEDRESULT_177', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(178, 0, 'img', 2, '', '_CNAME_178', '_ERR_178', '_DESC_178', NULL, NULL, '', '', '', '_QUESTION_178', '_DECISIONPASS_178', '_DECISIONFAIL_178', '_PROCEDURE_178', '_EXPECTEDRESULT_178', '_FAILEDRESULT_178', 'return BasicFunctions::hasParent("a");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(179, 0, 'body', 2, '', '_CNAME_179', '_ERR_179', '_DESC_179', NULL, NULL, '', '', '', '_QUESTION_179', '_DECISIONPASS_179', '_DECISIONFAIL_179', '_PROCEDURE_179', '_EXPECTEDRESULT_179', '_FAILEDRESULT_179', 'return (BasicFunctions::getPlainTextLength() <= 10);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(180, 0, 'a', 0, '', '_CNAME_180', '_ERR_180', '_DESC_180', NULL, NULL, '', '_HOWTOREPAIR_180', '_REPAIREXAMPLE_180', '', '', '', '_PROCEDURE_180', '_EXPECTEDRESULT_180', '_FAILEDRESULT_180', 'return !(BasicFunctions::getAttributeValueInLowerCase("href") == BasicFunctions::getNextSiblingAttributeValueInLowerCase("href"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(181, 0, 'a', 0, '', '_CNAME_181', '_ERR_181', '_DESC_181', NULL, NULL, '', '_HOWTOREPAIR_181', '', '', '', '', '_PROCEDURE_181', '_EXPECTEDRESULT_181', '_FAILEDRESULT_181', 'return (BasicFunctions::getSubstring(BasicFunctions::getAttributeValueInLowerCase("href"), 0, 11) <> "javascript:");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(182, 0, 'body', 0, '', '_CNAME_182', '_ERR_182', '_DESC_182', NULL, NULL, '', '_HOWTOREPAIR_182', '', '', '', '', '_PROCEDURE_182', '_EXPECTEDRESULT_182', '_FAILEDRESULT_182', 'return !BasicFunctions::hasAttribute("background");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(183, 0, 'object', 0, '', '_CNAME_183', '_ERR_183', '_DESC_183', NULL, NULL, '', '_HOWTOREPAIR_183', '', '', '', '', '_PROCEDURE_183', '_EXPECTEDRESULT_183', '_FAILEDRESULT_183', 'return (BasicFunctions::getNumOfTagRecursiveInChildren(''embed'') > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(184, 0, 'body', 2, '', '_CNAME_184', '_ERR_184', '_DESC_184', NULL, NULL, '', '', '', '_QUESTION_184', '_DECISIONPASS_184', '_DECISIONFAIL_184', '_PROCEDURE_184', '_EXPECTEDRESULT_184', '_FAILEDRESULT_184', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(185, 0, 'body', 0, '', '_CNAME_185', '_ERR_185', '_DESC_185', NULL, NULL, '', '_HOWTOREPAIR_185', '', '', '', '', '_PROCEDURE_185', '_EXPECTEDRESULT_185', '_FAILEDRESULT_185', 'return !BasicFunctions::hasDuplicateAttribute(''id'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(186, 0, 'label', 0, '', '_CNAME_186', '_ERR_186', '_DESC_186', NULL, NULL, '', '_HOWTOREPAIR_186', '_REPAIREXAMPLE_186', '', '', '', '_PROCEDURE_186', '_EXPECTEDRESULT_186', '_FAILEDRESULT_186', 'return (BasicFunctions::getNumOfTagRecursiveInChildren(''input'') == 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(187, 0, 'body', 0, '', '_CNAME_187', '_ERR_187', '_DESC_187', NULL, NULL, '', '_HOWTOREPAIR_187', '', '', '', '', '_PROCEDURE_187', '_EXPECTEDRESULT_187', '_FAILEDRESULT_187', 'return !BasicFunctions::hasDuplicateAttribute(''for'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(188, 0, 'input', 0, '', '_CNAME_188', '_ERR_188', '_DESC_188', NULL, NULL, '', '_HOWTOREPAIR_188', '', '', '', '', '_PROCEDURE_188', '_EXPECTEDRESULT_188', '_FAILEDRESULT_188', 'if (BasicFunctions::getAttributeValue(''type'') <> ''hidden'' && BasicFunctions::getAttributeValue(''type'') <> ''button'') return BasicFunctions::associatedLabelHasText();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(189, 0, 'input', 2, '', '_CNAME_189', '_ERR_189', '_DESC_189', NULL, NULL, '', '', '', '_QUESTION_189', '_DECISIONPASS_189', '_DECISIONFAIL_189', '_PROCEDURE_189', '_EXPECTEDRESULT_189', '_FAILEDRESULT_189', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(190, 0, 'a', 0, '', '_CNAME_190', '_ERR_190', '_DESC_190', NULL, NULL, '', '_HOWTOREPAIR_190', '_REPAIREXAMPLE_190', '', '', '', '_PROCEDURE_190', '_EXPECTEDRESULT_190', '_FAILEDRESULT_190', 'return BasicFunctions::hasAttribute("title");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(191, 0, 'a', 2, '', '_CNAME_191', '_ERR_191', '_DESC_191', NULL, NULL, '', '', '', '_QUESTION_191', '_DECISIONPASS_191', '_DECISIONFAIL_191', '_PROCEDURE_191', '_EXPECTEDRESULT_191', '_FAILEDRESULT_191', 'return !(!BasicFunctions::hasAttribute("href") || (BasicFunctions::hasAttribute("href") && BasicFunctions::hasAttribute("title")));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(192, 0, 'input', 0, '', '_CNAME_192', '_ERR_192', '_DESC_192', NULL, NULL, '', '_HOWTOREPAIR_192', '', '', '', '', '_PROCEDURE_192', '_EXPECTEDRESULT_192', '_FAILEDRESULT_192', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="image" && (BasicFunctions::getAttributeValueInLowerCase("alt")=="submit" || BasicFunctions::getAttributeValueInLowerCase("alt")=="button"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(193, 0, 'input', 2, '', '_CNAME_193', '_ERR_193', '_DESC_193', NULL, NULL, '', '', '', '_QUESTION_193', '_DECISIONPASS_193', '_DECISIONFAIL_193', '_PROCEDURE_193', '_EXPECTEDRESULT_193', '_FAILEDRESULT_193', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="image");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(194, 0, 'area', 2, '', '_CNAME_194', '_ERR_194', '_DESC_194', NULL, NULL, '', '', '', '_QUESTION_194', '_DECISIONPASS_194', '_DECISIONFAIL_194', '_PROCEDURE_194', '_EXPECTEDRESULT_194', '_FAILEDRESULT_194', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(195, 0, 'img', 0, '', '_CNAME_195', '_ERR_195', '_DESC_195', '_SEARCHSTR_195', NULL, '', '_HOWTOREPAIR_195', '', '', '', '', '_PROCEDURE_195', '_EXPECTEDRESULT_195', '_FAILEDRESULT_195', 'return !(BasicFunctions::getParentHTMLTag() == "a" && BasicFunctions::isAttributeValueInSearchString(''alt''));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(196, 0, 'img', 2, '', '_CNAME_196', '_ERR_196', '_DESC_196', NULL, NULL, '', '', '', '_QUESTION_196', '_DECISIONPASS_196', '_DECISIONFAIL_196', '_PROCEDURE_196', '_EXPECTEDRESULT_196', '_FAILEDRESULT_196', 'return !(BasicFunctions::hasAttribute("ismap"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(197, 0, 'a', 2, '', '_CNAME_197', '_ERR_197', '_DESC_197', NULL, NULL, '', '', '', '_QUESTION_197', '_DECISIONPASS_197', '_DECISIONFAIL_197', '_PROCEDURE_197', '_EXPECTEDRESULT_197', '_FAILEDRESULT_197', 'return !(BasicFunctions::hasAttribute("href"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(198, 0, 'legend', 2, '', '_CNAME_198', '_ERR_198', '_DESC_198', NULL, NULL, '', '', '', '_QUESTION_198', '_DECISIONPASS_198', '_DECISIONFAIL_198', '_PROCEDURE_198', '_EXPECTEDRESULT_198', '_FAILEDRESULT_198', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(199, 0, 'legend', 0, '', '_CNAME_199', '_ERR_199', '_DESC_199', NULL, NULL, '', '_HOWTOREPAIR_199', '', '', '', '', '_PROCEDURE_199', '_EXPECTEDRESULT_199', '_FAILEDRESULT_199', 'return (BasicFunctions::getPlainTextLength() > 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(200, 0, 'legend', 1, '', '_CNAME_200', '_ERR_200', '_DESC_200', '_SEARCHSTR_200', NULL, '', '', '', '_QUESTION_200', '_DECISIONPASS_200', '_DECISIONFAIL_200', '_PROCEDURE_200', '_EXPECTEDRESULT_200', '_FAILEDRESULT_200', 'return !BasicFunctions::isPlainTextInSearchString();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(201, 0, 'frame', 0, '', '_CNAME_201', '_ERR_201', '_DESC_201', NULL, NULL, '', '_HOWTOREPAIR_201', '', '', '', '', '_PROCEDURE_201', '_EXPECTEDRESULT_201', '_FAILEDRESULT_201', 'return !(BasicFunctions::getAttributeTrimedValueLength(''title'') == 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(202, 0, 'frame', 2, '', '_CNAME_202', '_ERR_202', '_DESC_202', '_SEARCHSTR_202', NULL, '', '', '', '_QUESTION_202', '_DECISIONPASS_202', '_DECISIONFAIL_202', '_PROCEDURE_202', '_EXPECTEDRESULT_202', '_FAILEDRESULT_202', 'return !BasicFunctions::isAttributeValueInSearchString(''title'');', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(203, 0, 'table', 2, '', '_CNAME_203', '_ERR_203', '_DESC_203', NULL, NULL, '', '', '', '_QUESTION_203', '_DECISIONPASS_203', '_DECISIONFAIL_203', '_PROCEDURE_203', '_EXPECTEDRESULT_203', '_FAILEDRESULT_203', 'return !(BasicFunctions::isDataTable() && BasicFunctions::hasAttribute("summary"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(204, 0, 'input', 0, '', '_CNAME_204', '_ERR_204', '_DESC_204', NULL, NULL, '', '_HOWTOREPAIR_204', '', '', '', '', '_PROCEDURE_204', '_EXPECTEDRESULT_204', '_FAILEDRESULT_204', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="radio" && !BasicFunctions::associatedLabelHasText());', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(205, 0, 'input', 2, '', '_CNAME_205', '_ERR_205', '', NULL, NULL, '', '', '', '_QUESTION_205', '_DECISIONPASS_205', '_DECISIONFAIL_205', '_PROCEDURE_205', '_EXPECTEDRESULT_205', '_FAILEDRESULT_205', 'return !(BasicFunctions::getAttributeValueInLowerCase("type") == "file");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(206, 0, 'input', 0, '', '_CNAME_206', '_ERR_206', '_DESC_206', NULL, NULL, '', '_HOWTOREPAIR_206', '', '', '', '', '_PROCEDURE_206', '_EXPECTEDRESULT_206', '_FAILEDRESULT_206', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="checkbox" && !BasicFunctions::associatedLabelHasText());', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(207, 0, 'input', 0, '', '_CNAME_207', '_ERR_207', '_DESC_207', NULL, NULL, '', '_HOWTOREPAIR_207', '', '', '', '', '_PROCEDURE_207', '_EXPECTEDRESULT_207', '_FAILEDRESULT_207', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="password" && !BasicFunctions::associatedLabelHasText());', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(208, 0, 'select', 0, '', '_CNAME_208', '_ERR_208', '_DESC_208', NULL, NULL, '', '_HOWTOREPAIR_208', '', '', '', '', '_PROCEDURE_208', '_EXPECTEDRESULT_208', '_FAILEDRESULT_208', 'return BasicFunctions::associatedLabelHasText();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(209, 0, 'select', 2, '', '_CNAME_209', '_ERR_209', '', NULL, NULL, '', '', '', '_QUESTION_209', '_DECISIONPASS_209', '_DECISIONFAIL_209', '_PROCEDURE_209', '_EXPECTEDRESULT_209', '_FAILEDRESULT_209', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(210, 0, 'select', 2, '', '_CNAME_210', '_ERR_210', '', NULL, NULL, '', '', '', '_QUESTION_210', '_DECISIONPASS_210', '_DECISIONFAIL_210', '_PROCEDURE_210', '_EXPECTEDRESULT_210', '_FAILEDRESULT_210', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(211, 0, 'input', 2, '', '_CNAME_211', '_ERR_211', '_DESC_211', NULL, NULL, '', '', '', '_QUESTION_211', '_DECISIONPASS_211', '_DECISIONFAIL_211', '_PROCEDURE_211', '_EXPECTEDRESULT_211', '_FAILEDRESULT_211', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="text");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(212, 0, 'textarea', 0, '', '_CNAME_212', '_ERR_212', '_DESC_212', NULL, NULL, '', '_HOWTOREPAIR_212', '', '', '', '', '_PROCEDURE_212', '_EXPECTEDRESULT_212', '_FAILEDRESULT_212', 'return BasicFunctions::associatedLabelHasText();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(213, 0, 'input', 0, '', '_CNAME_213', '_ERR_213', '_DESC_213', NULL, NULL, '', '_HOWTOREPAIR_213', '', '', '', '', '_PROCEDURE_213', '_EXPECTEDRESULT_213', '_FAILEDRESULT_213', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="text" && !BasicFunctions::associatedLabelHasText());', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(214, 0, 'textarea', 2, '', '_CNAME_214', '_ERR_214', '', NULL, NULL, '', '', '', '_QUESTION_214', '_DECISIONPASS_214', '_DECISIONFAIL_214', '_PROCEDURE_214', '_EXPECTEDRESULT_214', '_FAILEDRESULT_214', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(216, 0, 'input', 0, '', '_CNAME_216', '_ERR_216', '_DESC_216', NULL, NULL, '', '_HOWTOREPAIR_216', '', '', '', '', '_PROCEDURE_216', '_EXPECTEDRESULT_216', '_FAILEDRESULT_216', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="file" && !BasicFunctions::associatedLabelHasText());', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(217, 0, 'input', 2, '', '_CNAME_217', '_ERR_217', '', NULL, NULL, '', '', '', '_QUESTION_217', '_DECISIONPASS_217', '_DECISIONFAIL_217', '_PROCEDURE_217', '_EXPECTEDRESULT_217', '_FAILEDRESULT_217', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="password");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(218, 0, 'input', 2, '', '_CNAME_218', '_ERR_218', '', NULL, NULL, '', '', '', '_QUESTION_218', '_DECISIONPASS_218', '_DECISIONFAIL_218', '_PROCEDURE_218', '_EXPECTEDRESULT_218', '_FAILEDRESULT_218', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="text");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(219, 0, 'input', 2, '', '_CNAME_219', '_ERR_219', '', NULL, NULL, '', '', '', '_QUESTION_219', '_DECISIONPASS_219', '_DECISIONFAIL_219', '_PROCEDURE_219', '_EXPECTEDRESULT_219', '_FAILEDRESULT_219', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="checkbox");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(220, 0, 'input', 2, '', '_CNAME_220', '_ERR_220', '', NULL, NULL, '', '', '', '_QUESTION_220', '_DECISIONPASS_220', '_DECISIONFAIL_220', '_PROCEDURE_220', '_EXPECTEDRESULT_220', '_FAILEDRESULT_220', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="radio");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(221, 0, 'body', 0, '', '_CNAME_221', '_ERR_221', '_DESC_221', NULL, NULL, '', '_HOWTOREPAIR_221', '_REPAIREXAMPLE_221', '', '', '', '_PROCEDURE_221', '_EXPECTEDRESULT_221', '_FAILEDRESULT_221', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$textcolor = BasicFunctions::getAttributeValue("text");\r\n\r\nif ($bgcolor == "" && $textcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $textcolor) >= 4.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(222, 0, 'body', 0, '', '_CNAME_222', '_ERR_222', '_DESC_222', NULL, NULL, '', '_HOWTOREPAIR_222', '_REPAIREXAMPLE_222', '', '', '', '_PROCEDURE_222', '_EXPECTEDRESULT_222', '_FAILEDRESULT_222', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$linkcolor = BasicFunctions::getAttributeValue("link");\r\n\r\nif ($bgcolor == "" && $linkcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $linkcolor) >= 4.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(223, 0, 'body', 0, '', '_CNAME_223', '_ERR_223', '_DESC_223', NULL, NULL, '', '_HOWTOREPAIR_223', '_REPAIREXAMPLE_223', '', '', '', '_PROCEDURE_223', '_EXPECTEDRESULT_223', '_FAILEDRESULT_223', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$alinkcolor = BasicFunctions::getAttributeValue("alink");\r\n\r\nif ($bgcolor == "" && $alinkcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $alinkcolor) >= 4.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(224, 0, 'body', 0, '', '_CNAME_224', '_ERR_224', '_DESC_224', NULL, NULL, '', '_HOWTOREPAIR_224', '_REPAIREXAMPLE_224', '', '', '', '_PROCEDURE_224', '_EXPECTEDRESULT_224', '_FAILEDRESULT_224', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$vlinkcolor = BasicFunctions::getAttributeValue("vlink");\r\n\r\nif ($bgcolor == "" && $vlinkcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $vlinkcolor) >= 4.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(225, 0, 'html', 0, '', '_CNAME_225', '_ERR_225', '_DESC_225', NULL, NULL, '', '_HOWTOREPAIR_225', '_REPAIREXAMPLE_225', '', '', '', '_PROCEDURE_225', '_EXPECTEDRESULT_225', '_FAILEDRESULT_225', 'return BasicFunctions::validateDoctype();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(226, 0, 'body', 0, '', '_CNAME_226', '_ERR_226', '_DESC_226', NULL, NULL, '', '_HOWTOREPAIR_226', '_REPAIREXAMPLE_226', '', '', '', '_PROCEDURE_226', '_EXPECTEDRESULT_226', '_FAILEDRESULT_226', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$textcolor = BasicFunctions::getAttributeValue("text");\r\n\r\nif ($bgcolor == "" && $textcolor == "")\r\n   return true;\r\nelse\r\n   return BasicFunctions::hasGoodContrastWaiert($bgcolor, $textcolor);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(227, 0, 'body', 0, '', '_CNAME_227', '_ERR_227', '_DESC_227', NULL, NULL, '', '_HOWTOREPAIR_227', '_REPAIREXAMPLE_227', '', '', '', '_PROCEDURE_227', '_EXPECTEDRESULT_227', '_FAILEDRESULT_227', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$linkcolor = BasicFunctions::getAttributeValue("link");\r\n\r\nif ($bgcolor == "" && $linkcolor == "")\r\n   return true;\r\nelse\r\n   return BasicFunctions::hasGoodContrastWaiert($bgcolor, $linkcolor);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(228, 0, 'body', 0, '', '_CNAME_228', '_ERR_228', '_DESC_228', NULL, NULL, '', '_HOWTOREPAIR_228', '_REPAIREXAMPLE_228', '', '', '', '_PROCEDURE_228', '_EXPECTEDRESULT_228', '_FAILEDRESULT_228', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$alinkcolor = BasicFunctions::getAttributeValue("alink");\r\n\r\nif ($bgcolor == "" && $alinkcolor == "")\r\n   return true;\r\nelse\r\n   return BasicFunctions::hasGoodContrastWaiert($bgcolor, $alinkcolor);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(229, 0, 'body', 0, '', '_CNAME_229', '_ERR_229', '_DESC_229', NULL, NULL, '', '_HOWTOREPAIR_229', '_REPAIREXAMPLE_229', '', '', '', '_PROCEDURE_229', '_EXPECTEDRESULT_229', '_FAILEDRESULT_229', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$vlinkcolor = BasicFunctions::getAttributeValue("vlink");\r\n\r\nif ($bgcolor == "" && $vlinkcolor == "")\r\n   return true;\r\nelse\r\n   return BasicFunctions::hasGoodContrastWaiert($bgcolor, $vlinkcolor);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(230, 0, 'table', 2, '', '_CNAME_230', '_ERR_230', '_DESC_230', NULL, NULL, '', '', '', '_QUESTION_230', '_DECISIONPASS_230', '_DECISIONFAIL_230', '_PROCEDURE_230', '_EXPECTEDRESULT_230', '_FAILEDRESULT_230', 'return !(BasicFunctions::isDataTable() && \r\n         (BasicFunctions::getNumOfTagRecursiveInChildren("thead") == 0 ||\r\n         BasicFunctions::getNumOfTagRecursiveInChildren("tfoot") == 0 ||\r\n         BasicFunctions::getNumOfTagRecursiveInChildren("tbody") == 0));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(231, 0, 'table', 2, '', '_CNAME_231', '_ERR_231', '_DESC_231', NULL, NULL, '', '', '', '_QUESTION_231', '_DECISIONPASS_231', '_DECISIONFAIL_231', '_PROCEDURE_231', '_EXPECTEDRESULT_231', '_FAILEDRESULT_231', 'return !(BasicFunctions::isDataTable() && \r\n         BasicFunctions::getNumOfTagRecursiveInChildren("col") == 0 &&\r\n         BasicFunctions::getNumOfTagRecursiveInChildren("colgroup") == 0);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(232, 0, 'html', 0, '', '_CNAME_232', '_ERR_232', '_DESC_232', NULL, NULL, '', '_HOWTOREPAIR_232', '', '', '', '', '_PROCEDURE_232', '_EXPECTEDRESULT_232', '_FAILEDRESULT_232', 'return BasicFunctions::htmlValidated();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(233, 0, 'frameset', 0, '', '_CNAME_233', '_ERR_233', '_DESC_233', NULL, NULL, '', '_HOWTOREPAIR_233', '', '', '', '', '_PROCEDURE_233', '_EXPECTEDRESULT_233', '_FAILEDRESULT_233', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(234, 0, 'frame', 0, '', '_CNAME_234', '_ERR_234', '_DESC_234', NULL, NULL, '', '_HOWTOREPAIR_234', '', '', '', '', '_PROCEDURE_234', '_EXPECTEDRESULT_234', '_FAILEDRESULT_234', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(235, 0, 'body', 2, '', '_CNAME_235', '_ERR_235', '_DESC_235', NULL, NULL, '', '', '', '_QUESTION_235', '_DECISIONPASS_235', '_DECISIONFAIL_235', '_PROCEDURE_235', '_EXPECTEDRESULT_235', '_FAILEDRESULT_235', 'return (BasicFunctions::getPlainTextLength() < 11);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(236, 0, 'a', 0, '', '_CNAME_236', '_ERR_236', '_DESC_236', NULL, NULL, '', '_HOWTOREPAIR_236', '_REPAIREXAMPLE_236', '', '', '', '_PROCEDURE_236', '_EXPECTEDRESULT_236', '_FAILEDRESULT_236', 'return !(BasicFunctions::getNextSiblingTag() == ''a'' && BasicFunctions::getAttributeValueInLowerCase("href") == BasicFunctions::getNextSiblingAttributeValueInLowerCase("href"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(237, 0, 'html', 0, '', '_CNAME_237', '_ERR_237', '_DESC_237', NULL, NULL, '', '_HOWTOREPAIR_237', '', '', '', '', '_PROCEDURE_237', '_EXPECTEDRESULT_237', '_FAILEDRESULT_237', 'return BasicFunctions::isSubmitLabelDifferent();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(238, 0, 'input', 0, '', '_CNAME_238', '_ERR_238', '_DESC_238', NULL, NULL, '', '_HOWTOREPAIR_238', '', '', '', '', '_PROCEDURE_238', '_EXPECTEDRESULT_238', '_FAILEDRESULT_238', 'return !(BasicFunctions::getAttributeValueInLowerCase("type") <> "image" && BasicFunctions::hasAttribute("alt"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(239, 0, 'img', 2, '', '_CNAME_239', '_ERR_239', '_DESC_239', NULL, NULL, '', '', '', '_QUESTION_239', '_DECISIONPASS_239', '_DECISIONFAIL_239', '_PROCEDURE_239', '_EXPECTEDRESULT_239', '_FAILEDRESULT_239', 'return (BasicFunctions::getAttributeValue(''title'') == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(240, 0, 'a', 2, '', '_CNAME_240', '_ERR_240', '_DESC_240', NULL, NULL, '', '', '', '_QUESTION_240', '_DECISIONPASS_240', '_DECISIONFAIL_240', '_PROCEDURE_240', '_EXPECTEDRESULT_240', '_FAILEDRESULT_240', '$ext = BasicFunctions::getLast4CharsFromAttributeValue(''href'');\r\n\r\nreturn !($ext == ".wmv" || $ext == ".mpg" || $ext == ".mov" || $ext == ".ram" || $ext == ".aif");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(241, 0, 'body', 2, '', '_CNAME_241', '_ERR_241', '_DESC_241', NULL, NULL, '', '', '', '_QUESTION_241', '_DECISIONPASS_241', '_DECISIONFAIL_241', '_PROCEDURE_241', '_EXPECTEDRESULT_241', '_FAILEDRESULT_241', 'return (BasicFunctions::getPlainTextLength() < 21);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(242, 0, 'caption', 2, '', '_CNAME_242', '_ERR_242', '_DESC_242', NULL, NULL, '', '', '', '_QUESTION_242', '_DECISIONPASS_242', '_DECISIONFAIL_242', '_PROCEDURE_242', '_EXPECTEDRESULT_242', '_FAILEDRESULT_242', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(243, 0, 'table', 0, '', '_CNAME_243', '_ERR_243', '_DESC_243', NULL, NULL, '', '_HOWTOREPAIR_243', '', '', '', '', '_PROCEDURE_243', '_EXPECTEDRESULT_243', '_FAILEDRESULT_243', 'if (BasicFunctions::getAttributeValue("summary") == "") return true;\r\n\r\n$caption = BasicFunctions::getLowerCasePlainTextWithGivenTagInChildren(''caption'');\r\n\r\nreturn (BasicFunctions::getAttributeValueInLowerCase("summary") <> $caption);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(244, 0, 'table', 0, '', '_CNAME_244', '_ERR_244', '_DESC_244', NULL, NULL, '', '_HOWTOREPAIR_244', '', '', '', '', '_PROCEDURE_244', '_EXPECTEDRESULT_244', '_FAILEDRESULT_244', 'if (!BasicFunctions::isDataTable()) \r\n   return true;\r\nelse\r\n   return BasicFunctions::hasScope();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(245, 0, 'table', 0, '', '_CNAME_245', '_ERR_245', '_DESC_245', NULL, NULL, '', '_HOWTOREPAIR_245', '', '', '', '', '_PROCEDURE_245', '_EXPECTEDRESULT_245', '_FAILEDRESULT_245', 'if (!BasicFunctions::isDataTable()) \r\n   return true;\r\nelse\r\n   return BasicFunctions::hasIdHeaders();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(246, 0, 'form', 2, '', '_CNAME_246', '_ERR_246', '_DESC_246', NULL, NULL, '', '', '', '_QUESTION_246', '_DECISIONPASS_246', '_DECISIONFAIL_246', '_PROCEDURE_246', '_EXPECTEDRESULT_246', '_FAILEDRESULT_246', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(247, 0, 'form', 0, '', '_CNAME_247', '_ERR_247', '_DESC_247', NULL, NULL, '', '_HOWTOREPAIR_247', '', '', '', '', '_PROCEDURE_247', '_EXPECTEDRESULT_247', '_FAILEDRESULT_247', 'return BasicFunctions::hasFieldsetOnMultiCheckbox();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(248, 0, 'body', 2, '', '_CNAME_248', '_ERR_248', '_DESC_248', NULL, NULL, '', '', '', '_QUESTION_248', '_DECISIONPASS_248', '_DECISIONFAIL_248', '_PROCEDURE_248', '_EXPECTEDRESULT_248', '_FAILEDRESULT_248', 'return (BasicFunctions::getPlainTextLength() < 31);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(249, 0, 'body', 2, '', '_CNAME_249', '_ERR_249', '_DESC_249', NULL, NULL, '', '', '', '_QUESTION_249', '_DECISIONPASS_249', '_DECISIONFAIL_249', '_PROCEDURE_249', '_EXPECTEDRESULT_249', '_FAILEDRESULT_249', 'return (BasicFunctions::getPlainTextLength() < 51);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(250, 0, 'body', 2, '', '_CNAME_250', '_ERR_250', '_DESC_250', NULL, NULL, '', '', '', '_QUESTION_250', '_DECISIONPASS_250', '_DECISIONFAIL_250', '_PROCEDURE_250', '_EXPECTEDRESULT_250', '_FAILEDRESULT_250', 'return (BasicFunctions::getPlainTextLength() < 21);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(251, 0, 'img', 2, '', '_CNAME_251', '_ERR_251', '_DESC_251', NULL, NULL, '', '', '', '_QUESTION_251', '_DECISIONPASS_251', '_DECISIONFAIL_251', '_PROCEDURE_251', '_EXPECTEDRESULT_251', '_FAILEDRESULT_251', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(252, 0, 'body', 0, '', '_CNAME_252', '_ERR_252', '_DESC_252', NULL, NULL, '', '_HOWTOREPAIR_252', '_REPAIREXAMPLE_252', '', '', '', '_PROCEDURE_252', '_EXPECTEDRESULT_252', '_FAILEDRESULT_252', '$count_colors = 0;\r\n\r\nif (BasicFunctions::hasAttribute("text")) $count_colors++;\r\nif (BasicFunctions::hasAttribute("link")) $count_colors++;\r\nif (BasicFunctions::hasAttribute("alink")) $count_colors++;\r\nif (BasicFunctions::hasAttribute("vlink")) $count_colors++;\r\nif (BasicFunctions::hasAttribute("bgcolor")) $count_colors++;\r\n\r\nreturn ($count_colors == 0 || $count_colors == 5);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(253, 0, 'img', 2, '', '_CNAME_253', '_ERR_253', '_DESC_253', NULL, NULL, '', '', '', '_QUESTION_253', '_DECISIONPASS_253', '_DECISIONFAIL_253', '_PROCEDURE_253', '_EXPECTEDRESULT_253', '_FAILEDRESULT_253', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(254, 0, 'body', 0, '', '_CNAME_254', '_ERR_254', '_DESC_254', NULL, NULL, '', '_HOWTOREPAIR_254', '_REPAIREXAMPLE_254', '', '', '', '_PROCEDURE_254', '_EXPECTEDRESULT_254', '_FAILEDRESULT_254', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$textcolor = BasicFunctions::getAttributeValue("text");\r\n\r\nif ($bgcolor == "" && $textcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $textcolor) >= 9.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(255, 0, 'body', 0, '', '_CNAME_255', '_ERR_255', '_DESC_255', NULL, NULL, '', '_HOWTOREPAIR_255', '_REPAIREXAMPLE_255', '', '', '', '_PROCEDURE_255', '_EXPECTEDRESULT_255', '_FAILEDRESULT_255', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$linkcolor = BasicFunctions::getAttributeValue("link");\r\n\r\nif ($bgcolor == "" && $linkcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $linkcolor) >= 9.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(256, 0, 'body', 0, '', '_CNAME_256', '_ERR_256', '_DESC_256', NULL, NULL, '', '_HOWTOREPAIR_256', '_REPAIREXAMPLE_256', '', '', '', '_PROCEDURE_256', '_EXPECTEDRESULT_256', '_FAILEDRESULT_256', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$alinkcolor = BasicFunctions::getAttributeValue("alink");\r\n\r\nif ($bgcolor == "" && $alinkcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $alinkcolor) >= 9.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(257, 0, 'body', 0, '', '_CNAME_257', '_ERR_257', '_DESC_257', NULL, NULL, '', '_HOWTOREPAIR_257', '_REPAIREXAMPLE_257', '', '', '', '_PROCEDURE_257', '_EXPECTEDRESULT_257', '_FAILEDRESULT_257', '$bgcolor = BasicFunctions::getAttributeValue("bgcolor");\r\n$vlinkcolor = BasicFunctions::getAttributeValue("vlink");\r\n\r\nif ($bgcolor == "" && $vlinkcolor == "")\r\n   return true;\r\nelse\r\n   return (BasicFunctions::getLuminosityContrastRatio($bgcolor, $vlinkcolor) >= 9.99);', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(258, 0, 'applet', 2, '', '_CNAME_258', '_ERR_258', '_DESC_258', NULL, NULL, '', '', '', '_QUESTION_258', '_DECISIONPASS_258', '_DECISIONFAIL_258', '_PROCEDURE_258', '_EXPECTEDRESULT_258', '_FAILEDRESULT_258', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(259, 0, 'object', 2, '', '_CNAME_259', '_ERR_259', '_DESC_259', NULL, NULL, '', '', '', '_QUESTION_259', '_DECISIONPASS_259', '_DECISIONFAIL_259', '_PROCEDURE_259', '_EXPECTEDRESULT_259', '_FAILEDRESULT_259', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(260, 0, 'embed', 2, '', '_CNAME_260', '_ERR_260', '_DESC_260', NULL, NULL, '', '', '', '_QUESTION_260', '_DECISIONPASS_260', '_DECISIONFAIL_260', '_PROCEDURE_260', '_EXPECTEDRESULT_260', '_FAILEDRESULT_260', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(261, 0, 'body', 2, '', '_CNAME_261', '_ERR_261', '_DESC_261', NULL, NULL, '', '', '', '_QUESTION_261', '_DECISIONPASS_261', '_DECISIONFAIL_261', '_PROCEDURE_261', '_EXPECTEDRESULT_261', '_FAILEDRESULT_261', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(262, 0, 'body', 2, '', '_CNAME_262', '_ERR_262', '_DESC_262', NULL, NULL, '', '', '', '_QUESTION_262', '_DECISIONPASS_262', '_DECISIONFAIL_262', '_PROCEDURE_262', '_EXPECTEDRESULT_262', '_FAILEDRESULT_262', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(263, 0, 'frameset', 2, '', '_CNAME_263', '_ERR_263', '_DESC_263', NULL, NULL, '', '', '', '_QUESTION_263', '_DECISIONPASS_263', '_DECISIONFAIL_263', '_PROCEDURE_263', '_EXPECTEDRESULT_263', '_FAILEDRESULT_263', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(264, 0, 'input', 0, '_NOTE_264', '_CNAME_264', '_ERR_264', '_DESC_264', NULL, NULL, '', '_HOWTOREPAIR_264', '', '', '', '', '_PROCEDURE_264', '_EXPECTEDRESULT_264', '_FAILEDRESULT_264', 'return !(BasicFunctions::getAttributeValueInLowerCase("type")=="submit" && BasicFunctions::getAttributeValue("tabindex") == "");', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(265, 0, 'form', 2, '', '_CNAME_265', '_ERR_265', '_DESC_265', NULL, NULL, '', '', '', '_QUESTION_265', '_DECISIONPASS_265', '_DECISIONFAIL_265', '_PROCEDURE_265', '_EXPECTEDRESULT_265', '_FAILEDRESULT_265', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(266, 0, 'body', 2, '', '_CNAME_266', '_ERR_266', '_DESC_266', NULL, NULL, '', '', '', '_QUESTION_266', '_DECISIONPASS_266', '_DECISIONFAIL_266', '_PROCEDURE_266', '_EXPECTEDRESULT_266', '_FAILEDRESULT_266', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(267, 0, 'form', 2, '', '_CNAME_267', '_ERR_267', '_DESC_267', NULL, NULL, '', '', '', '_QUESTION_267', '_DECISIONPASS_267', '_DECISIONFAIL_267', '_PROCEDURE_267', '_EXPECTEDRESULT_267', '_FAILEDRESULT_267', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(268, 0, 'form', 2, '', '_CNAME_268', '_ERR_268', '_DESC_268', NULL, NULL, '', '', '', '_QUESTION_268', '_DECISIONPASS_268', '_DECISIONFAIL_268', '_PROCEDURE_268', '_EXPECTEDRESULT_268', '_FAILEDRESULT_268', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(269, 0, 'form', 2, '', '_CNAME_269', '_ERR_269', '_DESC_269', NULL, NULL, '', '', '', '_QUESTION_269', '_DECISIONPASS_269', '_DECISIONFAIL_269', '_PROCEDURE_269', '_EXPECTEDRESULT_269', '_FAILEDRESULT_269', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(270, 0, 'body', 2, '', '_CNAME_270', '_ERR_270', '_DESC_270', NULL, NULL, '', '', '', '_QUESTION_270', '_DECISIONPASS_270', '_DECISIONFAIL_270', '_PROCEDURE_270', '_EXPECTEDRESULT_270', '_FAILEDRESULT_270', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(271, 0, 'body', 2, '', '_CNAME_271', '_ERR_271', '_DESC_271', NULL, NULL, '', '', '', '_QUESTION_271', '_DECISIONPASS_271', '_DECISIONFAIL_271', '_PROCEDURE_271', '_EXPECTEDRESULT_271', '_FAILEDRESULT_271', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(272, 0, 'form', 2, '', '_CNAME_272', '_ERR_272', '_DESC_272', NULL, NULL, '', '', '', '_QUESTION_272', '_DECISIONPASS_272', '_DECISIONFAIL_272', '_PROCEDURE_272', '_EXPECTEDRESULT_272', '_FAILEDRESULT_272', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(273, 0, 'html', 0, '', '_CNAME_273', '_ERR_273', '_DESC_273', NULL, NULL, '', '_HOWTOREPAIR_273', '_REPAIREXAMPLE_273', '', '', '', '_PROCEDURE_273', '_EXPECTEDRESULT_273', '_FAILEDRESULT_273', 'return BasicFunctions::isValidRTL();', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(274, 0, 'all elements', 2, '', '_CNAME_274', '_ERR_274', '_DESC_274', NULL, NULL, '', '', '', '_QUESTION_274', '_DECISIONPASS_274', '_DECISIONFAIL_274', '_PROCEDURE_274', '_EXPECTEDRESULT_274', '_FAILEDRESULT_274', 'return !(BasicFunctions::hasAttribute("onmouseover") || \r\n         BasicFunctions::hasAttribute("onmouseout") || \r\n         BasicFunctions::hasAttribute("onfocus") || \r\n         BasicFunctions::hasAttribute("onblur") || \r\n         BasicFunctions::hasAttribute("onchange"));', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(275, 0, 'body', 2, '', '_CNAME_275', '_ERR_275', '_DESC_275', NULL, NULL, '', '', '', '_QUESTION_275', '_DECISIONPASS_275', '_DECISIONFAIL_275', '_PROCEDURE_275', '_EXPECTEDRESULT_275', '_FAILEDRESULT_275', 'return false;', 1, '0000-00-00 00:00:00');
INSERT INTO `checks` (`check_id`, `user_id`, `html_tag`, `confidence`, `note`, `name`, `err`, `description`, `search_str`, `long_description`, `rationale`, `how_to_repair`, `repair_example`, `question`, `decision_pass`, `decision_fail`, `test_procedure`, `test_expected_result`, `test_failed_result`, `func`, `open_to_public`, `create_date`) VALUES(276, 0, 'body', 2, '', '_CNAME_276', '_ERR_276', '_DESC_276', NULL, NULL, '', '', '', '_QUESTION_276', '_DECISIONPASS_276', '_DECISIONFAIL_276', '_PROCEDURE_276', '_EXPECTEDRESULT_276', '_FAILEDRESULT_276', 'return false;', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `check_examples`
--

CREATE TABLE IF NOT EXISTS `check_examples` (
  `check_example_id` mediumint(8) unsigned NOT NULL auto_increment,
  `check_id` mediumint(8) unsigned NOT NULL,
  `type` varchar(50) default NULL COMMENT 'Values: pass, fail',
  `description` text,
  `content` text COMMENT 'Example content',
  PRIMARY KEY  (`check_example_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=504 ;

--
-- Dumping data for table `check_examples`
--

INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(1, 1, '1', '<code>img</code> element with an <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>Testfile - Check #1 - Negative</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="A black and brown cat named Rex."/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(2, 1, '0', '<code>img</code> element without an <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #1 - Positive</title>\n</head>\n<body>\n<p><img src="rex.jpg"/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(3, 2, '1', 'Alt text is different from <code>src</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #2 - Negative</title>\r</head>\r<body>\r<img src="rex.jpg" alt="photo of rex the cat"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(4, 2, '0', 'Alt text is the same as <code>src</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #2 - Positive</title>\r</head>\r<body>\r<img src="rex.jpg" alt="rex.jpg"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(5, 3, '1', 'Alt text is shorter than 100 characters.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #3 - Negative</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="photo of rex the cat"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(6, 3, '0', 'Alt text is longer than 100 characters.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #3 - Positive</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="A picture of Rex the cat with some extra text. This is very long alt text. In fact, it was much much too long for this image. Sort alt text would be much better and this alt text should be shortened."/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(7, 4, '1', 'IMG is non-decorative and has valid Alt text.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #4 - Negative</title>\r</head>\r<body>\r<p>We would like to adopt another pet and are looking for one that is similar to what''s shown in the picture.</p>\r<img src="rex.jpg" alt="large brown and black cat named Rex" width="150" height="105"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(8, 4, '0', 'IMG is non-decorative but has empty Alt text.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #4 - Positive</title>\r</head>\r<body>\r<p>We would like to adopt another pet and are looking for one that is similar to what''s shown in the picture.</p>\r<img src="rex.jpg" alt="" width="150" height="105"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(9, 5, '1', '<code>img</code> element has whitespace Alt text but width and height are less than 25.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #5 - Negative</title>\r</head>\r<body>\r<img src="spacer.gif" alt="  " width="5" height="5"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(10, 5, '0', '<code>img</code> element has whitespace Alt text and width and height are both greater than 25.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #5 - Positive</title>\r</head>\r<body>\r<img src="rex.jpg" alt="  " width="150" height="105"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(11, 6, '1', '<code>img</code> has alt text that does not contain any placeholder text.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>OAC Testfile - Check #6 - Negative</title>\n</head>\n<body>\n<p><img src="rex.jpg" alt="Photo of a brown and black cat named Rex."/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(12, 6, '0', '<code>img</code> has alt text of ''spacer''.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>OAC Testfile - Check #6 - Positive</title>\n</head>\n<body>\n<p><img src="rex.jpg" alt="spacer" width="150" height="105"/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(13, 7, '1', '<code>img</code> is contained by A element, anchor has no other text and Alt text is not empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #7 - Negative</title>\r</head>\r<body>\r<p><a href="rex.html"><img src="rex.jpg" alt="a story about Rex the cat"/></a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(14, 7, '0', '<code>img</code> is contained by A element, anchor has no other text and Alt text is empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #7 - Positive</title>\r</head>\r<body>\r<p><a href="rex.html"><img src="rex.jpg" alt=""/></a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(15, 8, '1', 'Image is not fully described in Alt text but image has a <code>longdesc</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #8.2 - Negative</title>\r</head>\r<body>\r<p>The text in this document does not fully describe the image shown here but the image contains a longdesc attribute linking to a text file that does describe the image. <img src="chart.gif" alt="a complex chart" longdesc="chart.html"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(16, 8, '0', 'Image is not fully described in Alt text and a long description is not provided.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #8.1 - Positive</title>\r</head>\r<body>\r<p>The text in this document does not fully describe the complex image shown here.\r<img src="chart.gif" alt="a complex chart" /></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(17, 9, '1', '<code>img</code> with a <code>longdesc</code> and d-link.', '<?xml version="1.0" encoding="UTF-8"?>\r\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r\n<title>OAC Testfile - Check #9 - Positive</title>\r\n</head>\r\n<body>\r\n<p><img src="rex.jpg" alt="photo of Rex the cat" width="300" height="300" longdesc="rex.html" />\r\n<a href="rex.html">[d]</a></p>\r\n</body>\r\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(18, 9, '0', '<code>img</code> with <code>longdesc</code> but no d-link.', '<?xml version="1.0" encoding="UTF-8"?>\r\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r\n<title>OAC Testfile - Check #9 - Positive</title>\r\n</head>\r\n<body>\r\n<p><img src="rex.jpg" alt="photo of Rex the cat" width="300" height="300" longdesc="rex.html" /></p>\r\n</body>\r\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(19, 10, '1', 'Image does not flicker.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #10.2 - Negative</title>\r</head>\r<body>\r<img src="rex.gif" alt="A brown and black cat named Rex."/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(20, 10, '0', 'Image flickers.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #10.1 - Positive</title>\r</head>\r<body>\r<img src="eatatjoes.gif" alt="eat at Joes" width="200" height="200"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(21, 11, '1', 'Alt text has all text within image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #11 - Negative</title>\r</head>\r<body>\r<p><img src="http://www.freeiconsweb.com/Bookmark/su.png" alt="W3C Working Draft logo"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(22, 11, '0', 'Alt text does not contain all text in image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #11 - Positive</title>\r</head>\r<body>\r<p><img src="http://www.w3.org/2005/11/MWI-Icons/MWI-Picto.png" alt="logo" /></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(23, 12, '1', '<code>img</code> element contains both ISMAP and <code>usemap</code> attributes.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #12 - Negative</title>\r</head>\r<body>\r<p><img src="image.gif" alt="image map" ismap="ismap" usemap="#map1"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(24, 12, '0', '<code>img</code> element contains an <code>ismap</code> attribute but no <code>usemap</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #12 - Positive</title>\r</head>\r<body>\r<p><img src="image.gif" alt="image map" ismap="ismap" /></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(25, 13, '1', '<code>img</code> element has <code>usemap</code> and equivalent text links.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #13 - Negative</title>\r</head>\r<body>\r<p><map name="imagemap" id="map1">\r<area shape="poly" coords="185,0,355,0,295,123" href="horses.html" alt="horses"/>\r<area shape="poly" coords="336,202,549,203,549" href="dogs.html" alt="dogs"/>\r<area shape="rect" coords="0,10,172,10" href="birds.html" alt="birds"/>\r</map></p>\r\r<p><img src="navigation.gif" usemap="#imagemap" alt="navigation"/></p>\r\r<p><a href="horses.html">Horses</a> | <a href="dogs.html">Dogs</a> | <a href="birds.html">Birds</a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(26, 13, '0', '<code>img</code> element has <code>usemap</code> but is missing all text links.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #13 - Positive</title>\r</head>\r<body>\r<p><map name="imagemap" id="map1">\r<area shape="poly" coords="185,0,355,0,295,123" href="horses.html" alt="horses"/>\r<area shape="poly" coords="336,202,549,203,549" href="dogs.html" alt="dogs"/>\r<area shape="rect" coords="0,10,172,10" href="birds.html" alt="birds"/>\r</map></p>\r\r<p><img src="navigation.gif" usemap="#imagemap" alt="navigation"/></p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(27, 14, '1', 'Image is not referenced within document text by color alone.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #14.2 - Negative</title>\r</head>\r<body>\r<h1>Clayton''s Class</h1>\r\r<p>This is Clayton''s class photo from 2004. Clayton is third from the left wearing a red coat and no boots.</p>\r\r<p><img src="kids.jpg" alt="class photo showing 6 children"/></p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(28, 14, '0', 'Image is referenced by color alone.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #14.1 - Positive</title>\r</head>\r<body>\r<h1>Clayton''s Class</h1>\r\r<p>This is Clayton''s class photo from 2004. Clayton is the one wearing a red coat.</p>\r\r<p><img src="kids.jpg" alt="class photo showing 6 children"/></p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(29, 15, '1', 'Alt text for an image used as a link identifies the destination of the link.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #15 - Negative</title>\r</head>\r<body>\r<p><a href="routes.html"><img src="topo.gif" alt="Current routes at Boulders Climbing Gym" /></a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(30, 15, '0', 'Alt text for an image used as a link does not identify the destination of the link.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #15 - Positive</title>\r</head>\r<body>\r<p><a href="routes.html"><img src="topo.gif" alt="large rock with arrow" /></a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(31, 16, '1', 'Image is decorative and Alt text is an empty string ("").', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #16 - Negative</title>\r</head>\r<body>\r<p>My poem requires a big space<img src="10pttab.gif" alt="" width="5" height="5"/>here.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(32, 16, '0', 'Image is decorative and Alt text is not an empty string ("").', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #16 - Positive</title>\r</head>\r<body>\r<p>My poem requires a big space<img src="10pttab.gif" alt="big space" width="5" height="5"/>here.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(33, 17, '1', 'No link to sound file.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #17 - Positive</title>\r</head>\r<body>\r<p>\rRead the <a href="carol-text-dogs.txt">text transcript of Carol''s talk about dogs</a>.\r</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(34, 17, '0', 'Link to sound file (.wav) but no link to text transcript.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #17 - Positive</title>\r</head>\r<body>\r<p>\rListen to <a href="carol-talking.wav">Carol talking about dogs</a>.\r</p></body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(35, 18, '1', '<code>a</code> (anchor) element has target of "_self".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #18 - Negative</title>\r</head>\r<body>\r<a href="newwindow.html" target="_self">same window</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(36, 18, '0', '<code>a</code> (anchor) element has target of "_new".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #18 - Positive</title>\r</head>\r<body>\r<a href="newwindow.html" target="_new">new window</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(37, 19, '1', 'Link text is meaningful when read out of context.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #19 - Negative</title>\r</head>\r<body>\r<p>We have more information about <a href="dogs.html">dogs</a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(38, 19, '0', 'Link text is not meaningful when read out of context.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #19 - Positive</title>\r</head>\r<body>\r<p>We have more information <a href="dogs.html">about</a> dogs.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(39, 20, '1', 'No link to multimedia file', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #20 - Negative</title>\r</head>\r<body>\r<p>\r</p></body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(40, 20, '0', 'Link to multimedia file (.wav) without a text transcript.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #20 - Positive</title>\r</head>\r<body>\r<p>\rView <a href="movie.wmv">the movie</a>.\r</p></body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(41, 21, '1', 'Does not have an <code>applet</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #21.2 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(42, 21, '0', 'Contains an <code>applet</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #21.1 - Positive</title>\r</head>\r<body>\r<applet/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(43, 22, '1', '<code>applet</code> does not flicker.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #22.2 - Negative</title>\r</head>\r<body>\r<p>There is not a realy applet here yet. I''m looking for one that does not flicker.</p>\r<applet code="bubbles2.class"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(44, 22, '0', '<code>applet</code> flickers.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #22.1 - Positive</title>\r</head>\r<body>\r<p>There is not a realy applet here yet. I''m looking for one that flickers.</p>\r<applet code="bubbles.class"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(45, 23, '1', '<code>applet</code> has alt text that is equivalent to the <code>applet</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #23 - Negative</title>\r</head>\r<body>\r<applet alt="this is valid alt text for the applet"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(46, 23, '0', 'Contains an <code>applet</code> element with empty Alt text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #23 - Positive</title>\r</head>\r<body>\r<applet alt=""/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(47, 24, '1', 'Does not have an <code>applet</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #24 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(48, 24, '0', 'Contains an <code>applet</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #24 - Positive</title>\r</head>\r<body>\r<applet/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(49, 25, '1', '<code>applet</code> element contains a text equivalent.', '<html lang="en">\r<head>\r<title>ATRC Testfile - Check #25.2 - Negative</title>\r</head>\r<body>\r<applet code="Press.class" width="500" height="500"> \r	As temperature increases, the molecules in the balloon... \r</applet> \r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(50, 25, '0', '<code>applet</code> element does not contain a text equivalent.', '<html lang="en">\r<head>\r<title>ATRC Testfile - Check #25.1 - Positive</title>\r</head>\r<body>\r<applet code="Press.class" width="500" height="500"> \r</applet> \r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(51, 26, '1', 'Does not have an <code>applet</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #26 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(52, 26, '0', 'Contains an <code>applet</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #26 - Positive</title>\r</head>\r<body>\r<applet/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(53, 27, '1', 'Does not have a <code>blink</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #27.2 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(54, 27, '0', 'Contains a <code>blink</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #27.1 - Positive</title>\r</head>\r<body>\r<blink>blinks</blink>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(55, 28, '1', 'Has a "skip to content" link.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #28.2 - Negative</title>\n</head>\n<body>\n\n<p><a href="#content"><img src="spacer.gif" width="0" height="0" border="0" alt="skip to content" /></a></p>\n\n<p><img src="logo.jpg" width="50" height="50" alt="company logo" /></p>\n\n<ul class="navigation links">\n<li><a href="page1.html">front page</a></li>\n<li><a href="page2.html">products</a></li>\n<li><a href="page3.html">archives</a></li>\n<li><a href="page4.html">dogs</a></li>\n<li><a href="page5.html">cats</a></li>\n</ul>\n\n<a name="content"></a>\n<p >The main content of the document goes here. This is some example text.</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(56, 28, '0', 'Does not have a "skip to content" link.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #28.1 - Positive</title>\n</head>\n<body>\n\n<p><img src="logo.jpg" width="50" height="50" alt="company logo" /></p>\n\n<ul>\n<li><a href="page1.html">front page</a></li>\n<li><a href="page2.html">products</a></li>\n<li><a href="page3.html">archives</a></li>\n<li><a href="page4.html">dogs</a></li>\n<li><a href="page5.html">cats</a></li>\n</ul>\n\n<p>The main content of the document goes here. This is some example text.</p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(57, 29, '1', 'Does have a doctype declaration.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #29 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(58, 29, '0', 'Does not have a doctype declaration.', '<?xml version="1.0" encoding="UTF-8"?>\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #29 - Positive</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(59, 30, '1', '<code>object</code> does not flicker.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #30.2 - Negative</title>\r</head>\r<body>\r<p>There is not a real object here. I need an object that does not flicker.</p>\r<object/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(60, 30, '0', '<code>object</code> flickers.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #30.1 - Positive</title>\r</head>\r<body>\r<p>There is not a real object here. I need an object that flickers.</p>\r<object/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(61, 31, '1', '<code>frame</code> has a <code>title</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #31.2 - Negative</title>\r</head>\r\r<frameset >\r<frame src="birds.html" title="main content" />\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(62, 31, '0', '<code>frame</code> has no <code>title</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #31.1 - Positive</title>\r</head>\r\r<frameset >\r<frame src="birds.html"/>\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(63, 32, '1', '<code>frame</code> <code>title</code> describes the purpose or function of the <code>frame</code>.', '<html xmlns="http://www.w3.org/1999/xhtml">\r  <head>\r    <title>A simple frameset document</title>\r  </head>\r  <frameset cols="10%, 90%">\r    <frame src="nav.html" title="Navigation" />\r    <frame src="doc.html" title="Content" />\r    <noframes>\r      <body>\r        <a href="lib.html" title="Library link">Select to go to the electronic library</a>\r      </body>\r    </noframes>\r  </frameset>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(64, 32, '0', '<code>frame</code> <code>title</code> does not describe the purpose or function of the <code>frame</code>.', '<html xmlns="http://www.w3.org/1999/xhtml">\r  <head>\r    <title>A simple frameset document</title>\r  </head>\r  <frameset cols="10%, 90%">\r    <frame src="nav.html" title="title" />\r    <frame src="doc.html" title="title" />\r    <noframes>\r      <body>\r        <a href="lib.html" title="Library link">Select to go to the electronic library</a>\r      </body>\r    </noframes>\r  </frameset>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(65, 33, '1', '<code>frame</code> content accessible - image within HTML page', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #33 - Negative</title>\r</head>\r\r<frameset>\r  <frame src="rex.html" title="a frame with accessible content"/>\r</frameset>\r\r<!--\rThe file ''rex.html'' contains the HTML code:\r\r<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #33 - Negative</title>\r</head>\r<body>\r\r<p><img src="rex.jpg" alt="Photo of a brown and black cat named Rex."/></p>\r\r</body>\r</html>\r-->\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(66, 33, '0', '<code>frame</code> content not accessible - just image', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #33 - Positive</title>\r</head>\r\r<frameset>\r  <frame src="rex.jpg" title="a demo frame with poor content"/>\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(67, 34, '1', '<code>frameset</code> has 4 frames and a <code>longdesc</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #34 - Negative</title>\r</head>\r<body>\r\r<frameset longdesc="description.html">\r	<frame />\r	<frame />\r	<frame />\r	<frame />\r</frameset>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(68, 34, '0', '<code>frameset</code> has 4 frames and no <code>longdesc</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #34 - Positive</title>\r</head>\r<body>\r\r<frameset>\r	<frame />\r	<frame />\r	<frame />\r	<frame />\r</frameset>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(69, 35, '1', 'FRAMESET has NOFRAMES section.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #35 - Negative</title>\r</head>\r<body>\r\r<frameset>\r	<frame src="frame1.html"/>\r	<frame src="frame2.html"/>\r	<noframes>Content of the frames.</noframes>\r</frameset>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(70, 35, '0', 'FRAMESET missing NOFRAMES section.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #35 - Positive</title>\r</head>\r<body>\r\r<frameset>\r	<frame src="frame1.html"/>\r	<frame src="frame2.html"/>\r</frameset>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(71, 36, '1', 'NOFRAMES section is equivalent to FRAMES section.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #35 - Positive</title>\r</head>\r<body>\r\r<frameset>\r	<frame src="frame1.html"/>\r	<frame src="frame2.html"/>\r</frameset>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(72, 36, '0', 'NOFRAMES section is equivalent to FRAMES section.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #35 - Negative</title>\r</head>\r<body>\r\r<frameset>\r	<frame src="frame1.html"/>\r	<frame src="frame2.html"/>\r	<noframes>Content of the frames.</noframes>\r</frameset>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(73, 37, '1', '<code>h2</code> follows an <code>h1</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #37 - Negative</title>\r</head>\r<body>\r\r<h1>The First Heading</h1>\r<p>Here is some demo text.</p>\r<h2>The Second Heading</h2>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(74, 37, '0', '<code>h3</code> follows an <code>h1</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #37 - Positive</title>\r</head>\r<body>\r\r<h1>The First Heading</h1>\r<p>Here is some demo text.</p>\r<div><div><h3>The bad Heading</h3></div></div>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(75, 38, '1', '<code>h3</code> follows an <code>h2</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #38 - Negative</title>\r</head>\r<body>\r\r<h2>The First Heading</h2>\r<p>Here is some demo text.</p>\r<h3>This Heading Is OK</h3>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(76, 38, '0', '<code>h4</code> follows an <code>h2</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #38 - Positive</title>\r</head>\r<body>\r\r<h2>The First Heading</h2>\r<p>Here is some demo text.</p>\r<h4>The bad Heading</h4>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(77, 39, '1', '<code>h4</code> follows an <code>h3</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #39 - Negative</title>\r</head>\r<body>\r\r<h3>The First Heading</h3>\r<p>Here is some demo text.</p>\r<h4>This Heading Is OK</h4>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(78, 39, '0', '<code>h5</code> follows an <code>h3</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #39 - Positive</title>\r</head>\r<body>\r\r<h3>The First Heading</h3>\r<p>Here is some demo text.</p>\r<h5>The bad Heading</h5>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(79, 40, '1', '<code>h5</code> follows an <code>h4</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #40 - Negative</title>\r</head>\r<body>\r\r<h4>The First Heading</h4>\r<p>Here is some demo text.</p>\r<h5>This Heading Is OK</h5>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(80, 40, '0', '<code>h6</code> follows an <code>h4</code>', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #40 - Positive</title>\r</head>\r<body>\r\r<h4>The First Heading</h4>\r<p>Here is some demo text.</p>\r<h6>The bad Heading</h6>\r<p>Here is some more demo text.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(81, 41, '1', '<code>h6</code> follows an <code>h5</code>', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #41 - Negative</title>\r</head>\r<body>\r\r<h5>The First Heading</h5>\r\r<h6>The Second Heading</h6>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(82, 41, '0', '<code>h6</code> follows an <code>h4</code>', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #41 - Positive</title>\r</head>\r<body>\r\r<h4>The First Heading</h4>\r\r<h6>The Second Heading</h6>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(83, 42, '1', 'Header is not used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #42 - Negative</title>\r</head>\r<body>\r\r<h1>The First Heading</h1>\r\r<p>This is <strong>very important</strong> and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(84, 42, '0', 'Header is used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #42 - Positive</title>\r</head>\r<body>\r\r<p>This is</p> <h1>very important</h1> <p>and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(85, 43, '1', 'Header is not used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #43 - Negative</title>\r</head>\r<body>\r\r<p>This is <strong>very important</strong> and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(86, 43, '0', 'Header is used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #43 - Positive</title>\r</head>\r<body>\r\r<p>This is</p> <h2>very important</h2> <p>and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(87, 44, '1', 'Header is not used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #44 - Negative</title>\r</head>\r<body>\r\r<p>This is <strong>very important</strong> and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(88, 44, '0', 'Header is used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #44 - Positive</title>\r</head>\r<body>\r\r<p>This is</p> <h3>very important</h3> <p>and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(89, 45, '1', 'Header is not used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #45 - Negative</title>\r</head>\r<body>\r\r<p>This is <strong>very important</strong> and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(90, 45, '0', 'Header is used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #45 - Positive</title>\r</head>\r<body>\r\r<p>This is</p> <h4>very important</h4> <p>and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(91, 46, '1', 'Header is not used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #46 - Negative</title>\r</head>\r<body>\r\r<p>This is <strong>very important</strong> and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(92, 46, '0', 'Header is used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #46 - Positive</title>\r</head>\r<body>\r\r<p>This is</p> <h5>very important</h5> <p>and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(93, 47, '1', 'Header is not used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #47 - Negative</title>\r</head>\r<body>\r\r<p>This is <strong>very important</strong> and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(94, 47, '0', 'Header is used to format text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #47 - Positive</title>\r</head>\r<body>\r\r<p>This is</p> <h6>very important</h6> <p>and you should read it.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(95, 48, '1', '<code>html</code> element has a <code>lang</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #48 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(96, 48, '0', '<code>html</code> element missing a <code>lang</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title  xmlns="http://www.w3.org/1999/xhtml" >OAC Testfile - Check #49 - Positive</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(97, 49, '1', '<code>lang</code> attribute is valid.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #49 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(98, 49, '0', '<code>lang</code> attribute is not valid.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="language" lang="language">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #49 - Positive</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(99, 50, '1', '<code>title</code> element is present.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #50.2 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(100, 50, '0', '<code>title</code> element is missing.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(101, 51, '1', '<code>title</code> element has content.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #51 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(102, 51, '0', '<code>title</code> element is empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title></title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(103, 52, '1', '<code>title</code> element has valid length (less than 150 characters).', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #52 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(104, 52, '0', '<code>title</code> element is too long (greater than 150 characters).', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>This is a really really long title and maybe it should be shortened. In fact I think it really should be shortened. Yes, let''s all shorted the title so it''s more manageable for everyone.</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(105, 53, '1', '<code>title</code> element does not contain placeholder text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #53 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(106, 53, '0', '<code>title</code> element has placehoder text ''title''.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>title</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(107, 54, '1', '<code>title</code> describes the document', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>The History Of Birds</title>\r</head>\r<body>\r<h1>History Of Birds</h1>\r<p>This document contains the history of Birds.\rThe title of the document is appropriate.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(108, 54, '0', '<code>title</code> does not describe the document', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>New Page</title>\r</head>\r<body>\r<h1>History Of Birds</h1>\r<p>This document contains a history of birds.\rThe title of this document does not describe the contents of this document.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(109, 55, '1', 'Does not have an <code>input</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #55 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(110, 55, '0', 'Has <code>input</code> element', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #55 - Positive</title>\r</head>\r<body>\r<form>\r<label for="name">Name:</label> <input type="text" name="name" id="name"></form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(111, 57, '1', '<code>input</code> has associated label with matching <code>for</code> and <code>id</code>attributes.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #57 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="firstname">First name:</label> \r<input type="text" name="firstname" id="firstname" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(112, 57, '0', '<code>input</code> does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #57 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label>First name:</label> \r<input type="text" name="firstname" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(113, 58, '1', '<code>input</code> element, <code>type</code> of "image", has <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #58 - Negative</title>\r</head>\r<body>\r<form action="http://example.com/prog/text-read" method="post">\r<p><input type="image" name="submit" src="finddogs.gif" alt="Find Dogs" /></p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(114, 58, '0', '<code>input</code> element, <code>type</code> of "image", is missing <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #58 - Positive</title>\r</head>\r<body>\r<form action="http://example.com/prog/text-read" method="post">\r<p><input type="image" name="submit" src="finddogs.gif" /></p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(115, 59, '1', '<code>input</code> element, <code>type</code> of "image", has Alt text that identifies the purpose or function of the image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>ATRC Testfile - Check #59 - Negative</title>\r</head>\r<body>\r<form action="http://example.com" method="post">\r<p><input type="image" name="submit" src="rex.jpg" alt="search for cats" /></p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(116, 59, '0', '<code>input</code> element, <code>type</code> of "image", has Alt text that does not identify the purpose or function of the image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>ATRC Testfile - Check #59 - Positive</title>\r</head>\r<body>\r<form action="http://example.com" method="post">\r<p><input type="image" name="submit" src="rex.jpg" alt="A brown and black cat named Rex." /></p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(117, 60, '1', '<code>input</code> element, <code>type</code> of "image", has Alt text less than 100 characters.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #60 - Negative</title>\r</head>\r<body>\r<form>\r<label for="name">Name</label>: <br/><br/><input type="image" name="name" id="name" src="input.jpg" alt="name">\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(118, 60, '0', '<code>input</code> element, <code>type</code> of "image", has Alt text greater than 100 characters.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #60 - Positive</title>\r</head>\r<body>\r<form>\r<label for="name">Name</label>: <br/><br/><input type="image" name="name" id="name" src="name.jpg" alt="This is some very long alt text for the contro''s image. Your alt text should not be this long. Shorten the text to make it more accessible and more pleasant for all.">\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(119, 61, '1', '<code>input</code> <code>alt</code> attribute is different from the <code>src</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #61 - Negative</title>\r</head>\r<body>\r<form>\r<label for="name">Name</label>: <br/><br/><input type="image" name="name" id="name" src="input.jpg" alt="input name">\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(120, 61, '0', '<code>input</code> <code>alt</code> attribute is same as the <code>src</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #61 - Positive</title>\r</head>\r<body>\r<form>\r<label for="name">Name</label>: <br/><br/><input type="image" name="name" id="name" src="name.jpg" alt="name.jpg">\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(121, 62, '1', '<code>input</code> <code>alt</code> attribute is valid text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #62 - Negative</title>\r</head>\r<body>\r<form>\r<label for="name">Name</label>: <br/><br/><input type="image" name="name" id="name" src="input.jpg" alt="input name">\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(122, 62, '0', '<code>input</code> <code>alt</code> attribute is "image".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #62 - Positive</title>\r</head>\r<body>\r<form>\r<label for="name">Name</label>: <br/><br/><input type="image" name="name" id="name" src="name.jpg" alt="image">\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(123, 63, '1', '<code>input</code> element, <code>type</code> of text, contains default text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #63 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<label for="name">Name</label>: <input type="text" name="name" id="name" value="your name here">\r<input type="submit" value="Send"></form>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(124, 63, '0', '<code>input</code> element, <code>type</code> of text, missing default text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #63 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<label for="name">Name</label>: <input type="text" name="name" id="name">\r<input type="submit" value="Send"></form>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(125, 64, '1', '<code>area</code> element has <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #64 - Negative</title>\r</head>\r<body>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,30,30" href="reference.html" alt="reference section"/>\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(126, 64, '0', '<code>area</code> element missing <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #64 - Positive</title>\r</head>\r<body>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,30,30" href="reference.html" />\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(127, 65, '1', 'Alt text identifies the link destination.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #65 - Negative</title>\r</head>\r<body>\r<p><img src="library.gif" usemap="#map1" alt="Image map of areas in the library" /> </p>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,50,50" href="reference.html" alt="reference section"/>\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(128, 65, '0', 'Alt text does not identify the link destination.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #65 - Positive</title>\r</head>\r<body>\r<p><img src="library.gif" usemap="#map1" alt="Image map of areas in the library" /> </p>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,50,50" href="reference.html" alt="drawing of a blue book"/>\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(129, 66, '1', '<code>area</code> has link to sound file (.mp3) and has a text equivalent link.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #66 - Negative</title>\r</head>\r<body>\r<p><img src="welcome.gif" usemap="#map1"  alt="Image map of areas in the library" /></p>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,80,30" href="reference.html" alt="Reference" />\r<area shape="rect" coords="0,35,110,100" href="avlab.mp3" alt="Audio Visual Lab" />\r</map></p>\r<p><a href="avlab.txt">Audio Visual Lab Text Transcript</a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(130, 66, '0', '<code>area</code> has link to sound file (.mp3) but no text equivalent link.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #66 - Positive</title>\r</head>\r<body>\r<p><img src="welcome.gif" usemap="#map1"  alt="Image map of areas in the library" /></p>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,80,30" href="reference.html" alt="Reference" />\r<area shape="rect" coords="0,35,110,100" href="avlab.mp3" alt="Audio Visual Lab" />\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(131, 68, '1', '<code>area</code> has target of "_self".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #68 - Negative</title>\r</head>\r<body>\r<map id="map1" name="map1">\r  <area shape="rect" coords="0,0,30,30" href="reference.html" alt="reference section" target="_self"/>\r</map></body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(132, 68, '0', '<code>area</code> has target of new window.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #68 - Positive</title>\r</head>\r<body>\r<map id="map1" name="map1">\r  <area shape="rect" coords="0,0,30,30" href="reference.html" alt="hello" target="new window"/>\r</map></body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(133, 69, '1', 'Does not contain <code>marquee</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #69 - Negative</title>\r</head>\r<body>\r<p>There is no marquee text in this document.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(134, 69, '0', 'Contains <code>marquee</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #69 - Positive</title>\r</head>\r<body>\r<p><marquee>this is marquee text</marquee></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(135, 71, '1', 'Does not contain auto-redirect.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #71 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(136, 71, '0', 'Contains auto-redirect.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #71 - Positive</title>\r<meta  http-equiv="refresh" content="http://www.foo.com/bar.html" />\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(137, 72, '1', 'meta refresh used with a timeout of zero', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>ATRC Testfile - Check #72.2 - Negative</title>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<meta  http-equiv="refresh" content="0; url=http://test.com" />\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(138, 72, '0', 'meta refresh used with a timeout', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>ATRC Testfile - Check #72.1 - Positive</title>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<meta  http-equiv="refresh" content="30; url=http://test.com" />\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(139, 73, '1', '<code>object</code> element not used', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #74 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(140, 73, '0', '<code>object</code> element used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #73 - Positive</title>\r</head>\r<body>\r<object/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(141, 74, '1', '<code>object</code> element not used', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #74 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(142, 74, '0', '<code>object</code> element used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #74 - Positive</title>\r</head>\r<body>\r<object codebase="hello"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(143, 75, '1', '<code>object</code> element not used', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #75 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(144, 75, '0', '<code>object</code> element used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #75 - Positive</title>\r</head>\r<body>\r<object codebase="hello"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(145, 76, '1', '<code>object</code> element not used', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #76 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(146, 76, '0', '<code>object</code> element used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #76 - Positive</title>\r</head>\r<body>\r<object codebase="hello"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(147, 77, '1', '<code>object</code> element not used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #77 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(148, 77, '0', '<code>object</code> element has <code>type</code> attribute value of "video".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #77 - Positive</title>\r</head>\r<body>\r<object type="video"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(149, 78, '1', '<code>object</code> element has <code>title</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #78 - Positive</title>\r</head>\r<body>\r<object classid="http://www.miamachina.it/analogclock.py" title="a clock object">\rThe text equivalent for the object should go here.\r</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(150, 78, '0', '<code>object</code> element missing <code>title</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #78 - Positive</title>\r</head>\r<body>\r<object classid="http://www.miamachina.it/analogclock.py">\rThe text equivalent for the object should go here.\r</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(151, 79, '1', '<code>object</code> with valid <code>title</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #79 - Positive</title>\r</head>\r<body>\r<object classid="http://www.miamachina.it/analogclock.py" title="a clock object">\rThe text equivalent for the object should go here.\r</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(152, 79, '0', '<code>object</code> with empty <code>title</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #79 - Positive</title>\r</head>\r<body>\r<object classid="http://www.miamachina.it/analogclock.py" title="">\rThe text equivalent for the object should go here.\r</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(153, 80, '1', 'Contains text equivalent.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #80 - Positive</title>\r</head>\r<body>\r<object classid="http://www.miamachina.it/analogclock.py" title="a clock object">\rHere is some text that describes the object and its operation.\r</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(154, 80, '0', 'No alternate content.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #80 - Positive</title>\r</head>\r<body>\r<object classid="http://www.miamachina.it/analogclock.py" title="a clock object">\r</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(155, 81, '1', 'List with two items.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #81 - Negative</title>\r</head>\r<body>\r\r<ol>\r<li>Item text 1</li>\r<li>Item text 2</li>\r</ol>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(156, 81, '0', 'List with only one item.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #81 - Positive</title>\r</head>\r<body>\r\r<ol>\r<li>Item text</li>\r</ol>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(157, 82, '1', 'Paragraph with unmarked text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #82 - Negative</title>\r</head>\r<body>\r<p>This is a regular paragraph</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(158, 82, '0', 'Paragraph with all text marked as "strong".', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #82 - Positive</title>\r</head>\r<body>\r<p><strong>Looks like a header</strong></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(159, 86, '1', 'Does not contain a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #86 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(160, 86, '0', 'Contains a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #86 - Positive</title>\r</head>\r<body>\r<script/>\r<noscript>Alternate content for script</noscript>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(161, 87, '1', 'Does not contain a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #87 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(162, 87, '0', 'Contains a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #87 - Positive</title>\r</head>\r<body>\r<script/>\r<noscript>Alternate content for script</noscript>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(163, 88, '1', 'Does not contain a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #88 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(164, 88, '0', 'Contains a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #88 - Positive</title>\r</head>\r<body>\r<script/>\r<noscript>Alternate content for script</noscript>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(165, 89, '1', 'Does not contain a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #88 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(166, 89, '0', 'Contains a <code>script</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #89 - Positive</title>\r</head>\r<body>\r<script/>\r<noscript>Alternate content for script</noscript>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(167, 90, '1', 'Contains both <code>script</code> and <code>noscript</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #90 - Negative</title>\r</head>\r<body>\r<script>\r</script>\r<noscript>Alternate content for script</noscript>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(168, 90, '0', 'Contains a <code>script</code> element without a <code>noscript</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #90 - Positive</title>\r</head>\r<body>\r<script/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(169, 91, '1', '<code>select</code> element has an associated label using <code>label</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 91.2 - Negative</title>\r</head>\r<body>\r<form method="post" action="http://www.test.com">\r<p>\r<label for="animal">Animal:</label>\r<select name="abcselect" id="animal">\r<option value="1">dog</option>\r<option value="2">cat</option>\r<option value="3">bird</option>\r</select>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(170, 91, '0', '<code>select</code> element does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 91.1 - Positive</title>\r</head>\r<body>\r<form method="post" action="http://www.test.com">\r<p>\r<label>Animal:</label>\r<select name="abcselect" id="animal">\r<option value="1">dog</option>\r<option value="2">cat</option>\r<option value="3">bird</option>\r</select>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(171, 92, '1', '<code>select</code> element''s <code>onchange</code> attribute does not cause extreme change of context.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #92 - Negative</title>\r</head>\r<body>\r\r<form action="http://www.example.com/test" method="post">\r<p>\r<label for="select1">Pick A Number:</label> <select name="abcselect" id="select1" >\r<option value="1">1</option>\r<option value="2">2</option>\r<option value="3">3</option>\r</select>\r<br/><input type="submit" value="select number"/>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(172, 92, '0', '<code>select</code> element''s <code>onchange</code> attribute causes extreme change of context.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #92 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.example.com/test" method="post">\r<p>\r<label for="select1">Pick A Number:</label> <select name="abcselect" id="select1" onchange="form.submit();">\r<option value="1">1</option>\r<option value="2">2</option>\r<option value="3">3</option>\r</select>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(173, 94, '1', 'Does not contain a SCRIPT element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #94 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(174, 94, '0', 'Contains a SCRIPT element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #94 - Positive</title>\r</head>\r<body>\r<script/>\r<noscript>Alternate content for script</noscript>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(175, 95, '1', '<code>textarea</code> element has an associated label using <code>label</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #95.2 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.test.com/testing" method="post">\r<label for="text1">Comments:</label>\r<textarea name="nametext" id="text1" rows="5" cols="40">\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(176, 95, '0', '<code>textarea</code> element does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #95.1 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.test.com/testing" method="post">\r<label>Comments:</label>\r<textarea name="nametext" id="text1" rows="5" cols="40">\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(177, 96, '1', 'Label is close to <code>textarea</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #96.2 - Negative</title>\n</head>\n<body>\n<form action="http://www.example.com" method="post">\n<table>\n<tr><td>first name:</td><td><input type="text" /></td></tr>\n<tr><td>last name:</td><td><input type="text" /></td></tr>\n<tr><td>comment:</td><td align="right"><textarea rows="3" cols="20" ></textarea></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(178, 96, '0', 'Label is not close to <code>textarea</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #96.1 - Positive</title>\n</head>\n<body>\n<form action="http://www.example.com" method="post">\n<table width="100%">\n<tr><td>first name:</td><td align="right"><input type="text" /></td></tr>\n<tr><td>last name:</td><td align="right"><input type="text" /></td></tr>\n<tr><td>comment:</td><td align="right"><textarea rows="3" cols="20" ></textarea></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" ></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(179, 97, '1', '<code>link</code> element does not have <code>rel</code> attribute with value of "stylesheet".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #97 - Negative</title>\r<link href="docB" rel="foo">\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(180, 97, '0', '<code>link</code> element has <code>rel</code> attribute with value of "stylesheet".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #97 - Positive</title>\r<link href="docB" rel="stylesheet">\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(181, 98, '1', '<code>body</code> text is less than 10 characters.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #98 - Positive</title>\r</head>\r<body>\r<p>hello</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(182, 98, '0', '<code>body</code> has text with unmarked abbreviation.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #98 - Positive</title>\r</head>\r<body>\r<p>Come visit the ATRC.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(183, 99, '1', '<code>body</code> has less than 10 characters', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #99 - Negative</title>\r</head>\r<body>\r<p>Hi</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(184, 99, '0', '<code>body</code> has more than 10 characters', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #99 - Positive</title>\r</head>\r<body>\r<p>Come visit the ATRC.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(185, 100, '1', '<code>blockquote</code> has <code>cite</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #100 - Negative</title>\r</head>\r<body>\r<blockquote cite="Pierre Elliot Trudeau, Hansard">If I have any sins to confess, I will tell them to my priest.</blockquote>.\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(186, 100, '0', '<code>blockquote</code> does not have <code>cite</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #100 - Positive</title>\r</head>\r<body>\r<blockquote>If I have any sins to confess, I will tell them to my priest.</blockquote>.\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(187, 102, '1', 'Contains an element that has an <code>onclick</code> attribute and an <code>onkeypress</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #102 - Negative</title>\r</head>\r<body>\r\r<INPUT name="num" onclick="foo" onkeypress="bar" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(188, 102, '0', 'Contains an element that has an <code>onclick</code> attribute without an <code>onkeypress</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #102 - Positive</title>\r</head>\r<body>\r\r<INPUT name="num" onclick="foo" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(189, 103, '1', 'Contains an element that has an <code>ondblclick</code> attribute with keyboard equivalents.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #103 - Negative</title>\r</head>\r<body>\r\r<INPUT name="num" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(190, 103, '0', 'Contains an element that has an <code>ondblclick</code> attribute without keyboard equivalents.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #103 - Positive</title>\r</head>\r<body>\r\r<INPUT name="num" ondblclick="bar" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(191, 104, '1', 'Contains an element that has an <code>onmousedown</code> attribute and an <code>onkeydown</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #104.2 - Negative</title>\r</head>\r<body>\r\r<input name="num" onmousedown="foo" onkeydown="bar" value="0"/>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(192, 104, '0', 'Contains an element that has an <code>onmousedown</code> attribute without an <code>onkeydown</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #104.1 - Positive</title>\r</head>\r<body>\r\r<input name="num" onmousedown="foo"  value="0"/>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(193, 105, '1', 'Contains an element that has an <code>onmousemove</code> attribute with keyboard equivalents.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #105 - Negative</title>\r</head>\r<body>\r\r<INPUT name="num" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(194, 105, '0', 'Contains an element that has an <code>onmousemove</code> attribute without keyboard equivalents.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #105 - Positive</title>\r</head>\r<body>\r\r<INPUT name="num" onmousemove="bar" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(195, 106, '1', 'Contains an element that has an <code>onmouseout</code> attribute and an <code>onblur</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #106 - Negative</title>\r</head>\r<body>\r\r<INPUT name="num" onmouseout="foo" onblur="bar" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(196, 106, '0', 'Contains an element that has an <code>onmouseout</code> attribute without an <code>onblur</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #106 - Positive</title>\r</head>\r<body>\r\r<INPUT name="num" onmouseout="foo" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(197, 107, '1', 'Contains an element that has an <code>onmouseover</code> attribute and an <code>onfocus</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #107 - Negative</title>\r</head>\r<body>\r\r<INPUT name="num" onmouseover="foo" onfocus="bar" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(198, 107, '0', 'Contains an element that has an <code>onmouseover</code> attribute without an <code>onfocus</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #107 - Positive</title>\r</head>\r<body>\r\r<INPUT name="num" onmouseover="foo" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(199, 108, '1', 'Contains an element that has an <code>onmouseup</code> attribute and an <code>onkeyup</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #108 - Negative</title>\r</head>\r<body>\r\r<INPUT name="num" onmouseup="foo" onkeyup="bar" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(200, 108, '0', 'Contains an element that has an <code>onmouseup</code> attribute without an <code>onkeyup</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #108 - Positive</title>\r</head>\r<body>\r\r<INPUT name="num" onmouseup="foo" value="0">\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(201, 109, '1', 'Contains no elements with <code>style</code> attributes.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #109 - Negative</title>\r</head>\r<body>\r\r<p>Hello.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(202, 109, '0', 'Contains an element that has a <code>style</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #109 - Positive</title>\r</head>\r<body>\r\r<p style="font-size: 12pt; color: fuchsia">Hello.</p>\r\r<p style="font-size: 12pt; color: fuchsia">Bye.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(203, 110, '1', 'Document contains words outside the primary language but they are marked as such.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #110 - Positive</title>\r</head>\r<body>\r<P>And with a certain <SPAN lang="fr">je ne sais quoi</SPAN>, she entered both the room, and his life, forever. </p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(204, 110, '0', 'Document contains words outside the primary language.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #110 - Positive</title>\r</head>\r<body>\r<P>And with a certain je ne sais quoi, she entered both the room, and his life, forever. </p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(205, 111, '1', 'Complex data table with a <code>summary</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #111-2 - Negative</title>\r</head>\r<body>\r\r<table border="1" summary="Schedule for Route 7 going downtown. Service begins \rat 4:00 AM and ends at midnight. Intersections are listed in the top row. \rFind the intersection closest to your starting point or destination, then read \rdown that column to find out what time the bus leaves that intersection.">\r<tr>\r<th scope="col">State & First</th>\r<th scope="col">State & Sixth</th>\r<th scope="col">State & Fifteenth</th>\r<th scope="col">Fifteenth & Morrison</th>\r</tr>\r<td>4:00</td>\r<td>4:05</td>\r<td>4:11</td>\r<td>4:19</td>\r</tr>\r</tr>\r<td>5:00</td>\r<td>5:05</td>\r<td>5:11</td>\r<td>5:19</td>\r</tr>\r</tr>\r<td>6:00</td>\r<td>6:05</td>\r<td>6:11</td>\r<td>6:19</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(206, 111, '0', 'Complex data table without a <code>summary</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #111.1 - Positive</title>\r</head>\r<body>\r\r<table border="1">\r<tr>\r<th scope="col">State & First</th>\r<th scope="col">State & Sixth</th>\r<th scope="col">State & Fifteenth</th>\r<th scope="col">Fifteenth & Morrison</th>\r</tr>\r<td>4:00</td>\r<td>4:05</td>\r<td>4:11</td>\r<td>4:19</td>\r</tr>\r</tr>\r<td>5:00</td>\r<td>5:05</td>\r<td>5:11</td>\r<td>5:19</td>\r</tr>\r</tr>\r<td>6:00</td>\r<td>6:05</td>\r<td>6:11</td>\r<td>6:19</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(207, 112, '1', 'Data <code>table</code> with a valid <code>summary</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #112-2 - Negative</title>\r</head>\r<body>\r\r<table border="1" summary="This table shows the number of cups of coffee consumed by each senator, the type of coffee (decaf or regular), and whether taken with sugar.">\r\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(208, 112, '0', 'Data <code>table</code> with an empty <code>summary</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #112-1 - Positive</title>\r</head>\r<body>\r\r<table border="1" summary="">\r\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(209, 113, '1', 'Data <code>table</code> with valid <code>summary</code> (greater than 10 characters).', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #113-2 - Positive</title>\r</head>\r<body>\r\r<table border="1" summary="This table shows the number of cups of coffee consumed by each senator, the type of coffee (decaf or regular), and whether taken with sugar.">\r\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(210, 113, '0', 'Data <code>table</code> with short <code>summary</code> (less than 10 characters).', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #113-1 - Positive</title>\r</head>\r<body>\r\r<table border="1" summary="coffee">\r\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(211, 114, '1', 'Layout <code>table</code> with empty <code>summary</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #114-2 - Negative</title>\r</head>\r<body>\r\r<table border="0" cellpadding="5" summary="">\r<tr>\r<td>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>\r<td>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(212, 114, '0', 'Layout <code>table</code> with <code>summary</code> text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #114-1 - Positive</title>\r</head>\r<body>\r\r<table border="0" cellpadding="5" summary="this table is used to create 2 columns of text">\r<tr>\r<td>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>\r<td>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(213, 115, '1', 'Layout table without <code>caption</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #115-2 - Negative</title>\r</head>\r<body>\r\r<table border="0" cellpadding="5">\r<tr>\r<td>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>\r<td>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(214, 115, '0', 'Layout table with <code>caption</code>.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #115-1 - Positive</title>\r</head>\r<body>\r\r<table border="0" cellpadding="5"><caption>Latin And English Text</caption>\r<tr>\r<td>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>\r<td>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(215, 116, '1', 'No <code>b</code> elements used.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #116 - Negative</title>\r</head>\r<body>\r<p>What she <em>really</em> meant to say was, "This isn''t ok, it is <strong>excellent</strong>!"</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(216, 116, '0', '<code>b</code> element used.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #116 - Positive</title>\r</head>\r<body>\r<p>What she <bold>really</bold> meant to say was, "This isn''t ok, it is <bold>excellent</bold>!"</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(217, 117, '1', 'No <code>i</code> (italic) elements used.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #117 - Negative</title>\r</head>\r<body>\r<p>What she <em>really</em> meant to say was, "This isn''t ok, it is <strong>excellent</strong>!"</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(218, 117, '0', '<code>i</code> (italic) element used.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #117 - Positive</title>\r</head>\r<body>\r<p>What she <i>really</i> meant to say was, "This isn''t ok, it is <i>excellent</i>!"</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(219, 118, '1', '<code>input</code> element has an associated label using <code>label</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #118 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="pass">Password:</label> \r<input type="password" id="pass" name="login-password" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(220, 118, '0', '<code>input</code> element does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #118 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label>Password:</label> \r<input type="password" name="login-password" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(221, 119, '1', '<code>input</code> element has an associated label using <code>label</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #119 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="catbox">Cats</label> \r<input type="checkbox" id="catbox" name="cats" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(222, 119, '0', '<code>input</code> element, <code>type</code> of "checkbox", does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #119 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label>Cats</label> \r<input type="checkbox" name="cats" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(223, 120, '1', '<code>input</code> element has an associated label using <code>label</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #120 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="thefile">Your file:</label> \r<input type="file" id="thefile" name="data" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(224, 120, '0', '<code>input</code> element does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #120 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label>Your file:</label> \r<input type="file" name="data" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(225, 121, '1', '<code>input</code> element has an associated label using <code>label</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #121 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="dogradio">Dogs:</label> \r<input type="radio" id="dogradio" name="choice1" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(226, 121, '0', '<code>input</code> element does not have associated label.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #121 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label>Dogs:</label> \r<input type="radio" name="choice1" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(227, 122, '1', 'Label is close to password control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #122.2 - Negative</title>\n</head>\n<body>\n<p>Please enter your password below:</p>\n<form action="http://www.example.com" method="post">\n<table>\n<tr><td>password:</td><td><input type="password" /></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(228, 122, '0', 'Label is not close to password control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #122.1 - Positive</title>\n</head>\n<body>\n<p>Please enter your password below:</p>\n<form action="http://www.example.com" method="post">\n<table width="100%">\n<tr><td>password:</td><td align="right"><input type="password" /></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(229, 123, '1', 'Label is close to checkbox control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #123.2 - Negative</title>\n</head>\n<body>\n<p>Select your animals using the form below:</p>\n<form action="http://www.example.com" method="post">\n<table>\n<tr><td><input type="checkbox" /></td><td>dog</td></tr>\n<tr><td><input type="checkbox" /></td><td>cat</td></tr>\n<tr><td><input type="checkbox" /></td><td>polar bear</td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(230, 123, '0', 'Label is not close to checkbox control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #123.1 - Positive</title>\n</head>\n<body>\n<p>Select your animals using the form below:</p>\n<form action="http://www.example.com" method="post">\n<table width="100%">\n<tr><td><input type="checkbox" /></td><td align="right">dog</td></tr>\n<tr><td><input type="checkbox" /></td><td align="right">cat</td></tr>\n<tr><td><input type="checkbox" /></td><td align="right">polar bear</td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(231, 124, '1', 'Label is close to file control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #124.2 - Negative</title>\n</head>\n<body>\n<p>Please upload your file using the form below:</p>\n<form action="http://www.example.com" method="post">\n<table>\n<tr><td>file:</td><td><input type="file" /></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(232, 124, '0', 'Label is not close to file control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #124.1 - Positive</title>\n</head>\n<body>\n<p>Please upload your file using the form below:</p>\n<form action="http://www.example.com" method="post">\n<table width="100%">\n<tr><td>file:</td><td align="right"><input type="file" /></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(233, 125, '1', 'Label is close to radio button control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #125.2 - Negative</title>\n</head>\n<body>\n<p>Select your favourite animal using the form below:</p>\n<form action="http://www.example.com" method="post">\n<table>\n<tr><td><input type="radio" /></td><td>dog</td></tr>\n<tr><td><input type="radio" /></td><td>cat</td></tr>\n<tr><td><input type="radio" /></td><td>polar bear</td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(234, 125, '0', 'Label is not close to radio button control.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #125.1 - Positive</title>\n</head>\n<body>\n<p>Select your favourite animal using the form below:</p>\n<form action="http://www.example.com" method="post">\n<table width="100%">\n<tr><td><input type="radio" /></td><td align="right">dog</td></tr>\n<tr><td><input type="radio" /></td><td align="right">cat</td></tr>\n<tr><td><input type="radio" /></td><td align="right">polar bear</td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(235, 126, '1', '<code>input</code> element with default text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #126 - Negative</title>\r</head>\r<body>\r<label for="name">Name:</label> <input type="text" name="name" id="name" value="your name"></form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(236, 126, '0', '<code>input</code> element does not have default text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #126 - Positive</title>\r</head>\r<body>\r<form>\r<label for="name">Name:</label> <input type="text" name="name" id="name"></form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(237, 127, '1', 'Contains an <code>object</code> element with a valid CLASS<code>id</code> attribute but contains no text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #127 - Negative</title>\r</head>\r<body>\r<object classid="foo"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(238, 127, '0', 'Contains an <code>object</code> element with a valid CLASS<code>id</code> attribute and contains text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #127 - Positive</title>\r</head>\r<body>\r<object classid="foo">text equiv for object</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(239, 128, '1', 'Contains an <code>object</code> element with a valid CLASS<code>id</code> attribute but contains no text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #128 - Negative</title>\r</head>\r<body>\r<object classid="foo"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(240, 128, '0', 'Contains an <code>object</code> element with a valid CLASS<code>id</code> attribute and contains text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #128 - Positive</title>\r</head>\r<body>\r<object classid="foo">text equiv for object</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(241, 129, '1', 'Contains an <code>object</code> element with a valid CLASS<code>id</code> attribute but contains no text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #129 - Negative</title>\r</head>\r<body>\r<object classid="foo"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(242, 129, '0', 'Contains an <code>object</code> element with a valid CLASS<code>id</code> attribute and contains text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #129 - Positive</title>\r</head>\r<body>\r<object classid="foo">text equiv for object</object>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(243, 131, '1', 'Body does not contain text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #131 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(244, 131, '0', 'Body contains text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #131 - Positive</title>\r</head>\r<body>\r<p>It was a dark and stormy night.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(245, 132, '1', 'Image contains <code>ismap</code> attribute with duplicate text links.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #132 - Negative</title>\r</head>\r<body>\r<p><img src="map.gif" ismap alt="map of the country"/></p>\r<p><a href="eastcoast.html">East Coast</a> | <a href="central.html">Central</a> | <a href="westcoast.html">West Coast</a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(246, 132, '0', 'Image contains <code>ismap</code> attribute without duplicate text links.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #132 - Positive</title>\r</head>\r<body>\r<p><img src="map.gif" ismap alt="map of the country"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(247, 133, '1', 'Layout <code>table</code> makes sense when linearized.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #133.2 - Negative</title>\r</head>\r<body>\r\r<table>\r<tr>\r  <td colspan="2"><img src="logo.gif" alt="XYZ mountaineering"/></td>\r</tr>\r<tr>\r  <td>XYZ gets you to the</td>\r  <td>top!</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(248, 133, '0', 'layout <code>table</code> does not make sense when linearized.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #133.1 - Positive</title>\r</head>\r<body>\r\r<table>\r<tr>\r  <td><img src="logo.gif" alt="XYZ mountaineering"/></td>\r  <td>top!</td>\r</tr>\r<tr>\r  <td colspan="2">XYZ gets you to the</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(249, 134, '1', 'Adjacent links with separator characters.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #134 - Negative</title>\r</head>\r<body>\r<a href="dogs">dogs</a> | <a href="cats">cats</a> | <a href="birds">birds</a> | <a href="snakes">snakes</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(250, 134, '0', 'Adjacent links that do not contain separator characters.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #134 - Positive</title>\r</head>\r<body>\r<a href="dogs">dogs</a> <a href="cats">cats</a> <a href="birds">birds</a> <a href="snakes">snakes</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(251, 135, '1', 'Image contains math and document has MathML.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 plus MathML 2.0//EN" "http://www.w3.org/TR/MathML2/dtd/xhtml-math11-f.dtd" [\r  <!ENTITY mathml "http://www.w3.org/1998/Math/MathML"> ]>\r\n<html lang="en">\r\n	<head>\r\n		<title>Testfile - Check #135 - Negative</title>\r\n	</head>\r\n	<body>\r\n		<p>The following image shows the solution to the quadratic equation: begin fraction minus b plus or \r\n			minus begin square root of b squared minus four a c end square root over 2 a \r\n			end fraction</p>\r\n		<img src="quadeqn.png" alt="solution to the quadratic equation" width="179" height="63">\r\n		<math xmlns=''http://www.w3.org/1998/Math/MathML''>\r\n			<mfrac>\r\n				<mrow>\r\n					<mrow>\r\n						<mo>-</mo>\r\n						<mi>b</mi>\r\n					</mrow>\r\n					<mo>&pm;</mo>\r\n					<msqrt>\r\n						<mrow>\r\n							<msup>\r\n								<mi>b</mi>\r\n								<mn>2</mn>\r\n							</msup>\r\n							<mo>-</mo>\r\n							<mrow>\r\n								<mn>4</mn>\r\n								<mo>&it;</mo>\r\n								<mi>a</mi>\r\n								<mo>&it;</mo>\r\n								<mi>c</mi>\r\n							</mrow>\r\n						</mrow>\r\n					</msqrt>\r\n				</mrow>\r\n				<mrow>\r\n					<mn>2</mn>\r\n					<mo>&it;</mo>\r\n					<mi>a</mi>\r\n				</mrow>\r\n			</mfrac>\r\n		</math>\r\n	</body>\r\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(252, 135, '0', 'Image contains math but document has no MathML.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r\n<html lang="en">\r\n	<head>\r\n		<title>Testfile - Check #135 - Positive</title>\r\n	</head>\r\n	<body>\r\n		<p>The following image shows the solution to the quadratic equation: begin fraction minus b plus or minus begin square root of b squared minus four a c end square root over 2 a end fraction</p>\r\n\r\n		<img src="quadeqn.png" alt="solution to the quadratic equation" width="179" height="63">\r\n	</body>\r\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(253, 136, '1', 'Data <code>table</code> with <code>th</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #136-2 - Negative</title>\r</head>\r<body>\r\r<table border="1">\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(254, 136, '0', 'Data <code>table</code> without <code>th</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #136-1 - Positive</title>\r</head>\r<body>\r\r<table border="1">\r<tr><td>name</td><td>number of cups</td><td>type</td><td>with sugar</td></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(255, 137, '1', 'Layout <code>table</code> without <code>th</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #114-1 - Positive</title>\r</head>\r<body>\r\r<table border="0" cellpadding="5" summary="this table is used to create 2 columns of text">\r<tr><td>Latin is a dead language.</td><td>The English language thrives.</td></tr>\r<tr>\r<td>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>\r<td>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(256, 137, '0', 'Layout <code>table</code> with <code>th</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #114-1 - Positive</title>\r</head>\r<body>\r\r<table border="0" cellpadding="5" summary="this table is used to create 2 columns of text">\r<caption>a</caption>\r<tr><th>Latin is a dead language.</th><th>The English language thrives.</th></tr>\r<tr>\r<td>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>\r<td>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(257, 138, '1', 'Text <code>input</code> element has valid <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #138.2 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="text" name="name" id="name" value="your name here" tabindex=""/>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(258, 138, '0', 'Text <code>input</code> element does not have <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #138.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="text" name="name" id="name" value="your name here" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(259, 139, '1', 'Radio <code>input</code> element has valid <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #138.2 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="radio" name="name" id="name" value="your name here" tabindex=""/>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(260, 139, '0', 'Radio <code>input</code> element does not have <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #139.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="radio" name="name" id="name" value="your name here" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(261, 140, '1', 'Password <code>input</code> element has valid <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #140.2 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="password" name="name" id="name" value="your name here" tabindex=""/>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(262, 140, '0', 'Password <code>input</code> element does not have <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #140.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="password" name="name" id="name" value="your name here" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(263, 141, '1', 'Checkbox <code>input</code> element has valid <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #141.2 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="checkbox" name="name" id="name" tabindex="" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(264, 141, '0', 'Checkbox <code>input</code> element does not have <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #141.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="checkbox" name="name" id="name"  />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(265, 142, '1', 'File <code>input</code> element has valid <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #142.2 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="file" name="name" id="name" tabindex="" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(266, 142, '0', 'File <code>input</code> element does not have <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #142.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<label for="name">Name</label>: <input type="file" name="name" id="name"  />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(267, 143, '1', 'Content contains <code>address</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #143 - Negative</title>\r</head>\r<body>\r<address><a href="mailto:name@company.com">joe smith</a></address>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(268, 143, '0', 'Content does not have <code>address</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #143 - Positive</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(269, 145, '1', 'Link to multimedia file also has link to text alternative.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #145.2 - Negative</title>\r</head>\r<body>\r<p>View <a href="movie.wav">the movie</a> <a href="alternative.html">(text alternative)</a>.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(270, 145, '0', 'Link to multimedia file (.wmv) without a text alternative.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #145.1 - Positive</title>\r</head>\r<body>\r<p>View <a href="movie.wmv">the movie</a>.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(271, 146, '1', 'Object does not have <code>type</code> of "video".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #146 - Negative</title>\r</head>\r<body>\r<object/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(272, 146, '0', 'Object with <code>type</code> of "video".', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #146 - Positive</title>\r</head>\r<body>\r<object type="video"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(273, 147, '1', 'Has a <code>link</code> element with a <code>rel</code> attribute value of "index".', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #147.2 - Negative</title>\r<link rel="Index" href="../index.html" />\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(274, 147, '0', 'Does not have a <code>link</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #147.1 - Positive</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(275, 148, '0', 'Does not have a <code>link</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r\n<html lang="en">\r\n	<head>\r\n		<title>OAC Testfile - Check #148 - Positive</title>\r\n		<link rel="stylesheet" href="stylesheet.xsl">\r\n	</head>\r\n	<body>\r\n	</body>\r\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(276, 151, '1', 'Data <code>table</code> with a <code>caption</code> that describes the nature of the table.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #151.2 - Negative</title>\r</head>\r<body>\r\r<table border="1"><caption>Coffee Consumed By Senators</caption>\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(277, 151, '0', 'Data <code>table</code> without a <code>caption</code> is not identified within the document.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #151.1 - Positive</title>\r</head>\r<body>\r\r<table border="1">\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(278, 152, '1', '<code>table</code> headers are short.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #152 - Positive</title>\r</head>\r<body>\r\r<TABLE border="1" summary="This simple data table demonstrates the use of summary">\r<TR>\r<TD></TD>\r<TH>Col. 1 header</TH>\r<TH>Col. 2 header</TH>\r</TR>\r<TR>\r<TH>Row 1 header</TH>\r<TD>C1R1</TD>\r<TD>C1R2</TD>\r</TR>\r<TR>\r<TH>Row 2 header</TH>\r<TD>C2R1</TD>\r<TD>C2R2</TD>\r</TR>\r</TABLE>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(279, 152, '0', '<code>table</code> headers are long.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #152 - Positive</title>\r</head>\r<body>\r\r<TABLE border="1" summary="This simple data table demonstrates the use of summary">\r<caption>A Test Table</caption>\r<TR>\r<TD></TD>\r<TH>Col. 1 header really long text</TH>\r<TH>Col. 2 header really long text</TH>\r</TR>\r<TR>\r<TH>Row 1 header</TH>\r<TD>C1R1</TD>\r<TD>C1R2</TD>\r</TR>\r<TR>\r<TH>Row 2 header</TH>\r<TD>C2R1</TD>\r<TD>C2R2</TD>\r</TR>\r</TABLE>\r\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(280, 153, '1', 'Header abbreviations are short.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #153 - Positive</title>\r</head>\r<body>\r\r<TABLE border="1" summary="This simple data table demonstrates the use of summary">\r<caption>A Test Table</caption>\r<TR>\r<TD></TD>\r<TH abbr="short abbrev">Col. 1 header really long text</TH>\r<TH abbr="short abbrev 2">Col. 2 header really long text</TH>\r</TR>\r<TR>\r<TH>Row 1 header</TH>\r<TD>C1R1</TD>\r<TD>C1R2</TD>\r</TR>\r<TR>\r<TH>Row 2 header</TH>\r<TD>C2R1</TD>\r<TD>C2R2</TD>\r</TR>\r</TABLE>\r\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(281, 153, '0', 'Header abbreviations are long.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #153 - Positive</title>\r</head>\r<body>\r\r<TABLE border="1" summary="This simple data table demonstrates the use of summary">\r<caption>A Test Table</caption>\r<TR>\r<TD></TD>\r<TH abbr="This abbreviation is much too long.">Col. 1 header really long text</TH>\r<TH abbr="abbrev OK">Col. 2 header really long text</TH>\r</TR>\r<TR>\r<TH>Row 1 header</TH>\r<TD>C1R1</TD>\r<TD>C1R2</TD>\r</TR>\r<TR>\r<TH>Row 2 header</TH>\r<TD>C2R1</TD>\r<TD>C2R2</TD>\r</TR>\r</TABLE>\r\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(282, 154, '1', '<code>pre</code> not used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #154 - Positive</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(283, 154, '0', '<code>pre</code> used.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #154 - Positive</title>\r</head>\r<body>\r\r<pre>\r     dogs  cats\rbig	  2     4\rsmall 5     7\r</pre>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(284, 159, '1', 'IMG does not have a <code>title</code>.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #159 - Negative</title>\r</head>\r<body>\r<img src="rex.jpg" alt="A brown and black cat named Rex."/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(285, 159, '0', 'IMG has a <code>title</code>.', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #159 - Positive</title>\r</head>\r<body>\r<img src="rex.jpg" alt="A brown and black cat named Rex." title="Rex the bad cat"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(286, 160, '1', 'Document does not contain an <code>object</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #160 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(287, 160, '0', 'Document contains an <code>object</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #160 - Positive</title>\r</head>\r<body>\r<object/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(288, 163, '1', '<code>embed</code> contains a <code>noembed</code> element.', '<html lang="en">\r<head>\r<title>ATRC Testfile - Check #163.2 - Negative</title>\r</head>\r<body>\r<embed src="../movies/history_of_rome.mov" height="60" width="144" autostart="false">\r	<noembed>\r		<a href="../transcripts/transcript_history_rome.htm">Transcript of "The history of Rome"</a>\r	</noembed>\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(289, 163, '0', '<code>embed</code> missing <code>noembed</code>.', '<html lang="en">\r<head>\r<title>ATRC Testfile - Check #163.1 - Positive</title>\r</head>\r<body>\r<embed src="../movies/history_of_rome.mov" height="60" width="144" autostart="false">\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(290, 164, '1', '<code>noembed</code> element not present.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #164 - Negative</title>\r</head>\r<body>\r<embed src="demo.mov">\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(291, 164, '0', '<code>noembed</code> element present.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #164 - Positive</title>\r</head>\r<body>\r<embed src="demo.mov">\r<noembed>Alternate content for the embed</noembed>\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(292, 165, '1', '<code>embed</code> with <code>alt</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #165 - Negative</title>\r</head>\r<body>\r<embed alt="description of the embed" src="demo.mov">\r<noembed>Alternate content for the embed</noembed>\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(293, 165, '0', '<code>embed</code> missing <code>alt</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #165 - Positive</title>\r</head>\r<body>\r<embed src="demo.mov">\r<noembed>Alternate content for the embed</noembed>\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(294, 166, '1', '<code>embed</code> with valid <code>alt</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #166 - Negative</title>\r</head>\r<body>\r<embed alt="description of the embed" src="demo.mov">\r<noembed>Alternate content for the embed</noembed>\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(295, 166, '0', '<code>embed</code> with empty <code>alt</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #166 - Positive</title>\r</head>\r<body>\r<embed alt=""  src="demo.mov">\r<noembed>Alternate content for the embed</noembed>\r</embed>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(296, 167, '1', '<code>iframe</code> without a <code>longdesc</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #167 - Negative</title>\r</head>\r<body>\r<iframe/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(297, 167, '0', '<code>iframe</code> with a <code>longdesc</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #167 - Positive</title>\r</head>\r<body>\r<iframe longdesc="file.html"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(298, 168, '1', 'radio button group contains both <code>fieldset</code> and <code>legend</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #168 - Negative</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>Donut Type</legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(299, 168, '0', 'radio button group contains no <code>fieldset</code> or <code>legend</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #168 - Positive</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r<br/><input type="submit" value="Purchase Donut"/>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(300, 169, '1', '<code>option</code>s with <code>optgroup</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #169 - Negative</title>\r</head>\r<body>\r\r<form action="http://example.com/prog/someprog" method="post">\r  <select name="ComOS">\r    <optgroup label="PortMaster 3">\r      <option label="3.7.1" value="pm3_3.7.1">\r        PortMaster 3 with ComOS 3.7.1\r      </option>\r      <option label="3.7" value="pm3_3.7">\r        PortMaster 3 with ComOS 3.7\r      </option>\r      <option label="3.5" value="pm3_3.5">\r        PortMaster 3 with ComOS 3.5\r      </option>\r    </optgroup>\r    <optgroup label="PortMaster 2">\r      <option label="3.7" value="pm2_3.7">\r        PortMaster 2 with ComOS 3.7\r      </option>\r      <option label="3.5" value="pm2_3.5">\r        PortMaster 2 with ComOS 3.5\r      </option>\r    </optgroup>\r    <optgroup label="IRX">\r      <option label="3.7R" value="IRX_3.7R">\r        IRX with ComOS 3.7R\r      </option>\r      <option label="3.5R" value="IRX_3.5R">\r        IRX with ComOS 3.5R\r      </option>\r    </optgroup>\r  </select>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(301, 169, '0', '<code>option</code>s without <code>optgroup</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #169 - Positive</title>\r</head>\r<body>\r\r<form action="http://example.com/prog/someprog" method="post">\r	<label for="select1">master</label>\r  <select name="ComOS" id="select1">\r      <option label="3.7.1" value="pm3_3.7.1">\r        PortMaster 3 with ComOS 3.7.1\r      </option>\r      <option label="3.7" value="pm3_3.7">\r        PortMaster 3 with ComOS 3.7\r      </option>\r      <option label="3.5" value="pm3_3.5">\r        PortMaster 3 with ComOS 3.5\r      </option>\r      <option label="3.7" value="pm2_3.7">\r        PortMaster 2 with ComOS 3.7\r      </option>\r  </select>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(302, 173, '1', 'Anchor with non placeholder text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #173 - Negative</title>\r</head>\r<body>\r\r<p>Select link for more <a href="dogs.html">information about dogs</a>.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(303, 173, '0', 'Anchor with "click here" text.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #173 - Positive</title>\r</head>\r<body>\r\r<p>For more information <a href="dogs.html">click here</a>.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(304, 174, '1', 'Anchor with text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #174 - Negative</title>\r</head>\r<body>\r\r<p>Select link for more <a href="dogs.html">information about dogs</a>.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(305, 174, '0', 'Anchor has no text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #174 - Positive</title>\r</head>\r<body>\r\r<p>For more information <a href="dogs.html"></a>.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(306, 175, '1', 'Anchor contains image with Alt text different from link text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #175 - Negative</title>\r</head>\r<body>\r\r<p>\r<a href="page1.html"><img src="star.jpg" alt=""/>page1</a>\r</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(307, 175, '0', 'Anchor contains image with Alt text same as link text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #175 - Positive</title>\r</head>\r<body>\r\r<p>\r<a href="page1.html"><img src="star.jpg" alt="page1"/>page1</a>\r</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(308, 176, '1', 'Does not contain a <code>basefont</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #176 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(309, 176, '0', 'Contains a <code>basefont</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #176 - Positive</title>\r</head>\r<body>\r<basefont face="Arial" size="4"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(310, 177, '1', 'Does not contain a <code>font</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #177 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(311, 177, '0', 'Contains a <code>font</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN""http://www.w3.org/TR/REC-html40/loose.dtd">\r<html lang="en">\r<head>\r<title>OAC Testfile - Check #177 - Positive</title>\r</head>\r<body>\r<font size="4"/>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(312, 178, '1', 'Alt text conveys same information as image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #178 - Negative</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="a black and brown cat named Rex"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(313, 178, '0', 'Alt text does not convey same information as image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #178 - Positive</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="shoes and suits and clothing and ties"/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(314, 180, '1', 'Two sequential Anchor elements that have different targets.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #180 - Negative</title>\r</head>\r<body>\r<a href="dogs.html"><img src="icon.gif" alt="Products for dogs" /></a>\r<a href="cats.html">Products For Cats</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(315, 180, '0', 'Two sequential Anchor elements that have the same target.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #180 - Positive</title>\r</head>\r<body>\r<a href="dogs.html"><img src="icon.gif" alt="Products for dogs" /></a>\r<a href="dogs.html">Products For Dogs</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(316, 181, '1', 'Anchor does not use the Javascript URL protocol.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #181 - Negative</title>\r</head>\r<body>\r<a href="fallback.html" onclick="dosomething(); return false;">Scripted link with fallback</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(317, 181, '0', 'Anchor uses the Javascript URL protocol.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #181 - Positive</title>\r</head>\r<body>\r<a href="javascript:dosomething()">Scripted link</a>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(318, 182, '1', '<code>body</code> does not contain a <code>background</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #182 - Negative</title>\r</head>\r<body>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(319, 182, '0', '<code>body</code> contains a <code>background</code> attribute.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #182 - Positive</title>\r</head>\r<body background="background.jpg">\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(320, 183, '1', '<code>object</code> contains an <code>embed</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #183 - Negative</title>\r</head>\r<body>\r\r<object classid="clsid:A12BCD3F-GH4I-56JK-xyz"\r    codebase="http://example.com/content.cab" \r    width="100" height="80">\r  <param name="Movie" value="moviename.swf" />\r  <embed src="moviename.swf" width="100" height="80"\r      pluginspage="http://example.com/shockwave/download/">\r  <noembed>\r    <img alt="Still from Movie" src="moviename.gif" \r    width="100" height="80" />\r  </noembed>\r  </embed>\r</object>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(321, 183, '0', '<code>object</code> does not contain an <code>embed</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #183 - Positive</title>\r</head>\r<body>\r\r<object classid="clsid:A12BCD3F-GH4I-56JK-xyz"\r    codebase="http://example.com/content.cab" \r    width="100" height="80">\r  <param name="Movie" value="moviename.swf" />\r</object>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(322, 184, '1', 'Document is part of a collection that has a site map.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #184 - Negative</title>\r</head>\r<body>\r\r<a href="sitemap.html">Site Map</a>\r\r<p>This document is part of a large collection of related documents.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(323, 184, '0', 'Document is part of a collection but there is not site map.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #184 - Positive</title>\r</head>\r<body>\r\r<p>This document is part of a large collection of related documents.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(324, 185, '1', '<code>id</code> attribute values are unique.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #1 - Negative</title>\r</head>\r<body>\r<table border=1 summary="table #1 with IDs and HEADERS">\r<tr>\r <th id="city">City</th>\r <th id="state">State</th>\r</tr>\r<tr>\r <td headers="city">Phoenix</td>\r <td headers="state">Arizona</td>\r</tr>\r<tr>\r <td headers="city">Seattle</td>\r <td headers="state">Washington</td>\r</tr>\r</table>\r\r\r<table border=1 summary="table #2 with IDs and HEADERS">\r<tr>\r <th id="bigcity">City</th>\r <th id="bigstate">State</th>\r</tr>\r<tr>\r <td headers="city">Phoenix</td>\r <td headers="state">Arizona</td>\r</tr>\r<tr>\r <td headers="city">Seattle</td>\r <td headers="state">Washington</td>\r</tr>\r</table>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(325, 185, '0', '<code>id</code> attribute values are not unique.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #185 - Positive</title>\r</head>\r<body>\r<table border=1 summary="table #1 with IDs and HEADERS">\r<tr>\r <th id="city">City</th>\r <th id="state">State</th>\r</tr>\r<tr>\r <td headers="city">Phoenix</td>\r <td headers="state">Arizona</td>\r</tr>\r<tr>\r <td headers="city">Seattle</td>\r <td headers="state">Washington</td>\r</tr>\r</table>\r\r\r<table border=1 summary="table #2 with IDs and HEADERS">\r<tr>\r <th id="city">City</th>\r <th id="state">State</th>\r</tr>\r<tr>\r <td headers="city">Phoenix</td>\r <td headers="state">Arizona</td>\r</tr>\r<tr>\r <td headers="city">Seattle</td>\r <td headers="state">Washington</td>\r</tr>\r</table>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(326, 186, '1', '<code>label</code> does not contain an <code>input</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #186 - Negative</title>\r</head>\r<body>\r\r<form>\r<label for="name">First name: </label> <input type="text" name="firstname" id="name"/>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(327, 186, '0', '<code>label</code> contains an <code>input</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #186 - Positive</title>\r</head>\r<body>\r\r<form>\r<label for="name">First name: <input type="text" name="firstname" id="name"/></label>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(328, 187, '1', '<code>input</code> has only 1 associated label.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #187 - Negative</title>\r</head>\r<body>\r\r<form>\r<label for="name">First name: </label>\r<input type="text" name="firstname" id="name"/>\r</form>\r\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(329, 187, '0', '<code>input</code> has 2 associated <code>labels</code>.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">\r<html xml:lang="en-US" lang="en">\r<head>\r<title>OAC Testfile - Check #187 - Positive</title>\r</head>\r<body>\r\r<form>\r<label for="name">First name: </label>\r<input type="text" name="firstname" id="name"/>\r<label for="name">Enter your first name: </label>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(330, 188, '1', '<code>label</code> contains one printable character.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #188 - Negative</title>\r</head>\r<body>\r\r<form action="http://www.test.com" method="post">\r<p>\r<label for="name">First name: </label>\r<input type="text" name="firstname" id="name"/>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(331, 188, '0', '<code>label</code> is empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #188 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.test.com" method="post">\r<p>\r<label for="name"></label>\r<input type="text" name="firstname" id="name"/>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(332, 189, '1', '<code>label</code> does describe its associated <code>input</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #189 - Negative</title>\r</head>\r<body>\r\r<form action="http://www.test.com" method="post">\r<p>\r<label for="name">First name: </label>\r<input type="text" name="firstname" id="name"/>\r</p>\r</form>\r\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(333, 189, '0', '<code>label</code> does not describe its associated <code>input</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #189 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.test.com" method="post">\r<p>\r<label for="name">shoe size:</label>\r<input type="text" name="firstname" id="name"/>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(334, 190, '1', '<code>a</code> (anchor) element does have a <code>title</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>Testfile - Check #190 - Negative</title>\r</head>\r<body>\r<p>We have information about <a href="dogs.html" title="dogs information">dogs</a> on our site.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(335, 190, '0', '<code>a</code> (anchor) element does not have a <code>title</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>Testfile - Check #190 - Positive</title>\r</head>\r<body>\r<p>We have more <a href="dogs.html">information about dogs</a> on our site.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(336, 191, '1', '<code>title</code> attribute value on source anchor describes the link destination.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>Testfile - Check #191 - Negative</title>\r</head>\r<body>\r<p>We have information about <a href="dogs.html" title="dogs information">dogs</a> on our site.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(337, 191, '0', '<code>title</code> attribute value on source anchor does not describe the link destination.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>Testfile - Check #191 - Positive</title>\r</head>\r<body>\r<p>We have more <a href="dogs.html" title="cats information">information about dogs</a> on our site.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(338, 192, '1', 'Alt text does not use the word "submit".', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #192 - Negative</title>\r</head>\r<body>\r<form action="http://example.com/prog/text-read" method="post">\r  <input type="image" name="submit" src="button.gif" alt="find dogs"/>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(339, 192, '0', 'Alt text uses the word "submit".', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #192 - Positive</title>\r</head>\r<body>\r<form action="http://example.com/prog/text-read" method="post">\r  <input type="image" name="submit" src="button.gif" alt="submit"/>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(340, 193, '1', 'Alt text has all text within image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #193 - Negative</title>\r</head>\r<body>\r<form action="http://example.com/prog/text-read" method="post">\r<p><input type="image" name="submit" src="finddogs.gif" alt="find dogs" /></p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(341, 193, '0', 'Alt text does not contain all text in image and text is not decorative.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #193 - Positive</title>\r</head>\r<body>\r<form action="http://example.com/prog/text-read" method="post">\r<p><input type="image" name="submit" src="finddogs.gif" alt="submit" /></p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(342, 194, '1', 'Alt text has all text within image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #194 - Negative</title>\r</head>\r<body>\r<p><img src="welcome.gif" usemap="#map1"  alt="Image map of areas in the library" /></p>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,80,30" href="reference.html" alt="Reference" />\r<area shape="rect" coords="0,35,110,100" href="media.html" alt="Audio Visual Lab" />\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(343, 194, '0', 'Alt text does not contain all non decorative text in image.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #194 - Positive</title>\r</head>\r<body>\r<p><img src="welcome.gif" usemap="#map1"  alt="Image map of areas in the library" /></p>\r<p><map id="map1" name="map1">\r<area shape="rect" coords="0,0,80,30" href="reference.html" alt="Reference" />\r<area shape="rect" coords="0,35,110,100" href="media.html" alt="Lab" />\r</map></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(344, 195, '1', 'Link text does not begin with "link to".', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #195 - Negative</title>\r</head>\r<body>\r<p><a href="home.html">home page</a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(345, 195, '0', 'Link text begins with "link to".', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #195 - Positive</title>\r</head>\r<body>\r<p><a href="home.html">link to home page</a></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(346, 196, '1', 'Server-side image map does not use available geometric shapes.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #196 - Negative</title>\r</head>\r<body>\r<p><img src="image.gif" alt="image map" ismap /></p>\r<p>To perform this test, you must look at the server-side image map file and determine if the active areas in the image map use available geometric shapes.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(347, 196, '0', 'Server-side image map uses available geometric shapes.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #196 - Positive</title>\r</head>\r<body>\r<p><img src="image.gif" alt="image map" ismap /></p>\r<p>To perform this test, you must look at the server-side image map file and determine if the active areas in the image map use available geometric shapes.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(348, 197, '1', 'link text identifies the link destination', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #197 - Negative</title>\r</head>\r<body>\r<p>Here is a link to <a href="dogs.html">information about dogs</a>.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(349, 197, '0', 'link text does not identify the link destination.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>OAC Testfile - Check #197 - Positive</title>\r</head>\r<body>\r<p>For more information about dogs, <a href="dogs.html">click here</a>.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(350, 198, '1', '<code>legend</code> text describes the group of choices.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #198 - Negative</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>Donut Type</legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(351, 198, '0', '<code>legend</code> does not describe the group of choices.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #198 - Positive</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>dogs</legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(352, 199, '1', '<code>legend</code> text is not empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #199 - Negative</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>Donut Type</legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(353, 199, '0', '<code>legend</code> text is empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #199 - Positive</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend></legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(354, 200, '1', '<code>legend</code> text describes the group of choices.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #200 - Negative</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>Donut Type</legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(355, 200, '0', '<code>legend</code> text is placeholder text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #200 - Positive</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>legend</legend>\r<p>\r<input type="radio" name="flavour" id="choc" value="chocolate" checked="checked" />\r<label for="choc">Chocolate</label><br/>\r<input type="radio" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="radio" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donut"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(356, 201, '1', '<code>frame</code> <code>title</code> is not empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #201 - Negative</title>\r</head>\r\r<frameset >\r  <frame src="birds.html" title="main content" />\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(357, 201, '0', '<code>frame</code> <code>title</code> is empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #201 - Positive</title>\r</head>\r\r<frameset >\r  <frame src="birds.html" title="" />\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(358, 202, '1', '<code>frame</code> <code>title</code> is not placeholder text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #202 - Negative</title>\r</head>\r\r<frameset >\r  <frame src="birds.html" title="main content" />\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(359, 202, '0', '<code>frame</code> <code>title</code> is placeholder text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> \r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>OAC Testfile - Check #202 - Positive</title>\r</head>\r\r<frameset >\r  <frame src="birds.html" title="frame title" />\r</frameset>\r\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(360, 203, '1', 'Data <code>table</code> <code>summary</code> describes navigation and structure of the table.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #203.2 - Negative</title>\r</head>\r<body>\r\r<table border="1" summary="Schedule for Route 7 going downtown. Service begins \rat 4:00 AM and ends at midnight. Intersections are listed in the top row. \rFind the intersection closest to your starting point or destination, then read \rdown that column to find out what time the bus leaves that intersection.">\r<tr>\r<th scope="col">State & First</th>\r<th scope="col">State & Sixth</th>\r<th scope="col">State & Fifteenth</th>\r<th scope="col">Fifteenth & Morrison</th>\r</tr>\r<td>4:00</td>\r<td>4:05</td>\r<td>4:11</td>\r<td>4:19</td>\r</tr>\r</tr>\r<td>5:00</td>\r<td>5:05</td>\r<td>5:11</td>\r<td>5:19</td>\r</tr>\r</tr>\r<td>6:00</td>\r<td>6:05</td>\r<td>6:11</td>\r<td>6:19</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(361, 203, '0', 'Data <code>table</code> <code>summary</code> does not describe navigation and structure of the table.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #203.1 - Positive</title>\r</head>\r<body>\r\r<table border="1" summary="bus schedule">\r<tr>\r<th scope="col">State & First</th>\r<th scope="col">State & Sixth</th>\r<th scope="col">State & Fifteenth</th>\r<th scope="col">Fifteenth & Morrison</th>\r</tr>\r<td>4:00</td>\r<td>4:05</td>\r<td>4:11</td>\r<td>4:19</td>\r</tr>\r</tr>\r<td>5:00</td>\r<td>5:05</td>\r<td>5:11</td>\r<td>5:19</td>\r</tr>\r</tr>\r<td>6:00</td>\r<td>6:05</td>\r<td>6:11</td>\r<td>6:19</td>\r</tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(362, 204, '1', 'Label using <code>for</code> and <code>id</code> contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #204 - Negative</title>\r</head>\r<body>\r<form action="http://www.test.com/testing" method="post">\r<p>\r<label for="radioa">birds</label> \r<input id="radioa" type="radio" name="aradio" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(363, 204, '0', 'Label using <code>for</code> and <code>id</code> does not contain text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #204 - Positive</title>\r</head>\r<body>\r<form action="http://www.test.com/testing" method="post">\r<p>\r<label for="radioa"></label> \r<input id="radioa" type="radio" name="aradio" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(364, 205, '1', 'Label using <code>for</code> and <code>id</code> describes control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 205.2 - Negative</title>\r</head>\r<body>\r<form action="http://www.test.com/testing" method="post">\r<p>\r<label for="thefile">student file:</label> \r<input type="file" id="thefile" name="data" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(365, 205, '0', 'Label using <code>for</code> and <code>id</code> does not describe control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 205.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.test.com/testing" method="post">\r<p>\r<label for="thefile">I was walking down the street.</label> \r<input type="file" id="thefile" name="data" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(366, 206, '1', 'Label using <code>for</code> and <code>id</code> contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #206 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="boxa">birds</label> \r<input id="boxa" type="checkbox" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(367, 206, '0', 'Label using <code>for</code> and <code>id</code> does not contain text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #206 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="boxa"></label> \r<input id="boxa" type="checkbox" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(368, 207, '1', 'Label using <code>for</code> and <code>id</code> contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #207 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="pass">Password:</label> \r<input id="pass" type="password" name="login-password" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(369, 207, '0', 'Label using <code>for</code> and <code>id</code> does not contain text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #207 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="pass"></label> \r<input id="pass" type="password" name="login-password" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(370, 208, '1', 'associated <code>label</code> contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 208.2 - Negative</title>\r</head>\r<body>\r<form method="post" action="http://www.test.com">\r<p>\r<label for="animal">Animal:</label>\r<select name="abcselect" id="animal">\r<option value="1">dog</option>\r<option value="2">cat</option>\r<option value="3">bird</option>\r</select>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(371, 208, '0', 'associated <code>label</code> is empty.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 208.1 - Positive</title>\r</head>\r<body>\r<form method="post" action="http://www.test.com">\r<p>\r<label for="animal"></label>\r<select name="abcselect" id="animal">\r<option value="1">dog</option>\r<option value="2">cat</option>\r<option value="3">bird</option>\r</select>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(372, 209, '1', '<code>label</code> is positioned close to control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 209.2 - Negative</title>\r</head>\r<body>\r<form method="post" action="http://www.test.com">\r<p><label for="animal">Animal:</label>\r<select name="abcselect" id="animal">\r<option value="1">dog</option>\r<option value="2">cat</option>\r<option value="3">bird</option>\r</select>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(373, 209, '0', '<code>label</code> is not positioned close to control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 209.1 - Positive</title>\r</head>\r<body>\r<form method="post" action="http://www.test.com">\r<p><label for="animal">Animal:</label></p>\r<p>This is some text between the label and the control.<br/>\r<select name="abcselect" id="animal">\r<option value="1">dog</option>\r<option value="2">cat</option>\r<option value="3">bird</option>\r</select>\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(374, 211, '1', 'Labels are positioned close to controls.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #211.2 - Negative</title>\n</head>\n<body>\n<form action="http://www.example.com" method="post">\n<table>\n<tr><td>first name:</td><td><input type="text" /></td></tr>\n<tr><td>last name:</td><td><input type="text" /></td></tr>\n<tr><td>favorite color:</td><td><input type="text" /></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(375, 211, '0', 'Labels are positioned far from controls.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #211.1 - Positive</title>\n</head>\n<body>\n<form action="http://www.example.com" method="post">\n<table width="100%">\n<tr><td>first name:</td><td align="right"><input type="text" /></td></tr>\n<tr><td>last name:</td><td align="right"><input type="text" /></td></tr>\n<tr><td>favorite color:</td><td align="right"><input type="text" /></td></tr>\n<tr><td colspan="2"><input type="submit" value="submit" /></td></tr>\n</table>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(376, 212, '1', 'Label using <code>for</code> and <code>id</code> contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #212.2 - Negative</title>\r</head>\r<body>\r\r<form action="http://www.test.com/testing" method="post">\r<label for="text1">comments:</label>\r<textarea name="nametext" id="text1" rows="5" cols="40">\r</textarea>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(377, 212, '0', 'Label using <code>for</code> and <code>id</code> does not contain text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #212.1 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.test.com/testing" method="post">\r<label for="text1"></label>\r<textarea name="nametext" id="text1" rows="5" cols="40">\r</textarea>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(378, 213, '1', 'Label using <code>for</code> and <code>id</code> attributes contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #213 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">Name:</label> \r<input id="texta" type="text" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(379, 213, '0', 'Label using <code>for</code> and <code>id</code> attributes does not contain text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check 213 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta"></label> \r<input id="texta" type="text" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(380, 214, '1', 'Label using <code>for</code> and <code>id</code> describes control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #214.2 - Negative</title>\r</head>\r<body>\r\r<form action="http://www.test.com/testing" method="post">\r<label for="text1">comments:</label>\r<textarea name="nametext" id="text1" rows="5" cols="40">\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(381, 214, '0', 'Label using <code>for</code> and <code>id</code> does not describe control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #214.1 - Positive</title>\r</head>\r<body>\r\r<form action="http://www.test.com/testing" method="post">\r<label for="text1">I was walking down the street.</label>\r<textarea name="nametext" id="text1" rows="5" cols="40">\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(382, 216, '1', 'Label using <code>for</code> and <code>id</code> contains text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #216 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">File:</label> \r<input id="texta" type="file" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(383, 216, '0', 'Label using <code>for</code> and <code>id</code> does not contain text.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check 216 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta"></label> \r<input id="texta" type="file" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(384, 217, '1', 'Label using <code>for</code> and <code>id</code> describes control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #217 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="pass">Password:</label> \r<input id="pass" type="password" name="login-password" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(385, 217, '0', 'Label using <code>for</code> and <code>id</code> does not describe control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check 217 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="pass">Your name:</label> \r<input id="pass" type="password" name="login-password" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(386, 218, '1', 'Label using <code>for</code> and <code>id</code> describes control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #218 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">Name:</label> \r<input id="texta" type="text" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(387, 218, '0', 'Label using <code>for</code> and <code>id</code> does not describe control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #218 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">password</label> \r<input id="texta" type="text" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(388, 219, '1', 'Label using <code>for</code> and <code>id</code> describes control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #219 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">birds</label> \r<input id="texta" type="checkbox" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(389, 219, '0', 'Label using <code>for</code> and <code>id</code> does not describe control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #219 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">I was walking down the street.</label> \r<input id="texta" type="checkbox" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(390, 220, '1', 'Label using <code>for</code> and <code>id</code> describes control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #220 - Negative</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">birds</label> \r<input id="texta" type="radio" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(391, 220, '0', 'Label using <code>for</code> and <code>id</code> does not describe control.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #220 - Positive</title>\r</head>\r<body>\r<form action="http://somesite.com/prog/adduser" method="post">\r<p>\r<label for="texta">I was walking down the street.</label> \r<input id="texta" type="radio" name="mytext" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(392, 221, '1', 'The luminosity contrast ratio between text and background color is greater than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #221.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" text="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(393, 221, '0', 'The luminosity contrast ratio between text and background color is less than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #221.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" text="#cccccc">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(394, 222, '1', 'The luminosity contrast ratio between link and background color is greater than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #222.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" link="#000000">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(395, 222, '0', 'The luminosity contrast ratio between link and background color is less than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #222.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" link="#cccccc">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(396, 223, '1', 'The luminosity contrast ratio between active link and background color is greater than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #223.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" alink="#000000">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(397, 223, '0', 'The luminosity contrast ratio between active link and background color is less than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #223.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" alink="#cccccc">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(398, 224, '1', 'The luminosity contrast ratio between visited link and background color is greater than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #224.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" vlink="#000000">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(399, 224, '0', 'The luminosity contrast ratio between visited link and background color is less than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #224.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" vlink="#cccccc">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(400, 225, '1', 'The document contains an HTML 4.01 strict DTD.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\r<html lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>Testfile - Check #225-2 - Negative</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="A black and brown cat named Rex."/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(401, 225, '0', 'The document does not contain a DTD.', '<html lang="en">\r<head>\r<title>Testfile - Check #225-1 - Positive</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="A black and brown cat named Rex."/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(402, 226, '1', 'The background color and the text color surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #226-2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" text="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(403, 226, '0', 'The background color and the text color do not surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #226-1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" text="#cccccc">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(404, 227, '1', 'The background color and the link color surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #227-2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" link="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(405, 227, '0', 'The background color and the link color do not surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #227-1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" link="#cccccc">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(406, 228, '1', 'The background color and the alink color surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #228-2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" alink="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(407, 228, '0', 'The background color and the alink color do not surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #228-1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" alink="#cccccc">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(408, 229, '1', 'The background color and the vlink color surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #229-2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" vlink="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(409, 229, '0', 'The background color and the vlink color do not surpass the WAI ERT color algorithm threshold.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #229-1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" vlink="#cccccc">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(410, 230, '1', 'Data table contains markup to group repeated header markup.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 230-1 Positive</title>\r</head>\r<body>\r\r<table border="1" summary="cups of coffee consumed by city politicians">\r<thead>\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r</thead>\r<tbody>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</tbody>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(411, 230, '0', 'Data table does not contain any markup to group repeated header markup.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 230-1 Positive</title>\r</head>\r<body>\r\r<table border="1" summary="cups of coffee consumed by city politicians">\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(412, 231, '1', 'Data table contains markup to group column structures.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 231-1 Positive</title>\r</head>\r<body>\r\r<p>From the WCAG 2.0 HTML techniques: "Describe the use and benefits of column structure elements. Much of this may be theoretical."</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(413, 231, '0', 'Data table does not contain any markup to group column structures.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile 231-1 Positive</title>\r</head>\r<body>\r\r<p>From the WCAG 2.0 HTML techniques: "Describe the use and benefits of column structure elements. Much of this may be theoretical."</p>\r\r<table border="1" summary="cups of coffee consumed by city politicians">\r<thead>\r<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\r</thead>\r<tbody>\r<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\r<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\r<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\r<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\r<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\r</tbody>\r</table>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(414, 232, '1', 'The document validates to declared specification.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\r<html lang="en">\r<head>\r<title>Testfile - Check #232-2 - Negative</title>\r</head>\r<body>\r<p>This link to an <a href="232-1.html">invalid file</a> opens in the same window.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(415, 232, '0', 'The document does not validate to declared specification - ''strict'' doctype does not allow <code>target</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\r<html lang="en">\r<head>\r<title>Testfile - Check #232-1 - Positive</title>\r</head>\r<body>\r<p>This link to a <a href="232-2.html" title="valid file - opens in a new window" target="_new">valid file</a> opens in a new window.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(416, 233, '1', 'Does not have a <code>frameset</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - 233.2 - Negative</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="A black and brown cat named Rex."/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(417, 233, '0', 'Contains a <code>frameset</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">\n<html>\n<head>\n<title>ATRC Testfile - 233.1 - Positive</title>\n</head>\n<frameset cols="33%,33%,33%">\n<frameset rows="*,200">\n<frame src="contents_of_frame1.html">\n<frame src="contents_of_frame2.gif">\n</frameset>\n<frame src="contents_of_frame3.html">\n<frame src="contents_of_frame4.html">\n</frameset>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(418, 234, '1', 'Does not have a <code>frame</code> element.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - 234.2 - Negative</title>\r</head>\r<body>\r<p><img src="rex.jpg" alt="A black and brown cat named Rex."/></p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(419, 234, '0', 'Contains a <code>frame</code> element.', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">\n<html>\n<head>\n<title>ATRC Testfile - 234.1 - Positive</title>\n</head>\n<frameset cols="33%,33%,33%">\n<frameset rows="*,200">\n<frame src="contents_of_frame1.html">\n<frame src="contents_of_frame2.gif">\n</frameset>\n<frame src="contents_of_frame3.html">\n<frame src="contents_of_frame4.html">\n</frameset>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(420, 235, '1', 'Primary document text reads left to right and contains a section that reads right to left that is unmarked.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #235.2 - Negative</title>\n</head>\n<body>    \n<p>Normal body text goes here</p>\n<blockquote lang="he" dir="rtl"> \n<!-- Hebrew quote goes here -->  \n<blockquote> \n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(421, 235, '0', 'Primary document text reads left to right and contains a section that reads right to left but is unmarked.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #235.1 - Positive</title>\n</head>\n<body>\n<p>Normal body text goes here</p>\n<blockquote lang="he"> \n<!-- Hebrew quote goes here -->  \n<blockquote> \n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(422, 236, '1', 'Text and image are combined into one link.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #236.2 - Negative</title>\n</head>\n<body>\n<p>\n<a href="products.html"><img src="icon.gif" alt="" />Products page</a>\n</p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(423, 236, '0', 'Adjacent text and image links with the same destination and duplicate text.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #236.1 - Positive</title>\n</head>\n<body>\n<p>\n<a href="products.html"><img src="icon.gif" alt="Products page" /></a>\n<a href="products.html">Products page</a>\n</p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(424, 237, '1', 'The two forms produce different results and the submit button labels are different.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #237.2 - Negative</title>\n</head>\n<body>\n\n<form action="http://mysite.com">\n<p><input type="submit" value="purchase books"/></p>\n</form>\n\n<form action="http://yoursite.com">\n<p><input type="image" name="submit" src="renew.gif" alt="renew license" /></p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(425, 237, '0', 'The two forms produce different results but the submit button labels are the same.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #237.1 - Positive</title>\n</head>\n<body>\n\n<form action="http://mysite.com">\n<p><input type="submit" value="submit"/></p>\n</form>\n\n<form action="http://yoursite.com">\n<p><input type="image" name="submit" src="submit.gif" alt="submit" /></p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(426, 238, '1', '<code>input</code> element with type of "submit" does not have an <code>alt</code> attribute', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #238.2 - Negative</title>\n</head>\n<body>\n\n<form action="http://mysite.com">\n<p><input type="submit" value="submit"/></p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(427, 238, '0', '<code>input</code> element with type of "submit" has an <code>alt</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #238.1 - Positive</title>\n</head>\n<body>\n\n<form action="http://mysite.com">\n<p><input type="submit" value="submit" alt="submit the form"/></p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(428, 239, '1', 'Image is decorative and <code>title</code> attribute is an empty string ("").', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>ATRC Testfile - Check #239.2 - Negative</title>\r</head>\r<body>\r<p>My poem requires a big space<img src="10pttab.gif" title="" width="5" height="5"/>here.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(429, 239, '0', 'Image is decorative and <code>title</code> attribute is not an empty string ("").', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<title>ATRC Testfile - Check #239.1 - Positive</title>\r</head>\r<body>\r<p>My poem requires a big space<img src="10pttab.gif" title="big space" width="5" height="5"/>here.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(430, 240, '1', 'Text alternative file tells the same story and presents the same information as the multimedia file.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #240.2 - Negative</title>\r</head>\r<body>\r<p>View <a href="movie.wav">the movie</a> <a href="alternative2.html">(text alternative)</a>.</p>\r\r<p>Shown below is the content of the text alternative file.</p>\r\r<p>Harmonica sounds play softly in the background. The setting is a small dusty town in the wild\rwest days. The opening shot is the main street of the town under the bright noon sun. The harmonica sounds stop and the sounds of the wind can be heard softly. A tall man dressed all in black wearing\ra black hat stands at the far end of the street. The shot changes to a closeup of the man''s emotionless face. He spits tobacco juice on the ground but leaves some brown liquid dripping down his chin. He slowly speaks the words "It''s about time now sherrif".</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(431, 240, '0', 'Text alternative file does not tell the same story and present the same information as the multimedia file.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #240.1 - Negative</title>\r</head>\r<body>\r<p>View <a href="movie.wmv">the movie</a> <a href="alternative1.html">(text alternative)</a>.</p>\r\r<p>Shown below is the content of the text alternative file.</p>\r\r<p>This movie shows a gunfight.</p>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(432, 241, '1', 'Table markup is used for tabular information.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #241.2 - Negative</title>\n</head>\n<body>\n<table border="1" summary="This table shows the number of cups of coffee consumed by each senator, the type of coffee (decaf or regular), and whether taken with sugar.">\n\n<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\n<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\n<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\n<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\n<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\n<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(433, 241, '0', 'Table markup is not used for tabular information.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #241.1 - Positive</title>\n</head>\n<body>\n\n<p>\n<pre>\nname           number of cups   type   with sugar\nAdams, Willie      2          regular     sugar\nBacon, Lise        4          regular     no sugar\nChaput, Maria      1          decaf       sugar\nDi Nino, Consiglio 0          n/a         n/a\nEggleton, Art      6          regular     no sugar \n</pre>\n</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(434, 242, '1', '<code>caption</code> identifies the <code>table</code>.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #242.2 - Negative</title>\n</head>\n<body>\n<table border="1"><caption>Cups of coffee consumed by each senator</caption>\n\n<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\n<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\n<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\n<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\n<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\n<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(435, 242, '0', '<code>caption</code> does not identify the <code>table</code>.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #242.2 - Positive</title>\n</head>\n<body>\n<table border="1"><caption>Caption Goes Here</caption>\n\n<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\n<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\n<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\n<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\n<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\n<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(436, 243, '1', 'The table summary and caption are different.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #243.2 - Negative</title>\n</head>\n<body>\n<table border="1" summary="This table shows the number of cups of coffee consumed by each senator, the type of coffee (decaf or regular), and whether taken with sugar."><caption>Cups of coffee consumed by each senator</caption>\n\n<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\n<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\n<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\n<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\n<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\n<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(437, 243, '0', 'The table summary is the same as the table caption.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #243.2 - Positive</title>\n</head>\n<body>\n<table border="1" summary="cups of coffee consumed by each senator"><caption>Cups of coffee consumed by each senator</caption>\n\n<tr><th>name</th><th>number of cups</th><th>type</th><th>with sugar</th></tr>\n<tr><td>Adams, Willie</td><td>2</td><td>regular</td><td>sugar</td></tr>\n<tr><td>Bacon, Lise</td><td>4</td><td>regular</td><td>no sugar</td></tr>\n<tr><td>Chaput, Maria</td><td>1</td><td>decaf</td><td>sugar</td></tr>\n<tr><td>Di Nino, Consiglio</td><td>0</td><td>not applicable</td><td>not applicable</td></tr>\n<tr><td>Eggleton, Art</td><td>6</td><td>regular</td><td>no sugar</td></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(438, 244, '1', 'Data table with both row and column headers contains <code>scope</code> attributes.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #244.2 - Negative</title>\n</head>\n<body>\n\n<table border="1">\n<tr><th scope="col">Name</th><th scope="col">Birth</th><th scope="col">Gender</th></tr>\n<tr><th scope="row">Clayton</th><td>2005-10-10</td><td>male</td></tr>\n<tr><th scope="row">Carol</th><td>2005-10-11</td><td>female</td></tr>\n<tr><th scope="row">Susan</th><td>2005-10-12</td><td>female</td></tr>\n<tr><th scope="row">Oleg</th><td>2005-10-13</td><td>male</td></tr>\n<tr><th scope="row">Belnar</th><td>2005-10-14</td><td>male</td></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(439, 244, '0', 'Data table with both row and column headers does not contain <code>scope</code> attributes.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #244.1 - Positive</title>\n</head>\n<body>\n\n<table border="1">\n<tr><th>Name</th><th>Birth</th><th>Gender</th></tr>\n<tr><th>Clayton</th><td>2005-10-10</td><td>male</td></tr>\n<tr><th>Carol</th><td>2005-10-11</td><td>female</td></tr>\n<tr><th>Susan</th><td>2005-10-12</td><td>female</td></tr>\n<tr><th>Oleg</th><td>2005-10-13</td><td>male</td></tr>\n<tr><th>Belnar</th><td>2005-10-14</td><td>male</td></tr>\n<tr></tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(440, 245, '1', 'Data table with multiple rows of column headers contains <code>id</code> and <code>headers</code> attributes.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #245.2 - Negative</title>\n</head>\n<body>\n\n<table border="1" >\n<tr>\n	<th id="class">Class</th>\n	<th id="teacher">Teacher</th>\n	<th id="males">Males</th>\n	<th id="females">Females</th>\n</tr>\n<tr>\n	<th id="firstyear" rowspan="2">First Year</th>\n	<th id="Bolter" headers="firstyear teacher">D. Bolter</th>\n	<td headers="firstyear Bolter males">5</td>\n	<td headers="firstyear Bolter females">4</td>\n</tr>\n<tr>\n	<th id="Cheetham" headers="firstyear teacher">A. Cheetham</th>\n	<td headers="firstyear Cheetham males">7</td>\n	<td headers="firstyear Cheetham females">9</td>\n</tr>\n<tr>\n	<th id="secondyear" rowspan="3">Second Year</th>\n	<th id="Lam" headers="secondyear teacher">M. Lam</th>\n	<td headers="secondyear Lam males">3</td>\n	<td headers="secondyear Lam females">9</td>\n</tr>\n<tr>\n	<th id="Crossy" headers="secondyear teacher">S. Crossy</th>\n	<td headers="secondyear Crossy males">4</td>\n	<td headers="secondyear Crossy females">3</td>\n</tr>\n<tr>\n	<th id="Forsyth" headers="secondyear teacher">A. Forsyth</th>\n	<td headers="secondyear Forsyth males">6</td>\n	<td headers="secondyear Forsyth females">9</td>\n</tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(441, 245, '0', 'Data table with multiple rows of column headers does not contain <code>id</code> or <code>headers</code> attributes.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #245.1 - Positive</title>\n</head>\n<body>\n\n<table border="1" >\n<tr>\n	<th>Class</th>\n	<th>Teacher</th>\n	<th>Males</th>\n	<th>Females</th>\n</tr>\n<tr>\n	<th rowspan="2">First Year</th>\n	<th>D. Bolter</th>\n	<td>5</td>\n	<td>4</td>\n</tr>\n<tr>\n	<th>A. Cheetham</th>\n	<td>7</td>\n	<td>9</td>\n</tr>\n<tr>\n	<th rowspan="3">Second Year</th>\n	<th>M. Lam</th>\n	<td>3</td>\n	<td>9</td>\n</tr>\n<tr>\n	<th>S. Crossy</th>\n	<td>4</td>\n	<td>3</td>\n</tr>\n<tr>\n	<th>A. Forsyth</th>\n	<td>6</td>\n	<td>9</td>\n</tr>\n</table>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(442, 246, '1', 'Required fields (first name and last name) are marked as "required".', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #246.2 - Negative</title>\n</head>\n<body>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="firstname">First Name (required):</label>\n<input type="text" id="firstname" /><br/>\n<label for="lastname">Last Name (required):</label>\n<input type="text" id="lastname" /><br/>\n<label for="colour">Favourite Colour:</label>\n<input type="text" id="colour" /><br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(443, 246, '0', 'Required fields (first name and last name) are not marked as "required".', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #246.1 - Positive</title>\n</head>\n<body>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="firstname">First Name:</label>\n<input type="text" id="firstname" /><br/>\n<label for="lastname">Last Name:</label>\n<input type="text" id="lastname" /><br/>\n<label for="colour">Favourite Colour:</label>\n<input type="text" id="colour" /><br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(444, 247, '1', 'Checkbox group contains both <code>fieldset</code> and <code>legend</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r\r\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<META content="text/xhtml; charset=UTF-8" http-equiv="Content-Type">\r\r<title>ATRC Testfile - Check #247.2 - Negative</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<fieldset>\r<legend>Donuts Requested (check all that apply)</legend>\r<p>\r<input type="checkbox" name="flavour" id="choc" value="chocolate" />\r<label for="choc">Chocolate</label><br/>\r<input type="checkbox" name="flavour" id="cream" value="cream" />\r<label for="cream">Cream Filled</label><br/>\r<input type="checkbox" name="flavour" id="honey" value="honey" />\r<label for="honey">Honey Glazed</label>\r</p>\r</fieldset>\r<p><input type="submit" value="Purchase Donuts"/></p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(445, 247, '0', 'Checkbox group contains no <code>fieldset</code> or <code>legend</code> elements.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #247.1 - Positive</title>\r</head>\r<body>\r\r<form action="http://example.com/donut" method="post">\r<p>\r<input type="checkbox" name="flavour" id="choc" value="chocolate" />\r<label for="choc">Chocolate</label><br/>\r<input type="checkbox" name="flavour" id="cream" value="cream"/>\r<label for="cream">Cream Filled</label><br/>\r<input type="checkbox" name="flavour" id="honey" value="honey"/>\r<label for="honey">Honey Glazed</label>\r<br/><input type="submit" value="Purchase Donuts"/>\r</p>\r</form>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(446, 248, '1', 'Visual list contains proper markup.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #248.2 - Negative</title>\n</head>\n<body>\n\n<ul>\n<li>chocolate</li>\n<li>vanilla</li>\n<li>cherry</li>\n<li>bananna</li>\n</ul>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(447, 248, '0', 'Visual list does not contain proper markup.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #248.1 - Positive</title>\n</head>\n<body>\n\n<p>\n* chocolate<br/>\n* vanilla<br/>\n* cherry<br/>\n* bananna<br/>\n</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(448, 249, '1', 'Semantic markup is used for emphasized and special text.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #249.2 - Negative</title>\n</head>\n<body>\n\n<p>The following is an excerpt from the <cite>The Story of my Life</cite> by Helen Keller</p>\n <blockquote>\n <p>Even in the days before my teacher came, I used to feel along the square stiff boxwood\n hedges, and, guided by the sense of smell, would find the first violets and lilies.  \n There, too, after a fit of temper, I went to find comfort and to hide my hot face \n in the cool leaves and grass.</p>\n </blockquote>\n\n<p>Helen Keller said, <q>Self-pity is our worst enemy and if we yield to it, \nwe can never do anything good in the world.</q></p>\n\n<p>Beth received 1<sup>st</sup> place in the 9<sup>th</sup> grade science competition.</p>\n<p>The chemical notation for water is H<sub>2</sub>O.</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(449, 249, '0', 'Semantic markup not used for emphasized and special text.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #249.1 - Positive</title>\n</head>\n<body>\n\n<p>The following is an excerpt from the The Story of my Life by Helen Keller</p>\n\n <p>Even in the days before my teacher came, I used to feel along the square stiff boxwood\n hedges, and, guided by the sense of smell, would find the first violets and lilies.  \n There, too, after a fit of temper, I went to find comfort and to hide my hot face \n in the cool leaves and grass.</p>\n\n\n<p>Helen Keller said, Self-pity is our worst enemy and if we yield to it, \nwe can never do anything good in the world.</p>\n\n<p>Beth received 1st place in the 9th grade science competition.</p>\n<p>The chemical notation for water is H2O.</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(450, 250, '1', 'Submit button is referenced by both shape and text.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #250.2 - Negative</title>\n</head>\n<body>\n\n<p>To submit the form, press the round button labeled GO</p>\n\n<form action="http://example.com" method="post">\n<p>\n<input type="image" name="submit" src="go.gif" alt="go"/>\n</p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(451, 250, '0', 'Submit button is referenced by shape alone.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #250.1 - Positive</title>\n</head>\n<body>\n\n<p>To submit the form, press the round button.</p>\n\n<form action="http://example.com" method="post">\n<p>\n<input type="image" name="submit" src="go.gif" alt="go"/>\n</p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(452, 251, '1', 'The luminosity contrast ratio between text and background color is greater than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #251.2 - Negative</title>\n</head>\n<body>\n<p><img src="contrast2.gif" alt="hello"/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(453, 251, '0', 'The luminosity contrast ratio between text and background color is less than 5:1.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #251.1 - Positive</title>\n</head>\n<body>\n<p><img src="contrast1.gif" alt="hello"/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(454, 252, '1', 'All text colors are set.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #252.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" text="#000000" link="#000000" vlink="#000000" alink="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(455, 252, '0', 'The text color and background color are set but other colors are not set.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #252.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" text="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(456, 253, '1', 'The luminosity contrast ratio between text and background color is greater than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #253.2 - Negative</title>\n</head>\n<body>\n<p><img src="contrast2.gif" alt="hello"/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(457, 253, '0', 'The luminosity contrast ratio between text and background color is less than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #253.1 - Positive</title>\n</head>\n<body>\n<p><img src="contrast1.gif" alt="hello"/></p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(458, 254, '1', 'The luminosity contrast ratio between text and background color is greater than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #254.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" text="#000000">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(459, 254, '0', 'The luminosity contrast ratio between text and background color is less than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #254.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" text="#cccccc">\r<p>This is some example text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(460, 255, '1', 'The luminosity contrast ratio between link and background color is greater than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #255.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" link="#000000">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(461, 255, '0', 'The luminosity contrast ratio between link and background color is less than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #255.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" link="#cccccc">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(462, 256, '1', 'The luminosity contrast ratio between active link and background color is greater than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #257.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" alink="#000000">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(463, 256, '0', 'The luminosity contrast ratio between active link and background color is less than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #256.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" alink="#cccccc">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(464, 257, '1', 'The luminosity contrast ratio between visited link and background color is greater than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #257.2 - Negative</title>\r</head>\r<body bgcolor="#ffffff" vlink="#000000">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(465, 257, '0', 'The luminosity contrast ratio between visited link and background color is less than 10:1.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #257.1 - Positive</title>\r</head>\r<body bgcolor="#ffffff" vlink="#cccccc">\r<p>This is some <a href="http://www.example.com">example</a> text.</p>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(466, 258, '1', '<code>applet</code> has a keyboard mechanism that returns focus to the parent window.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #258.2 - Positive</title>\r</head>\r<body>\r<p>The following applet is not working. This is just an example.</p>\r\r<applet code="Press2.class" width="500" height="500"></applet> \r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(467, 258, '0', '<code>applet</code> does not have a keyboard mechanism that returns focus to the parent window.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #258.1 - Positive</title>\r</head>\r<body>\r<p>The following applet is not working. This is just an example.</p>\r\r<applet code="Press1.class" width="500" height="500"> </applet> \r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(468, 259, '1', '<code>object</code> has a keyboard mechanism that returns focus to the parent window.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #259.2 - Positive</title>\r</head>\r<body>\r<p>The following object is not working. This is just an example.</p>\r\r<object classid="http://www.test2.com" title="a simple object" />\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(469, 259, '0', '<code>object</code> does not have a keyboard mechanism that returns focus to the parent window.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #259.1 - Positive</title>\r</head>\r<body>\r<p>The following object is not working. This is just an example.</p>\r\r<object classid="http://www.test1.com" title="a simple object" />\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(470, 260, '1', '<code>embed</code> has a keyboard mechanism that returns focus to the parent window.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #260.2 - Positive</title>\r</head>\r<body>\r<p>The following embed is not working. This is just an example.</p>\r\r<embed alt="demo movie" src="demo.mov"/>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(471, 260, '0', '<code>embed</code> does not have a keyboard mechanism that returns focus to the parent window.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"\r"http://www.w3.org/TR/html4/loose.dtd">\r<html lang="en">\r<head>\r<title>ATRC Testfile - Check #260.1 - Positive</title>\r</head>\r<body>\r<p>The following embed is not working. This is just an example.</p>\r\r<embed alt="demo movie" src="demo.mov"/>\r\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(472, 261, '1', 'Sections are marked with headers.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #261.2 - Negative</title>\n</head>\n<body>\n<h1>H69: Providing Heading elements at the beginning of each section of content</h1>\n\n<h2>Applicability</h2>\n<p>HTML and XHTML </p>\n\n<h2>This technique is referenced from:</h2>\n<p>How to Meet Success Criterion 2.4.1 </p>\n\n<h2>User Agent and Assistive Technology Support Notes</h2>\n<p>Home Page Reader, JAWS, and WindowEyes all provide navigation via headings and provide information about the level of the heading. The Opera browser provides a mechanism to navigate by headings. Additional plugins support navigation by headings in other user agents.</p>\n\n<h2>Description</h2>\n<p>The objective of this technique is to demonstrate how using the heading elements, h and h1 - h6, to markup the beginning of each section in the content can assist in navigation. Most assistive technologies and many user agents provide a mechanism to navigate by heading elements by providing keyboard commands that allow users to jump from one heading to the next. Using heading elements to markup sections of a document allows users to easily navigate from section to section.</p>\n\n<h2>Examples</h2>\n\n<p>Example 1...</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(473, 261, '0', 'Sections are not marked with headers.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #261.1 - Positive</title>\n</head>\n<body>\n\n<p>\n<strong>H69: Providing Heading elements at the beginning of each section of content</strong><br/>\n\n<strong>Applicability</strong><br/>\nHTML and XHTML <br/>\n\n<strong>This technique is referenced from:</strong><br/>\nHow to Meet Success Criterion 2.4.1 <br/>\n\n<strong>User Agent and Assistive Technology Support Notes</strong><br/>\nHome Page Reader, JAWS, and WindowEyes all provide navigation via headings and provide information about the level of the heading. The Opera browser provides a mechanism to navigate by headings. Additional plugins support navigation by headings in other user agents.<br/>\n\n<strong>Description</strong><br/>\nThe objective of this technique is to demonstrate how using the heading elements, h and h1 - h6, to markup the beginning of each section in the content can assist in navigation. Most assistive technologies and many user agents provide a mechanism to navigate by heading elements by providing keyboard commands that allow users to jump from one heading to the next. Using heading elements to markup sections of a document allows users to easily navigate from section to section.<br/>\n\n<strong>Examples</strong><br/>\nExample 1...\n</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(474, 262, '1', 'Groups of related links are marked.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #262.2 - Negative</title>\n</head>\n<body>\n\n<h2><a name="categories" id="categories"></a>Product Categories</h2>\n<ul class="navigation">\n    <li><a href="kitchen.html">Kitchen</a></li>\n    <li><a href="bedbath.html">Bed &amp; Bath</a></li>\n    <li><a href="dining.html">Fine Dining</a></li>\n    <li><a href="lighting.html">Lighting</a></li>\n    <li><a href="storage.html">Storage</a></li>\n</ul>\n\n<div title="Breadcrumb trail" class="breadcrumb">\n   <a href="home.html">Home</a> :\n   <a href="technology.html">Web Accessibility</a> :\n   <a href="guideline.html">Guidelines</a> :\n   1.3\n</div> \n\n<p>\n<map title="Navigation Bar" id="navbar">\n<p>\n [<a href="home.html">Home</a>] \n [<a href="search.html">Search</a>] \n [<a href="new.html">New and highlighted</a>] \n [<a href="sitemap.html">Site map</a>]\n</p>\n</map> \n</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(475, 262, '0', 'Groups of related links are not marked.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #262.1 - Positive</title>\n</head>\n<body>\n\n<h2>Product Categories</h2>\n<p><a href="kitchen.html">Kitchen</a></p>\n<p><a href="bedbath.html">Bed &amp; Bath</a></p>\n<p><a href="dining.html">Fine Dining</a></p>\n<p><a href="lighting.html">Lighting</a></p>\n<p><a href="storage.html">Storage</a></p>\n\n<p>\n<a href="home.html">Home</a> :\n<a href="technology.html">Web Accessibility</a> :\n<a href="guideline.html">Guidelines</a> :\n</p>\n\n<p>\n[<a href="home.html">Home</a>] \n[<a href="search.html">Search</a>] \n[<a href="new.html">New and highlighted</a>] \n[<a href="sitemap.html">Site map</a>]\n</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(476, 263, '1', 'Similar types of content appear in the same frame.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #263.2 - Negative</title>\n</head>\n<body>\n\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(477, 263, '0', 'Different types of content appear in the same frame.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #263.1 - Positive</title>\n</head>\n<body>\n\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(478, 264, '1', 'Submit <code>input</code> element has valid <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #264.2 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<input type="submit" value="submit" tabindex="" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(479, 264, '0', 'Submit <code>input</code> element does not have <code>tabindex</code> attribute.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #264.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<input type="submit" value="submit" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(480, 265, '1', 'Tab order is logical.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #264.3 - Negative</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<input type="submit" value="submit" tabindex="1" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(481, 265, '0', 'Tab order is not logical.', '<?xml version="1.0" encoding="UTF-8"?>\r<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\r<head>\r<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\r<title>ATRC Testfile - Check #264.1 - Positive</title>\r</head>\r<body>\r<form action="http://www.example.com" method="post">\r<p>\r<input type="submit" value="submit" />\r</p>\r</form>\r</body>\r</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(482, 266, '1', 'Document contains a breadcrumb trail.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #266.2 - Negative</title>\n</head>\n<body>\n\n<p><a href="home.html">home</a> | <a href="dogs.html">dogs</a> | <a href="big dogs.html">big dogs</a> | German Shepherd</p>\n\n<h1>All About German Shepherds</h1>\n<p>The German Shepherd is a big dog.</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(483, 266, '0', 'Document does not contain a breadcrumb trail.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #266.1 - Positive</title>\n</head>\n<body>\n\n<h1>All About German Shepherds</h1>\n<p>The German Shepherd is a big dog.</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(484, 267, '1', 'Form submission error message identifies required fields.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #267.2 - Negative</title>\n</head>\n<body>\n\n<p>Assume the form below was submitted to the server and has now been returned with an error message.</p>\n\n<p><strong>Error:</strong> First name and last name fields were incomplete.</p>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="firstname">First Name (required):</label>\n<input type="text" id="firstname" /><br/>\n<label for="lastname">Last Name (required):</label>\n<input type="text" id="lastname" /><br/>\n<label for="colour">Favourite Colour:</label>\n<input type="text" id="colour" /><br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(485, 267, '0', 'Form submission error message does not identify required fields.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #267.1 - Positive</title>\n</head>\n<body>\n\n<p>Assume the form below was submitted to the server and has now been returned with an error message.</p>\n\n<p><strong>Error:</strong> Form submission incomplete.</p>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="firstname">First Name (required):</label>\n<input type="text" id="firstname" /><br/>\n<label for="lastname">Last Name (required):</label>\n<input type="text" id="lastname" /><br/>\n<label for="colour">Favourite Colour:</label>\n<input type="text" id="colour" /><br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(486, 268, '1', 'Form submission error message provides assistance.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #268.2 - Negative</title>\n</head>\n<body>\n\n<p>Assume the form below was submitted to the server and has now been returned with an error message.</p>\n\n<p><strong>Error:</strong> Date should be entered as dd mm yyyy (e.g. 30 12 2006).</p>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="date">date:</label>\n<input type="text" id="firstname" /><br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(487, 268, '0', 'Form submission error message does not provide assistance.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #268.1 - Positive</title>\n</head>\n<body>\n\n<p>Assume the form below was submitted to the server and has now been returned with an error message.</p>\n\n<p><strong>Error:</strong> Form submission wrong.</p>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="date">date:</label>\n<input type="text" id="firstname" /><br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(488, 269, '1', 'Form submission process allows user to correct data before final acceptance.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #269.2 - Negative</title>\n</head>\n<body>\n\n<p>Shown below are the steps required to purchase a concert ticket.</p>\n\n<ol>\n<li>User fills out the form and selects the "submit" button.</li>\n<li>Data is presented to user with the option to correct data or submit it.</li>\n<li>If user submits form then credit card is charged for the tickets and tickets are mailed to user.</li>\n</ol>\n\n<h1>Step 1 - fill out form</h1>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="concert">concert</label>\n<select name="concert" id="concert">\n<option label="Beethoven" value="c1">\nBeethoven\n</option>\n<option label="Mozart" value="c2">\nMozart\n</option>\n<option label="Mamaday" value="c3">\nMamaday\n</option>\n<option label="U2" value="c4">\nU2\n</option>\n</select>\n\n<br/><label for="card">credit card:</label>\n<input type="text" size="30" id="card" name="card"/>\n\n<br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n<h1>Step 2 - data is presented to user</h1>\n\n<p>Please review the data below. If the data is correct select the "Purchase Ticket" button. If data is not correct then select this link to <a href="http://www.test.com/fix">modify the data</a>.</p>\n\n<form action="http://www.test.com">\n\n<p>\n<label for="concert">concert</label>\n<select name="concert" id="concert">\n<option label="Beethoven" value="c1">\nBeethoven\n</option>\n<option label="Mozart" value="c2" selected="selected">\nMozart\n</option>\n<option label="Mamaday" value="c3">\nMamaday\n</option>\n<option label="U2" value="c4">\nU2\n</option>\n</select>\n\n<br/><label for="card">credit card:</label>\n<input type="text" size="30" id="card" name="card" value="1234xxxxxxx567"/>\n\n<br/>\n<input type="submit" value="Purchase Ticket"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(489, 269, '0', 'Form submission proces does not allow user to correct data before final acceptance.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #269.1 - Positive</title>\n</head>\n<body>\n\n<p>Shown below are the steps required to purchase a concert ticket.</p>\n\n<ol>\n<li>User fills out the form and selects the "submit" button.</li>\n<li>User''s credit card is charged for the tickets and tickets are mailed to user.</li>\n</ol>\n\n\n<form action="http://www.test.com">\n\n<p>\n<label for="concert">concert</label>\n<select name="concert" id="concert">\n<option label="Beethoven" value="c1">\nBeethoven\n</option>\n<option label="Mozart" value="c2">\nMozart\n</option>\n<option label="Mamaday" value="c3">\nMamaday\n</option>\n<option label="U2" value="c4">\nU2\n</option>\n</select>\n\n<br/><label for="card">credit card:</label>\n<input type="text" size="30" id="card" name="card"/>\n\n<br/>\n<input type="submit" value="submit"/>\n</p>\n\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(490, 270, '1', 'Unicode right-to-left marking is present and HTML bidirectional algorithm produces desirable results.', '?<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #270.2 - Negative</title>\n</head>\n<body>\n\n<p>The title is "????? ?????? ?????!&amp;rlm;" in Arabic.</p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(491, 270, '0', 'Unicode right-to-left marking is missing from text and HTML bidirectional algorithm produces undesirable results.', '?<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #270.1 - Positive</title>\n</head>\n<body><p>The title is "????? ?????? ?????!" in Arabic.\n\n</p></body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(492, 271, '1', 'Block of text with a reading order different from the primary language is marked using the <code>dir</code> attribute.', '?<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #271.2 - Negative</title>\n</head>\n<body>\n\n<p>The title says "<span lang="he" dir="rtl">?????? ???');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(493, 271, '0', 'Block of text with a reading order different from the primary language is not marked using the <code>dir</code> attribute.', '?<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #271.1 - Positive</title>\n</head>\n<body>\n\n<p>The title says "<span lang="he">?????? ???');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(494, 272, '1', 'Form allows user to delete information and provides a method of recovery.', '?<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #272.2 - Negative</title>\n</head>\n<body>\n\n<p>Use the form below to remove your report from the repository.<br/>\nSelect the following link if you would like to <a href="http://www.example.com">recover a report</a> that has been previously deleted.</p>\n\n<form action="http://www.example.com" method="post">\n<p>\n<label for="r1">Report Name:</label> <input type="text" id="r1" /><br/>\n<input type="submit" value="Delete Report" />\n</p>\n</form>\n\n<p></p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(495, 272, '0', 'Form allows user to delete information without allowing recovery.', '?<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #272.1 - Positive</title>\n</head>\n<body>\n\n<p>Use the form below to remove your report from the repository.</p>\n\n<form action="http://www.example.com" method="post">\n<p>\n<label for="r1">Report Name:</label> <input type="text" id="r1" /><br/>\n<input type="submit" value="Delete Report" />\n</p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(496, 273, '1', 'Document''s primary reading order is right to left and <code>dir</code> attribute is set.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #273.2 - Negative</title>\n</head>\n<body>\n\n<p></p>\n\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(497, 273, '0', 'Document''s primary reading order is right to left but <code>dir</code> attribute is not set.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ar" lang="ar">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #273.1 - Positive</title>\n</head>\n<body>\n\n<p></p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(498, 274, '1', 'Window change occurs only after user selects form submit button.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #274.2 - Positive</title>\n</head>\n<body>\n\n<form action="http://www.example.com" method="post">\n<p>\n<select name="flavour">\n<option>Choose A Flavour</option>\n<option value="c">chocolate</option>\n<option value="v">vanilla</option>\n<option value="m">mango</option>\n</select><br/>\n<input type="submit" value="submit flavour" />\n</p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(499, 274, '0', 'Window changes when user selects option.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>Testfile - Check #274.1 - Positive</title>\n</head>\n<body>\n\n<form action="http://www.example.com" method="post">\n<p>\n<select name="flavour" onchange="this.form.submit();">\n<option>Select a flavour</option>\n<option value="c">chocolate</option>\n<option value="v">vanilla</option>\n<option value="m">mango</option>\n</select>\n</p>\n</form>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(500, 275, '1', 'Does not open a new page when loaded.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #275.2 - Negative</title>\n</head>\n<body>\n<p>This page does not cause a new window to open.</p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(501, 275, '0', 'Opens a new page when loaded.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #275.1 - Positive</title>\n<script>\nwindow.onload = showAdvertisement;\nfunction showAdvertisement()\n{\n	window.open(''275-2.html'', ''_blank'', ''height=200,width=150'');\n}\n</script>\n\n</head>\n\n<body>\n<p>This page will open a new window upon loading as long as scripting is enabled.</p>\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(502, 276, '1', 'Links appear in the same order as the other page.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #276.1 - Negative</title>\n</head>\n<body>\n\n<p>Here is a link to <a href="276-3.html">another page</a>. Note that the first link below is ''home''.</p>\n\n<p><a href="home.html">home</a> | <a href="dogs.html">dogs</a> | <a href="cats.html">cats</a></p>\n\n</body>\n</html>');
INSERT INTO `check_examples` (`check_example_id`, `check_id`, `type`, `description`, `content`) VALUES(503, 276, '0', 'Links do not appear in the same order as the other page.', '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n<head>\n<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />\n<title>ATRC Testfile - Check #276.3 - Positive</title>\n</head>\n<body>\n\n<p>Here is a link to <a href="276-1.html">another page</a>. Note that the first link below is ''dogs''.</p>\n\n<p><a href="dogs.html">dogs</a> | <a href="cats.html">cats</a> | <a href="home.html">home</a></p>\n\n</body>\n</html>');

-- --------------------------------------------------------

--
-- Table structure for table `check_prerequisites`
--

CREATE TABLE IF NOT EXISTS `check_prerequisites` (
  `check_id` mediumint(8) unsigned NOT NULL,
  `prerequisite_check_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`check_id`,`prerequisite_check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `check_prerequisites`
--

INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(2, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(3, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(4, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(5, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(6, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(7, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(8, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(11, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(15, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(16, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(32, 31);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(49, 48);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(53, 51);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(54, 51);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(59, 58);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(60, 58);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(61, 58);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(62, 58);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(65, 64);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(79, 78);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(112, 111);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(113, 111);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(113, 112);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(153, 152);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(157, 156);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(158, 156);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(166, 165);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(169, 91);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(178, 1);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(189, 188);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(191, 190);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(192, 58);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(193, 58);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(194, 64);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(197, 174);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(201, 31);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(203, 111);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(205, 216);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(208, 91);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(209, 91);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(210, 91);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(212, 95);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(213, 57);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(214, 212);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(217, 206);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(218, 213);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(219, 206);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(220, 204);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(240, 145);
INSERT INTO `check_prerequisites` (`check_id`, `prerequisite_check_id`) VALUES(273, 49);

-- --------------------------------------------------------

--
-- Table structure for table `color_mapping`
--

CREATE TABLE IF NOT EXISTS `color_mapping` (
  `color_name` varchar(50) NOT NULL default '',
  `color_code` varchar(6) default NULL,
  PRIMARY KEY  (`color_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color_mapping`
--

INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('aliceblue', 'F0F8FF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('antiquewhite', 'FAEBD7');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('aqua', '00FFFF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('aquamarine', '7FFFD4');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('azure', 'F0FFFF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('beige', 'F5F5DC');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('bisque', 'FFE4C4');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('black', '000000');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('blanchedalmond', 'FFEBCD');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('blue', '0000FF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('blueviolet', '8A2BE2');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('brown', 'A52A2A');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('burlywood', 'DEB887');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('cadetblue', '5F9EA0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('chartreuse', '7FFF00');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('chocolate', 'D2691E');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('coral', 'FF7F50');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('cornflowerblue', '6495ED');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('cornsilk', 'FFF8DC');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('crimson', 'DC143C');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('cyan', '00FFFF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkblue', '00008B');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkcyan', '008B8B');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkgoldenrod', 'B8860B');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkgray', 'A9A9A9');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkgreen', '006400');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkkhaki', 'BDB76B');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkmagenta', '8B008B');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkolivegreen', '556B2F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkorange', 'FF8C00');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkorchid', '9932CC');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkred', '8B0000');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darksalmon', 'E9967A');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkseagreen', '8FBC8F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkslateblue', '483D8B');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkslategray', '2F4F4F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkturquoise', '00CED1');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('darkviolet', '9400D3');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('deeppink', 'FF1493');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('deepskyblue', '00BFFF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('dimgray', '696969');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('dodgerblue', '1E90FF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('firebrick', 'B22222');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('floralwhite', 'FFFAF0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('forestgreen', '228B22');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('fuchsia', 'FF00FF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('gainsboro', 'DCDCDC');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('ghostwhite', 'F8F8FF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('gold', 'FFD700');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('goldenrod', 'DAA520');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('gray', '808080');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('green', '008000');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('greenyellow', 'ADFF2F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('honeydew', 'F0FFF0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('hotpink', 'FF69B4');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('indianred', 'CD5C5C');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('indigo', '4B0082');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('ivory', 'FFFFF0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('khaki', 'F0E68C');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lavender', 'E6E6FA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lavenderblush', 'FFF0F5');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lawngreen', '7CFC00');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lemonchiffon', 'FFFACD');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightblue', 'ADD8E6');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightcoral', 'F08080');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightcyan', 'E0FFFF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightgoldenrodyellow', 'FAFAD2');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightgreen', '90EE90');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightgrey', 'D3D3D3');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightpink', 'FFB6C1');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightsalmon', 'FFA07A');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightseagreen', '20B2AA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightskyblue', '87CEFA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightslategray', '778899');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightsteelblue', 'B0C4DE');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lightyellow', 'FFFFE0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('lime', '00FF00');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('limegreen', '32CD32');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('linen', 'FAF0E6');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('magenta', 'FF00FF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('maroon', '800000');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumaquamarine', '66CDAA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumblue', '0000CD');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumorchid', 'BA55D3');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumpurple', '9370DB');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumseagreen', '3CB371');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumslateblue', '7B68EE');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumspringgreen', '00FA9A');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumturquoise', '48D1CC');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mediumvioletred', 'C71585');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('midnightblue', '191970');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mintcream', 'F5FFFA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('mistyrose', 'FFE4E1');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('moccasin', 'FFE4B5');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('navajowhite', 'FFDEAD');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('navy', '000080');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('oldlace', 'FDF5E6');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('olive', '808000');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('olivedrab', '6B8E23');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('orange', 'FFA500');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('orangered', 'FF4500');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('orchid', 'DA70D6');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('palegoldenrod', 'EEE8AA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('palegreen', '98FB98');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('paleturquoise', 'AFEEEE');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('palevioletred', 'DB7093');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('papayawhip', 'FFEFD5');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('peachpuff', 'FFDAB9');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('peru', 'CD853F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('pink', 'FFC0CB');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('plum', 'DDA0DD');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('powderblue', 'B0E0E6');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('purple', '800080');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('red', 'FF0000');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('rosybrown', 'BC8F8F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('royalblue', '4169E1');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('saddlebrown', '8B4513');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('salmon', 'FA8072');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('sandybrown', 'F4A460');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('seagreen', '2E8B57');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('seashell', 'FFF5EE');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('sienna', 'A0522D');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('silver', 'C0C0C0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('skyblue', '87CEEB');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('slateblue', '6A5ACD');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('slategray', '708090');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('snow', 'FFFAFA');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('springgreen', '00FF7F');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('steelblue', '4682B4');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('tan', 'D2B48C');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('teal', '008080');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('thistle', 'D8BFD8');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('tomato', 'FF6347');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('turquoise', '40E0D0');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('violet', 'EE82EE');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('wheat', 'F5DEB3');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('white', 'FFFFFF');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('whitesmoke', 'F5F5F5');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('yellow', 'FFFF00');
INSERT INTO `color_mapping` (`color_name`, `color_code`) VALUES('yellowgreen', '9ACD32');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `name` char(30) NOT NULL default '',
  `value` char(255) NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`name`, `value`) VALUES('site_name', 'Web Accessibility Checker');
INSERT INTO `config` (`name`, `value`) VALUES('contact_email', 'g.gay@utoronto.ca');

-- --------------------------------------------------------

--
-- Table structure for table `guidelines`
--

CREATE TABLE IF NOT EXISTS `guidelines` (
  `guideline_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `title` varchar(255) default NULL,
  `abbr` varchar(100) default NULL,
  `long_name` varchar(255) default NULL,
  `published_date` date default NULL,
  `earlid` varchar(255) default NULL,
  `preamble` text,
  `status` tinyint(3) unsigned NOT NULL default '0',
  `open_to_public` tinyint(4) NOT NULL default '0',
  `seal_icon_name` varchar(255) default NULL,
  `subset` tinyint(4) NOT NULL default '0' COMMENT 'Value 0 means this guideline is not a subset of any other guidelines. Non-zero value means this guideline is the subset of others. The guideline with lower value is the subset of the guidelines with higher value.',
  PRIMARY KEY  (`guideline_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `guidelines`
--

INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(1, 0, 'BITV 1.0 (Level 2)', 'BITV1', '_GNAME_1', '2004-04-02', 'http://123barrierefrei.de/', NULL, 1, 1, 'iconBITV.png', 0);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(2, 0, 'Section 508', '508', '_GNAME_2', '2004-03-12', 'http://www.access-board.gov/sec508', NULL, 1, 1, 'icon508.png', 0);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(3, 0, 'Stanca Act', 'STANCA', '_GNAME_3', '2005-12-20', 'http://www.pubbliaccesso.it/index.htm', NULL, 1, 1, 'iconStanca.png', 0);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(4, 0, 'WCAG 1.0 (Level A)', 'WCAG1-A', '_GNAME_4', '2004-03-17', 'http://www.w3.org/TR/WCAG10/#a', NULL, 1, 1, 'iconA.png', 4);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(5, 0, 'WCAG 1.0 (Level AA)', 'WCAG1-AA', '_GNAME_5', '2004-05-27', 'http://www.w3.org/TR/WCAG10/#aa', NULL, 1, 1, 'iconAA.png', 5);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(6, 0, 'WCAG 1.0 (Level AAA)', 'WCAG1-AAA', '_GNAME_6', '2004-03-17', 'http://www.w3.org/TR/WCAG10/#aaa', NULL, 1, 1, 'iconAAA.png', 6);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(7, 0, 'WCAG 2.0 (Level AA)', 'WCAG2 - (Level AA)', '_GNAME_7', '2006-06-19', 'http://www.w3.org/TR/WCAG20/#a', '', 1, 1, 'iconA.png', 1);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(8, 0, 'WCAG 2.0 (Level A)', 'WCAG2- (Level A)', '_GNAME_8', '2006-06-19', 'http://www.w3.org/TR/WCAG20/#aa', '', 1, 1, 'iconAA.png', 2);
INSERT INTO `guidelines` (`guideline_id`, `user_id`, `title`, `abbr`, `long_name`, `published_date`, `earlid`, `preamble`, `status`, `open_to_public`, `seal_icon_name`, `subset`) VALUES(9, 0, 'WCAG 2.0 (Level AAA)', 'WCAG2-(Level AAA)', '_GNAME_9', '2006-06-19', 'http://www.w3.org/TR/WCAG20/#aaa', '', 1, 1, 'iconAAA.png', 3);

-- --------------------------------------------------------

--
-- Table structure for table `guideline_groups`
--

CREATE TABLE IF NOT EXISTS `guideline_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `guideline_id` mediumint(8) unsigned default NULL,
  `name` varchar(255) default NULL,
  `abbr` varchar(100) default NULL,
  `principle` varchar(100) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `guideline_groups`
--

INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(1, 1, '_GROUPNAME_1', 'L1', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(2, 1, '_GROUPNAME_2', 'L2', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(3, 2, '_GROUPNAME_3', 'P. A', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(4, 2, '_GROUPNAME_4', 'P. B', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(5, 2, '_GROUPNAME_5', 'P. C', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(6, 2, '_GROUPNAME_6', 'P. D', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(7, 2, '_GROUPNAME_7', 'P. E', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(8, 2, '_GROUPNAME_8', 'P. F', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(9, 2, '_GROUPNAME_9', 'P. G', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(10, 2, '_GROUPNAME_10', 'P. H', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(11, 2, '_GROUPNAME_11', 'P. I', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(12, 2, '_GROUPNAME_12', 'P. J', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(13, 2, '_GROUPNAME_13', 'P. K', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(14, 2, '_GROUPNAME_14', 'P. L', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(15, 2, '_GROUPNAME_15', 'P. M', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(16, 2, '_GROUPNAME_16', 'P. N', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(17, 2, '_GROUPNAME_17', 'P. O', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(18, 2, '_GROUPNAME_18', 'P. P', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(19, 3, '_GROUPNAME_19', 'r1', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(20, 3, '_GROUPNAME_20', 'r2', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(21, 3, '_GROUPNAME_21', 'r3', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(22, 3, '_GROUPNAME_22', 'r4', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(23, 3, '_GROUPNAME_23', 'r5', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(24, 3, '_GROUPNAME_24', 'r6', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(25, 3, '_GROUPNAME_25', 'r7', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(26, 3, '_GROUPNAME_26', 'r8', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(27, 3, '_GROUPNAME_27', 'r9', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(28, 3, '_GROUPNAME_28', 'r10', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(29, 3, '_GROUPNAME_29', 'r11', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(30, 3, '_GROUPNAME_30', 'r12', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(31, 3, '_GROUPNAME_31', 'r13', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(32, 3, '_GROUPNAME_32', 'r14', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(33, 3, '_GROUPNAME_33', 'r15', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(34, 3, '_GROUPNAME_34', 'r16', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(35, 3, '_GROUPNAME_35', 'r17', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(36, 3, '_GROUPNAME_36', 'r18', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(37, 3, '_GROUPNAME_37', 'r19', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(38, 3, '_GROUPNAME_38', 'r20', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(39, 3, '_GROUPNAME_39', 'r21', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(40, 3, '_GROUPNAME_40', 'r22', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(41, 4, '_GROUPNAME_41', 'A', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(42, 5, '_GROUPNAME_42', 'A', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(43, 5, '_GROUPNAME_43', 'A', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(44, 6, '_GROUPNAME_44', 'A', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(45, 6, '_GROUPNAME_45', 'AA', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(46, 6, '_GROUPNAME_46', 'AAA', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(47, 7, '_GROUPNAME_47', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(48, 7, '_GROUPNAME_48', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(49, 7, '_GROUPNAME_49', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(50, 7, '_GROUPNAME_50', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(51, 7, '_GROUPNAME_51', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(52, 7, '_GROUPNAME_52', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(53, 7, '_GROUPNAME_53', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(54, 7, '_GROUPNAME_54', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(88, 7, '_GROUPNAME_88', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(56, 7, '_GROUPNAME_56', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(57, 7, '_GROUPNAME_57', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(58, 7, '_GROUPNAME_58', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(60, 8, '_GROUPNAME_60', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(61, 8, '_GROUPNAME_61', '', 'Preceivable');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(62, 8, '_GROUPNAME_62', '', 'Preceivable');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(63, 8, '_GROUPNAME_63', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(64, 8, '_GROUPNAME_64', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(65, 8, '_GROUPNAME_65', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(66, 8, '_GROUPNAME_66', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(67, 8, '_GROUPNAME_67', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(87, 8, '_GROUPNAME_87', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(69, 8, '_GROUPNAME_69', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(70, 8, '_GROUPNAME_70', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(71, 8, '_GROUPNAME_71', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(73, 9, '_GROUPNAME_73', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(74, 9, '_GROUPNAME_74', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(75, 9, '_GROUPNAME_75', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(76, 9, '_GROUPNAME_76', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(77, 9, '_GROUPNAME_77', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(78, 9, '_GROUPNAME_78', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(79, 9, '_GROUPNAME_79', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(80, 9, '_GROUPNAME_80', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(86, 9, '_GROUPNAME_86', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(82, 9, '_GROUPNAME_82', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(83, 9, '_GROUPNAME_83', '', '');
INSERT INTO `guideline_groups` (`group_id`, `guideline_id`, `name`, `abbr`, `principle`) VALUES(84, 9, '_GROUPNAME_84', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `guideline_subgroups`
--

CREATE TABLE IF NOT EXISTS `guideline_subgroups` (
  `subgroup_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned default NULL,
  `name` varchar(255) default NULL,
  `abbr` varchar(100) default NULL,
  PRIMARY KEY  (`subgroup_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=378 ;

--
-- Dumping data for table `guideline_subgroups`
--

INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(1, 1, '_SUBGROUPNAME_1', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(2, 1, '_SUBGROUPNAME_2', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(3, 1, '_SUBGROUPNAME_3', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(4, 1, '_SUBGROUPNAME_4', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(5, 1, '_SUBGROUPNAME_5', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(6, 1, '_SUBGROUPNAME_6', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(7, 1, '_SUBGROUPNAME_7', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(8, 1, '_SUBGROUPNAME_8', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(9, 1, '_SUBGROUPNAME_9', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(10, 1, '_SUBGROUPNAME_10', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(11, 1, '_SUBGROUPNAME_11', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(12, 1, '_SUBGROUPNAME_12', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(13, 1, '_SUBGROUPNAME_13', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(14, 1, '_SUBGROUPNAME_14', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(15, 1, '_SUBGROUPNAME_15', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(16, 1, '_SUBGROUPNAME_16', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(17, 1, '_SUBGROUPNAME_17', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(18, 1, '_SUBGROUPNAME_18', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(19, 1, '_SUBGROUPNAME_19', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(20, 1, '_SUBGROUPNAME_20', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(21, 1, '_SUBGROUPNAME_21', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(22, 1, '_SUBGROUPNAME_22', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(23, 1, '_SUBGROUPNAME_23', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(24, 1, '_SUBGROUPNAME_24', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(25, 1, '_SUBGROUPNAME_25', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(26, 1, '_SUBGROUPNAME_26', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(27, 1, '_SUBGROUPNAME_27', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(28, 1, '_SUBGROUPNAME_28', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(29, 1, '_SUBGROUPNAME_29', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(30, 1, '_SUBGROUPNAME_30', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(31, 1, '_SUBGROUPNAME_31', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(32, 1, '_SUBGROUPNAME_32', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(33, 1, '_SUBGROUPNAME_33', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(34, 1, '_SUBGROUPNAME_34', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(35, 1, '_SUBGROUPNAME_35', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(36, 1, '_SUBGROUPNAME_36', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(37, 1, '_SUBGROUPNAME_37', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(38, 1, '_SUBGROUPNAME_38', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(39, 1, '_SUBGROUPNAME_39', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(40, 1, '_SUBGROUPNAME_40', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(41, 1, '_SUBGROUPNAME_41', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(42, 1, '_SUBGROUPNAME_42', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(43, 1, '_SUBGROUPNAME_43', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(44, 1, '_SUBGROUPNAME_44', 'L1');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(45, 2, '_SUBGROUPNAME_45', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(46, 2, '_SUBGROUPNAME_46', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(47, 2, '_SUBGROUPNAME_47', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(48, 2, '_SUBGROUPNAME_48', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(49, 2, '_SUBGROUPNAME_49', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(50, 2, '_SUBGROUPNAME_50', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(51, 2, '_SUBGROUPNAME_51', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(52, 2, '_SUBGROUPNAME_52', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(53, 2, '_SUBGROUPNAME_53', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(54, 2, '_SUBGROUPNAME_54', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(55, 2, '_SUBGROUPNAME_55', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(56, 2, '_SUBGROUPNAME_56', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(57, 2, '_SUBGROUPNAME_57', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(58, 2, '_SUBGROUPNAME_58', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(59, 2, '_SUBGROUPNAME_59', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(60, 2, '_SUBGROUPNAME_60', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(61, 2, '_SUBGROUPNAME_61', 'L2');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(62, 3, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(63, 4, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(64, 5, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(65, 6, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(66, 7, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(67, 8, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(68, 9, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(69, 10, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(70, 11, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(71, 12, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(72, 13, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(73, 14, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(74, 15, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(75, 16, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(76, 17, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(77, 18, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(78, 19, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(79, 20, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(80, 21, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(81, 22, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(82, 23, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(83, 24, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(84, 25, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(85, 26, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(86, 27, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(87, 28, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(88, 29, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(89, 30, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(90, 31, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(91, 32, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(92, 33, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(93, 34, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(94, 35, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(95, 36, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(96, 37, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(97, 38, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(98, 39, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(99, 40, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(100, 41, '_SUBGROUPNAME_100', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(101, 41, '_SUBGROUPNAME_101', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(102, 41, '_SUBGROUPNAME_102', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(103, 41, '_SUBGROUPNAME_103', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(104, 41, '_SUBGROUPNAME_104', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(105, 41, '_SUBGROUPNAME_105', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(106, 41, '_SUBGROUPNAME_106', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(107, 41, '_SUBGROUPNAME_107', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(108, 41, '_SUBGROUPNAME_108', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(109, 41, '_SUBGROUPNAME_109', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(110, 41, '_SUBGROUPNAME_110', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(111, 41, '_SUBGROUPNAME_111', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(112, 41, '_SUBGROUPNAME_112', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(113, 41, '_SUBGROUPNAME_113', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(114, 41, '_SUBGROUPNAME_114', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(115, 41, '_SUBGROUPNAME_115', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(116, 41, '_SUBGROUPNAME_116', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(117, 42, '_SUBGROUPNAME_117', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(118, 42, '_SUBGROUPNAME_118', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(119, 42, '_SUBGROUPNAME_119', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(120, 42, '_SUBGROUPNAME_120', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(121, 42, '_SUBGROUPNAME_121', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(122, 42, '_SUBGROUPNAME_122', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(123, 42, '_SUBGROUPNAME_123', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(124, 42, '_SUBGROUPNAME_124', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(125, 42, '_SUBGROUPNAME_125', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(126, 42, '_SUBGROUPNAME_126', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(127, 42, '_SUBGROUPNAME_127', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(128, 42, '_SUBGROUPNAME_128', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(129, 42, '_SUBGROUPNAME_129', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(130, 42, '_SUBGROUPNAME_130', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(131, 42, '_SUBGROUPNAME_131', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(132, 42, '_SUBGROUPNAME_132', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(133, 42, '_SUBGROUPNAME_133', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(134, 43, '_SUBGROUPNAME_134', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(135, 43, '_SUBGROUPNAME_135', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(136, 43, '_SUBGROUPNAME_136', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(137, 43, '_SUBGROUPNAME_137', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(138, 43, '_SUBGROUPNAME_138', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(139, 43, '_SUBGROUPNAME_139', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(140, 43, '_SUBGROUPNAME_140', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(141, 43, '_SUBGROUPNAME_141', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(142, 43, '_SUBGROUPNAME_142', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(143, 43, '_SUBGROUPNAME_143', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(144, 43, '_SUBGROUPNAME_144', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(145, 43, '_SUBGROUPNAME_145', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(146, 43, '_SUBGROUPNAME_146', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(147, 43, '_SUBGROUPNAME_147', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(148, 43, '_SUBGROUPNAME_148', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(149, 43, '_SUBGROUPNAME_149', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(150, 43, '_SUBGROUPNAME_150', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(151, 43, '_SUBGROUPNAME_151', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(152, 43, '_SUBGROUPNAME_152', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(153, 43, '_SUBGROUPNAME_153', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(154, 43, '_SUBGROUPNAME_154', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(155, 43, '_SUBGROUPNAME_155', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(156, 43, '_SUBGROUPNAME_156', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(157, 43, '_SUBGROUPNAME_157', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(158, 43, '_SUBGROUPNAME_158', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(159, 43, '_SUBGROUPNAME_159', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(160, 43, '_SUBGROUPNAME_160', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(161, 43, '_SUBGROUPNAME_161', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(162, 44, '_SUBGROUPNAME_162', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(163, 44, '_SUBGROUPNAME_163', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(164, 44, '_SUBGROUPNAME_164', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(165, 44, '_SUBGROUPNAME_165', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(166, 44, '_SUBGROUPNAME_166', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(167, 44, '_SUBGROUPNAME_167', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(168, 44, '_SUBGROUPNAME_168', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(169, 44, '_SUBGROUPNAME_169', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(170, 44, '_SUBGROUPNAME_170', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(171, 44, '_SUBGROUPNAME_171', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(172, 44, '_SUBGROUPNAME_172', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(173, 44, '_SUBGROUPNAME_173', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(174, 44, '_SUBGROUPNAME_174', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(175, 44, '_SUBGROUPNAME_175', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(176, 44, '_SUBGROUPNAME_176', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(177, 44, '_SUBGROUPNAME_177', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(178, 44, '_SUBGROUPNAME_178', 'A');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(179, 45, '_SUBGROUPNAME_179', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(180, 45, '_SUBGROUPNAME_180', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(181, 45, '_SUBGROUPNAME_181', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(182, 45, '_SUBGROUPNAME_182', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(183, 45, '_SUBGROUPNAME_183', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(184, 45, '_SUBGROUPNAME_184', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(185, 45, '_SUBGROUPNAME_185', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(186, 45, '_SUBGROUPNAME_186', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(187, 45, '_SUBGROUPNAME_187', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(188, 45, '_SUBGROUPNAME_188', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(189, 45, '_SUBGROUPNAME_189', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(190, 45, '_SUBGROUPNAME_190', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(191, 45, '_SUBGROUPNAME_191', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(192, 45, '_SUBGROUPNAME_192', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(193, 45, '_SUBGROUPNAME_193', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(194, 45, '_SUBGROUPNAME_194', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(195, 45, '_SUBGROUPNAME_195', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(196, 45, '_SUBGROUPNAME_196', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(197, 45, '_SUBGROUPNAME_197', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(198, 45, '_SUBGROUPNAME_198', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(199, 45, '_SUBGROUPNAME_199', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(200, 45, '_SUBGROUPNAME_200', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(201, 45, '_SUBGROUPNAME_201', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(202, 45, '_SUBGROUPNAME_202', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(203, 45, '_SUBGROUPNAME_203', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(204, 45, '_SUBGROUPNAME_204', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(205, 45, '_SUBGROUPNAME_205', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(206, 45, '_SUBGROUPNAME_206', 'AA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(207, 46, '_SUBGROUPNAME_207', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(208, 46, '_SUBGROUPNAME_208', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(209, 46, '_SUBGROUPNAME_209', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(210, 46, '_SUBGROUPNAME_210', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(211, 46, '_SUBGROUPNAME_211', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(212, 46, '_SUBGROUPNAME_212', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(213, 46, '_SUBGROUPNAME_213', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(214, 46, '_SUBGROUPNAME_214', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(215, 46, '_SUBGROUPNAME_215', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(216, 46, '_SUBGROUPNAME_216', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(217, 46, '_SUBGROUPNAME_217', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(218, 46, '_SUBGROUPNAME_218', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(219, 46, '_SUBGROUPNAME_219', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(220, 46, '_SUBGROUPNAME_220', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(221, 46, '_SUBGROUPNAME_221', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(222, 46, '_SUBGROUPNAME_222', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(223, 46, '_SUBGROUPNAME_223', 'AAA');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(224, 47, '_SUBGROUPNAME_224', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(225, 48, '_SUBGROUPNAME_225', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(226, 48, '_SUBGROUPNAME_226', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(227, 49, '_SUBGROUPNAME_227', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(228, 49, '_SUBGROUPNAME_228', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(229, 49, '_SUBGROUPNAME_229', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(230, 50, NULL, '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(231, 51, '_SUBGROUPNAME_231', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(232, 52, '_SUBGROUPNAME_232', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(233, 53, '_SUBGROUPNAME_233', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(234, 54, '_SUBGROUPNAME_234', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(371, 56, '_SUBGROUPNAME_371', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(236, 56, '_SUBGROUPNAME_236', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(237, 57, '_SUBGROUPNAME_237', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(238, 57, '_SUBGROUPNAME_238', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(239, 58, '_SUBGROUPNAME_239', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(240, 58, '_SUBGROUPNAME_240', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(355, 48, '_SUBGROUPNAME_355', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(242, 60, '_SUBGROUPNAME_242', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(364, 52, '_SUBGROUPNAME_364', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(244, 61, '_SUBGROUPNAME_244', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(245, 61, '_SUBGROUPNAME_245', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(246, 61, '_SUBGROUPNAME_246', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(365, 54, '_SUBGROUPNAME_365', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(248, 62, '_SUBGROUPNAME_248', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(249, 62, '_SUBGROUPNAME_249', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(250, 62, '_SUBGROUPNAME_250', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(363, 51, '_SUBGROUPNAME_363', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(362, 50, '_SUBGROUPNAME_362', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(253, 63, '_SUBGROUPNAME_253', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(254, 63, '_SUBGROUPNAME_254', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(255, 64, '_SUBGROUPNAME_255', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(256, 64, '_SUBGROUPNAME_256', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(257, 65, '_SUBGROUPNAME_257', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(258, 65, '_SUBGROUPNAME_258', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(259, 66, '_SUBGROUPNAME_259', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(361, 50, '_SUBGROUPNAME_361', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(261, 67, '_SUBGROUPNAME_261', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(262, 67, '_SUBGROUPNAME_262', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(263, 67, '_SUBGROUPNAME_263', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(264, 67, '_SUBGROUPNAME_264', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(360, 50, '_SUBGROUPNAME_360', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(359, 50, '_SUBGROUPNAME_359', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(358, 50, '_SUBGROUPNAME_358', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(268, 69, '_SUBGROUPNAME_268', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(269, 69, '_SUBGROUPNAME_269', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(270, 70, '_SUBGROUPNAME_270', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(271, 70, '_SUBGROUPNAME_271', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(354, 87, '_SUBGROUPNAME_354', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(353, 87, '_SUBGROUPNAME_353', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(274, 71, '_SUBGROUPNAME_274', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(275, 71, '_SUBGROUPNAME_275', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(357, 48, '_SUBGROUPNAME_357', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(356, 48, '_SUBGROUPNAME_356', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(278, 73, '_SUBGROUPNAME_278', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(331, 74, '_SUBGROUPNAME_331', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(330, 74, '_SUBGROUPNAME_330', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(281, 74, '_SUBGROUPNAME_281', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(282, 74, '_SUBGROUPNAME_282', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(283, 74, '_SUBGROUPNAME_283', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(284, 74, '_SUBGROUPNAME_284', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(285, 74, '_SUBGROUPNAME_285', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(286, 74, '_SUBGROUPNAME_286', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(287, 74, '_SUBGROUPNAME_287', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(288, 75, '_SUBGROUPNAME_288', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(289, 75, '_SUBGROUPNAME_289', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(290, 75, '_SUBGROUPNAME_290', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(333, 76, '_SUBGROUPNAME_333', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(332, 76, '_SUBGROUPNAME_332', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(293, 76, '_SUBGROUPNAME_293', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(294, 76, '_SUBGROUPNAME_294', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(295, 76, '_SUBGROUPNAME_295', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(296, 77, '_SUBGROUPNAME_296', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(297, 77, '_SUBGROUPNAME_297', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(298, 77, '_SUBGROUPNAME_298', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(299, 78, '_SUBGROUPNAME_299', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(300, 78, '_SUBGROUPNAME_300', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(301, 78, '_SUBGROUPNAME_301', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(302, 79, '_SUBGROUPNAME_302', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(303, 79, '_SUBGROUPNAME_303', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(340, 80, '_SUBGROUPNAME_340', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(305, 80, '_SUBGROUPNAME_305', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(306, 80, '_SUBGROUPNAME_306', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(307, 80, '_SUBGROUPNAME_307', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(308, 80, '_SUBGROUPNAME_308', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(309, 80, '_SUBGROUPNAME_309', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(310, 80, '_SUBGROUPNAME_310', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(311, 80, '_SUBGROUPNAME_311', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(312, 80, '_SUBGROUPNAME_312', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(346, 86, '_SUBGROUPNAME_346', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(345, 82, '_SUBGROUPNAME_345', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(344, 82, '_SUBGROUPNAME_344', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(342, 80, '_SUBGROUPNAME_342', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(317, 82, '_SUBGROUPNAME_317', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(318, 82, '_SUBGROUPNAME_318', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(319, 82, '_SUBGROUPNAME_319', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(320, 83, '_SUBGROUPNAME_320', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(321, 83, '_SUBGROUPNAME_321', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(322, 83, '_SUBGROUPNAME_322', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(323, 83, '_SUBGROUPNAME_323', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(324, 83, '_SUBGROUPNAME_324', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(325, 84, '_SUBGROUPNAME_325', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(326, 84, '_SUBGROUPNAME_326', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(367, 54, '_SUBGROUPNAME_367', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(366, 54, '_SUBGROUPNAME_366', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(334, 76, '_SUBGROUPNAME_334', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(335, 76, '_SUBGROUPNAME_335', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(336, 76, '_SUBGROUPNAME_336', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(337, 76, '_SUBGROUPNAME_337', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(338, 78, '_SUBGROUPNAME_338', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(339, 78, '_SUBGROUPNAME_339', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(343, 82, '_SUBGROUPNAME_343', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(347, 86, '_SUBGROUPNAME_347', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(348, 86, '_SUBGROUPNAME_348', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(349, 86, '_SUBGROUPNAME_349', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(350, 86, '_SUBGROUPNAME_350', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(351, 86, '_SUBGROUPNAME_351', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(368, 54, '_SUBGROUPNAME_368', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(369, 54, '_SUBGROUPNAME_369', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(370, 54, '_SUBGROUPNAME_370', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(372, 57, '_SUBGROUPNAME_372', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(373, 57, '_SUBGROUPNAME_373', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(374, 88, '_SUBGROUPNAME_374', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(375, 88, '_SUBGROUPNAME_375', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(376, 88, '_SUBGROUPNAME_376', '');
INSERT INTO `guideline_subgroups` (`subgroup_id`, `group_id`, `name`, `abbr`) VALUES(377, 88, '_SUBGROUPNAME_377', '');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `language_code` varchar(20) NOT NULL default '',
  `charset` varchar(80) NOT NULL default '',
  `reg_exp` varchar(124) NOT NULL default '',
  `native_name` varchar(80) NOT NULL default '',
  `english_name` varchar(80) NOT NULL default '',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_code`, `charset`, `reg_exp`, `native_name`, `english_name`, `status`) VALUES('eng', 'utf-8', 'en([-_][[:alpha:]]{2})?|english', 'English', 'English', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lang_codes`
--

CREATE TABLE IF NOT EXISTS `lang_codes` (
  `code_3letters` varchar(3) NOT NULL default '',
  `direction` varchar(16) NOT NULL default '',
  `code_2letters` varchar(2) default NULL,
  `description` varchar(50) default NULL,
  PRIMARY KEY  (`code_3letters`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang_codes`
--

INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('aar', 'ltr', 'aa', 'Afar');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('abk', 'ltr', 'ab', 'Abkhazian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ace', 'ltr', '', 'Achinese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ach', 'ltr', '', 'Acoli');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ada', 'ltr', '', 'Adangme');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ady', 'ltr', '', 'Adyghe');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('afa', 'ltr', '', 'Afro-Asiatic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('afh', 'ltr', '', 'Afrihili');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('afr', 'ltr', 'af', 'Afrikaans');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ain', 'ltr', '', 'Ainu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('aka', 'ltr', 'ak', 'Akan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('akk', 'ltr', '', 'Akkadian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('alb', 'ltr', 'sq', 'Albanian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ale', 'ltr', '', 'Aleut');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('alg', 'ltr', '', 'Algonquianlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('alt', 'ltr', '', 'Southern');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('amh', 'ltr', 'am', 'Amharic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('anp', 'ltr', '', 'Angika');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('apa', 'ltr', '', 'Apachelanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ang', 'ltr', '', 'English Old(ca.450-1100)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ara', 'rtl', 'ar', 'Arabic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('arc', 'ltr', '', 'Aramaic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('arg', 'ltr', 'an', 'Aragonese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('arm', 'ltr', 'hy', 'Armenian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('arn', 'ltr', '', 'Araucanian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('arp', 'ltr', '', 'Arapaho');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('art', 'ltr', '', 'Artificial(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('arw', 'ltr', '', 'Arawak');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('asm', 'ltr', 'as', 'Assamese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ast', 'ltr', '', 'Asturian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ath', 'ltr', '', 'Athapascanlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('aus', 'ltr', '', 'Australianlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ava', 'ltr', 'av', 'Avaric');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ave', 'ltr', 'ae', 'Avestan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('awa', 'ltr', '', 'Awadhi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('aym', 'ltr', 'ay', 'Aymara');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('aze', 'ltr', 'az', 'Azerbaijani');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bad', 'ltr', '', 'Banda');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bai', 'ltr', '', 'Bamilekelanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bak', 'ltr', 'ba', 'Bashkir');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bal', 'ltr', '', 'Baluchi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bam', 'ltr', 'bm', 'Bambara');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ban', 'ltr', '', 'Balinese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('baq', 'ltr', 'eu', 'Basque');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bas', 'ltr', '', 'Basa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bat', 'ltr', '', 'Baltic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bej', 'ltr', '', 'Beja');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bel', 'ltr', 'be', 'Belarusian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bem', 'ltr', '', 'Bemba');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ben', 'ltr', 'bn', 'Bengali');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ber', 'ltr', '', 'Berber(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bho', 'ltr', '', 'Bhojpuri');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bih', 'ltr', 'bh', 'Bihari');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bik', 'ltr', '', 'Bikol');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bin', 'ltr', '', 'Bini');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bis', 'ltr', 'bi', 'Bislama');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bla', 'ltr', '', 'Siksika');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bnt', 'ltr', '', 'Bantu(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tib', 'ltr', 'bo', 'Tibetan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bos', 'ltr', 'bs', 'Bosnian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bra', 'ltr', '', 'Braj');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bre', 'ltr', 'br', 'Breton');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('btk', 'ltr', '', 'Batak(Indonesia)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bua', 'ltr', '', 'Buriat');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bug', 'ltr', '', 'Buginese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bul', 'ltr', 'bg', 'Bulgarian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bur', 'ltr', 'my', 'Burmese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('byn', 'ltr', '', 'Blin;Bilin');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cad', 'ltr', '', 'Caddo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cai', 'ltr', '', 'CentralAmericanIndian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('car', 'ltr', '', 'Caribcaribe');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cat', 'ltr', 'ca', 'Catalan;Valencian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cau', 'ltr', '', 'Caucasian(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ceb', 'ltr', '', 'Cebuano');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cel', 'ltr', '', 'Celtic(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cze', 'ltr', 'cs', 'Czech');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ces', 'ltr', 'cs', 'Czech');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cha', 'ltr', 'ch', 'Chamorro');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chb', 'ltr', '', 'Chibcha');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('che', 'ltr', 'ce', 'Chechen');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chg', 'ltr', '', 'Chagatai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chi', 'ltr', 'zh', 'Chinese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zho', 'ltr', 'zh', 'Chinese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chk', 'ltr', '', 'Chuukese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chm', 'ltr', '', 'Mari');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chn', 'ltr', '', 'Chinookjargon');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cho', 'ltr', '', 'Choctaw');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chp', 'ltr', '', 'Chipewyan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chr', 'ltr', '', 'Cherokee');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chu', 'ltr', 'cu', 'ChurchSlavic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chv', 'ltr', 'cv', 'Chuvash');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('chy', 'ltr', '', 'Cheyenne');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cmc', 'ltr', '', 'Chamiclanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cop', 'ltr', '', 'Coptic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cor', 'ltr', 'kw', 'Cornish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cos', 'ltr', 'co', 'Corsican');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cpp', 'ltr', '', 'Creoles');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cre', 'ltr', 'cr', 'Cree');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('crh', 'ltr', '', 'CrimeanTatar');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('crp', 'ltr', '', 'Creolesandpidgins(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('csb', 'ltr', '', 'Kashubian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cus', 'ltr', '', 'Cushitic(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('wel', 'ltr', 'cy', 'Welsh');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cym', 'ltr', 'cy', 'Welsh');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dak', 'ltr', '', 'Dakota');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dan', 'ltr', 'da', 'Danish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dar', 'ltr', '', 'Dargwa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('day', 'ltr', '', 'Dayak');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('del', 'ltr', '', 'Delaware');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('den', 'ltr', '', 'Slave(Athapascan)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ger', 'ltr', 'de', 'German');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('deu', 'ltr', 'de', 'German');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dgr', 'ltr', '', 'Dogrib');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('din', 'ltr', '', 'Dinka');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('div', 'ltr', 'dv', 'Divehi;Dhivehi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('doi', 'ltr', '', 'Dogri');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dra', 'ltr', '', 'Dravidian(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dsb', 'ltr', '', 'LowerSorbian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dua', 'ltr', '', 'Duala');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dut', 'ltr', 'nl', 'Dutch;Flemish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nld', 'ltr', 'nl', 'Dutch;Flemish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dyu', 'ltr', '', 'Dyula');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dzo', 'ltr', 'dz', 'Dzongkha');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('efi', 'ltr', '', 'Efik');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('egy', 'ltr', '', 'Egyptian(Ancient)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('eka', 'ltr', '', 'Ekajuk');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('elx', 'ltr', '', 'Elamite');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cpe', 'ltr', '', 'Creolesandpidgins Englishbased(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('cpf', 'ltr', '', 'Creolesandpidgins French-based(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('dum', 'ltr', '', 'Dutch Middle(ca.1050-1350)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gre', 'ltr', 'el', 'Greek Modern(1453-)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ell', 'ltr', 'el', 'Greek Modern(1453-)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('eng', 'ltr', 'en', 'English');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('epo', 'ltr', 'eo', 'Esperanto');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('est', 'ltr', 'et', 'Estonian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('eus', 'ltr', 'eu', 'Basque');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ewe', 'ltr', 'ee', 'Ewe');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ewo', 'ltr', '', 'Ewondo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fan', 'ltr', '', 'Fang');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fao', 'ltr', 'fo', 'Faroese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('per', 'ltr', 'fa', 'Persian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fas', 'ltr', 'fa', 'Persian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fat', 'ltr', '', 'Fanti');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fij', 'ltr', 'fj', 'Fijian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fil', 'ltr', '', 'Filipino');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fin', 'ltr', 'fi', 'Finnish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fiu', 'ltr', '', 'Finno-Ugrian(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fon', 'ltr', '', 'Fon');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fre', 'ltr', 'fr', 'French');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fra', 'ltr', 'fr', 'French');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('frr', 'ltr', '', 'NorthernFrisian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('frs', 'ltr', '', 'EasternFrisian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fry', 'ltr', 'fy', 'WesternFrisian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ful', 'ltr', 'ff', 'Fulah');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fur', 'ltr', '', 'Friulian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gaa', 'ltr', '', 'Ga');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gay', 'ltr', '', 'Gayo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gba', 'ltr', '', 'Gbaya');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gem', 'ltr', '', 'Germanic(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kat', 'ltr', 'ka', 'Georgian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('geo', 'ltr', 'ka', 'Georgian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gez', 'ltr', '', 'Geez');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gil', 'ltr', '', 'Gilbertese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gla', 'ltr', 'gd', 'Gaelic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gle', 'ltr', 'ga', 'Irish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('glg', 'ltr', 'gl', 'Galician');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('glv', 'ltr', 'gv', 'Manxmanx;');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gon', 'ltr', '', 'Gondi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gor', 'ltr', '', 'Gorontalo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('got', 'ltr', '', 'Gothic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('grb', 'ltr', '', 'Grebo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('frm', 'ltr', '', 'French Middle(ca.1400-1600)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('fro', 'ltr', '', 'French Old(842-ca.1400)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('grc', 'ltr', '', 'Greek Ancient(to1453)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('grn', 'ltr', 'gn', 'Guarani');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gsw', 'ltr', '', 'Alemanic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('guj', 'ltr', 'gu', 'Gujarati');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('gwi', 'ltr', '', 'Gwich');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hai', 'ltr', '', 'Haida');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hat', 'ltr', 'ht', 'Haitian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hau', 'ltr', 'ha', 'Hausa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('haw', 'ltr', '', 'Hawaiian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('heb', 'rtl', 'he', 'Hebrew');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('her', 'ltr', 'hz', 'Herero');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hil', 'ltr', '', 'Hiligaynon');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('him', 'ltr', '', 'Himachali');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hin', 'ltr', 'hi', 'Hindi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hit', 'ltr', '', 'Hittite');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hmn', 'ltr', '', 'Hmong');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hmo', 'ltr', 'ho', 'HiriMotu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('scr', 'ltr', 'hr', 'Croatian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hrv', 'ltr', 'hr', 'Croatian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hsb', 'ltr', '', 'UpperSorbian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hun', 'ltr', 'hu', 'Hungarian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('hup', 'ltr', '', 'Hupa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('iba', 'ltr', '', 'Iban');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ibo', 'ltr', 'ig', 'Igbo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ice', 'ltr', 'is', 'Icelandic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('isl', 'ltr', 'is', 'Icelandic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ido', 'ltr', 'io', 'Ido');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('iii', 'ltr', 'ii', 'SichuanYi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ijo', 'ltr', '', 'Ijo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('iku', 'ltr', 'iu', 'Inuktitut');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ile', 'ltr', 'ie', 'Interlingue');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ilo', 'ltr', '', 'Iloko');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ina', 'ltr', 'ia', 'Interlingua');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('inc', 'ltr', '', 'Indic(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ind', 'ltr', 'id', 'Indonesian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ine', 'ltr', '', 'Indo-European(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('inh', 'ltr', '', 'Ingush');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ipk', 'ltr', 'ik', 'Inupiaq');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ira', 'ltr', '', 'Iranian(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('iro', 'ltr', '', 'Iroquoianlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ita', 'ltr', 'it', 'Italian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('jav', 'ltr', 'jv', 'Javanese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('jbo', 'ltr', '', 'Lojban');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('jpn', 'ltr', 'ja', 'Japanese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('jpr', 'ltr', '', 'Judeo-Persian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('jrb', 'ltr', '', 'Judeo-Arabic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kaa', 'ltr', '', 'Kara-Kalpak');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kab', 'ltr', '', 'Kabyle');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kac', 'ltr', '', 'Kachin');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kal', 'ltr', 'kl', 'Kalaallisut');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kam', 'ltr', '', 'Kamba');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kan', 'ltr', 'kn', 'Kannada');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kar', 'ltr', '', 'Karen');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kas', 'ltr', 'ks', 'Kashmiri');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kau', 'ltr', 'kr', 'Kanuri');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kaw', 'ltr', '', 'Kawi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kaz', 'ltr', 'kk', 'Kazakh');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kbd', 'ltr', '', 'Kabardian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kha', 'ltr', '', 'Khasi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('khi', 'ltr', '', 'Khoisan(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('khm', 'ltr', 'km', 'Khmer');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kho', 'ltr', '', 'Khotanese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kik', 'ltr', 'ki', 'Kikuyu;');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kin', 'ltr', 'rw', 'Kinyarwanda');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kir', 'ltr', 'ky', 'Kirghiz');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kmb', 'ltr', '', 'Kimbundu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kok', 'ltr', '', 'Konkani');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kom', 'ltr', 'kv', 'Komi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kon', 'ltr', 'kg', 'Kongo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kor', 'ltr', 'ko', 'Korean');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kos', 'ltr', '', 'Kosraean');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kpe', 'ltr', '', 'Kpelle');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('krc', 'ltr', '', 'Karachay-Balkar');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('krl', 'ltr', '', 'Karelian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kro', 'ltr', '', 'Kru');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kru', 'ltr', '', 'Kurukh');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kua', 'ltr', 'kj', 'Kuanyama');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kum', 'ltr', '', 'Kumyk');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kur', 'ltr', 'ku', 'Kurdish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('kut', 'ltr', '', 'Kutenai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lad', 'ltr', '', 'Ladino');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lah', 'ltr', '', 'Lahnda');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lam', 'ltr', '', 'Lamba');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lao', 'ltr', 'lo', 'Lao');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lat', 'ltr', 'la', 'Latin');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lav', 'ltr', 'lv', 'Latvian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lez', 'ltr', '', 'Lezghian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lim', 'ltr', 'li', 'Limburgan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lin', 'ltr', 'ln', 'Lingala');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lit', 'ltr', 'lt', 'Lithuanian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lol', 'ltr', '', 'Mongo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('loz', 'ltr', '', 'Lozi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ltz', 'ltr', 'lb', 'Luxembourgish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lua', 'ltr', '', 'Luba-Lulua');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lub', 'ltr', 'lu', 'Luba-Katanga');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lug', 'ltr', 'lg', 'Ganda');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lui', 'ltr', '', 'Luiseno');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lun', 'ltr', '', 'Lunda');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('luo', 'ltr', '', 'Luo(KenyaandTanzania)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('lus', 'ltr', '', 'lushai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mac', 'ltr', 'mk', 'Macedonian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mkd', 'ltr', 'mk', 'Macedonian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mad', 'ltr', '', 'Madurese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mag', 'ltr', '', 'Magahi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mah', 'ltr', 'mh', 'Marshallese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mai', 'ltr', '', 'Maithili');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mak', 'ltr', '', 'Makasar');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mal', 'ltr', 'ml', 'Malayalam');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('man', 'ltr', '', 'Mandingo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mao', 'ltr', 'mi', 'Maori');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mri', 'ltr', 'mi', 'Maori');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('map', 'ltr', '', 'Austronesian(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mar', 'ltr', 'mr', 'Marathi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mas', 'ltr', '', 'Masai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('may', 'ltr', 'ms', 'Malay');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('msa', 'ltr', 'ms', 'Malay');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mdf', 'ltr', '', 'Moksha');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mdr', 'ltr', '', 'Mandar');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('men', 'ltr', '', 'Mende');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mic', 'ltr', '', 'Mi''kmaq');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('min', 'ltr', '', 'Minangkabau');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mis', 'ltr', '', 'Miscellaneouslanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mkh', 'ltr', '', 'Mon-Khmer(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mlg', 'ltr', 'mg', 'Malagasy');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mlt', 'ltr', 'mt', 'Maltese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mnc', 'ltr', '', 'Manchu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mni', 'ltr', '', 'Manipuri');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mno', 'ltr', '', 'Manobolanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('moh', 'ltr', '', 'Mohawk');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mol', 'ltr', 'mo', 'Moldavian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mon', 'ltr', 'mn', 'Mongolian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mga', 'ltr', '', 'Irish Middle(900-1200)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mos', 'ltr', '', 'Mossi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mul', 'ltr', '', 'Multiple');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mun', 'ltr', '', 'Mundalanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mus', 'ltr', '', 'Creek');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mwl', 'ltr', '', 'Mirandese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mwr', 'ltr', '', 'Marwari');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('mya', 'ltr', 'my', 'Burmese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('myn', 'ltr', '', 'Mayanlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('myv', 'ltr', '', 'Erzya');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nah', 'ltr', '', 'Nahuatl');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nai', 'ltr', '', 'NorthAmericanIndian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nap', 'ltr', '', 'Neapolitan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nau', 'ltr', 'na', 'Nauru');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nav', 'ltr', 'nv', 'Navajo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ndo', 'ltr', 'ng', 'Ndonga');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nds', 'ltr', '', 'LowGerman');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nep', 'ltr', 'ne', 'Nepali');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('new', 'ltr', '', 'Newaria');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nia', 'ltr', '', 'Nias');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nic', 'ltr', '', 'Niger-Kordofanian(Other)s');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('niu', 'ltr', '', 'Niuean');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nno', 'ltr', 'nn', 'Norwegian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nob', 'ltr', 'nb', 'Norwegian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nog', 'ltr', '', 'Nogai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('non', 'ltr', '', 'Norse');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nor', 'ltr', 'no', 'Norwegian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nqo', 'ltr', '', 'N''ko');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nso', 'ltr', '', 'NorthernSotho');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nub', 'ltr', '', 'Nubianlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nwc', 'ltr', '', 'ClassicalNewari');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nya', 'ltr', 'ny', 'Chichewa;Chewa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nym', 'ltr', '', 'Nyamwezi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nyn', 'ltr', '', 'Nyankole');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nyo', 'ltr', '', 'Nyoro');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('oci', 'ltr', 'oc', 'Occitan(post1500)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('oji', 'ltr', 'oj', 'Ojibwa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ori', 'ltr', 'or', 'Oriya');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('orm', 'ltr', 'om', 'Oromo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('osa', 'ltr', '', 'Osage');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('oss', 'ltr', 'os', 'Ossetian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('oto', 'ltr', '', 'Otomianlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nbl', 'ltr', 'nr', 'Ndebele South');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('nde', 'ltr', 'nd', 'Ndebele North');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ota', 'ltr', '', 'Turkish Ottoman(1500-1928)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('paa', 'ltr', '', 'Papuan(Other)papoues');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pag', 'ltr', '', 'Pangasinan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pal', 'ltr', '', 'Pahlavi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pam', 'ltr', '', 'Pampanga');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pan', 'ltr', 'pa', 'Panjabi;Punjabi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pap', 'ltr', '', 'Papiamento');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pau', 'ltr', '', 'Palauan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('phi', 'ltr', '', 'Philippine(Other)philippines');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('phn', 'ltr', '', 'Phoenician');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pli', 'ltr', 'pi', 'Pali');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pol', 'ltr', 'pl', 'Polish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pon', 'ltr', '', 'Pohnpeian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('por', 'ltr', 'pt', 'Portuguese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pra', 'ltr', '', 'Prakritlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('pus', 'ltr', 'ps', 'Pushto');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('que', 'ltr', 'qu', 'Quechua');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('raj', 'ltr', '', 'Rajasthani');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('rap', 'ltr', '', 'Rapanui');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('rar', 'ltr', '', 'Rarotongan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('roa', 'ltr', 'R', 'omance(Other)romanes');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('roh', 'ltr', 'rm', 'Raeto-Romance');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('rom', 'ltr', '', 'Romany');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('rum', 'ltr', 'ro', 'Romanian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ron', 'ltr', 'ro', 'Romanian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('run', 'ltr', 'rn', 'Rundi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('rup', 'ltr', '', 'Aromanian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('rus', 'ltr', 'ru', 'Russian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sad', 'ltr', '', 'Sandawe');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sag', 'ltr', 'sg', 'Sango');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sah', 'ltr', '', 'Yakut');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sai', 'ltr', '', 'SouthAmericanIndian(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sal', 'ltr', '', 'Salishanlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sam', 'ltr', '', 'SamaritanAramaic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('san', 'ltr', 'sa', 'Sanskrit');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sas', 'ltr', '', 'Sasak');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sat', 'ltr', '', 'Santali');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('scc', 'ltr', 'sr', 'Serbian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('srp', 'ltr', 'sr', 'Serbian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('scn', 'ltr', '', 'Sicilian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sco', 'ltr', '', 'Scots');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sel', 'ltr', '', 'Selkup');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('peo', 'ltr', '', 'Persian Old(ca.600-400B.C.)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sem', 'ltr', '', 'Semitic(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sgn', 'ltr', '', 'SignLanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('shn', 'ltr', '', 'Shan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sid', 'ltr', '', 'Sidamo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sin', 'ltr', 'si', 'Sinhala');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sio', 'ltr', '', 'Siouanlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sit', 'ltr', '', 'Sino-Tibetan(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sla', 'ltr', '', 'Slavic(Other)slaves');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('slo', 'ltr', 'sk', 'Slovak');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('slk', 'ltr', 'sk', 'Slovak');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('slv', 'ltr', 'sl', 'Slovenian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sma', 'ltr', '', 'SouthernSami');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sme', 'ltr', 'se', 'NorthernSami');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('smi', 'ltr', '', 'Samilanguages(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('smj', 'ltr', '', 'LuleSami');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('smn', 'ltr', '', 'InariSami');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('smo', 'ltr', 'sm', 'Samoan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sms', 'ltr', '', 'SkoltSami');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sna', 'ltr', 'sn', 'Shona');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('snd', 'ltr', 'sd', 'Sindhi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('snk', 'ltr', '', 'Soninke');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sog', 'ltr', '', 'Sogdian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('som', 'ltr', 'so', 'Somali');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('son', 'ltr', '', 'Songhai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('spa', 'ltr', 'es', 'Spanish;Castilian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('srd', 'ltr', 'sc', 'Sardinian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('srn', 'ltr', '', 'SrananTogosranan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('srr', 'ltr', '', 'Serer');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ssa', 'ltr', '', 'Nilo-Saharan(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ssw', 'ltr', 'ss', 'Swati');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('suk', 'ltr', '', 'Sukuma');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sun', 'ltr', 'su', 'Sundanese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sus', 'ltr', '', 'Susu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sux', 'ltr', '', 'Sumerian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('swa', 'ltr', 'sw', 'Swahili');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('swe', 'ltr', 'sv', 'Swedish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('syr', 'ltr', '', 'Syriac');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tah', 'ltr', 'ty', 'Tahitian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tai', 'ltr', '', 'Tai(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tam', 'ltr', 'ta', 'Tamil');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tat', 'ltr', 'tt', 'Tatar');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tel', 'ltr', 'te', 'Telugu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tem', 'ltr', '', 'Timne');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sga', 'ltr', '', 'Irish Old(to900)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('sot', 'ltr', 'st', 'Sotho Southern');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ter', 'ltr', '', 'Tereno');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tet', 'ltr', '', 'Tetum');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tgk', 'ltr', 'tg', 'Tajik');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tgl', 'ltr', 'tl', 'Tagalog');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tha', 'ltr', 'th', 'Thai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('bod', 'ltr', 'bo', 'Tibetan');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tig', 'ltr', '', 'Tigre');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tir', 'ltr', 'ti', 'Tigrinya');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tiv', 'ltr', '', 'Tiv');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tkl', 'ltr', '', 'Tokelau');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tlh', 'ltr', '', 'Klingon');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tli', 'ltr', '', 'Tlingit');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tmh', 'ltr', '', 'Tamashek');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tog', 'ltr', '', 'Tonga(Nyasa)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ton', 'ltr', 'to', 'Tonga(TongaIslands)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tpi', 'ltr', '', 'TokPisin');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tsi', 'ltr', '', 'Tsimshian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tsn', 'ltr', 'tn', 'Tswana');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tso', 'ltr', 'ts', 'Tsonga');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tuk', 'ltr', 'tk', 'Turkmen');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tum', 'ltr', '', 'Tumbuka');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tup', 'ltr', '', 'Tupilanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tur', 'ltr', 'tr', 'Turkish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tut', 'ltr', '', 'Altaic(Other)');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tvl', 'ltr', '', 'Tuvalu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('twi', 'ltr', 'tw', 'Twi');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('tyv', 'ltr', '', 'Tuvinian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('udm', 'ltr', '', 'Udmurt');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('uga', 'ltr', '', 'Ugaritic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('uig', 'ltr', 'ug', 'Uighur');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ukr', 'ltr', 'uk', 'Ukrainian');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('umb', 'ltr', '', 'Umbundu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('und', 'ltr', '', 'Undetermined');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('urd', 'ltr', 'ur', 'Urdu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('uzb', 'ltr', 'uz', 'Uzbek');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('vai', 'ltr', '', 'Vai');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ven', 'ltr', 've', 'Venda');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('vie', 'ltr', 'vi', 'Vietnamese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('vol', 'ltr', 'vo', 'Volap�?k');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('vot', 'ltr', '', 'Votic');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('wak', 'ltr', '', 'Wakashanlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('wal', 'ltr', '', 'Walamo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('war', 'ltr', '', 'Waray');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('was', 'ltr', '', 'Washo');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('wen', 'ltr', '', 'Sorbianlanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('wln', 'ltr', 'wa', 'Walloon');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('wol', 'ltr', 'wo', 'Wolof');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('xal', 'ltr', '', 'Kalmyk');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('xho', 'ltr', 'xh', 'Xhosa');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('yao', 'ltr', '', 'Yao');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('yap', 'ltr', '', 'Yapese');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('yid', 'ltr', 'yi', 'Yiddish');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('yor', 'ltr', 'yo', 'Yoruba');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('ypk', 'ltr', '', 'Yupiklanguages');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zap', 'ltr', '', 'Zapotec');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zen', 'ltr', '', 'Zenaga');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zha', 'ltr', 'za', 'Zhuang');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('znd', 'ltr', '', 'Zande');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zul', 'ltr', 'zu', 'Zulu');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zun', 'ltr', '', 'Zuni');
INSERT INTO `lang_codes` (`code_3letters`, `direction`, `code_2letters`, `description`) VALUES('zxx', 'ltr', '', 'Nolinguisticcontent');

-- --------------------------------------------------------

--
-- Table structure for table `mail_queue`
--

CREATE TABLE IF NOT EXISTS `mail_queue` (
  `mail_id` mediumint(8) unsigned NOT NULL auto_increment,
  `to_email` varchar(50) NOT NULL default '',
  `to_name` varchar(50) NOT NULL default '',
  `from_email` varchar(50) NOT NULL default '',
  `from_name` varchar(50) NOT NULL default '',
  `char_set` varchar(20) NOT NULL default '',
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY  (`mail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mail_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE IF NOT EXISTS `privileges` (
  `privilege_id` mediumint(8) unsigned NOT NULL auto_increment,
  `title_var` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime default NULL,
  `link` varchar(255) NOT NULL default '',
  `menu_sequence` tinyint(4) NOT NULL,
  `open_to_public` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`privilege_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(1, 'web_accessibility_checker', 'Web accessibility checker', '2009-05-19 15:58:46', NULL, 'checker/index.php', 1, 1);
INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(2, 'users', 'User management: Create, edit, delete users.', '2009-05-19 15:58:46', NULL, 'user/index.php', 2, 0);
INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(3, 'guidelines', 'Guideline management: Create, edit, delete, enable, disable guidelines.', '2009-05-19 15:58:46', NULL, 'guideline/index.php', 3, 0);
INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(4, 'checks', 'Check management: Create, edit, delete, enable, disable checks.', '2009-05-19 15:58:46', NULL, 'check/index.php', 4, 0);
INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(5, 'language', 'Language management: Create, edit, delete, enable, disable languages.', '2009-05-19 15:58:46', NULL, 'language/index.php', 5, 0);
INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(6, 'translation', 'Translation: Translate all Achecker terms into other languages.', '2009-05-19 15:58:46', NULL, 'translation/index.php', 6, 0);
INSERT INTO `privileges` (`privilege_id`, `title_var`, `description`, `create_date`, `last_update`, `link`, `menu_sequence`, `open_to_public`) VALUES(7, 'profile', 'Profile management: Edit profile, change password or email.', '2009-05-19 15:58:46', NULL, 'profile/index.php', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subgroup_checks`
--

CREATE TABLE IF NOT EXISTS `subgroup_checks` (
  `subgroup_id` mediumint(8) unsigned NOT NULL default '0',
  `check_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`subgroup_id`,`check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subgroup_checks`
--

INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 4);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 5);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 66);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 78);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 79);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 90);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(1, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(2, 132);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(4, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(4, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(6, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(6, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(6, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(6, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(6, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(7, 135);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(8, 29);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 37);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 38);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 39);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 40);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 42);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 43);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 44);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 45);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 46);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(11, 47);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(12, 70);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(12, 81);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(13, 100);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(14, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(15, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(16, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(17, 94);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(17, 97);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(17, 109);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(18, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(18, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(18, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(19, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(19, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(19, 128);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 102);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 103);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 104);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 105);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 106);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 107);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(20, 108);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(21, 35);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(21, 36);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(21, 90);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(22, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(22, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(22, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(22, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(23, 27);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(24, 69);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(25, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(26, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(27, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(27, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(27, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(27, 129);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(28, 12);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(31, 18);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(31, 68);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(32, 96);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(32, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(32, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(32, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(32, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(36, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(36, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(37, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 95);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 120);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(39, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(40, 19);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(40, 173);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(41, 50);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(41, 51);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(41, 52);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(41, 53);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(41, 54);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(45, 13);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(46, 98);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(46, 99);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(47, 48);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(47, 49);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(48, 111);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(48, 112);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(48, 113);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(48, 114);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(49, 138);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(49, 139);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(49, 140);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(49, 141);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(49, 142);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(52, 134);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(55, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(59, 84);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 2);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 3);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 4);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 5);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 6);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 7);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 90);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(62, 101);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(63, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(64, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(64, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(64, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(64, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(64, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(65, 94);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(66, 13);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(67, 12);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(68, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(70, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(70, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(70, 33);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(70, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(70, 35);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(71, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(71, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(71, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(71, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(73, 90);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(74, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(74, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(74, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(74, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 60);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 61);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 62);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 63);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 120);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(75, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(76, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(77, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(77, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(78, 225);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(78, 232);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(79, 233);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(79, 234);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 2);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 3);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 4);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 5);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 6);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 15);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 16);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 61);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 62);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(80, 178);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(81, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(81, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(81, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(81, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(81, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(82, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(82, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(82, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(82, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(83, 226);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(83, 227);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(83, 228);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(83, 229);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(84, 196);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(85, 132);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(86, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(87, 230);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(87, 231);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(90, 114);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(90, 115);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(90, 133);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(90, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 120);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(91, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 88);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 90);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 94);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 128);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 164);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 165);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(92, 166);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 102);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 103);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 104);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 105);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 106);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 107);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 108);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(93, 129);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(95, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(95, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(95, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(95, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(96, 15);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(96, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(96, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(96, 175);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(96, 191);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(96, 197);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(97, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(97, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 4);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 5);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 66);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 78);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 79);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 90);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(100, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(101, 132);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(103, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(103, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(105, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(105, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(105, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(105, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(105, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(106, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(107, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(108, 94);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(108, 97);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(108, 109);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(109, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(109, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(109, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(110, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(110, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(110, 128);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(111, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(111, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(111, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(111, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(112, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(112, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(112, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(112, 129);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(113, 12);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(115, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(115, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 4);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 5);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 66);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 78);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 79);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(117, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(118, 132);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(120, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(120, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(122, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(122, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(122, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(122, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(123, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(124, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(125, 94);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(125, 97);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(125, 109);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(126, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(126, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(126, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(127, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(127, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(127, 128);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(128, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(128, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(128, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(128, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(129, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(129, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(129, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(129, 129);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(130, 12);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(132, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(132, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(135, 135);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(136, 232);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(137, 176);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(137, 177);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 37);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 38);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 39);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 40);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 42);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 43);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 44);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 45);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 46);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(139, 47);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(140, 70);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(140, 81);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(141, 100);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(142, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(144, 35);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(144, 36);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(145, 27);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(146, 69);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(147, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(148, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(151, 18);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(151, 68);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(152, 96);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(152, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(152, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(152, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(152, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(155, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(157, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(157, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(157, 95);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(157, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(157, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(157, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(158, 19);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(158, 173);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(159, 50);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(159, 51);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(159, 52);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(159, 53);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(159, 54);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 4);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 5);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 66);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 77);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 78);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 79);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(162, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(163, 13);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(165, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(165, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(167, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(167, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(167, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(167, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(167, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(168, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(169, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(170, 94);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(170, 97);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(170, 109);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(171, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(171, 74);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(171, 127);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(172, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(172, 75);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(172, 128);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(173, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(173, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(173, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(173, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(174, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(174, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(174, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(174, 129);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(175, 12);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(177, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(177, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(180, 135);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(181, 232);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(182, 176);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(182, 177);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 37);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 38);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 39);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 40);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 42);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 43);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 44);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 45);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 46);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(184, 47);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(185, 70);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(185, 81);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(186, 100);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(187, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 102);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 103);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 104);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 105);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 106);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 107);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(188, 108);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(189, 35);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(189, 36);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(190, 27);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(191, 69);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(192, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(193, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(196, 18);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(196, 68);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(197, 96);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(197, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(197, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(197, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(197, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(200, 34);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(202, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(202, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(202, 95);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(202, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(202, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(202, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(203, 19);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(203, 173);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(204, 50);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(204, 51);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(204, 52);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(204, 53);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(204, 54);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(204, 143);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(207, 13);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(208, 98);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(208, 99);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(209, 48);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(209, 49);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(210, 111);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(210, 112);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(210, 113);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(210, 114);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(211, 138);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(211, 139);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(211, 140);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(211, 141);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(211, 142);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(214, 134);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(217, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(221, 84);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 2);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 3);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 6);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 7);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 16);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 60);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 62);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 66);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 163);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 178);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 193);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 194);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 238);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(224, 239);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(225, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(225, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(225, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(225, 240);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 82);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 95);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 96);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 111);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 112);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 114);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 115);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 120);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 151);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 154);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 168);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 203);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 204);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 206);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 207);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 208);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 209);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 211);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 212);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 213);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 216);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 230);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 231);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 241);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 242);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 243);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 244);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 245);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 247);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 248);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 270);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(227, 271);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(229, 133);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(229, 250);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 103);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 104);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 105);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 106);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 107);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(231, 108);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(232, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(233, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(233, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(233, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(233, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 84);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 261);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 262);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(234, 263);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(236, 48);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(236, 49);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(236, 273);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(237, 275);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(238, 68);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(238, 92);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(238, 274);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(239, 185);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 2);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 3);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 6);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 7);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 16);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 24);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 60);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 62);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 66);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 163);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 178);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 193);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 194);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 238);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(242, 239);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(244, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(244, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(244, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(244, 240);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(246, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(246, 160);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 82);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 95);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 96);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 111);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 112);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 114);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 115);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 120);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 133);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 151);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 154);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 168);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 203);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 204);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 206);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 207);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 208);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 209);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 211);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 212);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 213);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 216);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 230);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 231);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 241);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 242);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 243);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 244);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 245);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 247);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 248);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 270);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(248, 271);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(250, 133);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(250, 250);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 221);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 222);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 223);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 224);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 251);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(253, 252);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 26);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 103);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 104);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 105);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 106);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 107);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(255, 108);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(256, 258);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(256, 259);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(256, 260);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(257, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(258, 27);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(258, 69);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(258, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(259, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(259, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(259, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(259, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 84);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 261);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 262);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(261, 263);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(262, 50);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(262, 51);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(262, 52);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(262, 53);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(262, 54);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(264, 19);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(264, 173);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(264, 174);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(264, 197);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(268, 48);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(268, 49);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(268, 273);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(269, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(270, 275);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(271, 68);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(271, 92);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(271, 274);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(274, 185);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 1);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 2);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 3);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 6);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 7);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 16);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 23);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 25);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 58);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 59);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 60);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 62);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 64);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 65);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 80);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 163);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 178);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 193);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 238);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(278, 239);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(281, 17);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(281, 20);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(281, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(281, 240);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(283, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(283, 160);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(287, 145);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(287, 240);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 57);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 82);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 91);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 95);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 96);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 111);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 112);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 114);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 115);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 118);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 119);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 120);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 121);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 122);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 123);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 124);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 125);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 136);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 137);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 151);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 154);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 168);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 203);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 204);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 206);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 207);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 208);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 209);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 211);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 212);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 213);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 216);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 230);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 231);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 241);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 242);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 243);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 244);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 245);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 247);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 248);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 270);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(288, 271);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(290, 133);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(290, 250);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 221);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 222);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 223);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 224);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 251);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(293, 252);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(295, 221);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(295, 222);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(295, 223);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(295, 224);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 76);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 89);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 103);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 104);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 105);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 106);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 107);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(296, 108);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(297, 258);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(297, 259);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(297, 260);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(299, 72);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(300, 27);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(300, 69);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(300, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(302, 10);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(302, 22);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(302, 30);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(302, 87);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(305, 28);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(305, 31);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(305, 32);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(305, 84);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(305, 261);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(305, 262);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(306, 50);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(306, 51);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(306, 52);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(306, 53);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(306, 54);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(308, 174);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(308, 197);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 184);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 198);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 199);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 200);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 210);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 214);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 246);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(309, 266);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 37);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 38);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 39);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 40);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 41);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 42);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 43);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 44);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 45);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 46);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(310, 47);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(312, 184);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(312, 266);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(317, 48);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(317, 49);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(317, 273);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(318, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(319, 179);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(320, 275);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(321, 92);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(322, 263);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(322, 265);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(322, 276);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(323, 81);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(323, 100);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(323, 131);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(324, 18);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(324, 274);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(325, 185);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(332, 116);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(332, 117);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(332, 176);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(332, 177);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(333, 253);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(333, 254);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(333, 255);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(333, 256);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(333, 257);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(334, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(334, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(342, 261);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(343, 98);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(343, 99);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(346, 267);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 187);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 188);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 189);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 205);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 210);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 217);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 218);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 219);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 220);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(347, 246);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(348, 268);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(349, 269);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(349, 272);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(351, 269);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(351, 272);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(353, 267);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 187);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 188);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 189);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 205);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 210);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 217);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 218);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 219);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 220);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(354, 246);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(355, 146);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(355, 160);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 14);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 21);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 55);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 73);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 86);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 251);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(358, 252);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(360, 221);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(360, 222);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(360, 223);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(360, 224);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(361, 116);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(361, 117);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(361, 176);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(361, 177);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(362, 8);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(362, 11);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(363, 258);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(363, 259);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(363, 260);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(364, 27);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(364, 69);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(364, 71);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(365, 50);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(365, 51);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(365, 52);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(365, 53);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(365, 54);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(367, 19);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(367, 173);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(367, 174);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(367, 197);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(368, 184);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(368, 266);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 37);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 38);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 39);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 40);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 41);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 42);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 43);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 44);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 45);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 46);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(369, 47);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(371, 110);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(372, 263);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(372, 265);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(372, 276);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(373, 81);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(373, 100);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(373, 131);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(374, 267);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 187);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 188);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 189);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 205);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 210);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 217);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 218);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 219);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 220);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(375, 246);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(376, 268);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(377, 269);
INSERT INTO `subgroup_checks` (`subgroup_id`, `check_id`) VALUES(377, 272);

-- --------------------------------------------------------

--
-- Table structure for table `techniques`
--

CREATE TABLE IF NOT EXISTS `techniques` (
  `subgroup_id` mediumint(8) unsigned NOT NULL default '0',
  `check_id` mediumint(8) unsigned NOT NULL default '0',
  `technique` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`subgroup_id`,`check_id`,`technique`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `techniques`
--

INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 1, 'F38');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 1, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 2, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 3, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 6, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 8, 'G72');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 8, 'G73');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 8, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 8, 'H45');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 11, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 16, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 16, 'H67');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 23, 'H35');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 25, 'H52');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 58, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 59, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 60, 'G94');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 64, 'H24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 65, 'H24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 80, 'H53');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 163, 'H46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 178, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 193, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 238, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(224, 239, 'H67');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 37, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 38, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 39, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 40, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 42, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 43, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 44, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 45, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 46, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 47, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 57, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 82, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 91, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 95, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 96, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 111, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 114, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 115, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 118, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 119, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 120, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 121, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 122, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 123, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 124, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 125, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 137, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 151, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 168, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 203, 'H73');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 204, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 206, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 207, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 208, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 209, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 211, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 212, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 213, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 216, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 241, 'H51');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 242, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 243, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 244, 'H63');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 245, 'H43');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 247, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 248, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 270, 'H34');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(227, 271, 'H56');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(228, 14, 'G111');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(229, 133, 'F49');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 103, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 104, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 105, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 106, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 107, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 108, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 258, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 259, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(231, 260, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(232, 72, 'F40');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(233, 10, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(233, 22, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(233, 30, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(234, 28, 'G1');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(234, 31, 'H64');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(234, 32, 'H64');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(234, 261, 'H69');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(234, 262, 'H50');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(234, 263, 'H70');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(235, 267, 'G83');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(235, 268, 'G85');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(236, 48, 'H57');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(236, 49, 'H57');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(236, 273, 'H55');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(237, 275, 'F52');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(238, 274, 'G107');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 1, 'F38');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 1, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 2, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 3, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 6, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 8, 'G72');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 8, 'G73');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 8, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 8, 'H45');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 11, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 16, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 16, 'H67');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 23, 'H35');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 25, 'H52');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 58, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 59, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 60, 'G94');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 64, 'H24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 65, 'H24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 80, 'H53');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 163, 'H46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 178, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 193, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 238, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(242, 239, 'H67');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 37, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 38, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 39, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 40, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 42, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 43, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 44, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 45, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 46, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 47, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 57, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 82, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 91, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 95, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 96, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 111, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 114, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 115, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 118, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 119, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 120, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 121, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 122, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 123, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 124, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 125, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 137, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 151, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 168, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 203, 'H73');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 204, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 206, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 207, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 208, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 209, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 211, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 212, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 213, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 216, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 241, 'H51');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 242, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 243, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 244, 'H63');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 245, 'H43');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 247, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 248, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 270, 'H34');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(248, 271, 'H56');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(249, 14, 'G111');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(250, 133, 'F49');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(251, 249, 'H49');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(252, 250, 'G96');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 221, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 221, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 222, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 222, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 223, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 223, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 224, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 224, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 251, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 251, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(253, 252, 'F24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 103, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 104, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 105, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 106, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 107, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 108, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 258, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 259, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(255, 260, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(257, 72, 'F40');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(258, 27, 'F47');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(259, 10, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(259, 22, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(259, 30, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(261, 28, 'G1');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(261, 31, 'H64');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(261, 32, 'H64');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(261, 261, 'H69');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(261, 262, 'H50');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(261, 263, 'H70');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(263, 50, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(263, 51, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(263, 52, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(263, 53, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(263, 54, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(264, 174, 'H30');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(264, 197, 'H30');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(265, 267, 'G83');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(265, 268, 'G85');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(267, 269, 'G98');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(267, 272, 'G99');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(268, 48, 'H57');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(268, 49, 'H57');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(268, 273, 'H55');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(269, 110, 'H58');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(270, 275, 'F52');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(271, 274, 'G107');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(272, 276, 'G61');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 1, 'F38');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 1, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 2, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 3, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 6, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 8, 'G72');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 8, 'G73');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 8, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 8, 'H45');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 11, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 16, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 16, 'H67');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 23, 'H35');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 25, 'H52');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 58, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 59, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 60, 'G94');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 64, 'H24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 65, 'H24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 80, 'H53');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 163, 'H46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 178, 'H37');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 193, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 238, 'H36');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(278, 239, 'H67');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(287, 145, 'G58');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(287, 240, 'G69');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 37, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 38, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 39, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 40, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 42, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 43, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 44, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 45, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 46, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 47, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 57, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 82, 'H42');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 91, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 95, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 96, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 111, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 114, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 115, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 118, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 119, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 120, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 121, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 122, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 123, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 124, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 125, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 137, 'F46');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 151, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 168, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 203, 'H73');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 204, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 206, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 207, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 208, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 209, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 211, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 212, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 213, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 216, 'H44');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 241, 'H51');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 242, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 243, 'H39');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 244, 'H63');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 245, 'H43');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 247, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 248, 'H71');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 270, 'H34');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(288, 271, 'H56');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(289, 14, 'G111');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(290, 133, 'F49');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(291, 249, 'H49');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(292, 250, 'G96');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 221, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 221, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 222, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 222, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 223, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 223, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 224, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 224, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 251, 'G18');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 251, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(293, 252, 'F24');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(295, 253, 'G17');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(295, 253, 'H21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(295, 254, 'G17');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(295, 255, 'G17');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(295, 256, 'G17');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(295, 257, 'G17');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 103, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 104, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 105, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 106, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 107, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 108, 'SCR20');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 258, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 259, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(296, 260, 'G21');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(299, 72, 'F40');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(300, 27, 'F47');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(302, 10, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(302, 22, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(302, 30, 'G15');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(305, 28, 'G1');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(305, 31, 'H64');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(305, 32, 'H64');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(305, 261, 'H69');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(305, 262, 'H50');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(305, 263, 'H70');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(307, 50, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(307, 51, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(307, 52, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(307, 53, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(307, 54, 'H25');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(308, 174, 'H30');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(308, 197, 'H30');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 198, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 199, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 200, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 205, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 210, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 214, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 217, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 218, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 219, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 220, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(309, 246, 'G131');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 138, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 139, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 140, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 141, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 142, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 264, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(310, 265, 'H4');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(311, 147, 'H59');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(311, 266, 'G65');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(313, 267, 'G83');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(313, 268, 'G85');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(315, 269, 'G98');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(315, 272, 'G99');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(317, 48, 'H57');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(317, 49, 'H57');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(317, 273, 'H55');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(318, 110, 'H58');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(320, 275, 'F52');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(321, 274, 'G107');
INSERT INTO `techniques` (`subgroup_id`, `check_id`, `technique`) VALUES(322, 276, 'G61');

-- --------------------------------------------------------

--
-- Table structure for table `test_pass`
--

CREATE TABLE IF NOT EXISTS `test_pass` (
  `check_id` mediumint(8) unsigned NOT NULL,
  `next_check_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`check_id`,`next_check_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_pass`
--

INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(1, 3);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(1, 6);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(1, 7);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(1, 11);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(1, 16);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(2, 3);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(2, 6);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(2, 7);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(2, 11);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(2, 16);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(3, 6);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(3, 16);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(3, 178);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(4, 6);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(6, 7);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(16, 6);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(51, 54);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(53, 54);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(58, 59);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(58, 193);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(111, 203);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(112, 113);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(221, 222);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(222, 223);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(223, 224);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(226, 227);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(227, 228);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(228, 229);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(237, 59);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(237, 60);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(237, 192);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(237, 193);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(238, 59);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(238, 60);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(238, 192);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(238, 193);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(254, 222);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(255, 223);
INSERT INTO `test_pass` (`check_id`, `next_check_id`) VALUES(256, 224);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `title` varchar(80) NOT NULL default '',
  `version` varchar(10) NOT NULL default '',
  `dir_name` varchar(20) NOT NULL default '',
  `last_updated` date NOT NULL default '0000-00-00',
  `extra_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`title`, `version`, `dir_name`, `last_updated`, `extra_info`, `status`) VALUES('AChecker', '0.1', 'default', '2009-05-19', 'This is the default AChecker theme and cannot be deleted as other themes inherit from it. Please do not alter this theme directly as it would complicate upgrading. Instead, create a new theme derived from this one.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `login` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `user_group_id` mediumint(8) NOT NULL,
  `first_name` varchar(100) default NULL,
  `last_name` varchar(100) default NULL,
  `email` varchar(50) default NULL,
  `web_service_id` varchar(40) NOT NULL,
  `status` tinyint(3) NOT NULL default '1',
  `create_date` datetime NOT NULL,
  `last_login` datetime default NULL,
  `preferences` text,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`, `user_group_id`, `first_name`, `last_name`, `email`, `web_service_id`, `status`, `create_date`, `last_login`, `preferences`) VALUES(1, 'ATutor', '0cbab2aec26a53b0107487d43b1b8eb29384ad10', 2, 'ATutor', 'ATutor', NULL, '2f4149673d93b7f37eb27506905f19d63fbdfe2d', 1, '2009-03-11 10:16:55', NULL, NULL);
INSERT INTO `users` (`user_id`, `login`, `password`, `user_group_id`, `first_name`, `last_name`, `email`, `web_service_id`, `status`, `create_date`, `last_login`, `preferences`) VALUES(2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, NULL, NULL, 'admin@admin.com', '71994d562236faf2886b3a270c81c455aa592f11', 1, '2009-05-19 15:59:08', '2009-05-22 09:01:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_decisions`
--

CREATE TABLE IF NOT EXISTS `user_decisions` (
  `user_link_id` mediumint(8) NOT NULL,
  `line_num` int(10) NOT NULL,
  `column_num` int(10) NOT NULL,
  `check_id` mediumint(8) NOT NULL,
  `sequence_id` int(8) NOT NULL,
  `decision` varchar(50) NOT NULL default 'N',
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`user_link_id`,`line_num`,`column_num`,`check_id`),
  KEY `IDX_SEQUENCE` (`user_link_id`,`sequence_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_decisions`
--

INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 65, 2, 54, 1, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 241, 2, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 271, 3, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 262, 4, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 275, 5, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 270, 6, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 261, 7, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 28, 8, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 110, 9, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 71, 1, 248, 10, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 92, 21, 197, 11, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 92, 55, 1, 12, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 92, 55, 251, 13, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 92, 55, 14, 14, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 95, 45, 11, 15, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 95, 45, 178, 16, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 95, 45, 251, 17, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 95, 45, 8, 18, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 95, 45, 14, 19, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 95, 45, 10, 20, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 11, 21, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 16, 22, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 178, 23, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 251, 24, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 8, 25, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 14, 26, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 96, 20, 10, 27, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 103, 21, 197, 28, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 103, 55, 1, 29, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 103, 55, 251, 30, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 103, 55, 14, 31, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 106, 63, 1, 32, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 106, 63, 251, 33, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 106, 63, 14, 34, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 106, 63, 10, 35, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 115, 6, 197, 36, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 116, 9, 197, 37, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 117, 9, 197, 38, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 118, 9, 197, 39, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 119, 9, 197, 40, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 120, 9, 197, 41, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 121, 9, 197, 42, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(1, 122, 9, 197, 43, 'N', '2009-05-20 14:00:35');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 5, 2, 54, 1, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 11, 1, 86, 2, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 11, 1, 87, 3, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 11, 1, 89, 4, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 250, 5, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 248, 6, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 110, 7, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 28, 8, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 241, 9, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 271, 10, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 262, 11, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 270, 12, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 261, 13, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 275, 14, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 1, 155, 15, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 1, 197, 16, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 1, 19, 17, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 11, 18, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 16, 19, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 8, 20, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 251, 21, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 14, 22, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 10, 23, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 98, 155, 24, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 98, 197, 25, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 98, 19, 26, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 11, 27, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 16, 28, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 8, 29, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 251, 30, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 14, 31, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 10, 32, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 4, 155, 33, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 4, 197, 34, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 4, 19, 35, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 11, 36, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 16, 37, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 8, 38, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 251, 39, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 14, 40, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 10, 41, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 32, 9, 155, 42, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 32, 9, 197, 43, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 32, 9, 19, 44, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 33, 9, 155, 45, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 33, 9, 197, 46, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 33, 9, 19, 47, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 34, 9, 155, 48, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 34, 9, 197, 49, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 34, 9, 19, 50, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 35, 9, 155, 51, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 35, 9, 197, 52, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 35, 9, 19, 53, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 36, 9, 155, 54, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 36, 9, 197, 55, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 36, 9, 19, 56, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 37, 9, 155, 57, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 37, 9, 197, 58, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 37, 9, 19, 59, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 38, 9, 155, 60, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 38, 9, 197, 61, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 38, 9, 19, 62, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 39, 9, 155, 63, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 39, 9, 197, 64, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 39, 9, 19, 65, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 40, 9, 155, 66, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 40, 9, 197, 67, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 40, 9, 19, 68, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 48, 4, 155, 69, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 60, 5, 267, 70, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 60, 5, 246, 71, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 62, 9, 188, 72, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 63, 9, 188, 73, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 64, 9, 188, 74, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 65, 9, 189, 75, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 65, 9, 211, 76, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 65, 9, 218, 77, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 65, 9, 55, 78, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 66, 9, 188, 79, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 66, 9, 55, 80, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 69, 5, 86, 81, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 69, 5, 87, 82, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 69, 5, 89, 83, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 76, 5, 267, 84, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 76, 5, 246, 85, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 77, 5, 133, 86, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 77, 5, 137, 87, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 80, 11, 189, 88, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 80, 11, 211, 89, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 80, 11, 218, 90, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 80, 11, 55, 91, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 81, 11, 188, 92, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 81, 11, 55, 93, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 85, 11, 217, 94, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 85, 11, 189, 95, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 85, 11, 55, 96, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 87, 15, 155, 97, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 87, 15, 197, 98, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 87, 15, 19, 99, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 91, 67, 189, 100, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 91, 67, 219, 101, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 91, 67, 55, 102, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 91, 211, 188, 103, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 97, 89, 155, 104, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 97, 89, 197, 105, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 97, 89, 19, 106, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 6, 155, 107, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 6, 197, 108, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 6, 19, 109, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 59, 11, 110, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 59, 16, 111, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 59, 8, 112, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 59, 251, 113, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 59, 14, 114, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 106, 10, 155, 115, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 106, 10, 197, 116, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 106, 10, 19, 117, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 107, 10, 155, 118, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 107, 10, 197, 119, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 107, 10, 19, 120, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 108, 10, 155, 121, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 108, 10, 197, 122, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 108, 10, 19, 123, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 11, 124, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 16, 125, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 239, 126, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 8, 127, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 251, 128, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 178, 129, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 14, 130, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 10, 131, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 191, 155, 132, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 191, 197, 133, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 191, 19, 134, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 11, 135, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 16, 136, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 239, 137, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 8, 138, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 251, 139, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 178, 140, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 14, 141, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 278, 10, 142, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 440, 155, 143, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 440, 197, 144, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 440, 19, 145, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 11, 146, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 16, 147, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 239, 148, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 8, 149, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 251, 150, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 178, 151, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 14, 152, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 484, 10, 153, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 11, 154, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 16, 155, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 239, 156, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 8, 157, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 251, 158, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 178, 159, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 14, 160, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 603, 10, 161, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 742, 155, 162, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 742, 197, 163, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 742, 19, 164, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 5, 155, 165, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 5, 197, 166, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 5, 19, 167, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 11, 168, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 16, 169, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 239, 170, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 8, 171, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 251, 172, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 14, 173, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 120, 5, 86, 174, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 120, 5, 87, 175, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 120, 5, 89, 176, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 134, 5, 86, 177, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 134, 5, 87, 178, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 134, 5, 89, 179, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 148, 5, 86, 180, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 148, 5, 87, 181, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 148, 5, 89, 182, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 157, 4, 155, 183, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 157, 4, 197, 184, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 157, 4, 19, 185, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 158, 2, 155, 186, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 163, 6, 11, 187, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 163, 6, 8, 188, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 163, 6, 251, 189, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 163, 6, 178, 190, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 163, 6, 14, 191, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 166, 8, 155, 192, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 166, 8, 197, 193, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 166, 8, 19, 194, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 167, 8, 155, 195, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 167, 8, 197, 196, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 167, 8, 19, 197, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 168, 8, 155, 198, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 168, 8, 197, 199, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 168, 8, 19, 200, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 169, 8, 155, 201, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 169, 8, 197, 202, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 169, 8, 19, 203, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 170, 8, 155, 204, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 170, 8, 197, 205, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 170, 8, 19, 206, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 177, 57, 155, 207, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 177, 57, 197, 208, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 177, 57, 19, 209, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 178, 54, 155, 210, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 178, 54, 197, 211, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 178, 54, 19, 212, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 179, 54, 155, 213, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 179, 54, 197, 214, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 179, 54, 19, 215, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 8, 155, 216, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 8, 197, 217, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 8, 19, 218, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 11, 219, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 16, 220, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 239, 221, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 8, 222, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 251, 223, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 14, 224, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 10, 225, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 199, 14, 155, 226, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 199, 14, 197, 227, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 199, 14, 19, 228, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 200, 11, 155, 229, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 200, 11, 197, 230, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 200, 11, 19, 231, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 201, 11, 155, 232, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 201, 11, 197, 233, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 201, 11, 19, 234, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 202, 11, 155, 235, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 202, 11, 197, 236, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 202, 11, 19, 237, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 203, 11, 155, 238, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 203, 11, 197, 239, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 203, 11, 19, 240, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 41, 155, 241, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 41, 197, 242, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 41, 19, 243, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 193, 155, 244, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 193, 197, 245, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 193, 19, 246, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 361, 155, 247, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 361, 197, 248, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 361, 19, 249, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 505, 155, 250, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 505, 197, 251, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 505, 19, 252, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 652, 155, 253, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 652, 197, 254, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 652, 19, 255, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 47, 155, 256, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 47, 197, 257, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 47, 19, 258, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 185, 155, 259, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 185, 197, 260, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 185, 19, 261, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 333, 155, 262, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 333, 197, 263, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 333, 19, 264, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 445, 155, 265, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 445, 197, 266, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 445, 19, 267, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 586, 155, 268, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 586, 197, 269, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 586, 19, 270, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 222, 2, 86, 271, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 222, 2, 87, 272, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 222, 2, 89, 273, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 239, 2, 86, 274, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 239, 2, 87, 275, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 239, 2, 89, 276, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 4, 155, 277, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 4, 197, 278, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 4, 19, 279, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 11, 280, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 16, 281, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 8, 282, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 251, 283, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 14, 284, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 10, 285, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 247, 9, 155, 286, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 247, 9, 197, 287, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 247, 9, 19, 288, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 249, 9, 155, 289, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 249, 9, 197, 290, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 249, 9, 19, 291, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 250, 9, 155, 292, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 250, 9, 197, 293, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 250, 9, 19, 294, 'N', '2009-05-25 09:50:50');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 179, 295, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 98, 296, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 131, 297, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 184, 298, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 276, 299, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 266, 300, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 20, 1, 99, 301, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 1, 18, 302, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 20, 253, 303, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 98, 18, 304, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 22, 113, 253, 305, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 4, 18, 306, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 27, 25, 253, 307, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 28, 4, 42, 308, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 32, 9, 18, 309, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 33, 9, 18, 310, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 34, 9, 18, 311, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 35, 9, 18, 312, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 36, 9, 18, 313, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 37, 9, 18, 314, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 38, 9, 18, 315, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 39, 9, 18, 316, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 40, 9, 18, 317, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 48, 4, 18, 318, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 49, 4, 43, 319, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 60, 5, 268, 320, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 60, 5, 272, 321, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 60, 5, 269, 322, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 60, 5, 265, 323, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 74, 4, 43, 324, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 76, 5, 268, 325, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 76, 5, 272, 326, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 76, 5, 269, 327, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 76, 5, 265, 328, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 77, 5, 136, 329, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 87, 15, 18, 330, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 95, 4, 43, 331, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 97, 89, 18, 332, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 6, 18, 333, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 99, 59, 253, 334, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 103, 4, 43, 335, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 106, 10, 18, 336, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 107, 10, 18, 337, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 108, 10, 18, 338, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 112, 4, 43, 339, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 52, 253, 340, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 191, 18, 341, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 253, 342, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 178, 343, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 251, 344, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 11, 345, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 16, 346, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 8, 347, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 10, 348, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 14, 349, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 248, 239, 350, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 387, 197, 351, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 387, 19, 352, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 387, 18, 353, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 253, 354, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 178, 355, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 251, 356, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 11, 357, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 16, 358, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 8, 359, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 10, 360, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 14, 361, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 474, 239, 362, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 636, 197, 363, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 636, 19, 364, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 636, 18, 365, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 253, 366, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 178, 367, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 251, 368, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 11, 369, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 16, 370, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 8, 371, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 10, 372, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 14, 373, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 680, 239, 374, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 253, 375, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 178, 376, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 251, 377, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 11, 378, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 16, 379, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 8, 380, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 10, 381, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 14, 382, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 799, 239, 383, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 938, 197, 384, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 938, 19, 385, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 938, 18, 386, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 116, 4, 43, 387, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 5, 18, 388, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 118, 104, 253, 389, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 132, 4, 43, 390, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 157, 4, 18, 391, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 158, 2, 18, 392, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 160, 2, 43, 393, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 163, 6, 253, 394, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 166, 8, 18, 395, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 167, 8, 18, 396, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 168, 8, 18, 397, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 169, 8, 18, 398, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 170, 8, 18, 399, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 177, 57, 18, 400, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 178, 54, 18, 401, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 179, 54, 18, 402, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 4, 44, 403, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 8, 18, 404, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 195, 78, 253, 405, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 199, 14, 18, 406, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 200, 11, 18, 407, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 201, 11, 18, 408, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 202, 11, 18, 409, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 203, 11, 18, 410, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 208, 4, 44, 411, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 38, 197, 412, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 38, 19, 413, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 38, 18, 414, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 205, 197, 415, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 205, 19, 416, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 205, 18, 417, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 357, 197, 418, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 357, 19, 419, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 357, 18, 420, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 525, 197, 421, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 525, 19, 422, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 525, 18, 423, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 669, 197, 424, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 669, 19, 425, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 669, 18, 426, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 215, 4, 44, 427, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 47, 18, 428, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 185, 18, 429, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 333, 18, 430, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 445, 18, 431, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 217, 586, 18, 432, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 4, 18, 433, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 244, 38, 253, 434, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 247, 9, 18, 435, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 249, 9, 18, 436, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 250, 9, 18, 437, 'N', '2009-05-25 09:53:28');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 8, 438, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 16, 439, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 178, 440, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 251, 441, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 11, 442, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 14, 443, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 239, 444, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 82, 10, 445, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 244, 197, 446, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 244, 19, 447, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 8, 448, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 16, 449, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 178, 450, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 251, 451, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 11, 452, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 14, 453, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 239, 454, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 288, 10, 455, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 8, 456, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 16, 457, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 178, 458, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 251, 459, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 11, 460, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 14, 461, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 239, 462, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 437, 10, 463, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 599, 197, 464, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 599, 19, 465, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 8, 466, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 16, 467, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 178, 468, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 251, 469, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 11, 470, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 14, 471, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 239, 472, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 638, 10, 473, 'N', '2009-05-25 11:12:17');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 114, 5, 82, 474, 'N', '2009-05-25 12:49:56');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 204, 197, 475, 'N', '2009-05-25 12:49:56');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 204, 19, 476, 'N', '2009-05-25 12:49:56');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 368, 197, 477, 'N', '2009-05-25 12:49:56');
INSERT INTO `user_decisions` (`user_link_id`, `line_num`, `column_num`, `check_id`, `sequence_id`, `decision`, `last_update`) VALUES(2, 210, 368, 19, 478, 'N', '2009-05-25 12:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime default NULL,
  PRIMARY KEY  (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `title`, `description`, `create_date`, `last_update`) VALUES(1, 'Administrator', 'Administrate guidelines, checks, users, languages.', '2009-05-19 15:58:46', '2009-05-25 10:12:16');
INSERT INTO `user_groups` (`user_group_id`, `title`, `description`, `create_date`, `last_update`) VALUES(2, 'User', 'Regular user. Can make decision on likely and potential problems. When a user revisits a report, decisions previously made for Likely and Potential problems will be restored for the matching URL. Regular users can create custom guidelines.', '2009-05-19 15:58:46', NULL);
INSERT INTO `user_groups` (`user_group_id`, `title`, `description`, `create_date`, `last_update`) VALUES(3, 'Guideline/Check editor', 'Create, edit, delete custom checks and guidelines.', '2009-05-19 15:58:46', NULL);
INSERT INTO `user_groups` (`user_group_id`, `title`, `description`, `create_date`, `last_update`) VALUES(4, 'Translator', 'Translate AChecker terms into a foreign lanugage.', '2009-05-19 15:58:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_privilege`
--

CREATE TABLE IF NOT EXISTS `user_group_privilege` (
  `user_group_id` mediumint(8) unsigned NOT NULL,
  `privilege_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`user_group_id`,`privilege_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_privilege`
--

INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 1);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 2);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 3);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 4);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 5);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 6);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(1, 7);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(2, 1);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(2, 3);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(2, 7);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(3, 1);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(3, 3);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(3, 4);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(3, 7);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(4, 1);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(4, 6);
INSERT INTO `user_group_privilege` (`user_group_id`, `privilege_id`) VALUES(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user_links`
--

CREATE TABLE IF NOT EXISTS `user_links` (
  `user_link_id` mediumint(8) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL,
  `URI` text NOT NULL,
  `last_guideline_ids` varchar(50) NOT NULL,
  `last_sessionID` varchar(40) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`user_link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_links`
--

INSERT INTO `user_links` (`user_link_id`, `user_id`, `URI`, `last_guideline_ids`, `last_sessionID`, `last_update`) VALUES(1, 2, 'http://ontario.ca', '8,7', 'ba3fdcfa55c326c4e7d0406595dceaf3b002ffa4', '2009-05-20 15:10:27');
INSERT INTO `user_links` (`user_link_id`, `user_id`, `URI`, `last_guideline_ids`, `last_sessionID`, `last_update`) VALUES(2, 2, 'http://atutor.ca', '8', '870a24ddaf28efeae390b3320f6ca9b8bb19757d', '2009-05-25 10:34:57');

