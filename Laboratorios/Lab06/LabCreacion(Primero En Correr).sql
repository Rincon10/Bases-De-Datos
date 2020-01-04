BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/

/*C. Construcci�n: creando */

CREATE TABLE Registros(
    numero NUMBER( 5 ) NOT NULL, 
	comentario VARCHAR( 20 ) ,
	fecha DATE NOT NULL ,
	tiempo NUMBER( 9 ) NOT NULL ,
	posicion NUMBER( 5 ) NOT NULL ,
	revision XMLTYPE  ,
	dificultad CHAR( 1 ) NOT NULL  ,
	nomSegmento VARCHAR( 10 ) NOT NULL, 
	idCiclista NUMBER( 5 ) NOT NULL 
); 
CREATE TABLE Fotos(
    noFoto NUMBER (5) NOT NULL,
	foto VARCHAR( 50 )  ,
	noRegistro  NUMBER( 5 ) NOT NULL
);

CREATE TABLE Carreras(
   codigo VARCHAR( 20 ) NOT NULL ,
   nombre VARCHAR( 30 ) ,pais VARCHAR( 15 ) , 
   categoria NUMBER( 1 ) , 
   periodicidad VARCHAR( 25 )
);

CREATE TABLE PropiedadDe(
    idMiembro NUMBER( 5 ) NOT NULL ,
	coCarrera VARCHAR( 20 ) NOT NULL,
	porcentaje NUMBER( 5, 2 ) NOT NULL 
);
CREATE TABLE Puntos(
    coPunto NUMBER( 5 ) NOT NULL,
	orden NUMBER( 2 ) NOT NULL , 
	nombre VARCHAR( 10 ) NOT NULL ,
	tipo CHAR( 1 ) NOT NULL,
	distancia NUMBER( 8,2 ) NOT NULL ,
	tiempoLimite NUMBER( 9 ) NOT NULL,
	coCarrera VARCHAR( 20 ) NOT NULL
) ;

CREATE TABLE Miembros(
    id_ NUMBER( 5 ) NOT NULL ,
	idT CHAR( 2 ) NOT NULL ,
	idN NUMBER( 15 ) NOT NULL ,
	pais CHAR( 15 ) NOT NULL,
	correo VARCHAR( 30 ) NOT NULL 
);

CREATE TABLE Personas(
    idMiembro NUMBER( 5 ) NOT NULL 
	,nombres VARCHAR( 50 ) NOT NULL 
) ;

CREATE TABLE Empresas(
    idMiembro NUMBER( 5 ) NOT NULL ,
	razonSocial VARCHAR( 30 ) NOT NULL ,
	idRepresentante NUMBER( 5 ) NOT NULL
); 
CREATE TABLE Ciclistas(
    idPersona NUMBER( 5 ) NOT NULL ,
	nacimiento DATE NOT NULL ,
	categoria NUMBER( 1 ) NOT NULL 
);


CREATE TABLE Versiones (
    coVersion CHAR( 5 ) NOT NULL ,
	nombre VARCHAR( 5 ) NOT NULL  ,
	fecha DATE NOT NULL ,
	coCarrera VARCHAR( 20 ) NOT NULL 
);

CREATE TABLE Segmentos( 
    nombre VARCHAR( 10 )NOT NULL,
	tipo CHAR( 1 ),
	coVersion CHAR( 5 ) NOT NULL ,
	coPuntoInicio NUMBER( 5 ) NOT NULL,
	coPuntoFinal NUMBER( 5 ) NOT NULL 
) ;

CREATE TABLE Participa( 
    idCiclista NUMBER( 5 ) NOT NULL , 
	coVersion CHAR( 5 ) NOT NULL
);

CREATE TABLE EsOrganizador( 
    idEmpresa NUMBER( 5 ) NOT NULL  , 
	coVersion CHAR( 5 ) NOT NULL  
);



/*
INSERT  INTO Miembros  VALUES( NULL,'CC', 1512315, 'COLOMBIA','juanPerez@gmail.com'  );
al  ser el id la llave en la tabla Miembros la llave con  integridad PRIMARY KEY, no puede ser nula ya que es el identificador de esta tabla

INSERT  INTO Miembros  VALUES( 12314,'CC', 1512315, 'COLOMBIA','juanPerez@gmail.com'  );
al  ser el id en la tabla Miembros la llave con la integridad PRIMARY KEY ,no se deben repetir los id(s) de los miembros ya que son unicos

INSERT INTO Puntos VALUES( 01, 2,'P-Orlando', 'P', 1.00, 10, 'CORIG' );
al ser coCarrera la clave foranea Tabla Puntos , es imposible que en puntos exista una clave llamada GIRE100 pero en la tabla Carreras NO

INSERT INTO Versiones VALUES( CO23,'2018',TO_DATE('05/04/2023','MM/DD/YYYY'), 'CORIG' );
al ser coCarrera la clave foranea de la Tabla Versiones , es imposible que en puntos exista una clave llamada GIRE100 pero en la tabla Carreras NO

INSERT INTO Carreras VALUES ( NULL,'COEDG','COLOMBIA', 5,'ANUAL');
al  ser el codigo la llave en la tabla Carreras la llave con  integridad PRIMARY KEY, no puede ser nula ya que es el identificador de esta tabla
*/

/*CICLO 1: PoblarNoOK ( 3 )*/


