DROP DATABASE IF EXISTS Garage;
CREATE DATABASE Garage;
USE Garage;

CREATE TABLE montir (
	id_montir				varchar(5),
	NamaMontir			varchar(50),
	KontakMontir			varchar(12),
	Alamat				varchar(30),
	Keaktifan				varchar(12),
	primary key			(id_montir)
);

INSERT montir VALUES
('ME201','Arya Gunawan Prakarsa','085612221322','Jl.Makassar','Aktif'),
('ME202','Fulan Bin Ahwan','089991132155','Jl.Surabaya','Aktif'),
('ME203','Dennis Saputra Yahya','085668884122','Jl.Ahmad Yani','Aktif'),
('ME204','Edo Setiawan','082154612378','Jl.Pohon Pinus','Aktif'),
('ME205','Damian Pohan','087741141212','Jl.Keramat Jati','Aktif'),
('ME206','Fahri Putra Sulung','082252333588','Jl.Madu Manis X','Tidak Aktif'),
('ME207','Kevin Egy Geovani','082246853212','Jl.Jatisari II','Aktif');

CREATE TABLE customer (
	id_customer			varchar(4),
	NamaCustomer			varchar(25),
	NamaBelakang			varchar(25),
	AlamatCustomer			varchar(30),
	KontakCustomer			varchar(12),
	primary key			(id_customer)
);

INSERT customer VALUES
('C001','Faisal Ahmad','Yasan','Jl. Kebon Melati V','082131321321'),
('C002','Maulidina','Habsyi','Jl. Poltangan Raya','085464561777'),
('C003','Raihan Paijul','Husni','Jl. Penjernihan VI','087774562123'),
('C004','Ahmad Fahmi','Musdalifa','Jl. Kramat II','085452132155'),
('C005','Rania Binti','Musdalifah','Jl. Salam Pramuka','085213888959'),
('C006','Daffa','Rahmaniawati','Jl. KaliPasir','087894565555'),
('C007','Kelly Putra','Rahmat','Jl. Sawo','087778653210'),
('C008','Fajri Salman','Rey','Jl. Kayu Manis','088794515555'),
('C009','Reynaldi','Oktaviana','Jl. Tegalan','089998451232'),
('C010','Firli Putri','Siregar','Jl. Pangeran Diponegoro','087784515541'),
('C011','Haidar','Kusumo','Jl. Manggarai III','085578946155');

CREATE TABLE kendaraan (
	id_Kendaraan			varchar(7),
	id_customer			varchar(4),
	JenisKendaraan			varchar(15),
	Merk					varchar(15),
	Warna				varchar(15),
	Tahun				varchar(4),
	primary key			(id_Kendaraan),
	foreign key 			(id_customer) REFERENCES customer(id_customer)
		on update cascade
		on delete cascade
);

INSERT kendaraan VALUES
('B1892TE','C001','Skuter matik','Piaggio','Hitam','2008'),
('B1452GE','C002','Standard/Naked','Honda','Perak','2012'),
('B7856LL','C003','Sport','Kawasaki','Hitam','2018'),
('B4206YE','C004','Cruiser','Suzuki','Coklat','2018'),
('B9052MM','C005','Bebek','Honda','Merah','2019'),
('E102KYT','C006','Off-Road','Benneli','Putih','2018'),
('A124WGN','C007','Standard/Naked','Yamaha','Kuning','2017'),
('B0101RE','C008','Skuter matik','Vespa','Jingga','2018'),
('B9872QW','C009','Off-Road','BMW','Coklat','2019'),
('B3344LO','C010','Standard/Naked','Yamaha','Merah Maron','2018'),
('B6758HY','C011','Sport','Suzuki','Biru','2018');

CREATE TABLE supplier (
	id_supplier			varchar(5),
	NamaSupplier			varchar(20),
	KontakSupplier			varchar(9),
	AlamatSupplier			varchar(50),
	Kodepos				varchar(5),
	primary key			(id_supplier)
);

