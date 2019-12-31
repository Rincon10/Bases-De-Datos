/*Fabi�n Mauricio Ram�rez Pinto
Iv�n Camilo Rinc�n Saavedra
*/


DROP TABLE musician;


/* Definiendo y poblando*/	

/*
1)Modifique la creaci�n de las tablas considerando este nuevo atributo*/

CREATE TABLE musician(
    m_no NUMBER( 11 ) NOT NULL ,
	m_name VARCHAR( 20 ) ,
	born DATE ,
	died DATE ,
	born_in NUMBER( 11 ) ,
	living_in NUMBER( 11 ) ,
	detalle XMLTYPE
);


ALTER TABLE musician 
    ADD CONSTRAINT Pk_musician PRIMARY KEY( m_no );



/*2)
Modifique las instrucciones para poblar la tabla considerando esta informaci�n*/
INSERT INTO musician 
    VALUES (1,'Fred Bloggs',TO_DATE('1948-01-02','YYYY-MM-DD'),NULL, 1,2,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/FredBloggsOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
          nombre = "Mercury"  
	      razon = "JBloggs">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Universal Music Group">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfon�a 1"
	       a�o = "1799">
	   </disco>
	   <disco
	       nombre  = "Sinfon�a 10"
	       a�o = "1810">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre = "World Music"
          a�o = "1812">
	   </premio>
       <premio
	      nombre =  "Heat Latin Music Awards? "
          a�o = "1812">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Jacobs School of Music"
		   a�oInicio = "1770"
		   a�oFin = "1775"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Amos Roddan">
	   </hijo>
	   
	   <hijo
	       nombre = "Gusta Egarr">
	   </hijo>
	</hijos>
   
</detalle>
'
);	
		
INSERT INTO musician 
    VALUES (2,'John Smith',TO_DATE('1950-03-03','YYYY-MM-DD'),NULL, 3,4,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/JohnSmithOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "arthur"  
	      razon = "JSmith">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Universal Music Group">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfon�a 25"
	       a�o = "1990">
	   </disco>
	   <disco
	       nombre  = "Sinfon�a 30"
	       a�o = "2000">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre = "World Music"
          a�o = "1812">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Yale School of Music"
		   a�oInicio = "1770"
		   a�oFin = "1775"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Amos Roddan">
	   </hijo>
	   
	   <hijo
	       nombre = "Gusta Egarr">
	   </hijo>
	</hijos>
   
</detalle>
'
);	
	
INSERT INTO musician 
    VALUES (3,'Helen Smyth',TO_DATE('1948-08-08','YYYY-MM-DD'),NULL, 4,5,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/HelenSmythOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	       nombre = "Melany"  
	       razon = "MSmyth">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Warner Music Group">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfon�a 6"
	       a�o = "1885">
	   </disco>
	   <disco
	       nombre  = "Sinfon�a  8"
	       a�o = "1900">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "Heat Latin Music Awards? "
          a�o = "1930">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Curtis Institute of Music"
		   a�oInicio = "1860"
		   a�oFin = "1870"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Lothaire Kluger">
	   </hijo>
	   
	   <hijo
	       nombre = "Darrin Kiddie">
	   </hijo>
	</hijos>
</detalle>
'
);		
INSERT INTO musician
    VALUES (4,'Harriet Smithson',TO_DATE('1909-05-09','YYYY-MM-DD'),TO_DATE('1980-09-20','YYYY-MM-DD'), 5,6,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/HarrietSmithsonOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Robert"  
	      razon = "RHsmithson">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "YG Entertainment">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Trilogia"
	       a�o = "1950">
	   </disco>
	   <disco
	       nombre  = "Le Diable"
	       a�o = "1970">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "Grammy Latinos "
          a�o = "1980">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Berklee School of Music"
		   a�oInicio = "1900"
		   a�oFin = "1905"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Trenna McBain">
	   </hijo>
	   
	   <hijo
	       nombre = "Laurette Bearblock">
	   </hijo>
	</hijos>
</detalle>
'
);		
INSERT INTO musician 
    VALUES (5,'James First',TO_DATE('1965-06-10','YYYY-MM-DD'),NULL, 7,7,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/JamesFirstOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Jacinto"  
	      razon = "JJFirst">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Epic Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Conciertos de Brandenburgo"
	       a�o = "1721">
	   </disco>
	   <disco
	       nombre  = "Sonata para piano 14"
	       a�o = "1770">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre = "Premio Grammy "
          a�o = "1810">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Yale School of Music"
		   a�oInicio = "1760"
		   a�oFin = "1765"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Francesco Cozens">
	   </hijo>
	   
	   <hijo
	       nombre = "Quinton Buttery">
	   </hijo>
	</hijos>
   
</detalle>
'
);	
    
    
    