--3Punto)
/*  
--1 Dado la tabla registros que se nos especifico, que el atributo "foto", tiene la restriccion de inicar por www. Al no hacer  ser una  integridad de tipos a�n, el valor 'w.imagenes/prueba.jpg' sigue siendo aceptadado, ya que es de tipo cadena.
INSERT INTO Registros VALUES( 04, 'excelente carrera',TO_DATE('10/01/2020','MM/DD/YYYY'), 120, 5,'g','A','Dor/Nort',12314 );

--2 Dado la tabla registros que se nos especifico, que el atributo "tiempo", tiene la restriccion de ser un numero positivo. Al no hacer  ser una  integridad de tipos a�n, el valor '-120' sigue siendo aceptadado, ya que es de tipo numerico.
INSERT INTO Registros VALUES( 05, 'excelente servicio',TO_DATE('10/01/2021','MM/DD/YYYY'), -120, 5,'g','A','www.imagenes/prueba2.jpg','21CO','Dor/Nort',12314 );

--3 Dado la tabla Miembros que se nos especifico, que el atributo "pais", tiene la restriccion de alamcenar unicamente letras en mayuscula y espacios en blanco. Al no hacer  ser una  integridad de tipos a�n, el valor 'chile' sigue siendo aceptadado, ya que es de tipo cadena.
INSERT INTO Miembros VALUES (21589, 'CE', '695784235879', 'chile','rickrincon@gmail.com');
 
--4 Dado la tabla Miembros que se nos especifico, que el atributo "correo", tiene la restriccion debe tener caracteres antes y despues de @. Al no hacer  ser una  integridad de tipos a�n, el valor 'sofia,neira@' sigue siendo aceptadado, ya que es de tipo cadena.
INSERT INTO Miembros VALUES (11389, 'CC', '789321456123', 'PERU','sofia,neira@');

--5 Dado la tabla Puntos que se nos especifico, que el atributo "Tipo", tiene la restriccion tiene de ser alguno de los valores P,L,H,A,M,V,C. Al no hacer  ser una  integridad de tipos a�n, el valor 'W' sigue siendo aceptadado, ya que es de tipo cadena.
INSERT INTO Puntos VALUES (07 , 5 , 'PMonterrey', 'W', 40.55, 30, 'ESCAS');

*/

/*
----------------------------------------------------CICLO 1: XPoblar(Eliminar los datos)----------------------------------------------------
DELETE FROM  Carreras ;
DELETE FROM PropiedadDe ;
DELETE FROM Puntos ;

DELETE FROM Segmentos ;
DELETE FROM Versiones ;

DELETE FROM Registros ;
DELETE FROM Fotos ;


DELETE FROM Miembros ;
DELETE FROM Personas ;
DELETE FROM Empresas ;
DELETE FROM Ciclistas ;
DELETE FROM Versiones ;

DELETE FROM EsOrganizador;
DELETE FROM Participa;
*/


/*D. Construcci�n: protegiendo*/

--1Punto)

/*CICLO 1: Atributos*/

ALTER TABLE Puntos ADD CONSTRAINT CK_Puntos_tipo CHECK( tipo IN ('P','L','H','A','M','V','C') );
ALTER TABLE Puntos ADD CONSTRAINT CK_Puntos_tiempoLimite CHECK( tiempoLimite >= 0);
ALTER TABLE Puntos ADD CONSTRAINT CK_Dist  
 CHECK ( distancia > 1 
 );
 
ALTER TABLE Segmentos ADD CONSTRAINT CK_Segmentos_tipo CHECK( tipo IN ('C','M','L'));

ALTER TABLE Registros ADD CONSTRAINT CK_Registros_numero CHECK( numero BETWEEN 1 AND 99999 );
ALTER TABLE Registros ADD CONSTRAINT CK_Registros_tiempo CHECK( tiempo >= 0 );
ALTER TABLE Registros ADD CONSTRAINT CK_Registros_dificultad CHECK( dificultad IN ('A','M','B' ));
ALTER TABLE Fotos  ADD CONSTRAINT CK_Fotos_foto CHECK(  REGEXP_LIKE( foto, 'www.[A-Za-z]*.pdf')  OR REGEXP_LIKE( foto, 'www.[A-Za-z]*.gif') );

ALTER TABLE Miembros ADD CONSTRAINT CK_Miembros_id_ CHECK( id_ BETWEEN 1 AND 99999 );
ALTER TABLE Miembros ADD CONSTRAINT CK_Miembros_idt CHECK( idt IN ( 'CC', 'CE', 'NT') );
ALTER TABLE Miembros ADD CONSTRAINT CK_Miembros_idn CHECK( idn >= 1111111111 )  ;
ALTER TABLE Miembros ADD CONSTRAINT CK_Miembros_pais CHECK( pais = UPPER( pais ) );
ALTER TABLE Miembros ADD CONSTRAINT CK_Miembros_correo CHECK(  correo LIKE '%@%' AND correo NOT LIKE '%@%@%' )  ;
ALTER TABLE Ciclistas ADD CONSTRAINT CK_Ciclistas_categoria CHECK( categoria BETWEEN 1 AND 5 );

ALTER TABLE Carreras ADD CONSTRAINT CK_Carreras_codigo CHECK( codigo = UPPER( codigo ) AND  REGEXP_LIKE( codigo, '^[A-Za-z0-9]*$'));
ALTER TABLE Carreras ADD CONSTRAINT CK_Carreras_pais CHECK( pais = UPPER( pais ) );
ALTER TABLE Carreras ADD CONSTRAINT CK_Carreras_categoria CHECK( categoria BETWEEN 1 AND 5 );
ALTER TABLE Carreras ADD CONSTRAINT CK_Carreras_periodicidad CHECK( LOWER(periodicidad) IN ('anual','semestral','mensual') );

ALTER TABLE Versiones  ADD CONSTRAINT CK_Versiones_coVersion  CHECK(  REGEXP_LIKE( coVersion ,'^[A-Za-z0-9]*$'))  ;

ALTER TABLE PropiedadDe ADD CONSTRAINT CK_PropiedadDe_porcentaje CHECK( porcentaje >= 0 );


/*CICLO 1: Primarias*/


ALTER TABLE Versiones ADD CONSTRAINT PK_Versiones PRIMARY KEY( coVersion ) ;
ALTER TABLE Segmentos ADD CONSTRAINT PK_Segmentos PRIMARY KEY( nombre ) ;

ALTER TABLE Registros ADD CONSTRAINT PK_Registros PRIMARY KEY( numero ) ;
ALTER TABLE Fotos ADD CONSTRAINT PK_Fotos PRIMARY KEY( noFoto ) ;

ALTER TABLE Carreras ADD CONSTRAINT PK_Carreras PRIMARY KEY( codigo ) ;
ALTER TABLE PropiedadDe ADD CONSTRAINT PK_PropiedadDe PRIMARY KEY( idMiembro, coCarrera ) ;
ALTER TABLE Puntos ADD CONSTRAINT PK_Puntos PRIMARY KEY( coPunto ) ;

