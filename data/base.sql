-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.1.62-community - MySQL Community Server (GPL)
-- S.O. server:                  Win32
-- HeidiSQL Versione:            9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;


-- Dump della struttura di tabella macchine.macchine
DROP TABLE IF EXISTS `macchine`;
CREATE TABLE IF NOT EXISTS `macchine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `macchina` varchar(50) NOT NULL,
  `marche_id` int(10) unsigned NOT NULL,
  `kw` int(4) NOT NULL,
  `anno` varchar(4) NULL,  
  `descrizione` text,
  PRIMARY KEY (`id`),
  KEY `marche_id` (`marche_id`),
  CONSTRAINT `macchine_ibfk_1` FOREIGN KEY (`marche_id`) REFERENCES `marche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella macchine.macchine: ~2 rows (circa)
/*!40000 ALTER TABLE `macchine` DISABLE KEYS */;
INSERT INTO `macchine` (`id`, `macchina`, `marche_id`, kw, `anno`, `descrizione`) VALUES
	(1, 'TRATTRICE DT5020', 1, 43, '2014', NULL),
	(2, 'TRATTRICE 6230R', 2, 180, '2015', NULL);
/*!40000 ALTER TABLE `macchine` ENABLE KEYS */;


-- Dump della struttura di tabella macchine.interventi
DROP TABLE IF EXISTS `interventi`;
CREATE TABLE IF NOT EXISTS `interventi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `macchine_id` int(10) unsigned NOT NULL,
  `dataintervento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descrizione` varchar(200) DEFAULT NULL,
  `tipologie_id` int(10) unsigned DEFAULT NULL,
  `km` int(10) unsigned DEFAULT NULL,
  `spesa` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `tipologie_id` (`tipologie_id`),
  KEY `macchine_id` (`macchine_id`),
  CONSTRAINT `interventi_ibfk_2` FOREIGN KEY (`macchine_id`) REFERENCES `macchine` (`id`),
  CONSTRAINT `interventi_ibfk_1` FOREIGN KEY (`tipologie_id`) REFERENCES `tipologie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella macchine.interventi: ~2 rows (circa)
/*!40000 ALTER TABLE `interventi` DISABLE KEYS */;
INSERT INTO `interventi` (`id`, `macchine_id`, `dataintervento`, `descrizione`, `tipologie_id`, `km`, `spesa`) VALUES
	(1, 1, '2017-02-01 10:31:41', 'Cambio olio e filtro', 5, 225300, 130.00),
	(2, 2, '2017-02-10 11:32:20', 'Rabbocco liquido raffreddamento', 5, 163400, 5.00);
/*!40000 ALTER TABLE `interventi` ENABLE KEYS */;


-- Dump della struttura di tabella macchine.marche
DROP TABLE IF EXISTS `marche`;
CREATE TABLE IF NOT EXISTS `marche` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella macchine.marche: ~3 rows (circa)
/*!40000 ALTER TABLE `marche` DISABLE KEYS */;
INSERT INTO `marche` (`id`, `marca`) VALUES
	(1, 'Kubota'),
	(2, 'John Deere'),
	(3, 'Echo');
/*!40000 ALTER TABLE `marche` ENABLE KEYS */;


-- Dump della struttura di tabella macchine.tipologie
DROP TABLE IF EXISTS `tipologie`;
CREATE TABLE IF NOT EXISTS `tipologie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipologia` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella macchine.tipologie: ~2 rows (circa)
/*!40000 ALTER TABLE `tipologie` DISABLE KEYS */;
INSERT INTO `tipologie` (`id`, `tipologia`) VALUES
	(4, 'Riparazione'),
	(5, 'Manutenzione ordinaria');
/*!40000 ALTER TABLE `tipologie` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
