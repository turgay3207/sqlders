/*JOINS
2 Tablodaki datalari Birlestirmek icinkullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir Tablolar icin ise JOINkullanilir
5 Cesit Join vardir
1)INNER JOIN iki Tablodaki ortak datalarigosterir
2)LEFT JOIN Ilk datada olan tum recordlarigosterir
3)RIGHT JOIN Ikinci tabloda olan tum recordlarigosterir
4)FULL JOIN Iki tablodaki tum recordlarigosterir
5)SELF JOIN Bir tablonun kendi icinde Join edilmesi ileolusur.*/

CREATE TABLE sirketler (sirket_id int, sirket_isim varchar(20) );

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, '2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, '2020-04-19'); 
INSERT INTO siparisler VALUES(44, 104, '2020-04-20'); 
INSERT INTO siparisler VALUES(55,  105, '2020-04-21');

select * from sirketler
select * from siparisler

---INNER JOIN-----
--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler inner join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

/*NOT:
1)Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklindeyazin
2)From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismiyazmaliyiz
3)Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimizyazilmali*/

------LEFT JOIN------
/*NOT:
1)Left Join’de ilk tablodaki tum record’largosterilir.
2)Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilirancak
ortak olmayan datalar icin o kisimlar boskalir
3)Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onuyazmaliyiz
*/
--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler left join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

-------RIGHT JOIN---------
/*NOT:
1)Right Join’de ikinci tablodaki tum record’largosterilir.
2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa
bu ek datalar ortak datalar icin gosterilirancak ortak olmayan datalar icin o kisimlar boskalir*/

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler right join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

------FULL JOIN---------
/*NOT:
1)FULL Join’de iki tabloda var olan tum record’largosterilir.
2)Bir tabloda olup otekinde olmayan data’lar boskalir*/

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler full join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

-------SELF JOIN----------
CREATE TABLE personel
(id int,isim varchar(20), title varchar(60), yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET',2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA',3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO',5);

select * from personel

SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel p1 INNER JOIN personel p2
ON p1.yonetici_id =p2.id;

-------------LIKE CONDITION-------------------
/*LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veyaDELETE
statementile calisan wildcards’a(özel sembol)izin verir.. Ve bize pattern matchingyapma imkaniverir. */
CREATE TABLE musteriler (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000); 
/*LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
NOT REGEXP_LIKE = !~       */
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz
*/
select * from musteriler where isim like 'A%';

select * from musteriler where isim ilike 'A%';

--SORU:Ismie harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERYyazin

select isim,gelir
from musteriler
where isim like '%e'

--SORU :Ismininicindeer olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir
from musteriler
where isim like '%er%'

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~ '_atma'
--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_a%'
--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '__s%'

--REGEXP_LIKE (~) KULLANIMI----

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin

SELECT * FROM kelimeler where kelime ~ 'h[ai]t';   -- ~ sonra * koyarsak buyuk kucuk harf gozetmez

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin

select * from kelimeler where kelime ~* 'h[a-k]t';

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime ~* '^[as]';

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime ~* '[mf]$';

--------UPPER---LOWER----INITCAP---

-- Kelimeler tablosundaki kelime sütunundaki verileri önce hepsini büyük harf, sonra küçük harf ve ilk harfleri
-- büyük olucak şekilde yazdıralım

SELECT UPPER(kelime) from kelimeler;

-- Musteriler tablosundan  butun isimleri buyuk harf yapiniz

select upper(isim) from musteriler
select lower(kelime) from kelimeler
select initcap(kelime) from kelimeler  -- initcap istedigimiz sutundaki kelimelerin ilk harfini buyuk yazar

/*
Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek
select lower(title),UPPER(isim) from personel şekilde yapabiliriz
*/










