CREATE SEQUENCE increment_productie
START WITH 1
INCREMENT BY 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE;

CREATE SEQUENCE increment_actor
START WITH 1
INCREMENT BY 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE;

CREATE TABLE PLATA(
    plata_id NUMBER(6) PRIMARY KEY,
    detinator VARCHAR2(50) NOT NULL,
    cod NUMBER(16) NOT NULL UNIQUE,
    data_expirare DATE NOT NULL,
    CVV NUMBER(3) NOT NULL
);
INSERT INTO PLATA VALUES(1, 'JOHN SMITH', 1234567890123456, to_date('15.1.2024','dd.mm.yyyy'), 123);
INSERT INTO PLATA VALUES(2, 'ALICE JOHNSON', 2345678901234567, to_date('10.10.2025','dd.mm.yyyy'), 173);
INSERT INTO PLATA VALUES(3, 'MICHAEL BROWN', 3456789012345678, to_date('20.12.2024','dd.mm.yyyy'), 333);
INSERT INTO PLATA VALUES(4, 'EMILY DAVIS', 4567890123456789, to_date('14.7.2025','dd.mm.yyyy'), 909);
INSERT INTO PLATA VALUES(5, 'DAVID WILSON', 4254753564907767, to_date('5.3.2025','dd.mm.yyyy'), 472);
INSERT INTO PLATA VALUES(6, 'SALAH LEE', 7345113144437373, to_date('30.8.2024','dd.mm.yyyy'), 649);

select * from plata;


CREATE TABLE ABONAMENT(
    abonament_id NUMBER(6) PRIMARY KEY,
    tip_plata VARCHAR(10) NOT NULL,
    data_expirare_plata DATE NOT NULL
);
INSERT INTO ABONAMENT VALUES(10, 'lunar', to_date('13.2.2024', 'dd.mm.yyyy'));
INSERT INTO ABONAMENT VALUES(20, 'lunar', to_date('17.6.2024', 'dd.mm.yyyy'));
INSERT INTO ABONAMENT VALUES(30, 'anual', to_date('25.12.2025', 'dd.mm.yyyy'));
INSERT INTO ABONAMENT VALUES(40, 'anual', to_date('13.1.2025', 'dd.mm.yyyy'));
INSERT INTO ABONAMENT VALUES(50, 'lunar', to_date('25.6.2025', 'dd.mm.yyyy'));
INSERT INTO ABONAMENT VALUES(60, 'anual', to_date('13.2.2025', 'dd.mm.yyyy'));
select * from abonament;


CREATE TABLE PROFIL(
    profil_id NUMBER(6) PRIMARY KEY,
    abonament_id NUMBER(6) NOT NULL,
    porecla VARCHAR2(20) NOT NULL,
    data_creare DATE NOT NULL,
    FOREIGN KEY (abonament_id) REFERENCES ABONAMENT(abonament_id)
);
INSERT INTO PROFIL VALUES(11, 10, 'Spark', to_date('13.1.2023', 'dd.mm.yyyy'));
INSERT INTO PROFIL VALUES(22, 10, 'Luna', to_date('14.2.2024', 'dd.mm.yyyy'));
INSERT INTO PROFIL VALUES(33, 20, 'Rocket', to_date('16.1.2022', 'dd.mm.yyyy'));
INSERT INTO PROFIL VALUES(44, 30, 'Maverick', to_date('5.2.2024', 'dd.mm.yyyy'));
INSERT INTO PROFIL VALUES(55, 40, 'Raven', to_date('14.1.2023', 'dd.mm.yyyy'));
INSERT INTO PROFIL VALUES(66, 60, 'Scout', to_date('4.1.2024', 'dd.mm.yyyy'));
INSERT INTO PROFIL VALUES(77, 50, 'Scout', to_date('4.1.2024', 'dd.mm.yyyy'));
select * from profil;


