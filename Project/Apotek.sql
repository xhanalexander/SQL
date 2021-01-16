
DROP DATABASE IF EXISTS Apotek;
CREATE DATABASE Apotek;
USE Apotek;

CREATE TABLE dokter (
	id_dokter 			int	primary key, -- kode
	nama_dokter			varchar(50) 		not null,
	lahirtanggal_dokter 	date,
	alamat_dokter			varchar(25),
	telp_dokter			varchar(30)
);

CREATE TABLE obat (
	id_obat				int auto_increment primary key,
	nama_obat				varchar(50)		not null,
	jenis_obat			varchar(50),
	harga_obat			float(12),
	stok_obat				integer(3),
	golongan_obat			varchar(15),
	kadaluarsa_obat		date
);

CREATE TABLE pasien (
	id_pasien				int primary key,
	nama_pasien			varchar(50)		not null,
	jenis_kelamin			char(1),
	umur_pasien			date,
	berat_pasien			float(3),
	tinggi_pasien			float(3),
	telp_pasien			float(12),
 	gejala_pasien			varchar(25)
);

CREATE TABLE pegawai (
	id_pegawai			int primary key,
	nama_pegawai			varchar(50)		not null,
	telp_pegawai			float(20)
);

CREATE TABLE transaksi (
	id_transaksi			int primary key,
	tanggal_transaksi		date,
	id_pegawai			int REFERENCES pegawai(id_pegawai),
	id_pasien				int REFERENCES pasien(id_pasien),
	id_dokter				int REFERENCES dokter(id_dokter),
	id_obat				int REFERENCES obat(id_obat),
	jumlah_obat			float(3),
	harga_beli_obat		float(9)
);

INSERT dokter VALUES
 (1, 'dr. Anton Komala', '1988/4/7','Jakarta Pusat', '(128)569755178'),
 (2, 'dr. Yani Muvitasari', '1984/7/30', 'Jakarta Pusat', '(120)777897756'),
 (3, 'dr. Pipin Abdilah', '1975/12/31', 'Jakarta Pusat', '(120)363125666'),
 (4, 'dr. Nji RD Wahidah', '1973/5/1','Jakarta Pusat', '(120)458978782'),
 (5, 'dr. Nurindah Isty Rachmayanti', '1991/2/24', 'Jakarta Pusat', '(120)454587776'),
 (6, 'dr. Bernardus Dirgantoro', '1992/4/13', 'Jakarta Pusat', '(120)454587776');

 INSERT obat VALUES
 (1, 'Aspirin', 'kapsul', '25.000', '20', 'obat keras','2020/5/13'),
 (2, 'Paracetamol', 'pil', '15.000', '35', 'bebas' ,'2020/1/1'),
 (3, 'Ibuprofein', 'kapsul', '70.000', '70', 'obat keras' ,'2021/2/1'),
 (4, 'kortikosteroid', 'Salep', '7.500', '70', 'obat keras' ,'2021/5/1'),
 (5, 'Antihistamin', 'Tablet', '50.000', '30', 'bebas' ,'2021/3/5'),
 (6, 'Kolkisin', 'Kaplet', '26.000', '15', 'obat keras' ,'2021/2/10'),
 (7, 'Enervit', 'Sirup', '25.000', '90', 'bebbas' ,'2020/12/30');

 INSERT pasien VALUES
 (1, 'Ahmad Bastian Hatta', 'L', '1996/4/28', '68', '170','088992244556', 'Migran Berat'),
 (2, 'Haiqal Alfa Reji', 'L', '2002/11/13', '59', '169','086098756422', 'Demam'),
 (3, 'Geral Hassan bakir', 'L', '1986/12/17', '70', '155','084987557721', 'Flu'),
 (4, 'Jajuli Chandra', 'L', '1991/12/17', '69', '157','082477769122', 'Saraf Kejepit'),
 (5, 'Yunita Putri Kurnia', 'P', '2004/5/25', '68', '148','083038705559', 'Pilek'),
 (6, 'Nataya Hadi Indira', 'P', '1968/10/4', '71', '152','0885670200193', 'Asam Urat'),
 (7, 'Rima Oktaviani', 'P', '1998/3/20', '57', '142','084505007776', 'Tifes');

 INSERT pegawai VALUES
 (1, 'Kenny Rahma', '08448705002'),
 (2, 'Alfian Kusuma Zaenal', '08788564422');

 INSERT transaksi VALUES
 (1, '2020/10/7', '1', '1', '1', '1', '1','25000' ),
 (2, '2020/10/7', '1', '2', '5', '4', '1','7500' ),
 (3, '2020/10/8', '2', '7', '6', '7', '1','25000' ),
 (4, '2020/10/8', '2', '6', '6', '6', '1','26000' ),
 (5, '2020/10/8', '2', '3', '6', '3', '2','140000' ),
 (6, '2020/10/8', '2', '5', '4', '5', '1','50000' );

create view pembayaran as
	select tanggal_transaksi, id_pegawai, id_pasien, id_dokter
	from transaksi as pembayaran
