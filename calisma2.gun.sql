--SUBQUERIES

create table ogrenciler
(
	okul_no int,
	isim varchar(20),
	veli_ismi varchar(20),
	irtibat varchar(20)
);

insert into ogrenciler values (123,'Ahmet','Mehmet','izmir');
insert into ogrenciler values (124,'Ahmet1','Mehmet1','izmir1');
insert into ogrenciler values (125,'Ahmet2','Mehmet2','izmir2');
insert into ogrenciler values (126,'Ahmet3','Mehmet3','izmir3');
insert into ogrenciler values (127,'Ahmet4','Mehmet4','izmir4');

create table notlar
(
numara int,
	isim varchar(20),
	ders varchar(20),
	nott real
	);
	
insert into notlar values(123,'Ahmet','matematik',90);	
insert into notlar values(124,'Ahmet1','fen',80);	
insert into notlar values(125,'Ahmet2','it',70);	
insert into notlar values(126,'Ahmet3','turkce',60);	
insert into notlar values(127,'Ahmet4','fizik',50);	
	
select * from ogrenciler
select * from notlar

--veli ismi mehmet1 olan ogrencinin notunu,irtibat,ismini yazdiriniz

select isim,irtibat,
(Select nott from notlar where okul_no =numara)

from ogrenciler where veli_ismi='Mehmet1';

--notu 75 in ustunde olan ve irtibat i izmir olan ogencinin okul nosunu ve ismini alin 

select isim,okul_no
from ogrenciler where okul_no in
(select numara from notlar where nott>75) and irtibat='izmir';

-- dersi fizik olan ve veli ismi mehmet4 olan ogrencinin ismini okul no sunu ve irtibatini yazdiriniz
select isim,okul_no,irtibat from ogrenciler
where okul_no in(select numara from notlar where ders='fizik') and veli_ismi='Mehmet4';

CREATE TABLE mart
(   
urun_id int, 
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
CREATE TABLE nisan 
(   
urun_id int, 
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

	--MART VE NİSAN aylarında aynı urun_id ile satılan ürünlerin urun_id’lerini listeleyen ve aynı zamanda
	--bu ürünleri MART ayında alan musteri_isim 'lerini listeleyen bir sorgu yazınız.
select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);
--ayni field lar oldugu zaman exists kullaniyoruz
	
	
	
	
	
	
	


)

