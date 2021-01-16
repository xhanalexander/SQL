DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;
USE clinic;

CREATE TABLE dokter (
	id_dokter 			int primary key,
	NamaDokter			varchar(50) 		not null,
     TanggaLahir		 	date,
	Alamat				varchar(25),
	NomorTelpon			varchar(12)
);

INSERT dokter values
('1','Halim Danuwarahman','1988/7/15','jl.tentram XX','081213141516'),
('2','Fitri Gissela','1993/11/27','jl.Mawar Bakti VI','082223242526'),
('3','Benny Farhan','1990/3/9','jl.Bangsa III','082323242425'),
('4','Johhny Truma','1988/8/17','jl.Mekarsari','082845897698'),
('5','Jimmy Gerald','1991/5/5','jl.Kebon Pete','081245458899'),
('6','Salim Deriansyah','1997/6/28','jl.Majapahit','081365459578'),
('7','Hafis Samahuddin','1981/10/18','jl.Dermaga I','081354218789');

CREATE TABLE client (
	id_client			     int primary key,
	NamaClient			varchar(50)		not null,
	NamaBelakang			varchar(50),
	JenisKelamin			varchar(1),
	Umur					varchar(2),
	BeratBadan			varchar(3),
	TinggiBadan			varchar(3),
	Alamat				varchar(25),
	NomorTelpon			varchar(12)
);

INSERT client values
('1','Henry','Ford','L','22','72','172','Jl.Puri Indah sari','085852545657'),
('2','Albert','Mustafa','L','30','88','179','Jl.Kartika','086598321278'),
('3','Dimitri','Kemal','L','30','82','189','Jl.Shibuya','086598321278'),
('4','Elizabeth','Gwen','P','27','78','179','Jl.Mendel','086655998877'),
('5','Elfie','Eva','P','25','70','168','Jl.Moshashi','082213568978'),
('6','Della','Belle','P','31','82','171','Jl.Fikri','081223134565'),
('7','Reza','Kurniawati','P','19','65','155','Jl.Alpukat','087754566456'),
('8','Ahmad','Baihaqi','L','25','78','157','Jl.Sesama','084565987845'),
('9','Siti','Jamilah','P','32','70','155','Jl.Tenggara','084578984565'),
('10','Dinda','Prima','P','28','50','145','Jl.Gajah Indah','088946137985');

CREATE TABLE karyawan (
	id_karyawan			int primary key,
	NamaKaryawan			varchar(50)		not null,
	NamaBelakang			varchar(50),
	NomorTelpon			varchar(12),
	GajiKaryawan			varchar(7)
);

INSERT karyawan values
('1','Hendra','Saputro','085570249878',null),
('2','Gea','Rahmawati','0857598684',null),
('3','Rania','Siti','084584862426',null),
('4','Rista','Yulansari','087968842426',null),
('5','Widya','Ananda','087898586848',null),
('6','Adinda','Salsa','082214151617',null);

CREATE TABLE booking (
	id_booking               int,
	id_client                int,
	NamaDokter			varchar(50) REFERENCES dokter(NamaDokter),
	NamaKaryawan			varchar(50) REFERENCES karyawan(NamaKaryawan),
	TanggalBooking			timestamp default current_timestamp,
	JenisLayanan			varchar(50) null,
	primary key              (id_booking),
	Foreign key              (id_client) REFERENCES client(id_client)
		on update cascade
		on delete cascade
);

INSERT booking values
('1','2','Jimmy Gerald','Rania','2018-05-05','Dermal'),
('2','1','Salim Deriansyah','Rania','2018-05-05','Mesoterapi'),
('3','3','Salim Deriansyah','Adinda','2018-05-06','Facial'),
('4','5','Jimmy Gerald','Gea','2018-05-06','Facial'),
('5','4','Hafis Samahuddin','Hendra','2018-05-06','Laser Therapy'),
('6','6','Hafis Samahuddin','Gea','2018-05-07','Facial'),
('7','7','Halim Danuwarahman','Gea','2018-05-07','Facial'),
('8','8','Jimmy Gerald','Rista','2018-05-08','Chemical Peeling'),
('9','9','Jimmy Gerald','Widya','2018-05-08','Facial'),
('10','10','Jimmy Gerald','Widya','2018-05-08','Mesoterapi');

CREATE TABLE jadwalDokter (
	id_jadwal				int,
	id_dokter				int,
	HariPraktek			varchar(6),
	JamPraktek			varchar(16),
	primary key			(id_jadwal),
	foreign key			(id_dokter) REFERENCES dokter(id_dokter)
		on update cascade
		on delete cascade
);

INSERT jadwalDokter values
('001','1','Senin','09:00 - 15:00'),
('002','5','Selasa','09:00 - 15:00'),
('003','3','Rabu','09:00 - 15:00'),
('004','1','Kamis','09:00 - 15:00'),
('005','4','Jumat','09:00 - 15:00'),
('006','5','Sabtu','09:00 - 12:00'),
('007','6','Sabtu','12:00 - 15:00'),
('008','7','Minggu','09:00 - 12:00'),
('009','1','Minggu','12:00 - 15:00');