ALTER TABLE Miembros ADD CONSTRAINT PK_Miembros PRIMARY KEY( id_ ) ;
ALTER TABLE Personas ADD CONSTRAINT PK_Personas PRIMARY KEY( idMiembro ) ;
ALTER TABLE Empresas ADD CONSTRAINT PK_Empresas PRIMARY KEY( idMiembro ) ;
ALTER TABLE Ciclistas ADD CONSTRAINT PK_Ciclistas PRIMARY KEY( idPersona ) ;

ALTER TABLE Participa ADD CONSTRAINT PK_Participa PRIMARY KEY( idCiclista , coVersion ) ;
ALTER TABLE EsOrganizador ADD CONSTRAINT Pk_EsOrganizador PRIMARY KEY( idEmpresa, coVersion ) ;

/*CICLO 1: �nicas*/

ALTER TABLE Registros ADD CONSTRAINT UK_Registros UNIQUE( comentario ) ;

/*CICLO 1: For�neas*/

ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PropiedadDe_idMiembro FOREIGN KEY( idMiembro ) REFERENCES Miembros( id_ ) ;
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PropiedadDe_coCarrera FOREIGN KEY( coCarrera ) REFERENCES Carreras( codigo ) ;

ALTER TABLE Puntos ADD CONSTRAINT FK_Puntos_coCarrera FOREIGN KEY ( coCarrera ) REFERENCES Carreras ( codigo );

ALTER TABLE Segmentos ADD CONSTRAINT FK_Segmentos_coPuntoInicio FOREIGN KEY ( coPuntoInicio ) REFERENCES Puntos ( coPunto ) ;
ALTER TABLE Segmentos ADD CONSTRAINT FK_Segmentos_coPuntoFinal FOREIGN KEY ( coPuntoFinal ) REFERENCES Puntos ( coPunto ) ;
ALTER TABLE Segmentos ADD CONSTRAINT FK_Segmentos_coVersion FOREIGN KEY ( coVersion ) REFERENCES Versiones( coVersion ) ;

ALTER TABLE Versiones ADD CONSTRAINT FK_Versiones_coCarrera FOREIGN KEY ( coCarrera ) REFERENCES Carreras( codigo ) ;

ALTER TABLE Registros ADD CONSTRAINT FK_Registros_nomSegmento FOREIGN KEY  ( nomSegmento ) REFERENCES  Segmentos ( nombre );
ALTER TABLE Registros ADD CONSTRAINT FK_Registros_idCiclista FOREIGN KEY  ( idCiclista ) REFERENCES Ciclistas( idPersona );

ALTER TABLE Fotos ADD CONSTRAINT FK_Fotos_noRegistro FOREIGN KEY( noRegistro ) REFERENCES Registros( numero );

ALTER TABLE Participa ADD CONSTRAINT FK_Participa_idCiclista FOREIGN KEY ( idCiclista ) REFERENCES Ciclistas ( idPersona ) ;
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_coVersion FOREIGN KEY ( coVersion ) REFERENCES Versiones ( coVersion );

ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_idRepresentante FOREIGN KEY ( idRepresentante ) REFERENCES Personas ( idMiembro );
ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_idMiembro FOREIGN KEY ( idMiembro ) REFERENCES Miembros ( id_ );

ALTER TABLE EsOrganizador ADD CONSTRAINT FK_EsOrganizador_idEmpresa FOREIGN KEY ( idEmpresa ) REFERENCES Empresas ( idMiembro );
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_EsOrganizador_coVersion FOREIGN KEY ( coVersion ) REFERENCES Versiones ( coVersion );

ALTER TABLE Ciclistas ADD CONSTRAINT FK_Ciclistas_ FOREIGN KEY ( idPersona ) REFERENCES Personas ( idMiembro );

ALTER TABLE Personas ADD CONSTRAINT FK_Personas_ FOREIGN KEY ( idMiembro ) REFERENCES Miembros ( id_ ); 

/* Tuplas*/
 /*La velocidad m�xima en cicla es de 100 km/hora*/
 ALTER TABLE Puntos ADD CONSTRAINT CK_Vel
  CHECK( distancia/tiempoLimite <= 100
);

/*2) Construcci�n: protegiendo*/
--2Punto)

--1 CK_Registros_foto 
--2 CK_Registros_tiempo
--3 CK_Miembros_pais
--4 CK_Miembros_correo
--5 CK_Puntos_Tipo

/*3) Construcci�n: protegiendo*/
--3Punto)

--INSERT INTO Registros VALUES( -20, 'recomendada',TO_DATE('10/05/2019','MM/DD/YYYY'), 130, 2,'g','A','www.imagenes/prueba1.gif',02,'Nu�/Herr',32012 ) ;
-- Dado la tabla Registros que se nos especifico, que el atributo "numero", tiene la restriccion de un numeroi entre 1 99999. Al no hacer  ser una  integridad de tipos a�n, el valor '-20' sigue siendo aceptadado, ya que es de tipo numerico.

--INSERT  INTO Miembros  VALUES( 15456,'CC', 1546515564, 'francia','alejandra@EFcorporation.com'  );
-- Dado la tabla Miembros que se nos especifico, que el atributo "pais", tiene la restriccion de almacenar el pais en mayuscula. Al no hacer  ser una  integridad de tipos a�n, el valor 'francia' sigue siendo aceptadado, ya que es de tipo cadena.

--INSERT  INTO Miembros  VALUES( 16845,'CC', -4512674546, 'COLOMBIA','jorge@gmail.com'  );
-- Dado la tabla Miembros que se nos especifico, que el atributo "idn", tiene la restriccion de almacenar un entero de mayor a 0 y a 1111111111. Al no hacer  ser una  integridad de tipos a�n, el valor ' -4512674546' sigue siendo aceptadado, ya que es de tipo numerico.

--INSERT  INTO Miembros  VALUES( 12314,'CD', 1213414212, 'COLOMBIA','camilorincon100@gmail.com'  );
-- Dado la tabla Miembros que se nos especifico, que el atributo "idt", tiene la restriccion de almacenar cadenas de tipo cc o ce o NT. Al no hacer  ser una  integridad de tipos a�n, el valor ' CD' sigue siendo aceptadado, ya que es de tipo cadena y de lonigtud 2.

--INSERT INTO Puntos VALUES ('08', 5 , 'PMonterrey', 'W', 40.55, -345, 'VCAL100');
--Dado la tabla Puntos que se nos especifico, que el atributo "timepoLimite", tiene la restriccion tiene de ser un numero positivo. Al no hacer  ser una  integridad de tipos a�n, el valor '-345' sigue siendo aceptadado, ya que es de tipo numerico positivo.



