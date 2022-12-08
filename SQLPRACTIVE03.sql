/*
CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA 

1-) CHILD TABLO SILINMEDEN PARENT TABLO SILINMEYE CALISILDIGINDA PGADMIN EROR VERIR.
YANI CHILD TABLO SILINMEDEN PARENT TABLO SILINEMEZ ..
2-) CHILD TABLODAKI VERI SILINMEDEN PARENT TABLODAKI VERI SILINMEYE CALISILDIGINDA PGADMIN .
YANI CHILD VERI SILINMEDEN PARENT TABLODAKI VERI SILINEMEZ..

CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA 

1-) CHILD TABLO SILINMEDEN PARENT TABLO SILINEBILIR.
PGADMIN EROR VERMEZ 
2-) CHILD TABLODAKI VERISILINMEDEN PARENT TABLODAKI VERI SILINMEYE CALISILDIGINDA PGADMIN EROR VERMEZ 
PARENT TABLODAKI VERIYI SILER 
FAKAT BU DURUMDA CHILD TABLODAKI VERIDE SILINIR

*/

-- SORU1: vergi_no’su 202 olan toptancinin sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.
update toptancilar set sirket_ismi = 'VivoBook'
where vergi_no= '202';
select * from toptancilar;
--  SORU2: toptancilar tablosundaki tüm sirket isimlerini 'NOKIA' olarak güncelleyeniz.
update toptancilar set sirket_ismi = 'NOKIA';
select * from toptancilar;
-- SORU3: vergi_no’su 201 olan toptancinin
--sirket_ismi'ni 'nokia' ve irtibat_ismi’ni 'Canan Can' olarak güncelleyiniz
UPDATE toptancilar SET sirket_ismi = 'NOKIA', irtibat_ismi= 'Canan Can' WHERE vergi_no=201;

-- SORU4: sirket_ismi nokia olan toptancinin
--irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.
UPDATE toptancilar SET irtibat_ismi = 'Bilal Han' WHERE sirket_ismi = 'Nokia';

-- SORU5: malzemeler tablosundaki 'Telefon' değerlerini 'Phone' olarak güncelleyiniz.

update malzemeler set malzeme_isim='Phone' where malzeme_isim='Telefon';

-- SORU6: malzemeler tablosundaki malzeme_id değeri 1004'ten büyük olanların
 --malzeme_id'lerini 1 artırarak güncelleyiniz.
 
 update malzemeler set malzeme_id=malzeme_id+1
 where malzeme_id>1004;
 
 -- SORU7: malzemeler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.
 
 update malzemeler set malzeme_id=malzeme_id+tedarik_vergino;



CREATE TABLE toptancilar     --> parent
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');
select * from toptancilar;
CREATE TABLE malzemeler     --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES toptancilar(vergi_no)
on delete cascade
);
INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
SELECT * FROM malzemeler;

-- SORU8: Malzemeler tablosundaki musteri_isim'i Ali Can olan malzeme_isim'ini,
--toptancılar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.

update malzemeler set malzeme_isim=(select sirket_ismi from toptancilar where irtibat_ismi='Adem Cos')
where musteri_isim='Ali Can';

-- SORU9: malzeme_ismi Laptop olan musteri_isim'ini,
 --sirket_ismi Apple’in irtibat_isim'i ile güncelleyiniz.
 
update malzemeler
set musteri_isim=(select irtibat_ismi from toptancilar where siket_ismi='Apple')
where malzeme_isim='Laptop';

create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
)
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--SORU: arac tablosundaki en yüksek fiyat'ı listele