CREATE TABLE UTILIZATOR(
    utilizator_id NUMBER(6) PRIMARY KEY,
    abonament_id NUMBER(6) NOT NULL,
    plata_id NUMBER(6) NOT NULL,
    mail VARCHAR2(50) NOT NULL UNIQUE,
    parola VARCHAR(50) NOT NULL,
    data_creare DATE NOT NULL,
    telefon VARCHAR2(16),
    FOREIGN KEY (abonament_id) REFERENCES ABONAMENT(abonament_id),
    FOREIGN KEY (plata_id) REFERENCES PLATA(plata_id)
);
INSERT INTO UTILIZATOR VALUES(100, 10, 1, 'johnsmith@yahoo.com', 'josmith123', to_date('13.01.2023', 'dd.mm.yyyy'), '0762599250');
INSERT INTO UTILIZATOR VALUES(101, 20, 2, 'aljohnson@gmail.com', 'johnsonAls', to_date('16.01.2024', 'dd.mm.yyyy'), '0742911211');
INSERT INTO UTILIZATOR VALUES(102, 30, 3, 'brownMICH@gmail.com', 'safePassword', to_date('5.02.2024', 'dd.mm.yyyy'), '0798566123');
INSERT INTO UTILIZATOR VALUES(103, 40, 4, 'DaViSeml@yahoo.com', 'EmilY', to_date('14.01.2023', 'dd.mm.yyyy'), '0776544232');
INSERT INTO UTILIZATOR VALUES(104, 50, 5, 'willdavidson@gmail.com', 'q34trs67', to_date('4.01.2024', 'dd.mm.yyyy'), '0768777565');
INSERT INTO UTILIZATOR(utilizator_id, abonament_id, plata_id, mail, parola, data_creare)
    VALUES(105, 60, 6, 'LeeSrh@gmail.com', 'llovve56', to_date('4.01.2024', 'dd.mm.yyyy'));
select * from utilizator;


CREATE TABLE DIRECTOR(
    director_id NUMBER(5) PRIMARY KEY,
    nume VARCHAR2(50),
    prenume VARCHAR2(50),
    data_nastere DATE
);
INSERT INTO DIRECTOR VALUES(101, 'Hart', 'Hanson', to_date('26.7.1957', 'dd.mm.yyyy'));
INSERT INTO DIRECTOR VALUES(202, 'Steven', 'Knight', to_date('1.4.1959', 'dd.mm.yyyy'));
INSERT INTO DIRECTOR (director_id, nume, prenume) VALUES(303, 'Adam', 'Horowitz');
INSERT INTO DIRECTOR (director_id, nume, prenume) VALUES(404, 'Paul', 'Scheuring');
INSERT INTO DIRECTOR VALUES(505, 'Dana', 'Terrace', to_date('8.12.1990', 'dd.mm.yyyy'));
INSERT INTO DIRECTOR VALUES(606, 'Kenneth', 'Branagh', to_date('10.12.1960', 'dd.mm.yyyy'));
INSERT INTO DIRECTOR (director_id, nume, prenume) VALUES(707, 'Mark', 'Mylod');
INSERT INTO DIRECTOR (director_id, nume, prenume) VALUES(808, 'Yargos ', 'Lanthimos');
INSERT INTO DIRECTOR (director_id, nume, prenume) VALUES(909, 'Edward', 'Kitsis');
select * from director;