/*F.Construcci�n: nuevamente poblando*/


--1Punto)
/* Casos que nos exigen ingresar a la base de datos */

INSERT  INTO Miembros  VALUES( 12348,'CC', 5465798431, 'COLOMBIA','sergio100@gmail.com'  );
INSERT  INTO Miembros  VALUES( 13246,'CC', 1231321545, 'COLOMBIA','juan100@gmail.com'  );

INSERT  INTO Personas   VALUES( 12348,'Tin Tin' );
INSERT  INTO Personas   VALUES( 13246,'Tovar' );

INSERT  INTO Ciclistas   VALUES( 12348,TO_DATE('9/05/1980','MM/DD/YYYY'),4);
INSERT  INTO Ciclistas   VALUES( 13246,TO_DATE('2/05/1980','MM/DD/YYYY'),4);

INSERT INTO Carreras VALUES ('COLAS','LaRutaSabana','COLOMBIA', 5,'ANUAL');

INSERT INTO Versiones VALUES( '19COL','ed18C',TO_DATE('05/04/2019','MM/DD/YYYY'), 'COLAS' );
INSERT INTO Versiones VALUES( '18COL','ed19C',TO_DATE('05/04/2018','MM/DD/YYYY'), 'COLAS' );

INSERT INTO PARTICIPA VALUES( 12348,'19COL');
INSERT INTO PARTICIPA VALUES( 13246,'18COL');

INSERT INTO Puntos VALUES( 01, 18,'P-Herrera', 'M', 20.52, 50, 'COLAS');
INSERT INTO Puntos VALUES( 02, 30,'P-Lopez', 'H', 40.52, 50, 'COLAS');
INSERT INTO Puntos VALUES( 03, 45,'P-Bolivar', 'A', 62.52, 50, 'COLAS');
INSERT INTO Puntos VALUES( 04, 70,'P-Cordoba', 'L', 80.52, 50, 'COLAS');


INSERT INTO Segmentos VALUES('Sisga', 'C','19COL',01,02 ) ;
INSERT INTO Segmentos VALUES('LaCuchilla', 'C','18COL',03,04 ) ;


--2Punto)


INSERT INTO Miembros VALUES (49344, 'CC', 5563059964, 'YEMEN', 'wcoar0@pagespersoorange.fr');
INSERT INTO Miembros VALUES (82655, 'CE', 9458647735, 'BRAZIL', 'eloache1@state.txus');
INSERT INTO Miembros VALUES (41095, 'CC', 4494319045, 'POLAND', 'lmcllster2@cornell.edu');
INSERT INTO Miembros VALUES (48633, 'NT', 3699399827, 'NEW ZEALAND', 'jnomavill3@wikimedia.org');
INSERT INTO Miembros VALUES (11242, 'CC', 3464292340, 'CHINA', 'ggiersleeve4@google.com');
INSERT INTO Miembros VALUES (40541, 'CE', 2688716815, 'RUSSIA', 'fukx5@oakley.com');
INSERT INTO Miembros VALUES (17728, 'NT', 6755108454, 'CHINA', 'ndibs6@freewebs.com');
INSERT INTO Miembros VALUES (35697, 'NT', 1357505426, 'BELARUS', 'cbernucci7@si.edu');
INSERT INTO Miembros VALUES (53891, 'CE', 4521156994, 'FRANCE', 'rsiggs8@nymag.com');
INSERT INTO Miembros VALUES (23281, 'CC', 4689602020, 'PERU', 'jlurti9@vistaprint.com');
INSERT INTO Miembros VALUES (12345, 'CC', 4454654654, 'PERU', 'dfdfdf9@vistaprint.com');

INSERT INTO Personas VALUES (49344,'Royall Theze' );
INSERT INTO Personas VALUES (82655, 'Zeke Carriage');
INSERT INTO Personas VALUES (41095, 'Myron Maruska');
INSERT INTO Personas VALUES (23281,  'Kiley Ciottoi');
INSERT INTO Personas VALUES (11242, 'Bartolomeo Morican');
INSERT INTO Personas VALUES (40541, 'Anselma Birrel');
INSERT INTO Personas VALUES (53891, 'Flynn Dunridge');
INSERT INTO Personas VALUES (12345, 'Pepe Torres');

INSERT INTO Ciclistas VALUES ( 23281,TO_DATE('08/30/2020','MM/DD/YYYY'), 3);
INSERT INTO Ciclistas VALUES ( 41095,TO_DATE('01/10/2020','MM/DD/YYYY'), 5);
INSERT INTO Ciclistas VALUES ( 82655,TO_DATE('10/14/2019','MM/DD/YYYY'), 3);
INSERT INTO Ciclistas VALUES ( 49344,TO_DATE('10/14/2022','MM/DD/YYYY'), 4);
INSERT INTO Ciclistas VALUES ( 12345,TO_DATE('08/30/2020','MM/DD/YYYY'), 3);

INSERT INTO  Empresas VALUES (48633,'Yodel',11242);
INSERT INTO  Empresas VALUES (17728,'Eire',53891);
INSERT INTO  Empresas VALUES (35697,'Zooveo',40541);


INSERT INTO Carreras VALUES ( 'RUSMTB','Raid MTB','RUSSIA',5,'ANUAL');
INSERT INTO Carreras VALUES ( 'PERBR',' Colombia Bike Race','PERU',4,'ANUAL');
INSERT INTO Carreras VALUES ( 'POLAT','Attack Nepal','POLAND',3,'ANUAL');
INSERT INTO Carreras VALUES ( 'YEMCR','Challenge Race','YEMEN',3,'ANUAL');
INSERT INTO Carreras VALUES ('BRRC',' conquistadores','BRAZIL',4,'ANUAL');
INSERT INTO Carreras VALUES ('BRBA','Bike Adventure ','BRAZIL',5,'ANUAL');
INSERT INTO Carreras VALUES ('FRIB','Iron Bike','FRANCE',4,'ANUAL');
INSERT INTO Carreras VALUES ('FRGB','Gold Bike','FRANCE',2,'ANUAL');