INSERT supplier VALUES
('S101','Aspira','222-555','Bekasi',null),
('S102','PSM','577-888','Jakarta Barat',null),
('S103','GMA product Series','321-444','Jakarta Barat - Kebon Jeruk','11530'),
('S104','Astra','846-522','Jakarta Utara - Kelapa Gading',null),
('S105','Top 1','231-222','Jakarta Pusat - Kemayoran','10620'),
('S106','Michellin','852-211','Jakarta Selatan - Kebayoran Lama',null),
('S107','Osram','885-544','Jakarta Pusat - Senen','10410'),
('S108','Federal Part','213-445','Jakarta Utara - Kelapa Gading',null),
('S109','Honda','774-521','Jawa Barat - Karawang',null),
('S110','Iridium','845-455','Jakarta Pusat - Pecenongan','10120'),
('S111','Tali Gas','798-456','Jakarta Timur - Pulogadung',null),
('S112','Mbtech','331-321','Jakarta Utara, Kelapa Gading',null),
('S113','Kyt','879-451','Bekasi - Cikarang',null),
('S114','Bosch','789-745','Bekasi - Cikarang',null),
('S115','TDR','321-123','Jakarta Timur - Cakung',null);

CREATE TABLE sparepart (
	id_sparepart			varchar(5),
	id_supplier			varchar(5),
	NamaSparepart			varchar(50),
	KodeSparepart			char(5) UNIQUE KEY,
	HargaBeli				float(6),
	HargaJual				float(6),
	StokBarang			float(3),
	primary key			(id_sparepart),
	foreign key			(id_supplier) REFERENCES supplier(id_supplier)
);

INSERT sparepart VALUES
('BA300','S101','Spion','SPI','44900','50000','25'),
('BA301','S102','Piringan Cakram','PIC','249000','250000','30'),
('BA302','S103','Windshield','WIN','199000','205000','15'),
('BA303','S104','Aki GS Astra','AKI','180000','180000','20'),
('BA304','S105','Oli Top1','OLI','34000','35000','35'),
('BA305','S106','Ban','BAN','349000','360000','44'),
('BA306','S107','Lampu LED Motor','LED','191000','200000','50'),
('BA307','S108','Rantai Federal','RAN','156000','165000','66'),
('BA308','S109','Karburator','KAR','118000','120000','34'),
('BA309','S110','Busi','BUS','14999','20000','80'),
('BA310','S111','Tali Gas','TAGS','39000','42000','32'),
('BA311','S112','Kulit Jok Motor','JOK','141000','150000','21'),
('BA312','S113','Helm Motor','HEM','132000','140000','91'),
('BA313','S114','Klakson','KLK','94000','95000','22'),
('BA314','S115','Velg Motor','VLG','479000','490000','12');

CREATE TABLE biayajasaservis (
	id_servis				varchar(6),
	TanggalServis			date,
	NamaMontir			varchar(50) REFERENCES montir(NamaMontir),
	BiayaJasa				float(6),
	id_Kendaraan			varchar(7) REFERENCES kendaraan(id_Kendaraan),
	NamaCustomer			varchar(25) REFERENCES customer(NamaCustomer),
	id_sparepart			varchar(5) REFERENCES sparepart(id_sparepart),
	HargaJual				float(6) REFERENCES sparepart(HargaJual),
	primary Key			(id_servis)
);

INSERT biayajasaservis VALUES
('SJ0001','2020/1/9','Arya Gunawan Prakarsa','300000','B1892TE','Faisal Ahmad','BA300','50000'),
('SJ0002','2020/1/9','Fulan Bin Ahwan','410000','B1452GE','Maulidina','BA301','250000'),
('SJ0003','2020/1/9','Arya Gunawan Prakarsa','500000','B7856LL','Raihan Paijul','BA302','205000'),
('SJ0004','2020/1/10','Edo Setiawan','150000','B4206YE','Ahmad Fahmi','BA303','180000'),
('SJ0005','2020/1/10','Damian Pohan','75000','B9052MM','Rania Binti','BA304','35000'),
('SJ0006','2020/1/10','Damian Pohan','250000','E102KYT','Daffa','BA305','360000'),
('SJ0007','2020/1/10','Damian Pohan','250000','A124WGN','Kelly Putra','BA306','200000'),
('SJ0008','2020/1/11','Fahri Putra Sulung','300000','B0101RE','Fajri Salman','BA307','165000'),
('SJ0009','2020/1/11','Fahri Putra Sulung','125000','B9872QW','Reynaldi','BA308','120000'),
('SJ0010','2020/1/11','Kevin Egy Geovani','80000','B3344LO','Firli Putri','BA309','20000'),
('SJ0011','2020/1/11','Damian Pohan','260000','B6758HY','Haidar','BA310','42000');

CREATE VIEW pembayaran AS
	SELECT TanggalServis,NamaMontir,BiayaJasa,id_Kendaraan,NamaCustomer,id_sparepart,HargaJual,
	((BiayaJasa)+(HargaJual)) AS TotalBiayaDanJasa
	FROM biayajasaservis
