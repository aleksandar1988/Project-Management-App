DROP DATABASE IF EXISTS projekti;

CREATE DATABASE IF NOT EXISTS projekti
 
	DEFAULT CHARACTER SET utf8mb4 
    
    COLLATE utf8mb4_general_ci;
    
    USE projekti;
    
    CREATE TABLE PROJEKAT(
    SifraProjekta int not null PRIMARY KEY,
    Naziv varchar(15) not null,
    DatumPocetka date not null,
    DatumKraja date not null
   ) ENGINE=InnoDB;
   
   CREATE TABLE ZANIMANJE(
   SifraZanimanja int not null PRIMARY KEY,
   Naziv varchar(15) not null
   )ENGINE = InnoDB;
   
   CREATE TABLE ZAPOSLENI(
   SifraZaposlenog int not null PRIMARY KEY,
   Ime varchar(10) not null,
   Prezime varchar(15) not null,
   JMBG varchar (13) not null,
   SifraZanimanja int not null,zanimanjezanimanje
   CONSTRAINT FK_ZAPOSLENI_ZANIMANJE FOREIGN KEY (SifraZanimanja)REFERENCES projekti.zanimanje(SifraZanimanja)
   )ENGINE = InnoDB;
   
   CREATE TABLE ANGAZOVANJE(
   SifraAngazovanja int not null PRIMARY KEY AUTO_INCREMENT,
   SifraProjekta int not null,
   SifraZaposlenog int not null,
   OpisPosla varchar(15) not null,
   BrojSati int not null,
   CONSTRAINT FK_ANGAZOVANJE_PROJEKAT FOREIGN KEY (SifraProjekta) REFERENCES projekti.projekat(SifraProjekta),
   CONSTRAINT FK_ANGAZOVANJE_ZAPOSLENI FOREIGN KEY (SifraZaposlenog) REFERENCES projekti.zaposleni(SifraZaposlenog),
   CONSTRAINT UQ_ANGAZOVANJE UNIQUE KEY(SifraProjekta, SifraZaposlenog)
   )ENGINE = InnoDb;
   
   INSERT INTO ZANIMANJE VALUES
   (1, 'Projektant'),
   (2, 'Menadzer'),
   (3, 'Operater');
   
   

   
   
   