CREATE TABLE obatPerawatan (
	id_obat				int primary key,	/* autoincrement isi tabel nya "null".*/
	KodeObat				char(10) UNIQUE key,
	NamaObat				varchar(25),
	kadaluarsa			date,
	JenisObat				varchar(10),
	HargaBeliObat			float(7)			/* bisa pakai (int atau float) untuk manual */
);

INSERT obatPerawatan values
('1','Spi','Spirulina','2019-2-22','Herbal','50000'),
('2','Alv','Aloe Vera','2019-5-24','Herbal','35000'),
('3','MiK','Minyak Kemiri','2019-2-21','Herbal','45000'),
('4','Cit','Citrus','2019-6-12','Herbal','40000'),
('5','Gre','Green tea','2019-1-15','Herbal','60000'),
('6','Lem','Lemon','2019-8-20','Herbal','75000'),
('7','Ked','Kedelai','2019-11-16','herbal','50000'),
('8','Bat','Batubara','2019-9-22','herbal','80000'),
('9','Pep','Pepaya','2019-2-20','herbal','60000'),
('10','Men','Mentimun','2019-1-8','herbal','30000'),
('11','Ben','Bengkoang','2019-2-7','herbal','40000'),
('12','Sus','Susu','2019-7-27','herbal','50000'),
('13','Kel','Kelapa','2019-8-12','herbal','25000'),
('14','Kop','Kopi','2019-2-2','herbal','75000'),
('15','Mad','Madu','2020-1-1','herbal','80000');

CREATE TABLE servisPerawatan (
	id_servis				int,
	JenisPerawatan			varchar(25),
	BiayaPerawatan			varchar(7),
	primary key			(id_servis)
);

INSERT servisPerawatan values
('11','Facial','1550000'),
('12','Mesoterapi','1150000'),
('13','Laser Therapy','5000000'),
('14','Chemical Peeling','2500000'),
('15','Dermal Fillers','5125000');

CREATE TABLE biayakonsultasi (
	id_servis				int,
	id_booking			int,
	tanggalkonsultasi		date,
	NamaClient			varchar(50) REFERENCES client(NamaClient),
	NamaDokter			varchar(50) REFERENCES dokter(Nama),
	NamaKaryawan			varchar(50) REFERENCES karyawan(NamaKaryawan),
	BiayaPerawatan			int REFERENCES servisperawatan(BiayaPerawatan),
	id_obat				int,
	HargaBeliObat			int REFERENCES obatPerawatan(HargaBeliObat)
	/*totalBiaya			int as (HargaBeliObat + BiayaPerawatan)*/
);

INSERT biayakonsultasi values
('11','1','2018-5-5','Albert','Jimmy Gerald','Rania','5125000','10','30000'),
('12','2','2018-5-5','Henry','Salim Deriansyah','Rania','1150000','6','75000'),
('11','3','2018-5-6','Dimitri','Salim Deriansyah','Adinda','1550000','2','35000'),
('11','4','2018-5-6','Elfie','Jimmy Gerald','Gea','1550000','9','60000'),
('13','5','2018-5-6','Elizabeth','Hafis Samahuddin','Hendra','5000000','14','75000'),
('11','6','2018-5-7','Della','Hafis Samahuddin','Gea','5000000','14','75000'),
('11','7','2018-5-7','Reza','Halim Danuwarahman','Gea','1550000','12','50000'),
('14','8','2018-5-8','Ahmad','Jimmy Gerald','Rista','2500000','15','80000'),
('11','9','2018-5-8','Siti','Jimmy Gerald','Widya','1550000','6','75000'),
('11','10','2018-5-8','Dinda','Jimmy Gerald','Widya','1150000','4','40000');

CREATE view MonitorClient as
	select NamaDokter,
		count(NamaDokter) as JumlahClientDimonitor
		from booking
		group by NamaDokter;

create view honorDokter as
	select tanggalkonsultasi,NamaDokter,BiayaPerawatan,HargaBeliObat,
	((BiayaPerawatan*0.6)+(HargaBeliObat*0.1)) as Totalhonor
	from biayakonsultasi;

create view nota as
	select BiayaPerawatan,id_obat,HargaBeliObat,
	(BiayaPerawatan)+(HargaBeliObat) as totalbiayakonsultasi
	from biayakonsultasi





































/*create view honorDokter as
	select TanggalBooking,NamaDokter,BiayaPerawatan,HargaBeliObat,
	((BiayaPerawatan*0.6)+(HargaBeliObat*0.1)) as Totalhonor
	from booking, servisperawatan, obatPerawatan;

create table kasir (
    bk_nomer    		int ,
    tr_tanggal  		date,
    ky_nama     		varchar(30) references karyawan(ky_nama),
    dk_nama     		varchar(30) references dokter(dk_nama),
    pl_nama     		varchar(30) references pelanggan(pl_nama),
    hg_konsul   		int,
    ob_id       		varchar(5) references obat(ob_id),
    ob_harga    		int references obat(ob_harga),
    harga_total 		int as (hg_konsul + ob_harga),
    foreign key 		(bk_nomer) references book(bk_nomer)

create view honor_dokter as
select tr_tanggal,dk_nama,hg_konsul,ob_harga,
((hg_konsul*0.6)+(ob_harga*0.1)) as jumlah_honor
from kasir;*/
