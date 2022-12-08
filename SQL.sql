--DATABASE(VeriTabani) Olusturma
--Create dataBase uludag;
--DDL-DATA DEFINITION LANGUAGE
--CREATE -TABLO OLUSTURMA
create table ogrenciler1
(
	OGRENCI_NO char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real, --ondalikli sayi icin kullanilir
	kayit_tarihi date
);
--Var olan tablodan yeni bir tablo olusturma
Create Table
ogrenci_ortalamalar 
As  -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
Select 
isim,soyisim,not_ort 
From
ogrenciler;

--DML _ DATA MANUPULATION LANG.
--INSERT (DATABASE E VERI EKLEME)

insert into ogrenciler1 values('1234567','turgay','uludag',85.5,now());
insert into ogrenciler1 values('1234567','turgay','uludag',85.5,'2022-12-1');

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK..

INSERT INTO ogrenciler1 (isim,soyisim) values('turgay','uludaggg');

--select le tablolari cagirma
--DQL-DATA QUERY LANG.
select*from ogrenciler1;