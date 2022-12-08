
--subquery--

create table musteri 
(
id char(3),
	isim varchar(20),
adres varchar(20),
	urunadi varchar(20)
);

create table marka
(
mar_id char(3),
	marka_isim varchar(20),
	sube varchar(20)
);

select * from musteri;
select * from marka;


insert into musteri values (123,'Ahmet','Kutahya','Pc');

delete from marka;
insert into musteri values (123, 'Ahmet', 'Kutahya','Pc');
insert into musteri values (124, 'Ahmet1', 'Kutahya1','Pc1');
insert into musteri values (125, 'Ahmet2', 'Kutahya2','Pc2');
insert into musteri values (126, 'Ahmet3', 'Kutahya3','Pc3');
insert into marka values (123, 'Samsung','izmir');
insert into marka values (124, 'Samsung1','izmir1');
insert into marka values (125, 'Samsung2','izmir2');
insert into marka values (126, 'Samsung3','izmir3');

--1.subesi izmir3 olan urunun isim,id ve adresini listeleyiniz..

























