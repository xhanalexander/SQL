DROP DATABASE IF EXISTS konekdb;
CREATE DATABASE konekdb;
USE konekdb;

CREATE TABLE user (
   id             INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nama           VARCHAR(50) NOT NULL,
   alamat         VARCHAR(50) NOT NULL,
   pekerjaan      VARCHAR(50) NOT NULL
);

INSERT INTO user VALUES
("1","Adi","Jl.Kaliurang","PNS"),
("2","Banu","Jl.Kaliurang","PNS"),
("3","Caca","Jl.Kaliurang","PNS"),
("4","Dede","Jl.Kaliurang","PNS"),
("5","Eko","Jl.Kaliurang","PNS"),
("6","Firman","Jl.Kaliurang","PNS"),
("7","Gede","Jl.Kaliurang","PNS"),
("8","Hadi","Jl.Kaliurang","PNS"),
("9","Ibu","Jl.Kaliurang","PNS"),
("10","Joko","Jl.Kaliurang","PNS");

/* cmd commands tips
use sekolah;
source konekDB.sql
show databases;
show tables;
describe siswa;
select * from mapel;
*/