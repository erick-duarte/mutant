/*
 ezcall
 Date: 30/09/2022 14:51:23
*/

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Tempo de geração: 30-Set-2022 às 17:09
-- Versão do servidor: 5.7.26
-- versão do PHP: 8.0.19


-- DROP DATABASE IF EXISTS `asterisk`;
-- DROP DATABASE IF EXISTS `asteriskcdrdb`;
-- DROP DATABASE IF EXISTS `SOLUTIONS`;
-- DROP DATABASE IF EXISTS `ezcall`;



DROP SERVER IF EXISTS fed_asteriskcdrdb;
CREATE SERVER fed_asteriskcdrdb
FOREIGN DATA WRAPPER mysql
OPTIONS (USER 'root', PASSWORD 'ac58d7', HOST '10.4.0.71', PORT 3306, DATABASE 'asteriskcdrdb');

DROP SERVER IF EXISTS fed_asterisk;
CREATE SERVER fed_asterisk
FOREIGN DATA WRAPPER mysql
OPTIONS (USER 'root', PASSWORD 'ac58d7', HOST '10.4.0.71', PORT 3306, DATABASE 'asterisk');

DROP SERVER IF EXISTS fed_solution;
CREATE SERVER fed_solution
FOREIGN DATA WRAPPER mysql
OPTIONS (USER 'root', PASSWORD 'ac58d7', HOST '10.4.0.71', PORT 3306, DATABASE 'SOLUTIONS');

