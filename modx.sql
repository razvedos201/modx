-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 28 2016 г., 13:09
-- Версия сервера: 5.5.45
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `modx`
--

-- --------------------------------------------------------

--
-- Структура таблицы `modx_active_users`
--

CREATE TABLE IF NOT EXISTS `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Дамп данных таблицы `modx_active_users`
--

INSERT INTO `modx_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'admin', 1469700187, NULL, '76', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_categories`
--

CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `modx_categories`
--

INSERT INTO `modx_categories` (`id`, `category`) VALUES
(1, 'Demo Content'),
(2, 'Js'),
(3, 'Login'),
(4, 'Manager and Admin'),
(5, 'Search'),
(6, 'Navigation'),
(7, 'Content'),
(8, 'Forms'),
(9, 'novo');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_documentgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_document_groups`
--

CREATE TABLE IF NOT EXISTS `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_event_log`
--

CREATE TABLE IF NOT EXISTS `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_keyword_xref`
--

CREATE TABLE IF NOT EXISTS `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_log`
--

CREATE TABLE IF NOT EXISTS `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=82 ;

--
-- Дамп данных таблицы `modx_manager_log`
--

INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1469697093, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(2, 1469697093, 1, 'admin', 17, '-', '-', 'Editing settings'),
(3, 1469697201, 1, 'admin', 30, '-', '-', 'Saving settings'),
(4, 1469697204, 1, 'admin', 27, '1', 'MODX CMS Install Success', 'Editing resource'),
(5, 1469697278, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(6, 1469697279, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(7, 1469697283, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(8, 1469697384, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(9, 1469697385, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(10, 1469697463, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(11, 1469697545, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(12, 1469697549, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(13, 1469697550, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(14, 1469697705, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(15, 1469697727, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(16, 1469697732, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(17, 1469697736, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(18, 1469697739, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(19, 1469697740, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(20, 1469697751, 1, 'admin', 76, '-', '-', 'Element management'),
(21, 1469697754, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template'),
(22, 1469697780, 1, 'admin', 76, '-', '-', 'Element management'),
(23, 1469697804, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template'),
(24, 1469697849, 1, 'admin', 20, '-', 'template', 'Saving template'),
(25, 1469697849, 1, 'admin', 76, '-', '-', 'Element management'),
(26, 1469697857, 1, 'admin', 16, '5', 'template', 'Editing template'),
(27, 1469697883, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(28, 1469697892, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(29, 1469697907, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(30, 1469697921, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
(31, 1469697942, 1, 'admin', 31, '-', '-', 'Using file manager'),
(32, 1469697997, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(33, 1469697997, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(34, 1469698004, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(35, 1469698007, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(36, 1469698008, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(37, 1469698046, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(38, 1469698176, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(39, 1469698187, 1, 'admin', 76, '-', '-', 'Element management'),
(40, 1469698189, 1, 'admin', 16, '5', 'template', 'Editing template'),
(41, 1469698215, 1, 'admin', 31, '-', '-', 'Using file manager'),
(42, 1469698218, 1, 'admin', 76, '-', '-', 'Element management'),
(43, 1469698222, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template'),
(44, 1469698271, 1, 'admin', 95, '-', '-', 'Importing resources from HTML'),
(45, 1469698911, 1, 'admin', 76, '-', '-', 'Element management'),
(46, 1469698913, 1, 'admin', 16, '5', 'template', 'Editing template'),
(47, 1469698939, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(48, 1469699134, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(49, 1469699138, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(50, 1469699139, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(51, 1469699160, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(52, 1469699163, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(53, 1469699165, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(54, 1469699166, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(55, 1469699548, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(56, 1469699560, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(57, 1469699562, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(58, 1469699566, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(59, 1469699583, 1, 'admin', 76, '-', '-', 'Element management'),
(60, 1469699589, 1, 'admin', 16, '5', 'template', 'Editing template'),
(61, 1469699595, 1, 'admin', 20, '5', 'template', 'Saving template'),
(62, 1469699595, 1, 'admin', 76, '-', '-', 'Element management'),
(63, 1469699602, 1, 'admin', 16, '5', 'template', 'Editing template'),
(64, 1469699608, 1, 'admin', 20, '5', 'template', 'Saving template'),
(65, 1469699608, 1, 'admin', 76, '-', '-', 'Element management'),
(66, 1469699615, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(67, 1469699620, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(68, 1469699623, 1, 'admin', 5, '1', 'Главная', 'Saving resource'),
(69, 1469699624, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(70, 1469699668, 1, 'admin', 76, '-', '-', 'Element management'),
(71, 1469699670, 1, 'admin', 16, '5', 'template', 'Editing template'),
(72, 1469700058, 1, 'admin', 20, '5', 'template', 'Saving template'),
(73, 1469700058, 1, 'admin', 76, '-', '-', 'Element management'),
(74, 1469700074, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(75, 1469700082, 1, 'admin', 76, '-', '-', 'Element management'),
(76, 1469700083, 1, 'admin', 16, '5', 'template', 'Editing template'),
(77, 1469700154, 1, 'admin', 20, '5', 'template', 'Saving template'),
(78, 1469700154, 1, 'admin', 76, '-', '-', 'Element management'),
(79, 1469700169, 1, 'admin', 16, '5', 'template', 'Editing template'),
(80, 1469700187, 1, 'admin', 20, '5', 'template', 'Saving template'),
(81, 1469700187, 1, 'admin', 76, '-', '-', 'Element management');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_users`
--

