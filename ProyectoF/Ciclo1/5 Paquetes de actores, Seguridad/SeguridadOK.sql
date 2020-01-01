/*SeguridadOK*/

/* Mesero */
EXECUTE PC_Zonas.AD_Zonas( 'CitYroncirus','O');
EXECUTE PC_Zonas.AD_Sectores( 'Shasta', 2);

--MESERO PUEDE ADICIONAR MESAS 

EXECUTE PA_Mesero.AD_Mesas('EA',1, NULL);
EXECUTE PA_Mesero.AD_Mesas('AS',1, NULL);
EXECUTE PA_Mesero.AD_Mesas('AS',1, NULL);


--MESERO PUEDE MODIFICAR EL ESTADO DE UNA MESA
EXECUTE PA_Mesero.MOD_Mesas(1,'AS',NULL);

--MESERO PUEDE CREAR PEDIDOS
EXECUTE PA_Mesero.AD_Pedidos('Camilo Rincon',NULL,2);
EXECUTE PA_Mesero.AD_Pedidos('Fabian Ramirez',NULL,3);

--MESERO PUEDE ELIMINAR PEDIDOS SI PASO MENOS DE 10 MINUTOS.
EXECUTE PA_Mesero.EL_Pedidos(1);


--MESERO PUEDE CONSULTAR LAS MESAS EXISTENTES.
SELECT 
PA_Mesero.CO_Mesas
FROM DUAL;

--MESERO PUEDE CONSULTAR LOS PEDIDOS EN PROCESO
SELECT 
PA_Mesero.CO_Pedidos
FROM DUAL;


--MESERO PUEDE CONSULTAR LAS MESAS ASEADAS DE UN SECTOR 
SELECT 
PA_Mesero.CO_Mesas_Libres
FROM DUAL;

/* SupervisorDeZona*/

--REGISTRAR UN DESPACHO REALIZADO CON SU RESPECTIVA ZONA
EXECUTE PC_Despachos.AD_Despachos(2);

--CONSULTAR LOS DESPACHOS REGISTRADOS PARA CADA ZONA
SELECT 
PA_SupervisorDeZona.CO_Despachos
FROM DUAL;


--EL SUPERVISOR CONSULTA QUE EMPLEADOS (MESEROS) SON CANDIDATOS PARA UN ASECENSO.
SELECT 
PA_SupervisorDeZona.CO_empleadosCan
FROM DUAL;

/* GerenteDeAlimentos */ 
--GERENTE DE ALIMENTOS SE ENCARGA DE QUE INSUMOS REGISTRAR EN LA BASE DE DATOS.
EXECUTE PA_GerenteDeAlimentos.AD_Insumos('Rice - Aborio');

--GERENTE DE ALIMENTOS PUEDE REGISTAR UN HISTORIAL DE LOS PROVEDOORES LOS CUALES VENDIERON SUS PRODUCTOS O INSUMOS.
EXECUTE PA_GerenteDeAlimentos.AD_Proveedores(5410359, 7586092347, 'CC', 3506349709);


--CONSULTAR QUE INSUMOS SE ENCUENTRAN EN LA BASE DE DATOS
SELECT 
PA_GerenteDeAlimentos.CO_Insumos
FROM DUAL;

--CONSULTAR LOS PROVEEDORES QUE SE ENCUENTRAN EN LA BASE DE DATOS.
SELECT 
PA_GerenteDeAlimentos.CO_Proveedores
FROM DUAL;

--CONSULTAR LAS COMPRAS REALIZADAS POR PARTE DEL MOVISTAR A LOS PROVEEDORES
SELECT 
PA_GerenteDeAlimentos.CO_Compras
FROM DUAL;

/* Administrador*/

--EL ADMINISTRADOR PUEDE REGISTRAR LAS ZONAS Y SECTORES, PARA MANTENER LA INFORMACION NECESARIA DE LA BASE DE DATOS.
EXECUTE PA_Administrador.AD_Zonas('Asian Pigeonwings','S');
EXECUTE PA_Administrador.AD_Sectores('Colorado',3);

--CONSULTAR LAS ZONAS YA REGISTRADAS EN LA BASE DE DATOS

SELECT 
PA_Administrador.CO_Zonas
FROM DUAL;

--CONSULTAR LOS SECTORES YA REGISTRADOS EN LA BASE DE DATOS
SELECT 
PA_Administrador.CO_Sectores
FROM DUAL;