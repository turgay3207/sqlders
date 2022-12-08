create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);
--- INSERT:Veritabanına yeni veri ekler.
insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

select * from ogrenciler;

--SORU: ogrenciler tablosundaki id ve isim sutununu getiriniz

select id,isim from ogrenciler;

--SORU: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele

Select * From ogrenciler where sinav_notu > 80;

--SORU: Adresi Ankara olan ögrencilerin tüm bilgilerini listele

select * from ogrenciler where adres='Ankara';

--SORU: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele

select isim from ogrenciler where sinav_notu='85' and adres='Ankara';

--SORU: .Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele

select * from ogrenciler where   sinav_notu='65' or sinav_notu='85';

select * from ogrenciler where sinav_notu in (65,85);

--SORU: .Sınav notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_notu between 65 and 85;

select * from ogrenciler where sinav_notu<=85  and sinav_notu>=65;

--SORU: .id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele

select isim,sinav_notu from ogrenciler where id not between 122 and 125; 

--SORU: sinav_notu 75 olan satırı siliniz

delete from ogrenciler where sinav_notu=75;

--SORU: adres'i Trabzon olan satırı siliniz

delete from ogrenciler where adres='Trabzon';

--SORU: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz

delete from ogrenciler where isim='Derya Soylu' or isim='Yavuz Bal';

--SORU: sınav notu 100 den küçük olan satırları siliniz

delete from ogrenciler where sinav_notu<100;

--SORU: Tablodaki tüm satırları siliniz

delete fro ogrenciler;

--CONSTRAINT
--UNIQUE-Bir sütundaki tüm değerlerin BENZERSİZ/TEKRARSIZ yani tek olmasını sağlar.
--NOT NULL-Bir Sütunun NULL içermemesini yani boş olmamasını sağlar.
--NOT NULL kısıtlaması için constraint ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
--PRIMARY KEY-Bir sütünün NULL içermemesini ve sütundaki verilerin
--BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
--FOREIGN KEY-Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
--Böylelikle, tablolar arasında ilişki kurulmuş olur.
/*
SORU: memurlar isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması olsun.
*/

create table memurlar
(
id int primary key,
isim varchar(30) unique,
maas int check(maas>500) not null
);
select * from memurlar
/*
SORU: insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
*/

create table insanlar
(
isim int,
soyisim varchar(30),
constraint pr_ks primary key(isim),
constraint uni_ks unique(soyisim));




