INSERT INTO Versiones VALUES ('18RUS','V18Ru',TO_DATE('04/21/2018','MM/DD/YYYY'),'RUSMTB');
INSERT INTO Versiones VALUES('19RUS','V19Ru',TO_DATE('04/11/2019','MM/DD/YYYY'),'RUSMTB');
INSERT INTO Versiones VALUES('18BRZ','V18Br',TO_DATE('04/14/2018','MM/DD/YYYY'),'BRBA');
INSERT INTO Versiones VALUES('19BRZ','V19Br',TO_DATE('04/21/2019','MM/DD/YYYY'),'BRBA');
INSERT INTO Versiones VALUES('19FRA','V19FR',TO_DATE('04/21/2019','MM/DD/YYYY'),'FRIB');
INSERT INTO Versiones VALUES('18FRA','V18FR',TO_DATE('04/21/2018','MM/DD/YYYY'),'FRIB');


INSERT INTO PropiedadDe VALUES(48633,'FRIB',55.22);
INSERT INTO PropiedadDe VALUES(17728,'YEMCR',13.66);
INSERT INTO PropiedadDe VALUES(35697,'POLAT',26.32);
INSERT INTO PropiedadDe VALUES(17728,'BRRC',21.12);



INSERT INTO  Puntos VALUES (05, 5,'Starlix', 'A', 22.2, 50,'FRIB');
INSERT INTO  Puntos VALUES  (06, 84,'Wild Oat', 'M', 32.88, 60,'BRBA');
INSERT INTO  Puntos VALUES (07,14,'Bitartrate', 'A', 18.47, 40,'BRBA');
INSERT INTO  Puntos VALUES  (08,58,'Hydrochlor', 'C', 78.89, 120,'BRBA');
INSERT INTO  Puntos VALUES (09,69,'ORCHID', 'C', 97.84, 150,'FRIB');
INSERT INTO Puntos VALUES (10,15,'Samphone','H',10.55,15,'RUSMTB');
INSERT INTO Puntos VALUES (11,90,'Huaperia','L',100.10,150,'RUSMTB');


INSERT INTO Segmentos VALUES( 'RetoMont','M','18FRA',05,09);
INSERT INTO Segmentos VALUES( 'Carrera','C','18BRZ',07,08);
INSERT INTO Segmentos VALUES( 'RutaMont','M','19BRZ',08,06);
INSERT INTO Segmentos VALUES( 'Monta�asAl','M','19RUS',10,11);

INSERT INTO Participa VALUES( 23281,'19BRZ');
INSERT INTO Participa VALUES( 23281,'18BRZ');
INSERT INTO Participa VALUES( 41095,'18BRZ');
INSERT INTO Participa VALUES(82655, '18FRA');
INSERT INTO Participa VALUES(41095, '18FRA');
INSERT INTO Participa VALUES(12345, '18BRZ');
INSERT INTO Participa VALUES(12345, '19RUS');
INSERT INTO Participa VALUES(23281, '19RUS');


INSERT INTO EsOrganizador VALUES( 48633,'19BRZ');
INSERT INTO EsOrganizador VALUES( 17728,'18BRZ');
INSERT INTO EsOrganizador VALUES(35697, '19FRA');