CREATE TABLE IF NOT EXISTS `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_manager_users`
--

INSERT INTO `modx_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'uncrypt>cce8e0d11cce43afbcd15541310fb3afc90121ab');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_member_groups`
--

CREATE TABLE IF NOT EXISTS `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content`
--

CREATE TABLE IF NOT EXISTS `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная', 'Главная', '', 'minimal-base', '', 1, 0, 0, 0, 0, '', '', 1, 5, 0, 1, 1, 1, 1130304721, 1, 1469699623, 0, 0, 0, 1130304721, 1, 'Base Install', 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_htmlsnippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(1, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 2, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\n\nif ($modx->db->getValue($modx->db->select(''count(id)'', $modx->getFullTableName(''site_tmplvars''), "name=''documentTags''"))) {\n	mm_widget_tags(''documentTags'', '' ''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\n}\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\n', 0),
(2, 'WebLoginSideBar', 'WebLogin Tpl', 0, 'none', 3, 0, '<!-- #declare:separator <hr> -->\n<!-- login form section-->\n<form method="post" name="loginfrm" action="[+action+]">\n    <input type="hidden" value="[+rememberme+]" name="rememberme" />\n    <fieldset>\n        <h3>Your Login Details</h3>\n        <label for="username">User: <input type="text" name="username" id="username" tabindex="1" onkeypress="return webLoginEnter(document.loginfrm.password);" value="[+username+]" /></label>\n    	<label for="password">Password: <input type="password" name="password" id="password" tabindex="2" onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);" value="" /></label>\n    	<input type="checkbox" id="checkbox_1" name="checkbox_1" tabindex="3" size="1" value="" [+checkbox+] onclick="webLoginCheckRemember()" /><label for="checkbox_1" class="checkbox">Remember me</label>\n    	<input type="submit" value="[+logintext+]" name="cmdweblogin" class="button" />\n	<a href="#" onclick="webLoginShowForm(2);return false;" id="forgotpsswd">Forget Your Password?</a>\n	</fieldset>\n</form>\n<hr>\n<!-- log out hyperlink section -->\n<h4>You''re already logged in</h4>\nDo you wish to <a href="[+action+]" class="button">[+logouttext+]</a>?\n<hr>\n<!-- Password reminder form section -->\n<form name="loginreminder" method="post" action="[+action+]">\n    <fieldset>\n        <h3>It happens to everyone...</h3>\n        <input type="hidden" name="txtpwdrem" value="0" />\n        <label for="txtwebemail">Enter the email address of your account to reset your password: <input type="text" name="txtwebemail" id="txtwebemail" size="24" /></label>\n        <label>To return to the login form, press the cancel button.</label>\n    	<input type="submit" value="Submit" name="cmdweblogin" class="button" /> <input type="reset" value="Cancel" name="cmdcancel" onclick="webLoginShowForm(1);" class="button" style="clear:none;display:inline" />\n    </fieldset>\n</form>\n\n', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_keywords`
--

CREATE TABLE IF NOT EXISTS `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_modules`
--

CREATE TABLE IF NOT EXISTS `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Modules' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `modx_site_modules`
--

INSERT INTO `modx_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', 'include_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.2</strong> first repository for MODX EVO', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', '//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(''../assets/modules/store/core.php'');');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_depobj`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugins`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `modx_site_plugins`
--

INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'CodeMirror', '<strong>1.3</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.6', 0, 4, 0, '$_CM_BASE = ''assets/plugins/codemirror/'';\r\n\r\n$_CM_URL = $modx->config[''site_url''] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .''codemirror.plugin.php'');\r\n\r\n', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light; &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true', 0, ''),
(2, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, ''),
(3, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, ''),
(4, 'ManagerManager', '<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users.', 0, 4, 0, '// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php \n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end.\n\n// See also user-friendly module for editing ManagerManager configuration file ddMMEditor (http://code.divandesign.biz/modx/ddmmeditor).\n\n// ManagerManager requires jQuery 1.9.1, which is located in /assets/plugins/managermanager/js/ folder.\n\n// You don''t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\ninclude($modx->config[''base_path''].''assets/plugins/managermanager/mm.inc.php'');', 0, '&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules', 0, ''),
(5, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '// In manager\nif (isset($_SESSION[''mgrValidated''])) {\n\n    $show = TRUE;\n\n    if ($disabled  != '''') {\n        $arr = array_filter(array_map(''intval'', explode('','', $disabled)));\n        if (in_array($modx->documentIdentifier, $arr)) {\n            $show = FALSE;\n        }\n    }\n\n    if ($show) {\n        // Replace [*#tv*] with QM+ edit TV button placeholders\n        if ($tvbuttons == ''true'') {\n            $e = $modx->Event;\n            if ($e->name == ''OnParseDocument'') {\n                 $output = &$modx->documentOutput;\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\n                 $modx->documentOutput = $output;\n             }\n         }\n        // In manager\n        if (isset($_SESSION[''mgrValidated''])) {\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n        }\n    }\n}', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ''),
(6, 'Search Highlight', '<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results', 0, 5, 0, '/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.evo.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://forums.modx.com/thread/47775/plugin-highlight-search-terms\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  ''utf8'' => ''UTF-8'',\n  ''latin1'' => ''ISO-8859-1'',\n  ''latin2'' => ''ISO-8859-2''\n);\n\nif (isset($_REQUEST[''searched'']) && isset($_REQUEST[''highlight''])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = ''<div class="searchTerms">Search Terms: '';\n     $removeText = ''Remove Highlighting'';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = ''oneword'';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[''searched'']));\n    $highlight = strip_tags(stripslashes($_REQUEST[''highlight'']));\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags(stripslashes($_REQUEST[''advsearch'']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[''searched'']);\n    $highlight = strip_tags($_REQUEST[''highlight'']);\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags($_REQUEST[''advsearch'']);\n  }\n\n  if ($advsearch != ''nowords'') {\n\n    $searchArray = array();\n    if ($advsearch == ''exactphrase'') $searchArray[0] = $searched;\n    else $searchArray = explode('' '', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(''term'' => $word, ''class'' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode("<body", $output); // break out the head\n\n    $highlightClass = explode('' '',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(''/[^A-Za-z0-9_-]/ms'', $value) == 1 ? '''' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == ''UTF-8'') ? ''iu'' : ''i'';\n    $lookBehind = ''/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)'';  // avoid a match with a html entity\n    $lookAhead = ''(?=[^>]*<)/''; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][''term''];\n      $class = $highlightClass[0].'' ''.$highlightClass[$searchTerms[$i][''class'']];\n\n      $highlightText .= ($i > 0) ? '', '' : '''';\n      $highlightText .= ''<span class="''.$class.''">''.$word.''</span>'';\n\n      $pattern = $lookBehind . preg_quote($word, ''/'') . $lookAhead . $pcreModifier;\n      $replacement = ''<span class="'' . $class . ''">${0}</span>'';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode("<body", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= ''<br /><a href="''.$removeUrl.''" class="ajaxSearch_removeHighlight">''.$removeText.''</a></div>'';\n\n    $output = str_replace(''<!--search_terms-->'',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}', 0, '', 1, ''),
(7, 'TinyMCE Rich Text Editor', '<strong>3.5.11</strong> Javascript WYSIWYG Editor', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce/plugin.tinymce.php'';\n', 0, '&customparams=Custom Parameters;textarea;valid_elements : "*[*]", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;500', 0, ''),
(8, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;utf8lowercase &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;legal characters &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `modx_site_plugin_events`
--

INSERT INTO `modx_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(2, 34, 0),
(2, 35, 0),
(2, 36, 0),
(2, 40, 0),
(2, 41, 0),
(2, 42, 0),
(3, 80, 0),
(3, 81, 0),
(3, 93, 0),
(4, 28, 0),
(4, 29, 0),
(4, 30, 0),
(4, 31, 0),
(4, 35, 0),
(4, 53, 0),
(4, 205, 0),
(5, 3, 0),
(5, 13, 0),
(5, 28, 0),
(5, 31, 0),
(5, 92, 0),
(6, 3, 0),
(7, 85, 0),
(7, 87, 0),
(7, 88, 0),
(8, 100, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_snippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'AjaxSearch', '<strong>1.10.1</strong> Ajax and non-Ajax search that supports results highlighting', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/ajaxSearch/snippet.ajaxSearch.php'';', 0, '', ''),
(2, 'Breadcrumbs', '<strong>1.0.5</strong> Configurable breadcrumb page-trail navigation', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ''),
(3, 'Ditto', '<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
(4, 'DocLister', '<strong>2.1.30</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/DocLister/snippet.DocLister.php'';', 0, '', ''),
(5, 'eForm', '<strong>1.4.6</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(6, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(7, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(8, 'Jot', '<strong>1.1.4</strong> User comments with moderation and email subscription', 0, 7, 0, '/*####\n#\n# Author: Armand "bS" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modx.com/extras/package/jot\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[''base_path''] . ''assets/snippets/jot/'';\ninclude_once($jotPath.''jot.class.inc.php'');\n\n$Jot = new CJot;\n$Jot->VersionCheck("1.1.4");\n$Jot->Set("path",$jotPath);\n$Jot->Set("action", $action);\n$Jot->Set("postdelay", $postdelay);\n$Jot->Set("docid", $docid);\n$Jot->Set("tagid", $tagid);\n$Jot->Set("subscribe", $subscribe);\n$Jot->Set("moderated", $moderated);\n$Jot->Set("captcha", $captcha);\n$Jot->Set("badwords", $badwords);\n$Jot->Set("bw", $bw);\n$Jot->Set("sortby", $sortby);\n$Jot->Set("numdir", $numdir);\n$Jot->Set("customfields", $customfields);\n$Jot->Set("guestname", $guestname);\n$Jot->Set("canpost", $canpost);\n$Jot->Set("canview", $canview);\n$Jot->Set("canedit", $canedit);\n$Jot->Set("canmoderate", $canmoderate);\n$Jot->Set("trusted", $trusted);\n$Jot->Set("pagination", $pagination);\n$Jot->Set("placeholders", $placeholders);\n$Jot->Set("subjectSubscribe", $subjectSubscribe);\n$Jot->Set("subjectModerate", $subjectModerate);\n$Jot->Set("subjectAuthor", $subjectAuthor);\n$Jot->Set("notify", $notify);\n$Jot->Set("notifyAuthor", $notifyAuthor);\n$Jot->Set("validate", $validate);\n$Jot->Set("title", $title);\n$Jot->Set("authorid", $authorid);\n$Jot->Set("css", $css);\n$Jot->Set("cssFile", $cssFile);\n$Jot->Set("cssRowAlt", $cssRowAlt);\n$Jot->Set("cssRowMe", $cssRowMe);\n$Jot->Set("cssRowAuthor", $cssRowAuthor);\n$Jot->Set("tplForm", $tplForm);\n$Jot->Set("tplComments", $tplComments);\n$Jot->Set("tplModerate", $tplModerate);\n$Jot->Set("tplNav", $tplNav);\n$Jot->Set("tplNotify", $tplNotify);\n$Jot->Set("tplNotifyModerator", $tplNotifyModerator);\n$Jot->Set("tplNotifyAuthor", $tplNotifyAuthor);\n$Jot->Set("tplSubscribe", $tplSubscribe);\n$Jot->Set("debug", $debug);\n$Jot->Set("output", $output);\nreturn $Jot->Run();', 0, '', ''),
(9, 'ListIndexer', '<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/listindexer/snippet.listindexer.php'';', 0, '', ''),
(10, 'MemberCheck', '<strong>1.1</strong> Show chunks based on a logged in Web User''s group membership', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/membercheck/snippet.membercheck.php'';', 0, '', ''),
(11, 'Personalize', '<strong>2.1</strong> Personalize snippet', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/personalize/snippet.personalize.php'';', 0, '', ''),
(12, 'phpthumb', '<strong>1.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/phpthumb/snippet.phpthumb.php'';\r\n', 0, '', ''),
(13, 'Reflect', '<strong>2.1.1</strong> Generates date-based archives using Ditto', 0, 7, 0, '/*\n * Author: \n *      Mark Kaplan for MODX CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page''s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[''base_path''].$reflect_base : $modx->config[''base_path'']."assets/snippets/reflect/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODX base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base."configs/default.config.php");\nrequire($reflect_base."default.templates.php");\nif ($config != "default") {\n    require((substr($config, 0, 5) != "@FILE") ? $reflect_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id."_" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    "" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[''id''];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODX document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODX Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODX fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : "%d-%b-%y %H:%M";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    "%d-%b-%y %H:%M"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : "DESC";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "DESC"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : "ASC";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "ASC"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$emptymsg = isset($emptymsg)? $emptymsg : "The Ditto object is invalid. Please check it.";\n/*\n    Param: emptymsg\n\n    Purpose:\n    Message to return if error\n\n    Options:\n    Any string\n    \n    Default:\n    The Ditto object is invalid. Please check it.\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = "reflect_".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: "@CODE:".$defaultTemplates[''item''];\n    $dParams = array(\n        "id" => "$rID",\n        "save" => "3",  \n        "summarize" => "all",\n        "tpl" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode("|",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(":",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(''reflect_base'',''config'',''id'',''getDocuments'',''showItems'',''groupByYears'',''targetID'',''yearSortDir'',''monthSortDir'',''start'',''phx'',''tplContainer'',''tplYear'',''tplMonth'',''tplMonthInner'',''tplItem'',''save'');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != ''tpl'') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : "Ditto";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        "Ditto"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID."_ditto_object");\n    $resource = $modx->getPlaceholder($rID."_ditto_resource");\n} else {\n    $ditto = $modx->getPlaceholder($id."ditto_object");\n    $resource = $modx->getPlaceholder($id."ditto_resource");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : $emptymsg;\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[''tpl''] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[''tpl''];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year''] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[''year''];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year_inner''] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[''year_inner''];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month''] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[''month''];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month_inner''] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[''month_inner''];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''item''] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[''item''];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField("date","display","custom");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists("reflect") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = '''';\n    $ph = array(''year''=>'''',''month''=>'''',''item''=>'''',''out''=>'''');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date["year"];\n        $month = $date["mon"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == "DESC") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == "ASC") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = '''';\n        $r_month = '''';\n        $r_month_2 = '''';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime("%B", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL("month=".$mon."&year=".$year."&day=false&start=0",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array("year"=>$year,"month"=>$month_text,"url"=>$month_url,"count"=>$month_count),$templates[''month'']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][''items''][] = $ditto->render($item, $templates[''item''], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(''wrapper'' => implode('''',$items[$year][$mon][''items''])),$templates[''month_inner'']);\n                $items[$year][$mon] = $ditto->template->replace(array(''wrapper'' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL("year=".$year."&month=false&day=false&start=0",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array("year"=>$year,"url"=>$year_url,"count"=>$year_count),$templates[''year'']);\n            $var = $ditto->template->replace(array(''wrapper''=>implode('''',$items[$year])),$templates[''year_inner'']);\n            $output .= $ditto->template->replace(array(''wrapper''=>$var),$r_year);\n        } else {\n            $output .= implode('''',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(''wrapper''=>$output),$templates[''tpl'']);\n    $modx->setPlaceholder($id.''reset'',$ditto->buildURL(''year=false&month=false&day=false'',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);\n', 0, '', ''),
(14, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(15, 'Wayfinder', '<strong>2.0.4</strong> Completely template-driven and highly flexible menu builder', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';\n', 0, '', ''),
(16, 'WebChangePwd', '<strong>1.0.1</strong> Allows Web User to change their password from the front-end of the website', 0, 3, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->isBackend())? "../":"");\n$snipPath .= "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[''cmdwebchngpwd'']);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/webchangepwd.inc.php";\n\n# Return\nreturn $output;\n\n\n\n', 0, '', ''),
(17, 'WebLogin', '<strong>1.1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 3, 0, '# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? array_filter(array_map(''intval'', explode('','', $loginhomeid))):array($modx->config[''login_home''],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:''Login'';\n$logoutText	= isset($logouttext)? $logouttext:''Logout'';\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$webLoginMode = isset($_REQUEST[''webloginmode''])? $_REQUEST[''webloginmode'']: '''';\n$isLogOut		= $webLoginMode==''lo'' ? 1:0;\n$isPWDActivate	= $webLoginMode==''actp'' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[''cmdweblogin'']) || isset($_POST[''cmdweblogin_x'']));\n$txtPwdRem 		= isset($_REQUEST[''txtpwdrem''])? $_REQUEST[''txtpwdrem'']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==''1'' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: '''';\n$cookieKey = substr(md5($site_id."Web-User"),0,15);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once ($modx->config[''site_manager_path''] . "includes/crypt.class.inc.php");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[''site_manager_path''] . "includes/log.class.inc.php";\n	include_once $snipPath."weblogin/weblogin.processor.inc.php";\n}\n\ninclude_once $snipPath."weblogin/weblogin.inc.php";\n\n# Return\nreturn $output;\n', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
(18, 'WebSignup', '<strong>1.1.1</strong> Basic Web User account creation/signup system', 0, 3, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#	    		   If custom template AND captcha on AND using WebSignup and \n#                  WebLogin on the same page make sure you have a field named\n#                  cmdwebsignup. In the default template it is the submit button \n#                  One can use a hidden field.\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n    return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:"";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[''use_captcha''] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? array_filter(array_map(''trim'', explode('','', $groups))):array();\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[''cmdwebsignup'']);\n\n$output = '''';\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/websignup.inc.php";\n\n# Return\nreturn $output;', 0, '&tpl=Template;string;', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.' AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `modx_site_templates`
--

INSERT INTO `modx_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`) VALUES
(3, 'Minimal Template', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0, 1),
(4, 'MODxHost', '<strong>1.0</strong> Legacy MODX Host template including dropdown menu', 0, 1, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n\n<head>\n  <title>[(site_name)] | [*pagetitle*]</title>\n  <meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" />\n  <base href="[(site_url)]"></base>\n  <link rel="stylesheet" href="assets/templates/modxhost/layout.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/modxmenu.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/form.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/modx.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/print.css" type="text/css" media="print" />\n  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="[(site_url)][~11~]" />\n  <script src="[(site_manager_url)]media/script/mootools/mootools.js" type="text/javascript"></script>\n  <script src="assets/templates/modxhost/drop_down_menu.js" type="text/javascript"></script>\n</head>\n<body>\n<div id="wrapper">\n  <div id="minHeight"></div>\n  <div id="outer">\n    <div id="inner">\n      <div id="right">\n        <div id="right-inner">\n          <h1 style="text-indent: -5000px;padding: 0px; margin:0px; font-size: 1px;">[(site_name)]</h1>\n          <div id="sidebar">\n            <h2>News:</h2>\n            [[Ditto? &parents=`2` &display=`2` &total=`20` &removeChunk=`Comments` &tpl=`nl_sidebar`]]\n            <div id="recentdocsctnr">\n              <h2>Most Recent:</h2>\n				<a name="recentdocs"></a><ul class="LIn_shortMode">[[Ditto? &showInMenuOnly="1" &parents=0&display=5&tpl=''@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="LIn_date">[+date+]</span> <span class="LIn_desc"></span></li>'']]</ul> </div>\n            <h2>Login:</h2>\n            <div id="sidebarlogin">[!WebLogin? &tpl=`WebLoginSideBar` &loginhomeid=`[(site_start)]`!]</div>\n            <h2>Meta:</h2>\n            <p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></p>\n            <p><a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page uses valid Cascading Stylesheets" rel="external">Valid <abbr title="W3C Cascading Stylesheets">css</abbr></a></p>\n            <p><a href="http://modx.com" title="Ajax CMS and PHP Application Framework">MODX</a></p>\n          </div>\n          <!-- close #sidebar -->\n        </div>\n        <!-- end right inner-->\n      </div>\n      <!-- end right -->\n      <div id="left">\n        <div id="left-inner">\n          [[Breadcrumbs?]]\n          <div id="content">\n            <div class="post">\n              <h2>[*longtitle*]</h2>\n              [*#content*] </div>\n            <!-- close .post (main column content) -->\n          </div>\n          <!-- close #content -->\n        </div>\n        <!-- end left-inner -->\n      </div>\n      <!-- end left -->\n    </div>\n    <!-- end inner -->\n    <div id="clearfooter"></div>\n    <div id="header">\n      <h1><a id="logo" href="[~[(site_start)]~]" title="[(site_name)]">[(site_name)]</a></h1>\n\n      <div id="search"><!--search_terms--><span id="search-txt">SEARCH</span><a name="search"></a>[!AjaxSearch? &ajaxSearch=`1` &landingPage=`8` &moreResultsPage=`8` &addJscript=`0` &showIntro=`0` &ajaxMax=`5` &extract=`1`!]</div>\n      <div id="ajaxmenu"> [[Wayfinder?startId=`0` &outerTpl=`mh.OuterTpl` &innerTpl=`mh.InnerTpl` &rowTpl=`mh.RowTpl` &innerRowTpl=`mh.InnerRowTpl` &firstClass=`first` &hereClass=``]] </div>\n      <!-- end topmenu -->\n    </div>\n    <!-- end header -->\n    <br style="clear:both;height:0;font-size: 1px" />\n    <div id="footer">\n      <p> <a href="http://modx.com" title="Ajax CMS and PHP Application Framework">Powered\n          by MODX</a> &nbsp;<a href="http://modx.com/" title="Template Designed by modXhost.com">Template &copy; 2006-2011\n          modXhost.com</a><br />\n        Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved\n        from [^s^]. </p>\n    </div>\n    <!-- end footer -->\n  </div>\n  <!-- end outer div -->\n</div>\n<!-- end wrapper -->\n</body>\n</html>', 0, 1),
(5, 'template', 'novotec', 0, 0, '', 0, '<!doctype html>\r\n<html lang="en" xmlns="http://www.w3.org/1999/html">\r\n<head>\r\n	<base href="[(site_url)]" />\r\n\r\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>\r\n    <title>Сайт</title>\r\n	<link rel="stylesheet" type="text/css" href="/assets/templates/novotec/css/reset.css"/>\r\n    <link rel="stylesheet" type="text/css" href="/assets/templates/novotec/css/style.css"/>\r\n</head>\r\n<body>\r\n<div id="container">\r\n    <div id="header_top_wrapper">\r\n        <div id="header_top">\r\n            <div id="header_top_left">\r\n                <div id="logo">\r\n					<img src="/assets/templates/novotec/images/logo.png">\r\n                </div>\r\n                <div id="logo_title">\r\n                    <img src="/assets/templates/novotec/images/logo2.png" alt="">\r\n\r\n                    <p>Новые технологии в энергоремонте</p>\r\n                </div>\r\n            </div>\r\n            <div id="header_top_right">\r\n                <div id="contacts_wrapper">\r\n                    <div id="phone">\r\n                        <p>+7(495)790-95-28\r\n                            <img src="/assets/templates/novotec/images/phone_icon.png" alt=""></p>\r\n                    </div>\r\n                    <div id="email">\r\n                        <p>zakaz@remontenergo.ru\r\n                            <img src="/assets/templates/novotec/images/mail_icon.png" alt=""></p>\r\n                    </div>\r\n                    <div id="address">\r\n                        <p>125493, Россия, Москва,\r\n                            <br>ул. Флотская дом 5 корпус 2</p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n            <div style="clear: both;"></div><!--костыль-->\r\n        </div>\r\n    </div>\r\n    <div id="header_bottom_wrapper">\r\n        <div id="header_bottom">\r\n            <div id="main_menu">\r\n                <ul>\r\n                    <li><a href="#">О компании</a></li>\r\n                    <li><a href="#">Сделать заказ</a></li>\r\n                    <li><a href="#">Новости</a></li>\r\n                    <li><a href="#">Наши партнеры</a></li>\r\n                    <li><a href="#">Вакансии</a></li>\r\n                    <li><a href="#">Контакты</a></li>\r\n                </ul>\r\n            </div>\r\n            <div id="search">\r\n                <form action="#">\r\n                    <input type="text" placeholder="Начать поиск...">\r\n                </form>\r\n            </div>\r\n            <div style="clear: both;"></div><!--костыль-->\r\n        </div>\r\n    </div>\r\n    <div id="main">\r\n        <div id="sidebar">\r\n            <div id="sidebar_top">\r\n                <ul>\r\n                    <li id="sidebar_menu"><span>Каталог</span></li>\r\n                    <li><a href="#">Приспособления для ремонта\r\n                        энергетического оборудования</a></li>\r\n                    <li><a href="#">Обработка и очистка труб</a></li>\r\n                    <li><a href="#">Пневматический инструмент</a></li>\r\n                    <li><a href="#">Компрессорное оборудование</a></li>\r\n                    <li><a href="#">Металлообрабатывающее оборудование</a></li>\r\n                    <li><a href="#">Оборудование EFCO, для ремонта, обработки\r\n                        и испытания арматуры</a></li>\r\n                    <li><a href="#">Леса для котлов ТУЛ-1</a></li>\r\n                    <li><a href="#">Диагностическое оборудование</a></li>\r\n                    <li><a href="#">Энергетическое оборудование</a></li>\r\n                    <li><a href="#">Водоструйные аппараты высокого давления ПОСЕЙДОН</a></li>\r\n                    <li><a href="#">Ремонт арматуры завода Энергомаш, Чехов</a></li>\r\n                    <li><a href="#">Пескоструйное оборудование</a></li>\r\n                </ul>\r\n            </div>\r\n            <div id="sidebar_bottom">\r\n                <iframe src=http://www.youtube.com/embed/4kBSKpt0TNo frameborder="0" allowfullscreen></iframe>\r\n                <iframe src=http://www.youtube.com/embed/kp_0C7aX10s frameborder="0" allowfullscreen></iframe>\r\n\r\n            </div>\r\n        </div>\r\n        <div id="content">\r\n\r\n            <div id="content_top">\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/775324d71f66f3f907cd961739c391b5.jpg"\r\n                             alt="Запорно-регулирующая арматура"\r\n                             title="Запорно-регулирующая арматура">\r\n\r\n                        <p>Запорно-регулирующая арматура</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/48c20930cd9b3a0d58702231a1366e3c.jpg"\r\n                             alt="Станки токарно-карусельные торговой марки KOMAX"\r\n                             title="Станки токарно-карусельные торговой марки KOMAX">\r\n\r\n                        <p>Станки токарно-карусельные торговой марки KOMAX</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/e952d9c77880cd0975b3b565eec77c64.jpg"\r\n                             alt="Приспособления для ремонта энергетического оборудования"\r\n                             title="Приспособления для ремонта энергетического оборудования">\r\n\r\n                        <p>Приспособления для ремонта энергетического оборудования</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/cf62293a2313156f426b9ec5b7d6afb5.jpg"\r\n                             alt="Обработка и очистка труб"\r\n                             title="Обработка и очистка труб">\r\n\r\n                        <p>Обработка и очистка труб</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/9446806929ff2a0828594c7ec82a7d86.jpg"\r\n                             alt="Пневматический инструмент"\r\n                             title="Пневматический инструмент">\r\n\r\n                        <p>Пневматический инструмент</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/940afdf8f8990e5f838939ce84f145b9.jpg"\r\n                             alt="Компрессорное оборудование"\r\n                             title="Компрессорное оборудование">\r\n\r\n                        <p>Компрессорное оборудование</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/34ccdcdea48f4ae6be5ec33b6f156283.jpg"\r\n                             alt="Гидравлическое оборудование Enerpac"\r\n                             title="Гидравлическое оборудование Enerpac">\r\n\r\n                        <p>Гидравлическое оборудование Enerpac</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/830a97b89eb025b74cee03c9d6700367.png"\r\n                             alt="Металлообрабатывающее оборудование"\r\n                             title="Металлообрабатывающее оборудование">\r\n\r\n                        <p>Металлообрабатывающее оборудование</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/381104d84a3b36c8528420abb5707463.jpg"\r\n                             alt="Оборудование EFCO, для ремонта, обработки и испытания арматуры"\r\n                             title="Оборудование EFCO, для ремонта, обработки и испытания арматуры">\r\n\r\n                        <p>Оборудование EFCO, для ремонта, обработки и испытания арматуры</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/561171b041588df45130887a01a2e432.jpg"\r\n                             alt="Оборудование тяжелого машиностроения"\r\n                             title="Оборудование тяжелого машиностроения">\r\n\r\n                        <p>Оборудование тяжелого машиностроения</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/a304ef4b71cc1ef3380f59de1ea580c1.jpeg"\r\n                             alt="Энергетическое оборудование"\r\n                             title="Энергетическое оборудование">\r\n\r\n                        <p>Энергетическое оборудование</p>\r\n                    </a>\r\n                </div>\r\n                <div>\r\n                    <a href="#">\r\n                        <img src="/assets/templates/novotec/images/43bcf2c0259bb3bee0da349c17d79063.jpg"\r\n                             alt="Водоструйные аппараты высокого давления ПОСЕЙДОН"\r\n                             title="Водоструйные аппараты высокого давления ПОСЕЙДОН">\r\n\r\n                        <p>Водоструйные аппараты высокого давления ПОСЕЙДОН</p>\r\n                    </a>\r\n                </div>\r\n\r\n\r\n            </div>\r\n            <div id="content_bottom">\r\n                <div id="news_title">\r\n                    <p> Новости компании</p>\r\n                </div>\r\n                <div id="news_wrapper">\r\n                    <div>\r\n                        <p>31.12.2013</p>\r\n                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. At aut autem enim et excepturi\r\n                        exercitationem laborum nemo nesciunt porro, quae, quia quod sapiente suscipit, ullam\r\n                        voluptatibus. Aspernatur hic molestiae quos.\r\n                        <a href="#">Читать далее >></a>\r\n                    </div>\r\n                    <div>\r\n                        <p>31.12.2013</p>\r\n                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. At autem cum deserunt error fugit\r\n                        iste placeat qui quisquam sequi vitae. A, labore nisi. Aut autem dolores doloribus, minus natus\r\n                        soluta!\r\n                        <a href="#">Читать далее >></a>\r\n                    </div>\r\n                    <div>\r\n                        <p>31.12.2013</p>\r\n                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. At atque consequuntur cupiditate\r\n                        deserunt dignissimos impedit inventore minus necessitatibus nobis, odio provident quo rem\r\n                        similique tenetur veniam? Itaque maxime quas quos.\r\n                        <a href="#">Читать далее >></a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div style="clear: both;"></div>\r\n    </div>\r\n\r\n</div>\r\n<div id="footer_wrapper">\r\n    <div id="footer">\r\n        <div id="footer_left">\r\n            <p>125493, Россия, Москва<br>\r\n                ул. Флотская дом 5 корпус 2<br>\r\n                Тел./ факс: +7(495) 640-22-89<br>\r\n                E-mail: zakaz@remontenergo.ru</p>\r\n        </div>\r\n        <div id="footer_right">\r\n            <p>"Новатекс"</p>\r\n\r\n            <p>Все права защищенны 2013</p>\r\n        </div>\r\n    </div>\r\n    <div style="clear: both;"></div><!--костыль-->\r\n</div>\r\n</body>\r\n</html>', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvars`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `modx_site_tmplvars`
--

INSERT INTO `modx_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
(1, 'richtext', 'blogContent', 'blogContent', 'RTE for the new blog entries', 0, 1, 0, '', 0, 'RichText', '&w=383px&h=450px&edt=TinyMCE', ''),
(2, 'text', 'documentTags', 'Tags', 'Space delimited tags for the current document', 0, 1, 0, '', 0, '', '', ''),
(3, 'text', 'loginName', 'loginName', 'Conditional name for the Login menu item', 0, 1, 0, '', 0, '', '', '@EVAL if ($modx->getLoginUserID()) return ''Logout''; else return ''Login'';');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_contentvalues`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `modx_site_tmplvar_templates`
--

INSERT INTO `modx_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1, 4, 0),
(2, 4, 0),
(3, 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_eventnames`
--

CREATE TABLE IF NOT EXISTS `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='System Event Names.' AUTO_INCREMENT=1036 ;

--
-- Дамп данных таблицы `modx_system_eventnames`
--

INSERT INTO `modx_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(107, 'OnMakePageCacheKey', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(1033, 'OnDocFormUnDelete', 1, 'Documents'),
(1034, 'onBeforeMoveDocument', 1, 'Documents'),
(1035, 'onAfterMoveDocument', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(104, 'OnBeforeLoadDocumentObject', 5, ''),
(105, 'OnAfterLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(106, 'OnParseProperties', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(102, 'OnMakeDocUrl', 5, ''),
(103, 'OnBeforeLoadExtension', 5, ''),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(214, 'OnManagerMenuPrerender', 2, ''),
(224, 'OnDocFormTemplateRender', 1, 'Documents'),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, ''),
(1001, 'OnFileBrowserUpload', 1, 'File Browser Events');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_settings`
--

CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'MODxRE'),
('settings_version', '1.1'),
('show_meta', '0'),
('server_offset_time', '0'),
('server_protocol', 'http'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'Novatecs'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('site_unavailable_message', 'The site is currently unavailable'),
('track_visitors', '0'),
('top_howmany', '10'),
('auto_template_logic', 'parent'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '0'),
('cache_default', '1'),
('search_default', '1'),
('friendly_urls', '0'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('captcha_words', 'MODX,Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('emailsender', 'razvedos201@yandex.ru'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('emailsubject', 'Your login details'),
('number_of_logs', '100'),
('number_of_messages', '30'),
('number_of_results', '20'),
('use_editor', '1'),
('use_browser', '1'),
('rb_base_dir', 'C:/OpenServer/domains/evolution/assets/'),
('rb_base_url', 'assets/'),
('which_editor', 'TinyMCE'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('strip_image_paths', '1'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF'),
('upload_maxsize', '10485760'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('filemanager_path', 'C:/OpenServer/domains/evolution/'),
('theme_refresher', ''),
('manager_layout', '4'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '60'),
('manager_direction', 'ltr'),
('tinymce_editor_theme', 'editor'),
('tinymce_custom_plugins', 'style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media'),
('tinymce_custom_buttons1', 'undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help'),
('tinymce_custom_buttons2', 'bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops'),
('tree_show_protected', '0'),
('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
('validate_referer', '1'),
('datepicker_offset', '-10'),
('xhtml_urls', '1'),
('allow_duplicate_alias', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '1'),
('remember_last_tab', '0'),
('enable_bindings', '1'),
('seostrict', '0'),
('cache_type', '1'),
('maxImageWidth', '1600'),
('maxImageHeight', '1200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('docid_incrmnt_method', '0'),
('make_folders', '0'),
('tree_page_click', '27'),
('clean_uploaded_filename', '1'),
('site_id', '5799cc363cb25'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('aliaslistingfolder', '0'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words_default', 'MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('smtp_secure', 'none'),
('reload_emailsubject', ''),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('resource_tree_node_name', 'pagetitle'),
('mce_editor_skin', 'cirkuit'),
('mce_template_docs', ''),
('mce_template_chunks', ''),
('mce_entermode', 'p'),
('mce_element_format', 'xhtml'),
('mce_schema', 'html4'),
('tinymce_custom_buttons3', ''),
('tinymce_custom_buttons4', ''),
('tinymce_css_selectors', 'left=justifyleft;right=justifyright'),
('rb_webuser', '0'),
('sys_files_checksum', 'a:3:{s:41:"C:/OpenServer/domains/evolution/index.php";s:32:"657db3d7274dbb84c80d4aac08a75417";s:49:"C:/OpenServer/domains/evolution/manager/index.php";s:32:"5db76a440c8e2388efe93e738025f5d6";s:63:"C:/OpenServer/domains/evolution/manager/includes/config.inc.php";s:32:"2e5ce90e7ad6a664c9356f144f9fa5f4";}');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_user_attributes`
--

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Default admin account', 1, 'razvedos201@yandex.ru', '', '', 0, 0, 0, 1, 0, 1469697093, 0, 'fe7rl44c7b8m3leidd4osvsqm4', 0, 0, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_messages`
--

CREATE TABLE IF NOT EXISTS `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_roles`
--

CREATE TABLE IF NOT EXISTS `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `modx_user_roles`
--

INSERT INTO `modx_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_groups`
--

CREATE TABLE IF NOT EXISTS `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_users`
--

CREATE TABLE IF NOT EXISTS `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
