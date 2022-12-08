create table ogrenciler5
(
	OGRENCI_NO char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real, --ondalikli sayi icin kullanilir
	kayit_tarihi date);
	
--VAR OLAN BI TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar;

--INSERT TABLO ICINE VERI EKLEME
insert into notlar values('Erol',75.5);
insert into notlar values('ali',70.5);
insert into notlar values('musa',65.5);
insert into notlar values('hakan',85.5);
insert into notlar values('mehmet',95.5);

select * from notlar;

select isim from notlar;


--Constraint
--UNIQUE
--NOT NULL
create table ogrenciler6
(
	OGRENCI_NO char(7) unique,
	isim varchar(20) not null,
	soyisim varchar(25),
	not_ort real, --ondalikli sayi icin kullanilir
	kayit_tarihi date);
select * from ogrenciler6;

insert into ogrenciler6 values('1234567','turgay','uludag',95.5,now());
insert into ogrenciler6 values('12345678','ali','veli',97.5,now());
--insert into ogrenciler7 (ogrenci_no,soyisim,not_ort) value('123456789','uludag',90.0);--not null deger alinmamasi

--pRIMARY KEY

create table ogrenciler7
(
	OGRENCI_NO char(7) PRIMARY KEY,
	isim varchar(20),
	soyisim varchar(25),
	not_ort real, --ondalikli sayi icin kullanilir
	kayit_tarihi date);

--PRIMARY KEY ATAMASI 2.YOL

create table ogrenciler8
(
	OGRENCI_NO char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real, --ondalikli sayi icin kullanilir
	kayit_tarihi date,
	cONSTRAINT ogr PRIMARY KEY(ogrenci_no)
);

--Practice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

create table tedarikciler3
(
	tedarikci_id char(5) Primary key,
	tedarikci_ismi varchar(15),
	iletisim_isim varchar(30)
);

create table urunler
(
	tedarikci_id char(5),
    urun_id char(5),
	
	foreign key (tedarikci_id) references tedarikciler3(tedarikci_id)
);

select * from tedarikciler3;
select * from urunler;
--“calisanlar” isimli bir Tablo olusturun.
--Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
--“adresler” isminde baska bir tablo olusturun.
--Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.

create table calisanlar
(
id char(5) primary key,
	isim varchar(20) UNIQUE,
	maas int not null,
	ise_baslama date,

);

create table adresler
(
adres_id char(7),
	sokak varchar(15),
	cadde varchar(15),
	sehir varchar(15),
	foreign key (adres_id) references calisanlar(id)
);

/*“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.*/
CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--unique cons. old icin kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--not null cons. kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--unique cons. old icin kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--int dedik string girmeye calistik
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key unique cons. old icin kabul etmez
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--iki ayni primary key kabul etmez
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key 
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');--boyle bir id yok parent
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from adresler;
select * from calisanlar;

create table calisanlar2
(
id varchar(5) primary key,
	isim varchar(20) UNIQUE,
	maas int check (maas>10000) not null,
	ise_baslama date
);

insert into calisanlar1 values('10002','Mehmet Yilmaz',19000,'2018-04-14');

--DQL-- WHERE KULLANIMI

select * from calisanlar;
select isim from calisanlar;
--calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyin

select isim,maas from calisanlar where maas>5000;

--calisanlar tablosundan ismi veli han olan tum  veriyi listeleyin

select * from calisanlar where isim='Veli Han';

--calisanlar tablosundan maasi 5000  olan tum verileri listeleyin
select * from calisanlar where maas=5000;

--DML--DELETE KOMUTU
delete from calisanlar; --eger parent table baska bir child tablo ile iliskili ise once child table 
                                                                           --silinmelidir..
delete from adresler;

select from adresler;

--adresler tablosundan sehri antep olan verileri silelim
delete from adresler where sehir='Antep';

CREATE TABLE ogrenciler66
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler66 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler66 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler66 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler66 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler66 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler66 VALUES(127, 'Mustafa Bak', 'Ali', 99);

---- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

delete from ogrenciler66 where isim='Nesibe Yilmaz' or isim='Mustafa Bak';