INSERT INTO Registros VALUES( 01, 'carrera muy exigente', TO_DATE('05/05/2019','MM/DD/YYYY'), 50, 154,

'<?xml version="1.0"?>
<Revison>
   <Secciones>
       <Sduras
              kilometroInicial = "4" 
              velocidadPromedio = "45"
              velocidadMaxima = "80"
              pulsacionesPromedio = "120"
              potenciaPromedio = "58"
               ></Sduras>
 
       <Sfaciles
        
              kilometroInicial = "60"
              velocidadPromedio = "78"
              velocidadMaxima = "58"
              pulsacionesPromedio = "65"
              potenciaPromedio = "45"
                 ></Sfaciles>
       <Sdescenso
              kilometroInicial = "85"
              velocidadPromedio = "40"
              velocidadMaxima = "80"
              pulsacionesPromedio = "65"
              potenciaPromedio = "50"
                  ></Sdescenso>
  </Secciones>
</Revison>' ,'A','Sisga',12348 ) ;
INSERT INTO Registros VALUES( 02, 'carrera recomendada', TO_DATE('10/05/2018','MM/DD/YYYY'), 60, 2,
'<?xml version="1.0"?>
<Revison>
   <Secciones>
       <Sduras
              kilometroInicial = "7" 
              velocidadPromedio = "60"
              velocidadMaxima = "90"
              pulsacionesPromedio = "130"
              potenciaPromedio = "59"
               ></Sduras>
 
       <Sfaciles
        
              kilometroInicial = "20"
              velocidadPromedio = "50"
              velocidadMaxima = "80"
              pulsacionesPromedio = "25"
              potenciaPromedio = "55"
                 ></Sfaciles>
       <Sdescenso
              kilometroInicial = "85"
              velocidadPromedio = "70"
              velocidadMaxima = "100"
              pulsacionesPromedio = "65"
              potenciaPromedio = "50"
                  ></Sdescenso>
  </Secciones>
</Revison>','A','LaCuchilla',13246 ) ;

INSERT INTO Registros VALUES(03,'mala carrera',TO_DATE('05/26/2019','MM/DD/YYYY'),120,5,
'<?xml version="1.0"?>
<Revison>
   <Secciones>
       <Sduras
              kilometroInicial = "5" 
              velocidadPromedio = "25"
              velocidadMaxima = "90"
              pulsacionesPromedio = "122"
              potenciaPromedio = "58"
               ></Sduras>
 
       <Sfaciles
        
              kilometroInicial = "40"
              velocidadPromedio = "78"
              velocidadMaxima = "58"
              pulsacionesPromedio = "65"
              potenciaPromedio = "45"
                 ></Sfaciles>
  </Secciones>
</Revison>','A','RutaMont',23281);

INSERT INTO Registros VALUES(04,'Durisima',TO_DATE('05/26/2018','MM/DD/YYYY'),170,8,NULL,'A','Carrera',41095);
INSERT INTO Registros VALUES(05,NULL,TO_DATE('03/14/2018','MM/DD/YYYY'),50,3,NULL,'A','RetoMont',82655);


INSERT INTO Fotos VALUES (1,'www.fotopprimerorredor.gif',01);
INSERT INTO Fotos VALUES (2,'www.fotossegundocorredor.gif',02);

/* E. Construcci�n : consultando */

--CICLO 1: <Consultar segmentos de monta�a con secciones de descenso>
--CICLO 1: <Consultar los ciclistas que terminaron un segmento mayor a 70 km >
--CICLO 1: <Consultar los cinco segmentos con tiempos mas cortos>

/*SELECT Versiones.nombre, Personas.nombres, Posiciones,tiempo FROM Segmentos, Registros,Ciclistas, Personas
WHERE idMiembro = idPersona AND idCiclista = idPersona AND nomSegmento = nombre AND Registros.coVersion = versiones.coVersiones 
ORDER BY tiempo ASC 
LIMIT 5;*/


--CICLO 1: <Consultar los segmentos mas recorridos de tipo puerto monta�a>
--CICLO 1: <Consultar puntos de una carrera>

/*Lab 04*/
/* Acciones*/
ALTER TABLE PropiedadDe DROP CONSTRAINT FK_PropiedadDe_idMiembro;
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PropiedadDe_idMiembro FOREIGN KEY( idMiembro ) REFERENCES Miembros( id_ )ON DELETE CASCADE ; 

ALTER TABLE PropiedadDe DROP CONSTRAINT FK_PropiedadDe_coCarrera;
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PropiedadDe_coCarrera FOREIGN KEY( coCarrera ) REFERENCES Carreras( codigo )ON DELETE CASCADE ;


ALTER TABLE Puntos DROP CONSTRAINT FK_Puntos_coCarrera;
ALTER TABLE Puntos ADD CONSTRAINT FK_Puntos_coCarrera FOREIGN KEY ( coCarrera ) REFERENCES Carreras ( codigo )ON DELETE CASCADE;

ALTER TABLE Fotos DROP CONSTRAINT FK_Fotos_noRegistro;
ALTER TABLE Fotos ADD CONSTRAINT FK_Fotos_noRegistro FOREIGN KEY( noRegistro ) REFERENCES Registros( numero )ON DELETE CASCADE;

ALTER TABLE Participa DROP CONSTRAINT FK_Participa_idCiclista;
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_idCiclista FOREIGN KEY ( idCiclista ) REFERENCES Ciclistas ( idPersona )ON DELETE CASCADE ;

ALTER TABLE Participa DROP CONSTRAINT FK_Participa_coVersion;
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_coVersion FOREIGN KEY ( coVersion ) REFERENCES Versiones ( coVersion )ON DELETE CASCADE;

ALTER TABLE Empresas DROP CONSTRAINT FK_Empresas_idRepresentante;
ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_idRepresentante FOREIGN KEY ( idRepresentante ) REFERENCES Personas ( idMiembro )ON DELETE CASCADE;

ALTER TABLE Empresas DROP CONSTRAINT FK_Empresas_idMiembro;
ALTER TABLE Empresas ADD CONSTRAINT FK_Empresas_idMiembro FOREIGN KEY ( idMiembro ) REFERENCES Miembros ( id_ )ON DELETE CASCADE;

ALTER TABLE EsOrganizador DROP CONSTRAINT FK_EsOrganizador_idEmpresa;
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_EsOrganizador_idEmpresa FOREIGN KEY ( idEmpresa ) REFERENCES Empresas ( idMiembro )ON DELETE CASCADE;

ALTER TABLE EsOrganizador DROP CONSTRAINT FK_EsOrganizador_coVersion;
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_EsOrganizador_coVersion FOREIGN KEY ( coVersion ) REFERENCES Versiones ( coVersion )ON DELETE CASCADE;

ALTER TABLE Ciclistas DROP CONSTRAINT FK_Ciclistas_;
ALTER TABLE Ciclistas ADD CONSTRAINT FK_Ciclistas_ FOREIGN KEY ( idPersona ) REFERENCES Personas ( idMiembro )ON DELETE CASCADE;

ALTER TABLE Personas DROP CONSTRAINT FK_Personas_;
ALTER TABLE Personas ADD CONSTRAINT FK_Personas_ FOREIGN KEY ( idMiembro ) REFERENCES Miembros ( id_ )ON DELETE CASCADE; 


/*El n�mero y la fecha se asignan autom�ticamente*/

CREATE OR REPLACE TRIGGER Ad_Registros_numero_fecha
BEFORE INSERT ON Registros
FOR EACH ROW 
DECLARE 
cont NUMBER;
BEGIN
  SELECT COALESCE( MAX( numero ), 0)+ 1 INTO cont FROM Registros;
  IF  :new.numero IS NULL AND :new.fecha IS NULL 
    THEN :new.numero := cont;
         :new.fecha := SYSDATE;  
         
  ELSIF  :new.numero IS NULL
    THEN :new.numero := cont;
    
  ELSIF :new.fecha IS NULL
    THEN :new.fecha := SYSDATE;
  END IF;
END;
/

/*DisparadoresNoOK
No hay casos de error */

/*Solo se pueden registrar resultados de ciclistas que hayan participado en la version de la carrera a la que pertenece el segmento.*/

CREATE OR REPLACE TRIGGER Ad_Registros_nomSegmento
BEFORE INSERT ON Registros
FOR EACH ROW
DECLARE 
C_S VARCHAR(10);
C_V VARCHAR(10);
BEGIN
    SELECT coVersion INTO C_S
      FROM Registros INNER JOIN  Segmentos 
       ON nombre = nomSegmento
    WHERE :new.nomSegmento = nomSegmento;  
    
   SELECT COUNT( co ) INTO C_V 
      FROM Registros,( SELECT idCiclista AS id_,coVersion AS co FROM Participa) 
      WHERE  idCiclista = id_ AND :new.idCiclista  = id_  AND C_S = co ; 
   
   IF  C_V = 0
   THEN RAISE_APPLICATION_ERROR(-20006, 'El nombre del segmento no existe la version ');
  END IF;
END ;
/

/*DisparadoresNoOK
se ingresa un segmento el cual su codigo asociado NO concuerda con los codigos  de las carreras realizadas por el ciclista
INSERT INTO Registros(numero,comentario,fecha, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista )  VALUES(09,NULL ,TO_DATE('05/04/2018','MM/DD/YYYY'),40,1,'HTY','A','RutaMont',12345);
*/


CREATE SEQUENCE AD_MI
START WITH 1
INCREMENT BY 1
MINVALUE  1
MAXVALUE 99999;


CREATE OR REPLACE TRIGGER Ad_no
    BEFORE INSERT 
	ON Miembros 
    FOR EACH ROW
BEGIN
    IF :new.id_ IS NULL 
	    THEN :new.id_ := AD_MI.NEXTVAL;
    END IF;	
END;

/


/*Un ciclista solo puede tener un �nico registro en un segmento*/

CREATE OR REPLACE TRIGGER Ad_Registros_nomSegmento
BEFORE INSERT ON Registros
FOR EACH ROW 
DECLARE
cont NUMBER;
BEGIN 
  SELECT COUNT( * ) INTO cont 
   FROM Registros 
  WHERE :new.idCiclista = idCiclista AND
        :new.nomSegmento = nomSegmento;
  IF cont = 1 
    THEN RAISE_APPLICATION_ERROR(-20006, 'solo puede tener un �nico registro en un segmento');
  END IF;
END;
/


/*
DisparadoresNoOK
se ingresa diferente informacion sobre un segmento ya existente de un mismo ciclista
INSERT INTO Registros  (numero,comentario,fecha, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista ) VALUES (10,NULL ,TO_DATE('02/07/2018','MM/DD/YYYY'),70,10,'HTY','A','Carrera',12345);
*/

/*No pueden quedar dos ciclistas con la misma posici�n.*/

CREATE  OR REPLACE TRIGGER  Ad_Registros_posicion
BEFORE INSERT ON Registros 
FOR EACH ROW
DECLARE 
cont NUMBER;
BEGIN 
 SELECT COUNT( * ) INTO cont FROM Registros
    WHERE :new.posicion = posicion  AND 
          :new.nomSegmento = nomSegmento; 
 IF cont = 1 
   THEN RAISE_APPLICATION_ERROR( -20007,'Dos Ciclistas no pueden quedar en la misma posicion.');
 END IF;
END;
/


/*DisparadoresNoOK

se ingresan dos ciclistas con la misma posicion pertenecientes al mismo segmento 
INSERT INTO Registros  (numero,comentario,fecha, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista ) VALUES (11,NULL ,TO_DATE('05/02/2019','MM/DD/YYYY'),120,1,'HTY','A','Monta�asAl',23281);
*/

/*Modificacion */

CREATE OR REPLACE TRIGGER verifyPais
   BEFORE INSERT 
   ON Miembros 
   FOR EACH ROW 
BEGIN
   IF :new.pais IS NOT NULL THEN
      :new.pais  := UPPER( :new.pais );
   END IF;
END;
/

/*Los datos a modificar son la revisi�n, las fotos y el comentario.*/

CREATE OR REPLACE TRIGGER Md_Registros
BEFORE UPDATE ON Registros
FOR EACH ROW
BEGIN
 IF :new.numero <> :old.numero OR
    :new.fecha <> :old.fecha  OR
    :old.tiempo <> :new.tiempo OR
    :old.posicion <> :new.posicion OR
    :old.dificultad <> :new.dificultad OR
    :old.nomSegmento <> :new.nomSegmento OR
    :old.idCiclista <> :new.idCiclista 
  THEN RAISE_APPLICATION_ERROR(-20005,'Unicamente se pueden modificar los datos revisi�n y el comentario. ');
 END IF;
END;
/


/*DisparadoresNoOK
no se debe actualizar la posicion solamente se puede el comentario y la revision 

UPDATE Registros 
  SET  numero = 01, comentario = 'Deben  hacerla', fecha= TO_DATE('05/05/2019','MM/DD/YYYY'),tiempo = 50,posicion =100, revision = 'g', dificultad = 'A',nomSegmento = 'Sisga', idCiclista = 12348 
WHERE numero = 1 ;
*/


/*Los datos a modificar son la revisi�n, las fotos y el comentario.*/
CREATE OR REPLACE TRIGGER Md_fotos
BEFORE UPDATE ON Fotos
FOR EACH ROW
BEGIN
IF :new.noRegistro <> :old.noRegistro OR
   :new.noFoto <> :old.noFoto
   THEN RAISE_APPLICATION_ERROR(-20005,'Unicamente se puede modificar el dato foto  ');
 END IF;
END;
/


/*DisparadoresNoOK
no se debe actualizarel noRegistro solamente se puede el comentario

UPDATE fotos 
  SET  noFoto  = 1 ,foto ='www.actualizacionFoto.gif' , noRegistro = 05
WHERE noFoto = 1 ;*/

/*Eliminaci�n*/

/*S�lo es posible eliminar un registro si no ha pasado mas de un dia desde que se creo.*/
CREATE OR REPLACE TRIGGER El_Registros 
BEFORE DELETE  ON Registros
FOR EACH ROW 
DECLARE
BEGIN 
 IF  SYSDATE < :old.fecha + 1
   THEN RAISE_APPLICATION_ERROR(-20005,'Solo se puede modificar la fecha cuando pase mas de un dia de su creacion');
 END IF;
END;
/

/*Mantener carrera*/
/*Puntos*/

/*Adicion */

/*El orden se debe generar autom�ticamente 1..*/

CREATE OR REPLACE TRIGGER Ad_Puntos_orden
BEFORE INSERT ON Puntos
FOR EACH ROW
DECLARE 
cont NUMBER;
BEGIN
   SELECT COALESCE(MAX( orden ), 1) INTO cont FROM Puntos
          WHERE coCarrera = :new.coCarrera;
   IF :new.orden  IS NULL 
     THEN :new.orden := cont; 
   END IF;
END;
/


/*DisparadoresNoOK*/
/* no hay forma de generar error*/


/*El nombre del punto no se debe repetir dentro de una carrera*/
CREATE OR REPLACE TRIGGER Ad_Puntos
BEFORE INSERT ON Puntos
FOR EACH ROW 
DECLARE 
cont NUMBER;
BEGIN 
  SELECT COUNT(nombre) INTO cont FROM Puntos
    WHERE coCarrera = :new.coCarrera AND nombre = :new.nombre;
  IF cont >= 1
  THEN RAISE_APPLICATION_ERROR(-20003,'El nombre del punto no se debe repetir dentro de una carrera');
  
  END IF;
  
END;
/


/*DisparadoresNoOK*/

/*INSERT INTO Puntos(coPunto,orden,nombre,tipo,distancia,tiempolimite,coCarrera) VALUES (14,20,'Adidas','L',35.45,60,'COLAS');*/

/*S�lo debe existir un punto de partida y un punto de llegada. */


CREATE OR REPLACE TRIGGER  Ad_Puntos_L
BEFORE INSERT ON Puntos
FOR EACH ROW
DECLARE 
cPartida NUMBER;
cLLegada NUMBER;
BEGIN
  SELECT COUNT( tipo ) INTO cPartida 
    FROM Puntos 
  WHERE coCarrera = :new.coCarrera AND
        :new.tipo = 'P';
  
  SELECT COUNT( tipo ) INTO cLLegada 
    FROM Puntos 
  WHERE coCarrera = :new.coCarrera AND
        :new.tipo = 'L';
  
  IF  (cPartida = 1  )OR ( cLLegada = 1 )
    THEN  RAISE_APPLICATION_ERROR(-20009,' Solo puede existir un punto inicio y un punto final para una carrera');
  END IF;
END;
/


/*DisparadoresNoOK*/
/*INSERT INTO Puntos(coPunto,orden,nombre,tipo,distancia,tiempolimite,coCarrera) VALUES (14,20,'under','L',35.45,60,'COLAS');*/

/* Si no se dice el tipo del punto se asume que es meta volante a no ser que sea el primer punto que es el de partida*/
CREATE OR REPLACE TRIGGER Ad_Puntos_meta
BEFORE INSERT ON Puntos
FOR EACH ROW
DECLARE 
cont NUMBER;
BEGIN
  SELECT COUNT (*) INTO cont FROM Puntos
    WHERE :new.coCarrera = coCarrera;
  IF cont  = 0
    THEN :new.tipo := 'P';
 ELSIF :new.tipo IS NULL
    THEN :new.tipo := 'V';
  END IF;
END;
/

/*DisparadoresNoOK*/
/*NO SE PUEDE PONER UN ERROR*/

/*Tuplas Ok*/



 /*Tuplas NOk*/

/* Si no se conoce la duraci�n m�xima se asume una velocidad de 60 km/hora*/

CREATE OR REPLACE TRIGGER Ad_Puntos_tiempoLimite
BEFORE INSERT ON Puntos 
FOR EACH ROW

BEGIN
  IF :new.tiempoLimite IS NULL AND :new.distancia IS NOT NULL
    THEN 
      :new.tiempoLimite := :new.distancia /60 ;
  END IF;
END;
/


/* modificar */
/*-Los �nicos datos que se pueden modificar son el tipo y la duraci�n
.-no se puede modificar el tipo de
partida 
-s�lo puede existir un punto de llegada*/
CREATE OR REPLACE TRIGGER Mo_Puntos
BEFORE UPDATE ON Puntos 
FOR EACH ROW 
DECLARE 
cont NUMBER;
BEGIN 
  SELECT COUNT( tipo ) 
    INTO  cont FROM Puntos 
  WHERE coPunto = :new.coPunto AND
        coCarrera = :new.coCarrera AND
        tipo = 'L';
  IF :new.coPunto  <> :old.coPunto OR 
     :new.orden  <> :old.orden OR 
     :new.nombre <> :old.nombre OR
     :new.distancia <> :old.distancia OR
     :new.coCarrera <> :old.coCarrera 
    THEN RAISE_APPLICATION_ERROR(-20004,'Los �nicos datos que se pueden modificar son el tipo y la duraci�n');
  ELSIF :old.tipo = 'P'
    THEN RAISE_APPLICATION_ERROR(-20009,'no se puede modificar un punto con tipo de partida ');
  ELSIF cont >= 1
    THEN RAISE_APPLICATION_ERROR(-20010,'s�lo puede existir un punto de llegada');
  END IF;
END;

/
/* eliminar */


/*Los puntos no se pueden eliminar*/
CREATE OR REPLACE TRIGGER  El_Puntos
BEFORE DELETE  ON Puntos
FOR EACH ROW 
DECLARE 
cont NUMBER;
BEGIN 
  RAISE_APPLICATION_ERROR(-20009,'no se puede eliminar un punto ');
END;
/


/*Carreras*/

/*Insertar*/

/* si no se inserta el codigo de la carrera , que se seleccione las primero 5 letras del nombre y lo asigne */

CREATE OR REPLACE TRIGGER Ad_Carreras_cod
BEFORE INSERT ON Carreras  
FOR EACH ROW
BEGIN
 IF :new.codigo IS NULL 
  THEN :new.codigo := SUBSTR( :new.nombre ,0,5) ;
 END IF;
END;
/

/* Modificar */
/*unicamente se puede modificar los datos periodicidad y categoria */

CREATE OR REPLACE TRIGGER Mo_Carreras
BEFORE UPDATE ON Carreras  
FOR EACH ROW
BEGIN
 IF :old.codigo <> :new.codigo OR 
    :old.nombre <> :new.nombre OR
    :old.pais <> :new.pais 
  THEN RAISE_APPLICATION_ERROR(-20011,'unicamente se puede modificar los datos periodicidad y categoria');
 END IF;
END;
/



/* Adicionar */
/*Generar el codigo de la version , concatenado 19 Con letras 3 primeras del nombre de la carrera  */
CREATE OR REPLACE TRIGGER Ad_Versiones
BEFORE INSERT ON Versiones 
FOR EACH ROW
DECLARE 
nu CHAR( 2 );
nom CHAR( 3 );
BEGIN 

 SELECT SUBSTR(:new.nombre ,0,3) INTO nom
   FROM Versiones;
 IF :new.coVersion IS NULL 
  THEN :new.coVersion := CONCAT('19' ,nom) ;
 END IF;
END;
/
/*Segmentos*/
/*Modificar*/
CREATE OR REPLACE TRIGGER Mo_Segmentos_nombre
BEFORE UPDATE ON Segmentos
FOR EACH ROW 
BEGIN 
  IF :new.tipo = :old.tipo OR 
     :new.coVersion = :old.coVersion OR 
     :new.coPuntoinicio = :old.coPuntoinicio OR 
     :new.coPuntoFinal = :old.coPuntoFinal
     
    THEN RAISE_APPLICATION_ERROR(-20006,'solo se puede modificar el dato nombre de la tabla de segmento');
  END IF ;
END;
/



