DROP DATABASE IF EXISTS crudeDB;
CREATE DATABASE crudeDB;
USE crudeDB;

CREATE TABLE user (
   "id"             INT(11) NOT NULL AUTO_INCREMENT,
   "names"          VARCHAR(50) NOT NULL,
   "email"          VARCHAR(50) NOT NULL,
   "mobile"         VARCHAR(15) NOT NULL,
   PRIMARY KEY ("id")
);