INSERT INTO musician 
    VALUES (6,'Theo Mengel',TO_DATE('1948-08-12','YYYY-MM-DD'),NULL, 7,1,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/TheoMengelOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "jefferson"  
	      razon = "TJmengel">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Epic Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfon�a 5 en Do menor"
	       a�o = "1800">
	   </disco>
	   <disco
	       nombre  = "Sinfon�a n�mero 9 Coral en Re menor"
	       a�o = "1820">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "MTV Video Music Awards"
          a�o = "1850">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "University of Hartford"
		   a�oInicio = "1820"
		   a�oFin = "1825"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Cassy Danbye">
	   </hijo>
	   
	   <hijo
	       nombre = "Eadmund Domanek">
	   </hijo>
	</hijos>
</detalle>
'
);		

	
INSERT INTO musician 
    VALUES (7,'Sue Little',TO_DATE('1945-02-21','YYYY-MM-DD'),NULL, 8,9,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/SueLittleOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Caroline"  
	      razon = "SLCaroline">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Sony Music Entertainment US Latin LLC">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Don Carlo"
	       a�o = "1980">
	   </disco>
	   <disco
	       nombre  = "Sonatas y Impromptus"
	       a�o = "1990">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "American Music Awards"
          a�o = "2000">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Yale School of Music"
		   a�oInicio = "1970"
		   a�oFin = "1975"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Allina Bosch">
	   </hijo>
	   
	   <hijo
	       nombre = "Shayne Ecclesall">
	   </hijo>
	</hijos>
</detalle>
'
);

INSERT INTO musician 
    VALUES (8,'Harry Forte',TO_DATE('1951-02-28','YYYY-MM-DD'),NULL, 1,8,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/HarryForteOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "josepth"  
	      razon = "JHForte">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Palenque Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Concierto para Viol�n en Re mayor"
	       a�o = "1878">
	   </disco>
	   <disco
	       nombre  = "Sinfon�a 9 del Nuevo Mundo en mi menor"
	       a�o = "1885">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  " Teen Choice Awards "
          a�o = "1890">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "The Univeristy of New Orleans"
		   a�oInicio = "1840"
		   a�oFin = "1845"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Sax Forman">
	   </hijo>
	   
	   <hijo
	       nombre = "Ruthie Stede">
	   </hijo>
	</hijos>
</detalle>
'
);		

	
INSERT INTO musician 
    VALUES (9,'Phil Hot',TO_DATE('1942-06-30','YYYY-MM-DD'),NULL, 2,7,

'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/PhilHotOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Andrew"  
	      razon = "PAHot">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "DEL Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Rossini�Otello"
	       a�o = "1860">
	   </disco>
	   <disco
	       nombre  = "Misas para �rgano"
	       a�o = "1870">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  " Billboard Music Award "
          a�o = "1890">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Virginia Tech"
		   a�oInicio = "1850"
		   a�oFin = "1860"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Mendy Reap">
	   </hijo>
	   
	   <hijo
	       nombre = "Marlo Pritchett">
	   </hijo>
	</hijos>
</detalle>
'
);		
/*B. Consultando*/
/*1)
 Los otros nombres de un m�sico*/

SELECT 
     m_no,
     m_name,
     EXTRACT(detalle,'//otroNombre/@nombre') AS OtroNombre
FROM musician;
/*2)
Los m�sicos de un sello espec�fico
*/

SELECT 
      m_name ,
      sello
FROM musician M,
     XMLTABLE('//sello'
                passing M.detalle
                columns sello VARCHAR( 10 ) PATH '@nombre'  ) 
ORDER BY sello,m_name ;

/*3)
El m�sico m�s premiado en un a�o espec�fico*/

CREATE VIEW a�os
 AS 
SELECT 
     m_name T1,
     premio,
     a�o
FROM 
    musician M, 
    XMLTABLE('//premio'
            passing M.detalle 
            columns 
               premio VARCHAR( 10 ) PATH '@nombre',
               a�o NUMBER PATH '@a�o'
            ) ;
