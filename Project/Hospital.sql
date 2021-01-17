DROP database if exists rumah_sakit;
create database rumah_sakit;
use rumah_sakit;

CREATE TABLE dokter (
	id_dokter 			int primary key,
	nama_dokter			varchar(50) 		not null,
	lahirtanggal_dokter 		date,
	alamat_dokter			varchar(25),
	telp_dokter			varchar(15)
);

CREATE TABLE pasien (
	id_pasien			int primary key,
	nama_pasien			varchar(50)		not null,
	jenis_kelamin			char(1),
	umur_pasien			date,
	berat_pasien			float(3),
	golongandarah_pasien		varchar(3),
	tinggi_pasien			float(3),
	telp_pasien			float(12),
	gejala_pasien			varchar(25)
);

CREATE TABLE ruang_pasien (
	id_ruang			int primary key,
	tipe_ruang			varchar(50),
	status_ruang 			varchar(20)
);

CREATE TABLE obat (
	id_obat				int auto_increment primary key,
	nama_obat			varchar(50)		not null,
	jenis_obat			varchar(50),
	harga_obat			float(12),
	stok_obat			float(3),
	golongan_obat			varchar(25),
	kadaluarsa_obat			date
);

CREATE TABLE petugas (
	id_petugas			int primary key,
	nama_petugas			varchar(50)		not null,
	telp_petugas			varchar(12)
);

CREATE TABLE tagihan (
	id_tagihan			int primary key,
	tanggal_tagihan			datetime,
	id_pasien			int references pasien(id_pasien),
	id_dokter			int references dokter(id_dokter),
	biaya_dokter			float(7),
	id_petugas			int references petugas(id_petugas),
	id_ruang			int references ruang_pasien(id_ruang),
	biaya_ruang_inap		float(6),
	id_obat				int references obat(id_obat),
	harga_satuan_obat		float(7),
	jumlah_obat			float(6)
);

INSERT tagihan VALUES
 (1, '2016/08/6', '1', '1', '500', '1', '1', '250', '1', '226', '5'),
 (2, '2016/08/6', '1', '1', '270', '1', '1', '250', '1', '226', '5');

INSERT dokter VALUES
 (1, 'dr. Anton Komala', '1988/04/07', "Jakarta Pusat", '(128)569755178'),
 (2, 'dr. Yani Muvitasari', '1984/07/30', "Jakarta Pusat", '(120)777897756'),
 (3, 'dr. Pipin Abdilah', '1975/12/31', "Jakarta Pusat", '(120)363125666');

INSERT pasien VALUES
 (1, 'Ahmad Bastian Hatta', 'L', '1996/04/28', '68', 'O-','170','088992244556', 'Migran Berat'),
 (2, 'Haiqal Alfa Reji', 'L', '2002/11/13', '59', 'AB+','169','086098756422', 'Demam'),
 (3, 'Geral Hassan bakir', 'L', '1986/12/17', '70', 'A-','155','084987557721', 'Flu');

INSERT ruang_pasien VALUES
 (1, 'ICU', 'terpakai'),
 (2, 'HCU', 'kosong'),
 (3, 'ICCU', 'kosong'),
 (4, 'NICU', 'kosong'),
 (5, 'PICU', 'terpakai'),
 (6, 'ICU', 'terpakai'),
 (7, 'HCU', 'kosong'),
 (8, 'ICCU', 'kosong'),
 (9, 'NICU', 'kosong');

INSERT obat VALUES
(1, 'insulin', 'suntikan', '226.000', '15', 'obat keras' ,'2021/02/10'),
(2, 'Antihistamin', 'Tablet', '50.000', '30', 'bebas' ,'2021/03/05');

INSERT petugas VALUES
(1, 'Bakrie Damian', '02187156984'),
(2, 'Stefani Jamilah', '02188715325');

select id_obat,
	harga_satuan_obat*jumlah_obat as total_obat
	from tagihan;

-- foreign key id_petugas
-- references petugas(id_petugas)
-- on update cascade

-- total_obat 			int as (harga_satuan_obat * jumlah_obat)

-- foreign key id_pasien
-- references pasien(id_pasien)
-- on delete cascade