--
-- Banco de dados: `SOLUTIONS`
--
CREATE DATABASE IF NOT EXISTS `SOLUTIONS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE SOLUTIONS;

-- --------------------------------------------------------



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for AGENTES
-- ----------------------------

CREATE TABLE IF NOT EXISTS `AGENTES` (
  `CHAVE` int(11) NOT NULL AUTO_INCREMENT,
  `CRIADO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AGENTEID` varchar(10) NOT NULL,
  `SENHA` varchar(20) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `OBS` varchar(100) DEFAULT NULL,
  `PERFIL` varchar(20) DEFAULT NULL,
  `ramal` varchar(6) DEFAULT NULL,
  `projeto` varchar(300) DEFAULT NULL,
  `USUARIO_CRM` varchar(30) DEFAULT NULL,
  `Turno` varchar(50) DEFAULT NULL,
  `CONTRATACAO` date DEFAULT NULL,
  `DESLIGAMENTO` date DEFAULT NULL,
  `HR_ENTRADA` time DEFAULT NULL,
  `HR_PAUSA1` time DEFAULT NULL,
  `HR_ALMOCO` time DEFAULT NULL,
  `HR_PAUSA2` time DEFAULT NULL,
  `HR_SAIDA` time DEFAULT NULL,
  `HR_EXTRA_INI` time DEFAULT NULL,
  `HR_EXTRA_FIM` time DEFAULT NULL,
  `FL_PAUSA1` int(11) DEFAULT '0',
  `FL_ALMOCO` int(11) DEFAULT '0',
  `FL_PAUSA2` int(11) DEFAULT '0',
  `FL_SAIDA` int(11) DEFAULT '0',
  `OPE_LOGIN` char(14) DEFAULT NULL,
  `OPE_SENHA` char(14) DEFAULT NULL,
  `LOGIN_CRM` varchar(100) DEFAULT '',
  `FL_LOGIN_HR` int(11) DEFAULT '1',
  `TELEFONE1` varchar(45) DEFAULT NULL,
  `TELEFONE2` varchar(45) DEFAULT NULL,
  `SKYPE` varchar(150) DEFAULT NULL,
  `EMAIL` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CHAVE`) USING BTREE,
  UNIQUE KEY `AGENTEID_UNIQUE` (`AGENTEID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for EMUSO
-- ----------------------------

CREATE TABLE IF NOT EXISTS `EMUSO` (
  `dateData` datetime NOT NULL,
  `TRONMAI` int(11) NOT NULL,
  `TRONNET` int(11) NOT NULL,
  `CH` int(11) NOT NULL,
  `voztotal` int(11) NOT NULL,
  `embratel` int(11) NOT NULL,
  PRIMARY KEY (`dateData`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for EVENTOS
-- ----------------------------
CREATE TABLE IF NOT EXISTS `EVENTOS` (
  `CHAVE` int(11) NOT NULL AUTO_INCREMENT,
  `RAMAL` varchar(6) NOT NULL,
  `AGENTEID` varchar(6) DEFAULT NULL,
  `EVENTO` varchar(20) NOT NULL,
  `TIPO` varchar(20) DEFAULT NULL,
  `CODEVENTO` int(11) DEFAULT NULL,
  `INICIO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FIM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DURACAO` int(11) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `CANALIN` varchar(30) DEFAULT NULL,
  `CANALOUT` varchar(30) DEFAULT NULL,
  `OUTROS` varchar(200) DEFAULT NULL,
  `VALIDADO` int(11) DEFAULT '0',
  `PARENT` int(11) DEFAULT NULL,
  `PROJECTID` int(11) unsigned DEFAULT NULL,
  `TIMEVENTINCALL` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`CHAVE`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for PAUSAS
-- ----------------------------
CREATE TABLE IF NOT EXISTS `PAUSAS` (
  `CHAVE` int(11) NOT NULL AUTO_INCREMENT,
  `CODPAUSA` int(11) DEFAULT NULL,
  `NOME` varchar(50) NOT NULL,
  `DESCRICAO` varchar(50) DEFAULT NULL,
  `TIPO` varchar(20) DEFAULT NULL,
  `LIMITE` int(11) NOT NULL DEFAULT '0',
  `TOLERANCIA` int(11) DEFAULT NULL,
  `STATUS` varchar(7) NOT NULL,
  `PROJETO` varchar(255) NOT NULL,
  PRIMARY KEY (`CHAVE`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for PROJETOS
-- ----------------------------
CREATE TABLE IF NOT EXISTS `PROJETOS` (
  `CO_PROJETO` int(11) NOT NULL AUTO_INCREMENT,
  `NO_PROJETO` varchar(100) NOT NULL,
  `FL_ATIVO` char(1) NOT NULL,
  PRIMARY KEY (`CO_PROJETO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for ezcall_call_events
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_call_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codpausa` int(11) unsigned NOT NULL,
  `extension` int(11) unsigned NOT NULL,
  `status` char(255) DEFAULT 'ABERTO',
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `uniqueid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ezcall_extension_call_status
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_extension_call_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(80) DEFAULT NULL,
  `uniqueid` varchar(32) DEFAULT NULL,
  `calldate` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `src` varchar(60) DEFAULT NULL,
  `ctype` char(3) DEFAULT 'O',
  `inuse` int(1) DEFAULT NULL,
  `call_status_id` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ezcall_lastcall
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_lastcall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(80) DEFAULT NULL,
  `calldate` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `billsec` int(11) DEFAULT NULL,
  `src_last` varchar(60) DEFAULT NULL,
  `ctype` char(1) DEFAULT NULL,
  `total` int(11) unsigned DEFAULT NULL,
  `calldate_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extension` (`extension`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ezcall_queue_call_stats
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_queue_call_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(32) NOT NULL,
  `event` varchar(255) NOT NULL,
  `unavailable` int(11) unsigned DEFAULT '0',
  `available` int(11) unsigned DEFAULT '0',
  `incall` int(11) unsigned DEFAULT '0',
  `paused` int(11) unsigned DEFAULT '0',
  `logged` int(11) unsigned DEFAULT '0',
  `offline` int(11) unsigned DEFAULT '0',
  `calls` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`,`uniqueid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ezcall_queue_calls
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_queue_calls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(32) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `src` varchar(80) DEFAULT NULL,
  `dst` varchar(80) DEFAULT NULL,
  `extension` int(11) DEFAULT NULL,
  `disposition` varchar(45) DEFAULT NULL,
  `holdtime` int(11) DEFAULT '0',
  `talktime` int(11) DEFAULT '0',
  `abandon` char(1) DEFAULT NULL,
  `reason` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ezcall_queue_stats
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_queue_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `queue` int(11) NOT NULL,
  `strategy` varchar(255) DEFAULT NULL,
  `calls` int(11) unsigned DEFAULT '0',
  `logged` int(11) unsigned DEFAULT '0',
  `offline` int(11) unsigned DEFAULT '0',
  `paused` int(11) unsigned DEFAULT '0',
  `incall` int(11) unsigned DEFAULT '0',
  `unavailable` int(11) unsigned DEFAULT '0',
  `available` int(11) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ezcall_transfers
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ezcall_transfers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(32) NOT NULL,
  `targetuniqueid` varchar(32) NOT NULL,
  `extension` varchar(50) NOT NULL DEFAULT '',
  `srcexten` varchar(50) NOT NULL DEFAULT '',
  `dstexten` varchar(50) NOT NULL DEFAULT '',
  `context` varchar(100) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for queue_monitor
-- ----------------------------
CREATE TABLE IF NOT EXISTS `queue_monitor` (
  `intId` int(11) NOT NULL AUTO_INCREMENT,
  `dtData` datetime DEFAULT NULL,
  `extension` varchar(100) NOT NULL,
  `service_level` float NOT NULL,
  `seconds` int(11) NOT NULL,
  PRIMARY KEY (`intId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `data` text,
  `expires` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `required` varchar(1) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `max_length` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbAvaliacao
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbAvaliacao` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_AVALIACAO` int(11) NOT NULL,
  `RAMAL` varchar(30) DEFAULT NULL,
  `NUMERO` varchar(30) DEFAULT NULL,
  `PERGUNTA1` int(11) DEFAULT '0',
  `PERGUNTA2` int(11) DEFAULT '0',
  `PERGUNTA3` int(11) DEFAULT '0',
  `PERGUNTA4` int(11) DEFAULT '0',
  `PERGUNTA5` int(11) DEFAULT '0',
  `PERGUNTA6` int(11) DEFAULT '0',
  `PERGUNTA7` int(11) DEFAULT '0',
  `PERGUNTA8` int(11) DEFAULT '0',
  `PERGUNTA9` int(11) DEFAULT '0',
  `PERGUNTA10` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbBoleto
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbBoleto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS` int(2) NOT NULL,
  `DATA` timestamp NOT NULL,
  `FINALIZADO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TELEFONE` varchar(15) DEFAULT NULL,
  `TELEFONE_ORI` varchar(15) DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `PLACA` varchar(4) DEFAULT NULL,
  `CANAIS` int(11) DEFAULT NULL,
  `UNIQUEID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampAgendamento
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampAgendamento` (
  `intIdAgendamento` int(11) NOT NULL AUTO_INCREMENT,
  `fkIntIdMailling` int(11) NOT NULL,
  `charRamal` varchar(10) NOT NULL,
  `fkIntIdQualificacao` int(11) NOT NULL,
  `dateAgendamento` datetime DEFAULT NULL,
  `charNomeDecisor` varchar(200) DEFAULT NULL,
  `charTelefone` varchar(45) DEFAULT NULL,
  `intStatusAgendamento` int(11) NOT NULL,
  PRIMARY KEY (`intIdAgendamento`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampListMaill
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampListMaill` (
  `intIdMailling` int(11) NOT NULL AUTO_INCREMENT,
  `fkIntIdLista` int(11) NOT NULL,
  `intIdCliente` int(11) NOT NULL,
  `intNr` int(11) NOT NULL,
  `charTelefone` varchar(20) NOT NULL,
  `charCampo1` varchar(200) DEFAULT NULL,
  `charCampo2` varchar(200) DEFAULT NULL,
  `charCampo3` varchar(200) DEFAULT NULL,
  `charCampo4` varchar(200) DEFAULT NULL,
  `charCampo5` varchar(200) DEFAULT NULL,
  `charCampo6` varchar(200) DEFAULT NULL,
  `charCampo7` varchar(200) DEFAULT NULL,
  `charCampo8` varchar(200) DEFAULT NULL,
  `charCampo9` varchar(200) DEFAULT NULL,
  `charCampo10` varchar(200) DEFAULT NULL,
  `fkIntIdQualificacao` int(11) NOT NULL,
  `intFlFinalizado` int(11) NOT NULL,
  PRIMARY KEY (`intIdMailling`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampQualiHist
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampQualiHist` (
  `intIdQualiHist` int(11) NOT NULL AUTO_INCREMENT,
  `fkIntIdMailling` int(11) NOT NULL,
  `fkIntIdQuali` int(11) NOT NULL,
  `charRamal` varchar(10) NOT NULL,
  `dateHorario` datetime DEFAULT NULL,
  PRIMARY KEY (`intIdQualiHist`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampanha
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampanha` (
  `intIdCampanha` int(11) NOT NULL AUTO_INCREMENT,
  `charNome` varchar(200) NOT NULL,
  `charUrlIntegracao` varchar(500) DEFAULT NULL,
  `intUrlStatus` int(11) NOT NULL,
  `charFila` varchar(45) DEFAULT NULL,
  `intNvAgressividade` int(11) DEFAULT NULL,
  `fkIntIdProjeto` int(11) NOT NULL,
  `intCampStatus` int(11) NOT NULL,
  PRIMARY KEY (`intIdCampanha`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampanhaLista
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampanhaLista` (
  `intIdLista` int(11) NOT NULL AUTO_INCREMENT,
  `fkIntIdCampanha` int(11) NOT NULL,
  `charNomeLista` varchar(200) NOT NULL,
  `charCampo1` varchar(100) DEFAULT NULL,
  `charCampo2` varchar(100) DEFAULT NULL,
  `charCampo3` varchar(100) DEFAULT NULL,
  `charCampo4` varchar(100) DEFAULT NULL,
  `charCampo5` varchar(100) DEFAULT NULL,
  `charCampo6` varchar(100) DEFAULT NULL,
  `charCampo7` varchar(100) DEFAULT NULL,
  `charCampo8` varchar(100) DEFAULT NULL,
  `charCampo9` varchar(100) DEFAULT NULL,
  `charCampo10` varchar(100) DEFAULT NULL,
  `intLinha` int(11) DEFAULT NULL,
  `intLinhaTot` int(11) DEFAULT NULL,
  `intUploadStatus` int(11) NOT NULL,
  `intStatusFinal` int(11) NOT NULL,
  `intStatusLista` int(11) NOT NULL,
  PRIMARY KEY (`intIdLista`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampanhaOperador
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampanhaOperador` (
  `intIdCampOpe` int(11) NOT NULL AUTO_INCREMENT,
  `fkIntIdCampanha` int(11) NOT NULL,
  `fkChaveOpe` int(11) NOT NULL,
  `intStatusCampOpe` int(11) NOT NULL,
  PRIMARY KEY (`intIdCampOpe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbCampanhaQuali
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbCampanhaQuali` (
  `intIdQualificacao` int(11) NOT NULL AUTO_INCREMENT,
  `charNomeQualificacao` varchar(200) NOT NULL,
  `charFlAcao` char(1) NOT NULL,
  `charCampanhas` varchar(200) NOT NULL,
  `intStatusQuali` int(11) NOT NULL,
  PRIMARY KEY (`intIdQualificacao`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbDepartamento
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbDepartamento` (
  `intIdDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `charNomeDpto` varchar(200) NOT NULL,
  `intAtivo` int(11) NOT NULL,
  PRIMARY KEY (`intIdDepartamento`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbDesbloqueio
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbDesbloqueio` (
  `intId` int(11) NOT NULL AUTO_INCREMENT,
  `fkIntIdAgente` int(11) DEFAULT NULL,
  `fkIntIdSupervisor` int(11) DEFAULT NULL,
  `dateData` datetime DEFAULT NULL,
  `charMotivo` varchar(500) DEFAULT NULL,
  `fkIntIdPausa` int(11) DEFAULT NULL,
  `dateInicioPausa` datetime DEFAULT NULL,
  PRIMARY KEY (`intId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbEmpresa
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbEmpresa` (
  `charNome` varchar(200) NOT NULL,
  `intPbxDiscador` int(11) NOT NULL,
  `intStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbListaTelefonica
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbListaTelefonica` (
  `intIdListaTel` int(11) NOT NULL AUTO_INCREMENT,
  `charTelefone` varchar(20) NOT NULL,
  `charTelDesc` varchar(100) NOT NULL,
  `charTelefone1` varchar(45) DEFAULT NULL,
  `charTelefone2` varchar(45) DEFAULT NULL,
  `charEmail` varchar(150) DEFAULT NULL,
  `charSkype` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`intIdListaTel`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbRamalDpto
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbRamalDpto` (
  `ramal` varchar(6) DEFAULT NULL,
  `dpto` varchar(200) DEFAULT NULL,
  `charCrmUsuario` varchar(100) DEFAULT '',
  `charTelefone1` varchar(45) DEFAULT NULL,
  `charTelefone2` varchar(45) DEFAULT NULL,
  `charSkype` varchar(150) DEFAULT NULL,
  `charEmail` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbUsuario
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbUsuario` (
  `intIdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `charLogin` varchar(100) NOT NULL,
  `charSenha` char(32) NOT NULL,
  `charNome` varchar(150) NOT NULL,
  `charDpto` varchar(500) DEFAULT NULL,
  `charProjetos` varchar(500) NOT NULL,
  `charEmail` varchar(200) DEFAULT NULL,
  `fkIntTipoUsuario` int(11) NOT NULL,
  `intAtivo` int(11) NOT NULL,
  PRIMARY KEY (`intIdUsuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbUsuarioTipo
-- ----------------------------
CREATE TABLE IF NOT EXISTS `tbUsuarioTipo` (
  `intIdUsrTipo` int(11) NOT NULL AUTO_INCREMENT,
  `charUsrTipoNome` varchar(80) NOT NULL,
  `intAtivo` int(11) NOT NULL,
  PRIMARY KEY (`intIdUsrTipo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ----------------------------
-- ASTERISK
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `asterisk` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE asterisk;

-- ----------------------------
-- Table structure for devices
-- ----------------------------

CREATE TABLE IF NOT EXISTS `devices` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tech` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dial` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `devicetype` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_cid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tech` (`tech`)
)
ENGINE=FEDERATED
DEFAULT CHARSET=utf8mb4
CONNECTION='fed_asterisk/devices'
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `users` (
  `extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voicemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ringtimer` int(3) DEFAULT NULL,
  `noanswer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recording` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outboundcid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sipname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mohclass` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `noanswer_cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `busy_cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `chanunavail_cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `noanswer_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `busy_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `chanunavail_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`extension`)
)
ENGINE=FEDERATED
DEFAULT CHARSET=utf8mb4
CONNECTION='fed_asterisk/users'
COLLATE=utf8mb4_unicode_ci;



-- ----------------------------
-- Table structure for queues_details
-- ----------------------------
CREATE TABLE IF NOT EXISTS `queues_details` (
  `id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flags` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`keyword`,`data`)
)
ENGINE=FEDERATED
DEFAULT CHARSET=utf8mb4
CONNECTION='fed_asterisk/queues_details'
COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
-- Table structure for queues_config
-- ----------------------------
CREATE TABLE IF NOT EXISTS `queues_config` (
  `extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descr` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grppre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alertinfo` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ringing` tinyint(1) NOT NULL DEFAULT '0',
  `maxwait` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ivr_id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dest` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cwignore` tinyint(1) NOT NULL DEFAULT '0',
  `qregex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agentannounce_id` int(11) DEFAULT NULL,
  `joinannounce_id` int(11) DEFAULT NULL,
  `queuewait` tinyint(1) DEFAULT '0',
  `use_queue_context` tinyint(1) DEFAULT '0',
  `togglehint` tinyint(1) DEFAULT '0',
  `qnoanswer` tinyint(1) DEFAULT '0',
  `callconfirm` tinyint(1) DEFAULT '0',
  `callconfirm_id` int(11) DEFAULT NULL,
  `monitor_type` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monitor_heard` int(11) DEFAULT NULL,
  `monitor_spoken` int(11) DEFAULT NULL,
  `callback_id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `destcontinue` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`extension`)
) ENGINE=FEDERATED
DEFAULT CHARSET=utf8mb4
CONNECTION='fed_asterisk/queues_config'
COLLATE=utf8mb4_unicode_ci;



-- ----------------------------
-- CDR
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `asteriskcdrdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE asteriskcdrdb;


-- ----------------------------
-- Table structure for cdr_logs
-- ----------------------------

CREATE TABLE IF NOT EXISTS `cdr_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realdst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int(11) NOT NULL DEFAULT '0',
  `remoteip` varchar(60) NOT NULL DEFAULT '',
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `hangupcause` varchar(50) NOT NULL DEFAULT '',
  `peerip` varchar(50) NOT NULL DEFAULT '',
  `recvip` varchar(50) NOT NULL DEFAULT '',
  `useragent` varchar(50) NOT NULL DEFAULT '',
  `uri` varchar(50) NOT NULL DEFAULT '',
  `fromuri` varchar(50) NOT NULL DEFAULT '',
  `peeraccount` varchar(20) NOT NULL DEFAULT '',
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `userfield` varchar(255) NOT NULL DEFAULT '',
  `did` varchar(50) NOT NULL DEFAULT '',
  `linkedid` varchar(32) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT 'none',
  `recordingfile` varchar(255) DEFAULT NULL,
  `cnum` varchar(40) DEFAULT NULL,
  `cnam` varchar(40) DEFAULT NULL,
  `outbound_cnum` varchar(40) NOT NULL DEFAULT '',
  `outbound_cnam` varchar(40) NOT NULL DEFAULT '',
  `dst_cnam` varchar(40) NOT NULL DEFAULT '',
  `tipo` varchar(30) DEFAULT NULL,
  `operadora` varchar(60) DEFAULT NULL,
  `AGENTEID` varchar(10) DEFAULT NULL,
  `eventdate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`,`eventdate`,`calldate`) USING BTREE,
  KEY `IDX_UNIQUEID` (`uniqueid`) USING BTREE,
  KEY `idx_calldate` (`calldate`) USING BTREE,
  KEY `idx_dst` (`dst`) USING BTREE,
  KEY `idx_account` (`accountcode`) USING BTREE,
  KEY `idx_recordingFile` (`recordingfile`) USING BTREE,
  KEY `idx_eventdate` (`eventdate`) USING BTREE
)
ENGINE=FEDERATED
DEFAULT CHARSET=utf8mb4
CONNECTION='fed_asteriskcdrdb/cdr_logs'
COLLATE=utf8mb4_unicode_ci;




-- ----------------------------
-- Table structure for cel_logs
-- ----------------------------
CREATE TABLE IF NOT EXISTS `cel_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventtime` datetime NOT NULL,
  `cid_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_num` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_ani` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_rdnis` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_dnid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exten` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channame` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appdata` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amaflags` int(11) NOT NULL,
  `accountcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peer` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userdeftype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventextra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userfield` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventdate` date NOT NULL,
  PRIMARY KEY (`id`,`eventtype`,`eventtime`,`eventdate`) USING BTREE,
  KEY `uniqueid_index` (`uniqueid`),
  KEY `linkedid_index` (`linkedid`),
  KEY `idx_uniqueid` (`uniqueid`) USING BTREE,
  KEY `idx_linkedid` (`linkedid`) USING BTREE,
  KEY `idx_eventtype` (`eventtype`) USING BTREE,
  KEY `idx_eventtime` (`eventtime`) USING BTREE,
  KEY `idx_exten` (`exten`) USING BTREE,
  KEY `idx_eventdate` (`eventdate`) USING BTREE
)
ENGINE=FEDERATED
DEFAULT CHARSET=utf8mb4
CONNECTION='fed_asteriskcdrdb/cel_logs'
COLLATE=utf8mb4_unicode_ci;



-- ----------------------------
-- View structure for abandon_calls_from_queue
-- ----------------------------
DROP VIEW IF EXISTS `abandon_calls_from_queue`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `abandon_calls_from_queue` AS select `Cel`.`uniqueid` AS `uniqueid`,`Cel`.`linkedid` AS `linkedid`,ifnull(min((case when (`Cel`.`eventtype` = 'ANSWER') then `Cel`.`exten` end)),0) AS `queue_id`,ifnull(min((case when (`Cel`.`eventtype` = 'CHAN_START') then `Cel`.`eventtime` end)),`Cel`.`eventtime`) AS `calldate`,NULL AS `src`,`Cel`.`cid_num` AS `dst`,NULL AS `extension`,'NO ANSWER' AS `disposition`,if(count(distinct (case when (`Cel`.`eventtype` = 'CHAN_START') then 1 end)),min(`Cel`.`eventtime`),`Cel`.`eventtime`) AS `starttime`,if(count(distinct (case when (`Cel`.`eventtype` = 'CHAN_END') then 1 end)),max(`Cel`.`eventtime`),`Cel`.`eventtime`) AS `endtime`,`Cel`.`eventdate` AS `eventdate` from `cel_logs` `Cel` where ((1 = 1) and (`Cel`.`channame` regexp '^(SIP/TERMINACAO|SIP/TRAVAYA)') and (convert(`Cel`.`uniqueid` using utf8mb4) = convert(`Cel`.`linkedid` using utf8mb4))) group by `Cel`.`uniqueid` having ((`queue_id` regexp '^[0-9]+$') and (`queue_id` <> 0) and (count(distinct (case when (`Cel`.`eventtype` = 'BRIDGE_ENTER') then 1 end)) = 0)) order by `Cel`.`eventtime`;

-- ----------------------------
-- View structure for incoming_calls_from_queue
-- ----------------------------
DROP VIEW IF EXISTS `incoming_calls_from_queue`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `incoming_calls_from_queue` AS select `Cdr`.`uniqueid` AS `uniqueid`,`Cdr`.`linkedid` AS `linkedid`,ifnull(min(`ChanStart`.`eventtime`),`Cdr`.`calldate`) AS `calldate`,'ANSWERED' AS `disposition`,`Cdr`.`src` AS `number`,`Cdr`.`dst` AS `extension`,`Cdr2`.`dst` AS `queue_id`,`Cdr`.`recordingfile` AS `recordingfile`,ifnull(min(`ChanStart`.`eventtime`),`Cdr`.`calldate`) AS `starttime`,ifnull(min((case when (`Cel`.`eventtype` = 'BRIDGE_ENTER') then `Cel`.`eventtime` end)),`Cdr`.`calldate`) AS `entertime`,ifnull(max((case when (`Cel`.`eventtype` = 'BRIDGE_EXIT') then `Cel`.`eventtime` end)),`Cdr`.`calldate`) AS `exittime`,`Cel`.`eventdate` AS `eventdate` from (((`cdr_logs` `Cdr` join `cdr_logs` `Cdr2` on(((`Cdr2`.`lastapp` = 'Queue') and (`Cdr2`.`disposition` = 'ANSWERED') and (`Cdr2`.`eventdate` = `Cdr`.`eventdate`) and (convert(`Cdr2`.`linkedid` using utf8mb4) = convert(`Cdr`.`linkedid` using utf8mb4)) and (`Cdr2`.`dstchannel` like concat('Local/',`Cdr`.`dst`,'@from-queue%'))))) join `cel_logs` `Cel` on(((convert(`Cel`.`uniqueid` using utf8mb4) = convert(`Cdr`.`uniqueid` using utf8mb4)) and (convert(`Cel`.`linkedid` using utf8mb4) = convert(`Cdr`.`linkedid` using utf8mb4)) and (`Cel`.`appname` = 'Dial')))) left join `cel_logs` `ChanStart` on(((`ChanStart`.`eventdate` = `Cdr`.`eventdate`) and (convert(`ChanStart`.`linkedid` using utf8mb4) = convert(`Cdr`.`linkedid` using utf8mb4)) and (convert(`ChanStart`.`exten` using utf8mb4) = convert(`Cdr`.`dst` using utf8mb4)) and (`ChanStart`.`eventtype` = 'CHAN_START') and (`ChanStart`.`context` = 'from-queue')))) where ((1 = 1) and (`Cdr`.`lastapp` = 'Dial') and (`Cdr`.`disposition` = 'ANSWERED')) group by `Cdr`.`uniqueid` order by `Cel`.`eventtime`;




-- ----------------------------
-- ezcall
-- ----------------------------

USE SOLUTIONS;

-- ----------------------------
-- VIEWS
-- ----------------------------

-- ----------------------------
-- View structure for ezcall_vw_agent_day_status
-- ----------------------------
DROP VIEW IF EXISTS `ezcall_vw_agent_day_status`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `ezcall_vw_agent_day_status` AS select `Agente`.`AGENTEID` AS `agente_id`,`Agente`.`ramal` AS `extension`,ifnull(max((`LastCall`.`calldate` + interval `LastCall`.`duration` second)),0) AS `last_call`,ifnull(max((case when (`EventoPausa`.`STATUS` = 'ABERTO') then `EventoPausa`.`CODEVENTO` end)),0) AS `pause_id`,ifnull(if(count(distinct (case when (`EventoPausa`.`STATUS` = 'ABERTO') then 1 end)),cast(max(`EventoPausa`.`INICIO`) as datetime),cast(max(`EventoPausa`.`FIM`) as datetime)),0) AS `last_pause`,ifnull(cast(max(`EventoLogin`.`INICIO`) as datetime),0) AS `last_login`,cast(greatest(ifnull(max((`LastCall`.`calldate` + interval `LastCall`.`duration` second)),0),ifnull(if(count(distinct (case when (`EventoPausa`.`STATUS` = 'ABERTO') then 1 end)),cast(max(`EventoPausa`.`INICIO`) as datetime),cast(max(`EventoPausa`.`FIM`) as datetime)),0),ifnull(max(`EventoLogin`.`INICIO`),0)) as datetime) AS `last_event`,timediff(now(),cast(greatest(ifnull(max((`LastCall`.`calldate` + interval `LastCall`.`duration` second)),0),ifnull(if(count(distinct (case when (`EventoPausa`.`STATUS` = 'ABERTO') then 1 end)),cast(max(`EventoPausa`.`INICIO`) as datetime),cast(max(`EventoPausa`.`FIM`) as datetime)),0),ifnull(max(`EventoLogin`.`INICIO`),0)) as datetime)) AS `idle`,count(`EventoPausa`.`VALIDADO`) AS `frequency`,if(`EventoPausa`.`VALIDADO`,1,0) AS `event_validated`,if(`EventoLogin`.`VALIDADO`,1,0) AS `login_validated`,if(`EventoLogin`.`CODEVENTO`,1,0) AS `login_id` from (((`AGENTES` `Agente` left join `ezcall_lastcall` `LastCall` on(((cast(`LastCall`.`calldate` as date) = cast(now() as date)) and (convert(`LastCall`.`extension` using utf8mb4) = convert(`Agente`.`ramal` using utf8mb4))))) left join `EVENTOS` `EventoPausa` on(((`EventoPausa`.`RAMAL` = `Agente`.`ramal`) and (`EventoPausa`.`EVENTO` = 'PAUSA') and (cast(`EventoPausa`.`INICIO` as date) = cast(now() as date))))) left join `EVENTOS` `EventoLogin` on(((`EventoLogin`.`RAMAL` = `Agente`.`ramal`) and (`EventoLogin`.`EVENTO` = 'LOGIN') and (`EventoLogin`.`STATUS` = 'ABERTO') and (cast(`EventoLogin`.`INICIO` as date) = cast(now() as date))))) where (1 = 1) group by `Agente`.`ramal`;


-- ----------------------------
-- View structure for vw_mail_quali
-- ----------------------------
DROP VIEW IF EXISTS `vw_mail_quali`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_mail_quali` AS select `List`.`intIdMailling` AS `intIdMailling`,`List`.`fkIntIdLista` AS `fkIntIdLista`,`List`.`intIdCliente` AS `intIdCliente`,`List`.`intNr` AS `intNr`,`List`.`charTelefone` AS `charTelefone`,`List`.`charCampo1` AS `charCampo1`,`List`.`charCampo2` AS `charCampo2`,`List`.`charCampo3` AS `charCampo3`,`List`.`charCampo4` AS `charCampo4`,`List`.`charCampo5` AS `charCampo5`,`List`.`charCampo6` AS `charCampo6`,`List`.`charCampo7` AS `charCampo7`,`List`.`charCampo8` AS `charCampo8`,`List`.`charCampo9` AS `charCampo9`,`List`.`charCampo10` AS `charCampo10`,`List`.`fkIntIdQualificacao` AS `fkIntIdQualificacao`,`List`.`intFlFinalizado` AS `intFlFinalizado`,`Agente`.`NOME` AS `Agente`,`QualyA`.`charRamal` AS `charRamal`,`QualyA`.`dateHorario` AS `dateHorario`,`QualyB`.`intIdQualificacao` AS `intIdQualificacao`,`QualyB`.`charNomeQualificacao` AS `charNomeQualificacao`,`QualyB`.`charFlAcao` AS `charFlAcao` from (((`tbCampListMaill` `List` join `tbCampQualiHist` `QualyA` on((`List`.`intIdMailling` = `QualyA`.`fkIntIdMailling`))) join `tbCampanhaQuali` `QualyB` on((`QualyA`.`fkIntIdQuali` = `QualyB`.`intIdQualificacao`))) join `AGENTES` `Agente` on((`QualyA`.`charRamal` = `Agente`.`ramal`))) where (1 = 1);

-- ----------------------------
-- View structure for vw_mail_resumo
-- ----------------------------
DROP VIEW IF EXISTS `vw_mail_resumo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_mail_resumo` AS select distinct `clm`.`fkIntIdLista` AS `fkIntIdLista`,`clm`.`intIdCliente` AS `intIdCliente`,count(`clm`.`intIdCliente`) AS `qtdNro`,sum(if((`clm`.`intFlFinalizado` = 1),1,0)) AS `qtdDisc`,sum(if((`clm`.`fkIntIdQualificacao` > 0),1,0)) AS `qtdQual`,sum(if((`clm`.`fkIntIdQualificacao` < 0),1,0)) AS `qtdMac`,sum(if((ifnull(`cq`.`charFlAcao`,'X') = 'A'),1,0)) AS `qtdAgen`,sum(if((ifnull(`cq`.`charFlAcao`,'X') = 'I'),1,0)) AS `qtdIncorreto`,sum(if((ifnull(`cq`.`charFlAcao`,'X') = 'C'),1,0)) AS `qtdCaixaPostal`,sum(if((ifnull(`cq`.`charFlAcao`,'X') = 'F'),1,0)) AS `qtdFinalizado`,sum(if((ifnull(`cq`.`charFlAcao`,'X') = 'R'),1,0)) AS `qtdReagendamento`,sum(if((ifnull(`cq`.`charFlAcao`,'X') = 'S'),1,0)) AS `qtdSucesso` from (`tbCampListMaill` `clm` left join `tbCampanhaQuali` `cq` on((`clm`.`fkIntIdQualificacao` = `cq`.`intIdQualificacao`))) group by `clm`.`fkIntIdLista`,`clm`.`intIdCliente`;
