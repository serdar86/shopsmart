CREATE DATABASE IF NOT EXISTS shopsmart /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE DATABASE shopsmart /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE TABLE IF NOT EXISTS ss_address (
  ADDRESSID int(11) NOT NULL AUTO_INCREMENT,
  ADDRESSTYPE varchar(45) NOT NULL,
  ADDRESS varchar(150) NOT NULL,
  CITY varchar(45) NOT NULL,
  STATE varchar(45) NOT NULL,
  ZIP varchar(45) NOT NULL,
  COUNTRY varchar(45) NOT NULL,
  DATECREATED timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  DATEUPDATED timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UPDATEDBY int(11) NOT NULL,
  PRIMARY KEY (ADDRESSID),
  KEY SS_ADDRESS_CITY (CITY),
  KEY SS_ADDRESS_STATE (STATE),
  KEY SS_ADDRESS_COUNTRY (COUNTRY),
  KEY SS_ADDRESS_ZIP (ZIP),
  KEY SS_ADDRESS_DATECREATED (DATECREATED)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ss_password (
  PASSWORDID int(11) NOT NULL AUTO_INCREMENT,
  USERID int(11) NOT NULL,
  PASSWORD varchar(200) NOT NULL,
  CREATEDDATE timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UPDATEDDATE timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UPDATEDBY int(11) NOT NULL,
  PRIMARY KEY (PASSWORDID),
  KEY SS_PASSWORD_USERID (USERID),
  KEY SS_PASSWORD_UPDATEDDATE (UPDATEDDATE),
  CONSTRAINT CS_PASSWORD_USERID FOREIGN KEY (USERID) REFERENCES ss_user (USERID) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ss_user (
  USERID int(11) NOT NULL AUTO_INCREMENT,
  USERNAME varchar(45) NOT NULL,
  LOGINEMAIL varchar(45) DEFAULT NULL,
  CURRENTPASSWORD varchar(45) NOT NULL,
  DATECREATED timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  DATEUPDATED timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UPDATEDBY int(11) NOT NULL,
  PRIMARY KEY (USERID),
  UNIQUE KEY SS_USER_USERNAME_UNIQUE (USERNAME),
  UNIQUE KEY SS_USER_LOGINEMAIL_UNIQUE (LOGINEMAIL),
  KEY SS_USER_DATECREATED_USER (DATECREATED)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ss_userprofile (
  PROFILEID int(11) NOT NULL AUTO_INCREMENT,
  USERID int(11) NOT NULL,
  FIRSTNAME varchar(45) NOT NULL,
  LASTNAME varchar(45) NOT NULL,
  EMAIL varchar(45) NOT NULL,
  ALTERNATEEMAIL varchar(45) NOT NULL,
  PRIMARYPHONE varchar(15) NOT NULL,
  ALTERNATEPHONE varchar(15) DEFAULT NULL,
  PRIMARYADDRESS int(11) NOT NULL,
  ALTERNATEADDRESS int(11) DEFAULT NULL,
  TIMEZONE varchar(45) NOT NULL,
  DATECREATED timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  DATEUPDATED timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UPDATEDBY int(11) NOT NULL,
  PRIMARY KEY (PROFILEID),
  UNIQUE KEY SS_PROFILE_PROFILE_ID_UNIQUE (PROFILEID),
  UNIQUE KEY SS_PROFLE_USERID_UNIQUE (USERID),
  UNIQUE KEY SS_PROFILE_EMAIL_UNIQUE (EMAIL),
  UNIQUE KEY SS_PROFILE_ALTERNATEEMAIL_UNIQUE (ALTERNATEEMAIL),
  KEY SS_PROFILE_FIRSTNAME (FIRSTNAME),
  KEY SS_PROFILEE_LASTNAME (LASTNAME),
  KEY SS_PROFILE_DATECREATED (DATECREATED),
  CONSTRAINT SS_PROFILE_USER_USERID FOREIGN KEY (USERID) REFERENCES ss_user (USERID) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