CREATE TABLE ACTOR(
    actor_id NUMBER(5) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    prenume VARCHAR2(50) NOT NULL,
    data_natere DATE
);
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Cillian', 'Murphy', to_date('25.5.1976', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'David', 'Boreanaz', to_date('16.5.1969', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Lana', 'Parrilla', to_date('15.7.1977', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Josh', 'Dallas', to_date('18.12.1978', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Dominic', 'Purcell', to_date('17.2.1970', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Robles', 'Sarah-Nicole', to_date('20.12.1991', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Kenneth', 'Branagh', to_date('10.12.1960', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Taylor-Joy', 'Any', to_date('16.4.1996', 'dd.mm.yyyy'));
INSERT INTO ACTOR VALUES(increment_actor.nextval, 'Emma', 'Stone', to_date('6.11.1988', 'dd.mm.yyyy'));
select* from actor;


CREATE TABLE ROL(
    rol_id NUMBER(5) PRIMARY KEY,
    nume_caracter VARCHAR2(50) NOT NULL,
    importanta VARCHAR2(50) NOT NULL,
    descriere VARCHAR2(200)
);
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(1, 'Thomas Shelby', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(2, 'Seeley Booth', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(3, 'Evil Queen', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(4, 'Prince Charming', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(5, 'Lincoln Burrows', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(6, 'Luz Noceda', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(7, 'Hercule Poirot', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(8, 'Margot', 'principal');
INSERT INTO ROL(rol_id, nume_caracter, importanta) VALUES(9, 'Bella Baxter', 'principal');
select * from rol;


CREATE TABLE PRODUCTIE(
    productie_id NUMBER(6) PRIMARY KEY,
    denumire VARCHAR2(50) NOT NULL,
    gen VARCHAR2(50) NOT NULL,
    data_aparitie DATE NOT NULL,
    director_id NUMBER(5) NOT NULL,
    FOREIGN KEY (director_id) REFERENCES DIRECTOR(director_id)
);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Peaky Blinders', 'drama', to_date('12.12.2013', 'dd.mm.yyyy'), 202);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Death On The Nile', 'politist', to_date('11.2.2022', 'dd.mm.yyyy'), 606);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Bones', 'drama', to_date('13.12.2005', 'dd.mm.yyyy'), 101);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'The Menu', 'comedie', to_date('18.11.2022', 'dd.mm.yyyy'), 707);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Prison Break', 'drama', to_date('29.8.2005', 'dd.mm.yyyy'), 404);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Owl House', 'aventura', to_date('10.1.2020', 'dd.mm.yyyy'), 505);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'A Haunting In Venice', 'politist', to_date('15.9.2023', 'dd.mm.yyyy'), 606);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Once Upon A Time', 'drama', to_date('23.10.2011', 'dd.mm.yyyy'), 303);
INSERT INTO PRODUCTIE VALUES(increment_productie.nextval, 'Poor Things', 'comedie', to_date('8.12.2023', 'dd.mm.yyyy'), 808);
select* from productie;


CREATE TABLE FILM(
    productie_id NUMBER(6) PRIMARY KEY,
    durata NUMBER(3) NOT NULL,
    FOREIGN KEY(productie_id) REFERENCES PRODUCTIE(productie_id)
);
INSERT INTO FILM VALUES(7, 103);
INSERT INTO FILM VALUES(2, 127);
INSERT INTO FILM VALUES(4, 106);
INSERT INTO FILM VALUES(9, 141);
select * from film;

CREATE TABLE SERIAL(
    productie_id NUMBER(6) PRIMARY KEY,
    numar_sezoane NUMBER(2) NOT NULL,
    FOREIGN KEY(productie_id) REFERENCES PRODUCTIE(productie_id)
);
INSERT INTO SERIAL VALUES(1, 6);
INSERT INTO SERIAL VALUES(3, 12);
INSERT INTO SERIAL VALUES(8, 7);
INSERT INTO SERIAL VALUES(5, 5);
INSERT INTO SERIAL VALUES(6, 3);
select * from serial;


CREATE TABLE EPISOD(
    episod_id NUMBER(6) PRIMARY KEY,
    productie_id NUMBER(6) NOT NULL,
    numar_episod NUMBER(2) NOT NULL,
    numar_sezon NUMBER(2) NOT NULL,
    titlu VARCHAR2(50) NOT NULL,
    durata NUMBER(3) NOT NULL,
    FOREIGN KEY(productie_id) REFERENCES PRODUCTIE(productie_id)
);
INSERT INTO EPISOD VALUES(1, 1, 1, 1, 'Episod 1', 58);
INSERT INTO EPISOD VALUES(2, 1, 2, 1, 'Episod 2', 58);
INSERT INTO EPISOD VALUES(3, 3, 5, 7, 'The Twist int the Twister', 42);
INSERT INTO EPISOD VALUES(4, 3, 6, 7, 'The Crack In The Code', 45);
INSERT INTO EPISOD VALUES(5, 3, 11, 12, 'The Day in the Life', 46);
INSERT INTO EPISOD VALUES(6, 8, 1, 1, 'Pilot', 42);
INSERT INTO EPISOD VALUES(7, 8, 2, 1, 'The Thing You Love Most', 41);
INSERT INTO EPISOD VALUES(8, 8, 3, 1, 'Snow Falls', 42);
INSERT INTO EPISOD VALUES(9, 8, 4, 1, 'The Price Of Gold', 45);
INSERT INTO EPISOD VALUES(10, 5, 1, 1, 'Pilot', 42);
INSERT INTO EPISOD VALUES(11, 5, 2, 1, 'Allen', 44);
INSERT INTO EPISOD VALUES(12, 5, 3, 1, 'Cell Test', 43);
select * from episod;


CREATE TABLE PROFIL_PRODUCTIE(
    profil_productie_id NUMBER(6) PRIMARY KEY,
    profil_id NUMBER(6) NOT NULL,
    productie_id NUMBER(6) NOT NULL,
    FOREIGN KEY(profil_id) REFERENCES PROFIL(profil_id),
    FOREIGN KEY(productie_id) REFERENCES PRODUCTIE(productie_id)
);

INSERT INTO PROFIL_PRODUCTIE VALUES(111, 11, 1);
INSERT INTO PROFIL_PRODUCTIE VALUES(112, 11, 2);
INSERT INTO PROFIL_PRODUCTIE VALUES(113, 11, 7);
INSERT INTO PROFIL_PRODUCTIE VALUES(114, 22, 7);
INSERT INTO PROFIL_PRODUCTIE VALUES(115, 33, 7);
INSERT INTO PROFIL_PRODUCTIE VALUES(116, 44, 9);
INSERT INTO PROFIL_PRODUCTIE VALUES(117, 44, 3);
INSERT INTO PROFIL_PRODUCTIE VALUES(118, 55, 9);
INSERT INTO PROFIL_PRODUCTIE VALUES(119, 66, 6);
INSERT INTO PROFIL_PRODUCTIE VALUES(120, 11, 6);
INSERT INTO PROFIL_PRODUCTIE VALUES(121, 55, 7);
INSERT INTO PROFIL_PRODUCTIE VALUES(122, 11, 4);
INSERT INTO PROFIL_PRODUCTIE VALUES(123, 11, 9);
INSERT INTO PROFIL_PRODUCTIE VALUES(124, 22, 9);
INSERT INTO PROFIL_PRODUCTIE VALUES(125, 22, 2);
INSERT INTO PROFIL_PRODUCTIE VALUES(126, 66, 7);
INSERT INTO PROFIL_PRODUCTIE VALUES(127, 66, 2);
INSERT INTO PROFIL_PRODUCTIE VALUES(128, 66, 4);

select * from profil_productie;


CREATE TABLE PRODUCTIE_DIRECTOR(
    productie_director_id NUMBER(6) PRIMARY KEY,
    productie_id NUMBER(6) NOT NULL,
    director_id NUMBER(5) NOT NULL,
    FOREIGN KEY(productie_id) REFERENCES PRODUCTIE(productie_id),
    FOREIGN KEY(director_id) REFERENCES DIRECTOR(director_id)
);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(1, 1, 202);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(2, 2, 606);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(3, 3, 101);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(4, 4, 707);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(5, 5, 404);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(6, 6, 505);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(7, 7, 606);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(8, 8, 303);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(9, 9, 808);
INSERT INTO PRODUCTIE_DIRECTOR VALUES(10, 8, 909);
select * from productie_director;


CREATE TABLE ROL_PRODUCTIE_JUCAT(
    rol_productie_jucat NUMBER(7) PRIMARY KEY,
    actor_id NUMBER(5) NOT NULL,
    rol_id NUMBER(5) NOT NULL,
    productie_id NUMBER(6) NOT NULL,
    timp_ecran NUMBER(3),
    FOREIGN KEY(actor_id) REFERENCES ACTOR(actor_id),
    FOREIGN KEY(rol_id) REFERENCES ROL(rol_id),
    FOREIGN KEY(productie_id) REFERENCES PRODUCTIE(productie_id)
);
INSERT INTO ROL_PRODUCTIE_JUCAT(rol_productie_jucat, actor_id, rol_id, productie_id) VALUES(1, 1, 1, 1);
INSERT INTO ROL_PRODUCTIE_JUCAT(rol_productie_jucat, actor_id, rol_id, productie_id) VALUES(2, 2, 2, 3);
INSERT INTO ROL_PRODUCTIE_JUCAT(rol_productie_jucat, actor_id, rol_id, productie_id) VALUES(3, 3, 3, 8);
INSERT INTO ROL_PRODUCTIE_JUCAT(rol_productie_jucat, actor_id, rol_id, productie_id) VALUES(4, 4, 4, 8);
INSERT INTO ROL_PRODUCTIE_JUCAT(rol_productie_jucat, actor_id, rol_id, productie_id) VALUES(5, 5, 5, 5);
INSERT INTO ROL_PRODUCTIE_JUCAT VALUES(6, 6, 6, 6, 359);
INSERT INTO ROL_PRODUCTIE_JUCAT VALUES(7, 7, 7, 7, 87);
INSERT INTO ROL_PRODUCTIE_JUCAT(rol_productie_jucat, actor_id, rol_id, productie_id) VALUES(8, 7, 7, 2);
INSERT INTO ROL_PRODUCTIE_JUCAT VALUES(9, 8, 8, 4, 74);
INSERT INTO ROL_PRODUCTIE_JUCAT VALUES(10, 9, 9, 9, 112);
select * from ROL_PRODUCTIE_JUCAT;



--1.ordonari si utilizarea functiilor nvl si decode
SELECT u.parola as "Email",
        DECODE(to_char(a.data_expirare_plata, 'yyyy'), 2024, 'Anul acesta', 2025, 'Anul viitor', 'N/A') as "An expirare plata",
        NVL(u.telefon, u.mail) as "Contact"
FROM utilizator u LEFT JOIN abonament a
    ON a.abonament_id=u.abonament_id
ORDER BY u.mail;


--1 bloc CASE+WITH
with doar_filme as (
select p.productie_id, p.denumire, p.data_aparitie, p.director_id, f.durata
from productie p inner join film f
on p.productie_id=f.productie_id)

select df.denumire as "Denumire",
    d.nume||' '||d.prenume as "Director",
    case
        when df.durata<110 then 'Short'
        when df.durata between 110 and 130 then 'Medium'
        else 'Long'
    end as "Durata"
from doar_filme df join director d
on df.director_id=d.director_id;



--2.o funtie pe data calendaristica+o functie pe sir de caracter+cerere nesincronizata in FROM
with toate_productiile as(
    select p.productie_id, p.denumire, p.gen, p.data_aparitie, f.durata, s.numar_sezoane
    from productie p left join film f
        on p.productie_id=f.productie_id
        left join serial s
        on s.productie_id=p.productie_id)
        
select t.productie_id as "Id", 
        lower(t.denumire) as "Titlu", 
        t.gen as "Gen", 
        t.durata as "Durata", 
        t.numar_sezoane as "Numar sezoane", 
        extract(year from t.data_aparitie) as "An aparitie",
        pp.nr_profile
from toate_productiile t 
join (select productie_id, 
            count(*) as nr_profile
        from profil_productie 
        group by productie_id) pp
on t.productie_id=pp.productie_id
order by t.gen;
             

select * from toate_productiile;

    
    
--3.functie cu sir de caracere, funtie cu date calendaristice +subcerere sincronizata pe 3 tabele
select 
    concat(concat(d.nume, ' '), d.prenume) as "Nume actor",
    p.denumire as "Denumire",
    (select sysdate - p.data_aparitie from dual) as "Date"
from director d
join productie_director pd on d.director_id = pd.director_id
join productie p on p.productie_id = pd.productie_id
order by "Date";


--4.grup?ri de date, func?ii grup, filtrare la nivel de grupuri cu subcereri nesincronizate
--(în clauza de HAVING) în care intervin cel pu?in 3 tabele (in cadrul aceleia?i cereri)
select d.director_id,
    concat(concat(d.nume, ' '), d.prenume) as "Nume director",
    count(p.productie_id) as "Numar productii"
from director d join productie_director pd
    on d.director_id=pd.director_id
    join productie p 
        on p.productie_id=pd.productie_id
where p.data_aparitie>=add_months(sysdate, -60)
group by d.director_id, d.nume, d.prenume
having count(p.productie_id)>=1
    and (select count(*)    
        from productie_director pd2
        where pd2.director_id=d.director_id)>=1
order by "Numar productii" desc;

select d.director_id,
    concat(concat(d.nume, ' '), d.prenume) as "Nume director",
    count(p.productie_id) as "Numar productii"
from director d join productie_director pd
    on d.director_id=pd.director_id
    join productie p 
        on p.productie_id=pd.productie_id
where p.data_aparitie>=add_months(sysdate, -60)
group by d.director_id, d.nume, d.prenume
having (select min(count(pd2.productie_id)) 
        from productie_director pd2
        group by director_id) =count(p.productie_id)
order by "Numar productii" desc;



select*from productie;

--stergerea directotului cel mai batran
delete from episod
where durata=(select max(durata) from episod);

select * from episod;
rollback;

--daca timp_ecran este null setam la 5 minute
update rol_productie_jucat
set timp_ecran=5
where timp_ecran is null;
select * from rol_productie_jucat;


--update la utilizator, punem parola "PAROLA_NOUA" daca anul crearii este minim
select * from utilizator;
update utilizator
set parola='PAROLA NOUA'
where extract(year from data_creare)=
        (select min(extract(year from data_creare)) from utilizator);


--vizualizare complexa
create view complex_view_again2 as(
select  p.denumire, p.gen,  a.nume||' '||a.prenume as "nume actor",
r.nume_caracter, d.nume||' '||d.prenume as "nume director"
from productie p
join rol_productie_jucat rpj on (p.productie_id=rpj.productie_id)
join actor a on(a.actor_id=rpj.actor_id)
join rol r on (r.rol_id=rpj.rol_id)
join productie_director pd on (p.productie_id=pd.productie_id)
join director d on (d.director_id=pd.director_id)
);
select * from complex_view_again2;
UPDATE complex_view_again2
SET gen='ceva'
WHERE gen='drama';


select * from complex_view;
update complex_view
set denumire='DA'
where nume_caracter like '%a%';



--outer_join
SELECT 
    a.actor_id,
    a.nume AS "Nume actor",
    r.rol_id,
    r.nume_caracter AS "nume rol",
    p.productie_id,
    p.denumire AS "nume productie"
FROM actor a
FULL OUTER JOIN rol_productie_jucat rpj ON a.actor_id = rpj.actor_id
FULL OUTER JOIN productie p ON rpj.productie_id = p.productie_id
FULL OUTER JOIN rol r ON rpj.rol_id = r.rol_id;

--top-n
select denumire, director_id
from (select *
    from productie
    where lower(denumire) like '%a%'
    order by denumire
    )
where rownum<=3
order by rownum desc;


--division

select a.actor_id,
    a.nume||' '||a.prenume
from actor a
where not exists(select 1 from rol_productie_jucat rpj
                join rol r on rpj.rol_id=r.rol_id
                join productie p on rpj.productie_id=p.productie_id
                where rpj.actor_id=a.actor_id
                and lower(p.denumire)='once upon a time'
                )
and not exists( select 1 from rol_productie_jucat rpj
                join rol r on r.rol_id=rpj.rol_id
                where rpj.actor_id=a.actor_id
                and lower(r.nume_caracter)='evil');
                
                
select a.actor_id, a.nume||a.prenume
from actor a
where not exists(select 1 
                from productie p, rol_productie_jucat rpj
                where p.productie_id=rpj.productie_id
                and not exists(select 'x' 
                                from actor b
                                where rpj.actor_id=b.actor_id
                                and a.actor_id=b.actor_id));
                
      
with doar_seriale as (
select p.productie_id
from productie p inner join serial s
on p.productie_id=s.productie_id) 

select a.actor_id, count(ds.productie_id)
from actor a
join rol_productie_jucat rpj on a.actor_id=rpj.actor_id
join doar_seriale ds on ds.productie_id=rpj.productie_id
group by a.actor_id
having count(ds.productie_id)=(select max( count(ds.productie_id))
                            from doar_seriale ds
                            join rol_productie_jucat rpj on rpj.productie_id=ds.productie_id
                            join actor a on rpj.actor_id=a.actor_id
                            group by a.actor_id);


---o cerere unde sa scot titlul productiile din genul cel mai intalnit si producatorul daca
--producatorul are data nasterii o scriem altfel scriem data inexistenta, daca 
--cumva data nasterii este dupa data aparitiei vom afisa GRESEALA

select gen from productie
where count(gen)=(select max(count(gen)) from productie group by gen)
group by gen;

select max(count(gen)) from productie
group by gen;




WITH genCounts AS (
    SELECT gen, COUNT(gen) AS gen_count
    FROM productie
    GROUP BY gen
)
SELECT p.denumire, p.gen, d.nume || ' ' || d.prenume,
    CASE
        WHEN d.data_nastere IS NULL THEN 'Data inexistenta'
        WHEN d.data_nastere > p.data_aparitie THEN 'GRESEALA!!!'
        else 'Data corecta'
    END
FROM productie p
JOIN director d ON d.director_id = p.director_id
WHERE p.gen = (
    SELECT gen 
    FROM genCounts 
    WHERE gen_count = (SELECT MAX(gen_count) FROM genCounts)
);