SELECT m_name,premio,a�o
    FROM musician INNER JOIN a�os ON T1 = m_name
;

DROP VIEW a�os;

/*4)
Los discos de un a�o dado*/

SELECT 
     disco_,
     a�o
FROM musician, 
     XMLTABLE('//disco'
             passing detalle
             columns 
                    disco_ VARCHAR(10) PATH '@nombre',
                    a�o NUMBER PATH '@a�o')
ORDER BY a�o;
/*5)
Los m�sicos que estudiaron en la misma universidad*/

SELECT 
     m_name,
     uni
FROM musician, 
     XMLTABLE('
     universidad'
             passing detalle
             columns 
                    uni VARCHAR(10) PATH '@nombre')
ORDER BY uni;


/*6) le numero de hijos que tiene cada musico*/
SELECT 
      m_name,
      COUNT( hijo )
FROM  musician,
      XMLTABLE( '//hijo'
               passing detalle
               columns hijo VARCHAR( 10 ) PATH '@nombre')
GROUP BY m_name;

/*7) muestre el nombre real del artista y como es conocido*/
SELECT 
      m_name,
      EXTRACT( detalle, '//otroNombre/@razon')
FROM  musician;

/*8) numero de discos por artista*/
SELECT 
      m_name,
      COUNT( disco_ )
FROM  musician,
      XMLTABLE( '//disco'
               passing detalle
               columns disco_ VARCHAR( 10 ) PATH '@nombre')
GROUP BY m_name;
/*9) muestre todos los musicos que terminaron su carrera entre 1760-1820 con su respectiva universidad*/
SELECT 
     m_no,
     m_name,
     uni,
     a�oIni,
     a�oFin
FROM musician,
     XMLTABLE( '//universidad'
              passing detalle 
              columns
                    uni VARCHAR( 15 ) PATH '@nombre',
                    a�oIni NUMBER PATH '@a�oInicio',
                    a�oFin  NUMBER PATH '@a�oFin'
              )
WHERE  1760<=a�oFin  AND a�oFin <= 1820 ;

     
/*10) muestre los sitios web de caada uno de los musicos*/
SELECT 
      m_name,
      ( EXTRACT( detalle, 'detalle/pagina/@url')) AS URL
FROM musician;
    
     
/*C. Definiendo esquema DTD*/
/*
<?xml version="1.0"?>
<!DOCTYPE detalle[
   <!ELEMENT detalle (pagina,otrosNombres,sellos,discos,premios,universidades,hijos)>
   <!ELEMENT pagina EMPTY>
   <!ATTLIST pagina
             url CDATA #REQUIRED>
   <!ELEMENT otrosNombres ( otroNombre* )>
   <!ELEMENT otroNombre EMPTY>
   <!ATTLIST otroNombre
             nombre CDATA #REQUIRED
             razon CDATA #REQUIRED>
   <!ELEMENT sellos ( sello+ )>
   <!ELEMENT sello EMPTY>
   <!ATTLIST sello 
             nombre CDATA #REQUIRED>
   <!ELEMENT discos ( disco, disco+ )>
   <!ELEMENT disco EMPTY >
   <!ATTLIST disco  
             nombre CDATA #REQUIRED
             a�o CDATA #REQUIRED >
   <!ELEMENT premios ( premio* )>
   <!ELEMENT premio EMPTY >
   <!ATTLIST premio 
             nombre CDATA #REQUIRED 
             a�o CDATA #REQUIRED >
   <!ELEMENT universidades ( universidad* )>
   <!ELEMENT universidad EMPTY >
   <!ATTLIST universidad 
             nombre CDATA #REQUIRED  
             a�oInicio CDATA #REQUIRED 
             a�oFin CDATA #IMPLIED
             titulo CDATA #IMPLIED >
   <!ELEMENT hijos ( hijo* )>
   <!ELEMENT hijo EMPTY >
   <!ATTLIST hijo
             nombre CDATA  #REQUIRED
             sexo  (Masculino | Femenino)  #IMPLIED>
]>               
*/

/*Proponga e implemente otras tres restricciones*/
/*1) el sexo de los hijos debe ser Masculino � Femenino*/

/*2)debe existir almenos 1 sello  por cada musico*/

/*3) un musico puede tener o no hijos*/