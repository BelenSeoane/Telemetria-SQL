-------------------------------------------------------------------------
--------------------- Grupo: SELECT_NAME_FROM_GROUP ---------------------
-------------------------------------------------------------------------

USE [GD1C2022]
GO

SET ANSI_NULLS ON
GO

-- Dropeo de Objetos

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Hechos_Medicion') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Hechos_Medicion
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Hechos_Parada_Box') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Hechos_Incidente') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Hechos_Incidente
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Tiempo') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Tiempo
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Auto') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Auto
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Piloto') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Piloto
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Escuderia') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Escuderia
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Sector') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Sector
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Circuito') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Circuito
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector
GO

-- Creacion de Tablas BI sin FKs

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Piloto (
	ID_PILOTO INT PRIMARY KEY
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Escuderia (
	ESCUDERIA_ID INT PRIMARY KEY,
	ESCUDERIA_NOMBRE NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Auto (
	AUTO_ID INT PRIMARY KEY,
	AUTO_MODELO NVARCHAR(255),
	AUTO_NUMERO INT,
	ESCUDERIA_ID INT,
	PILOTO_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector (
	SECTOR_TIPO_ID INT PRIMARY KEY IDENTITY(1,1),
	SECTO_TIPO NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Circuito (
	CIRCUITO_CODIGO INT PRIMARY KEY,
	CIRCUITO_NOMBRE NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Tiempo (
	TIEMPO_ID INT PRIMARY KEY IDENTITY(1,1),
	AÑO INT,
	CUATRIMESTRE INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente (
	TIPO_INCIDENTE_ID INT PRIMARY KEY IDENTITY(1,1),
	INCIDENTE_TIPO NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Dimension_Sector (
	SECTOR_ID INT PRIMARY KEY,
	SECTO_TIPO_ID INT,
	CIRCUITO_CODIGO INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Hechos_Incidente (
	INCIDENTE_ID INT PRIMARY KEY IDENTITY(1,1),
	TIPO_INCIDENTE_ID INT,
	ESCUDERIA_ID INT,
	SECTOR_ID INT,
	TIEMPO_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box (
	ID_PARADA_BOX INT PRIMARY KEY,
	PARADA_BOX_TIEMPO DECIMAL(18,2),
	TIPO_NEUMATICO_INGRESO NVARCHAR(255),
	TIPO_NEUMATICO_EGRESO NVARCHAR(255),
	CIRCUITO_ID INT,
	ESCUDERIA_ID INT,
	TIEMPO_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Hechos_Medicion (
	MEDICION_ID INT PRIMARY KEY IDENTITY(1,1),
	AUTO_ID INT,
	TIPO_SECTOR_ID INT,
	TELE_AUTO_NUMERO_VUELTA INT,
	TIEMPO_ID INT,
	TELE_AUTO_VELOCIDAD DECIMAL(18,2),
	CONSUMO_COMBUSTIBLE_PROMEDIO DECIMAL(18,2),
	MIN_TIEMPO_VUELTA DECIMAL(18,2),
	DESGASTE_CAJA_PROMEDIO DECIMAL(18,2),
	MOTOR_DESGASTE DECIMAL(18,2),
	DIF_PROFUNDIDAD_1 DECIMAL(18,2),
	DIF_PROFUNDIDAD_2 DECIMAL(18,2),
	DIF_PROFUNDIDAD_3 DECIMAL(18,2),
	DIF_PROFUNDIDAD_4 DECIMAL(18,2),
	DIF_FRENO_1 DECIMAL(18,2),
	DIF_FRENO_2 DECIMAL(18,2),
	DIF_FRENO_3 DECIMAL(18,2),
	DIF_FRENO_4 DECIMAL(18,2)
);

-- Agregado de FKs de tablas BI

-- Dimension_Auto
ALTER TABLE [SELECT_NAME_FROM_GROUP].Dimension_Auto ADD FOREIGN KEY (ESCUDERIA_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Escuderia (ESCUDERIA_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Dimension_Auto ADD FOREIGN KEY (PILOTO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Piloto (ID_PILOTO);

-- Dimension_Sector
ALTER TABLE [SELECT_NAME_FROM_GROUP].Dimension_Sector ADD FOREIGN KEY (SECTO_TIPO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector (SECTOR_TIPO_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Dimension_Sector ADD FOREIGN KEY (CIRCUITO_CODIGO) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Circuito (CIRCUITO_CODIGO);

-- Hechos_Incidente
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Incidente ADD FOREIGN KEY (TIPO_INCIDENTE_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente (TIPO_INCIDENTE_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Incidente ADD FOREIGN KEY (ESCUDERIA_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Escuderia (ESCUDERIA_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Incidente ADD FOREIGN KEY (SECTOR_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Sector (SECTOR_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Incidente ADD FOREIGN KEY (TIEMPO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Tiempo (TIEMPO_ID);

-- Hechos_Parada_Box
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box ADD FOREIGN KEY (CIRCUITO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Circuito (CIRCUITO_CODIGO);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box ADD FOREIGN KEY (ESCUDERIA_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Escuderia (ESCUDERIA_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box ADD FOREIGN KEY (TIEMPO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Tiempo (TIEMPO_ID);

-- Hechos_Medicion
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Medicion ADD FOREIGN KEY (AUTO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Auto (AUTO_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Medicion ADD FOREIGN KEY (TIPO_SECTOR_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector (SECTOR_TIPO_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Hechos_Medicion ADD FOREIGN KEY (TIEMPO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Dimension_Tiempo (TIEMPO_ID);

-- Drop Stored Procedures

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Piloto') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Piloto
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Escuderia') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Escuderia
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Auto') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Auto
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Sector') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Sector
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Circuito') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Circuito
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tiempo') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tiempo
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Incidente') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Incidente
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Dimension_Sector') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Sector
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Hechos_Incidente') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Incidente
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Hechos_Parada_Box') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Parada_Box
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].Migracion_Hechos_Medicion') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Medicion
GO

-- Creacion de Stored Procedures para migrar

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Piloto AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Piloto (ID_PILOTO)
	SELECT P.ID_PILOTO
	FROM [SELECT_NAME_FROM_GROUP].Piloto AS P
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Escuderia AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Escuderia (ESCUDERIA_ID, ESCUDERIA_NOMBRE)
	SELECT E.ID_ESCUDERIA, E.ESCUDERIA_NOMBRE
	FROM [SELECT_NAME_FROM_GROUP].Escuderia AS E
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Auto AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Auto (AUTO_ID, AUTO_MODELO, AUTO_NUMERO, ESCUDERIA_ID, PILOTO_ID)
	SELECT A.ID_AUTO, A.AUTO_MODELO, A.AUTO_NUMERO, A.ID_ESCUDERIA, A.ID_PILOTO
	FROM [SELECT_NAME_FROM_GROUP].Auto_Tabla AS A
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Sector AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector (SECTO_TIPO)
	SELECT DISTINCT S.SECTOR_TIPO
	FROM [SELECT_NAME_FROM_GROUP].Sector AS S
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Circuito AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Circuito (CIRCUITO_CODIGO, CIRCUITO_NOMBRE)
	SELECT DISTINCT C.CIRCUITO_CODIGO, C.CIRCUITO_NOMBRE
	FROM [SELECT_NAME_FROM_GROUP].Circuito AS C
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tiempo AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Tiempo (AÑO, CUATRIMESTRE)
	SELECT DISTINCT YEAR(C.CARRERA_FECHA), (CASE
												WHEN MONTH(C.CARRERA_FECHA) IN (1,2,3,4) THEN 1
												WHEN MONTH(C.CARRERA_FECHA) IN (5,6,7,8) THEN 2
												ELSE 3
											END)
	FROM [SELECT_NAME_FROM_GROUP].Carrera AS C
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Incidente AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente (INCIDENTE_TIPO)
	SELECT DISTINCT I.INCIDENTE_TIPO
	FROM [SELECT_NAME_FROM_GROUP].Incidente_X_Auto AS I
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Sector AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Sector (SECTOR_ID, SECTO_TIPO_ID, CIRCUITO_CODIGO)
	SELECT S.CODIGO_SECTOR, T.SECTOR_TIPO_ID, S.CIRCUITO_CODIGO
	FROM [SELECT_NAME_FROM_GROUP].Sector AS S
	JOIN (SELECT SECTOR_TIPO_ID, SECTO_TIPO FROM [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector) AS T ON T.SECTO_TIPO = S.SECTOR_TIPO
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Incidente AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Hechos_Incidente (TIPO_INCIDENTE_ID, ESCUDERIA_ID, SECTOR_ID, TIEMPO_ID)
	SELECT T.TIPO_INCIDENTE_ID, A.ESCUDERIA_ID, N.CODIGO_SECTOR, M.TIEMPO_ID
	FROM [SELECT_NAME_FROM_GROUP].Incidente_X_Auto AS I
	JOIN (SELECT TIPO_INCIDENTE_ID, INCIDENTE_TIPO FROM [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente) AS T ON T.INCIDENTE_TIPO = I.INCIDENTE_TIPO
	JOIN (SELECT AUTO_ID, ESCUDERIA_ID FROM [SELECT_NAME_FROM_GROUP].Dimension_Auto) AS A ON A.AUTO_ID = I.ID_AUTO
	JOIN (SELECT ID_INCIDENTE, CODIGO_SECTOR, CARRERA_FECHA FROM [SELECT_NAME_FROM_GROUP].Incidente) AS N ON N.ID_INCIDENTE = I.ID_INCIDENTE
	JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS M ON M.AÑO = YEAR(N.CARRERA_FECHA) AND M.CUATRIMESTRE = (CASE
																																							WHEN MONTH(N.CARRERA_FECHA) IN (1,2,3,4) THEN 1
																																							WHEN MONTH(N.CARRERA_FECHA) IN (5,6,7,8) THEN 2
																																							ELSE 3
																																						  END)
END
GO

--FALTA MIGRAR LOS TIPOS DE NEUMATICOS. O LOS DEJAMOS EN NULL, TOTAL NO LOS VAMOS A USAR
CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Parada_Box AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box (ID_PARADA_BOX, PARADA_BOX_TIEMPO, TIPO_NEUMATICO_INGRESO, TIPO_NEUMATICO_EGRESO, CIRCUITO_ID, ESCUDERIA_ID, TIEMPO_ID)
	SELECT P.ID_PARADA_BOX, P.PARADA_BOX_TIEMPO, NULL, NULL, C.CIRCUITO_CODIGO, A.ID_ESCUDERIA, T.TIEMPO_ID
	FROM [SELECT_NAME_FROM_GROUP].Parada_Box AS P
	--JOIN (SELECT PARADA_INGRESO, PARADA_EGRESO, NEUMATICO_TIPO_ID FROM [SELECT_NAME_FROM_GROUP].Neumatico) AS N ON 
	JOIN (SELECT CODIGO_CARRERA, CIRCUITO_CODIGO, CARRERA_FECHA FROM [SELECT_NAME_FROM_GROUP].Carrera) AS C ON C.CODIGO_CARRERA = P.ID_CARRERA
	JOIN (SELECT ID_AUTO, ID_ESCUDERIA FROM [SELECT_NAME_FROM_GROUP].Auto_Tabla) AS A ON A.ID_AUTO = P.ID_AUTO
	JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS T ON T.AÑO = YEAR(C.CARRERA_FECHA) AND T.CUATRIMESTRE = (CASE
																																							WHEN MONTH(C.CARRERA_FECHA) IN (1,2,3,4) THEN 1
																																							WHEN MONTH(C.CARRERA_FECHA) IN (5,6,7,8) THEN 2
																																							ELSE 3
																																						  END)
END
GO

--Agrupamos todas las mediciones que corresponden a 1 vuelta pero pueden ser de distinta carrera (segun el enunciado no importaria si es de una carrera distinta)
CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Medicion AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Hechos_Medicion (AUTO_ID, TIPO_SECTOR_ID, TELE_AUTO_NUMERO_VUELTA, TIEMPO_ID, TELE_AUTO_VELOCIDAD, CONSUMO_COMBUSTIBLE_PROMEDIO, MIN_TIEMPO_VUELTA, DESGASTE_CAJA_PROMEDIO, MOTOR_DESGASTE, DIF_PROFUNDIDAD_1, DIF_PROFUNDIDAD_2, DIF_PROFUNDIDAD_3, DIF_PROFUNDIDAD_4, DIF_FRENO_1, DIF_FRENO_2, DIF_FRENO_3, DIF_FRENO_4)
	SELECT M.ID_AUTO, DS.SECTO_TIPO_ID, M.TELE_AUTO_NUMERO_VUELTA, T.TIEMPO_ID, MAX(M.TELE_AUTO_VELOCIDAD), AVG(M.TELE_AUTO_COMBUSTIBLE), MIN(M.TELE_AUTO_TIEMPO_VUELTA), AVG(TCC.TELE_CAJA_DESGASTE), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
	FROM [SELECT_NAME_FROM_GROUP].Medicion AS M
	JOIN (SELECT SECTOR_ID, SECTO_TIPO_ID FROM [SELECT_NAME_FROM_GROUP].Dimension_Sector) AS DS ON M.CODIGO_SECTOR = DS.SECTOR_ID
	JOIN (SELECT CODIGO_CARRERA, CARRERA_FECHA FROM [SELECT_NAME_FROM_GROUP].Carrera) AS C ON C.CODIGO_CARRERA = M.CODIGO_CARRERA
	JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS T ON T.AÑO = YEAR(C.CARRERA_FECHA) AND T.CUATRIMESTRE = (CASE
																																							WHEN MONTH(C.CARRERA_FECHA) IN (1,2,3,4) THEN 1
																																							WHEN MONTH(C.CARRERA_FECHA) IN (5,6,7,8) THEN 2
																																							ELSE 3
																																						  END)
	JOIN (SELECT TELE_CAJA_ID, TELE_CAJA_DESGASTE FROM [SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios) AS TCC ON M.TELE_CAJA_ID = TCC.TELE_CAJA_ID
	JOIN (SELECT TELE_MOTOR_ID, TELE_MOTOR_POTENCIA FROM [SELECT_NAME_FROM_GROUP].Telemetria_Motor) AS TM ON M.TELE_MOTOR_ID = TM.TELE_MOTOR_ID	
	GROUP BY M.ID_AUTO, DS.SECTO_TIPO_ID, M.TELE_AUTO_NUMERO_VUELTA, T.TIEMPO_ID
END
GO

-- Ejecucion de la migracion

BEGIN TRANSACTION
BEGIN TRY
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Piloto
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Escuderia
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Auto
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Sector
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Circuito
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tiempo
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Tipo_Incidente
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Dimension_Sector
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Incidente
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Parada_Box
	EXECUTE [SELECT_NAME_FROM_GROUP].Migracion_Hechos_Medicion
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
		THROW 51000, 'Se produjo un error durante la migración', 1;
END CATCH
BEGIN
COMMIT TRANSACTION
END

-- Tablas de Dimension y Hechos
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Piloto
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Escuderia 
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Auto
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Circuito
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo 
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Incidente 
SELECT * FROM [SELECT_NAME_FROM_GROUP].Dimension_Sector
SELECT * FROM [SELECT_NAME_FROM_GROUP].Hechos_Incidente
SELECT * FROM [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box
SELECT * FROM [SELECT_NAME_FROM_GROUP].Hechos_Medicion

-- Drop vistas
IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Desgaste', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Desgaste;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Mejor_Tiempo_Vuelta', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Mejor_Tiempo_Vuelta;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Mayor_Consumo_Combustible', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Mayor_Consumo_Combustible;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Max_Velocidad', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Max_Velocidad;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Tiempo_Paradas', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Tiempo_Paradas;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Cantidad_Paradas', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Cantidad_Paradas;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Circuitos_Con_Mayor_Tiempo_Paradas', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Circuitos_Con_Mayor_Tiempo_Paradas;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Mas_Peligrosos', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Mas_Peligrosos;
GO

IF OBJECT_ID('[SELECT_NAME_FROM_GROUP].Vista_Promedio_Incidentes', 'V') IS NOT NULL
	DROP VIEW [SELECT_NAME_FROM_GROUP].Vista_Promedio_Incidentes;
GO


-- Creacion de vistas

CREATE VIEW [SELECT_NAME_FROM_GROUP].Vista_Circuitos_Con_Mayor_Tiempo_Paradas AS
	SELECT TOP 3 H.CIRCUITO_ID
	FROM [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box AS H
	GROUP BY H.CIRCUITO_ID
	ORDER BY SUM(H.PARADA_BOX_TIEMPO) DESC
GO

CREATE VIEW [SELECT_NAME_FROM_GROUP].Vista_Cantidad_Paradas AS
	SELECT H.CIRCUITO_ID, H.ESCUDERIA_ID, T.AÑO, COUNT(*) AS 'CANT PARADAS'
	FROM [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box AS H
	JOIN (SELECT TIEMPO_ID, AÑO FROM SELECT_NAME_FROM_GROUP.Dimension_Tiempo) AS T ON H.TIEMPO_ID = T.TIEMPO_ID
	GROUP BY H.CIRCUITO_ID, H.ESCUDERIA_ID, T.AÑO
GO

CREATE VIEW [SELECT_NAME_FROM_GROUP].Vista_Tiempo_Paradas AS
	SELECT H.ESCUDERIA_ID, AVG(H.PARADA_BOX_TIEMPO) AS 'TIEMPO PROMEDIO'
	FROM [SELECT_NAME_FROM_GROUP].Hechos_Parada_Box AS H
	GROUP BY H.ESCUDERIA_ID
GO

CREATE VIEW [SELECT_NAME_FROM_GROUP].Vista_Mas_Peligrosos AS
	SELECT TOP 3 S.CIRCUITO_CODIGO, COUNT(*) AS 'CANT INCIDENTES'
	FROM [SELECT_NAME_FROM_GROUP].Hechos_Incidente AS I
	JOIN (SELECT SECTOR_ID, CIRCUITO_CODIGO FROM [SELECT_NAME_FROM_GROUP].Dimension_Sector) AS S ON S.SECTOR_ID = I.SECTOR_ID
	GROUP BY S.CIRCUITO_CODIGO
	ORDER BY COUNT(*) DESC
GO

CREATE VIEW [SELECT_NAME_FROM_GROUP].Vista_Max_Velocidad AS
	SELECT A.AUTO_ID, MAX(M.TELE_AUTO_VELOCIDAD) AS 'MAXIMA VELOCIDAD', TS.SECTOR_TIPO_ID, C.CIRCUITO_CODIGO
	FROM [SELECT_NAME_FROM_GROUP].Dimension_Auto AS A
	JOIN [SELECT_NAME_FROM_GROUP].Hechos_Medicion AS M ON A.AUTO_ID=M.AUTO_ID
	JOIN [SELECT_NAME_FROM_GROUP].Dimension_Tipo_Sector AS TS ON M.TIPO_SECTOR_ID=TS.SECTOR_TIPO_ID
	JOIN [SELECT_NAME_FROM_GROUP].Dimension_Sector AS S ON S.SECTO_TIPO_ID=TS.SECTOR_TIPO_ID
	JOIN [SELECT_NAME_FROM_GROUP].Dimension_Circuito AS C ON C.CIRCUITO_CODIGO=S.CIRCUITO_CODIGO
	GROUP BY A.AUTO_ID, TS.SECTOR_TIPO_ID, C.CIRCUITO_CODIGO
GO

CREATE VIEW [SELECT_NAME_FROM_GROUP].Vista_Promedio_Incidentes AS
	SELECT I.ESCUDERIA_ID, T.AÑO, 
		((SELECT COUNT(INCIDENTE_ID) FROM [SELECT_NAME_FROM_GROUP].Hechos_Incidente AS I2 
			JOIN (SELECT SECTOR_ID, SECTO_TIPO_ID FROM [SELECT_NAME_FROM_GROUP].Dimension_Sector) AS S ON S.SECTOR_ID = I2.SECTOR_ID
			JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS T2 ON T2.TIEMPO_ID = I2.TIEMPO_ID
			WHERE S.SECTO_TIPO_ID = '3' AND I2.ESCUDERIA_ID = I.ESCUDERIA_ID AND T2.AÑO = T.AÑO)/COUNT(INCIDENTE_ID)) AS 'PROMEDIO RECTA',
		((SELECT COUNT(INCIDENTE_ID) FROM [SELECT_NAME_FROM_GROUP].Hechos_Incidente AS I2 
			JOIN (SELECT SECTOR_ID, SECTO_TIPO_ID FROM [SELECT_NAME_FROM_GROUP].Dimension_Sector) AS S ON S.SECTOR_ID = I2.SECTOR_ID
			JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS T2 ON T2.TIEMPO_ID = I2.TIEMPO_ID
			WHERE S.SECTO_TIPO_ID = '2' AND I2.ESCUDERIA_ID = I.ESCUDERIA_ID AND T2.AÑO = T.AÑO)/COUNT(INCIDENTE_ID)) AS 'PROMEDIO FRENADA',
		((SELECT COUNT(INCIDENTE_ID) FROM [SELECT_NAME_FROM_GROUP].Hechos_Incidente AS I2 
			JOIN (SELECT SECTOR_ID, SECTO_TIPO_ID FROM [SELECT_NAME_FROM_GROUP].Dimension_Sector) AS S ON S.SECTOR_ID = I2.SECTOR_ID
			JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS T2 ON T2.TIEMPO_ID = I2.TIEMPO_ID
			WHERE S.SECTO_TIPO_ID = '1' AND I2.ESCUDERIA_ID = I.ESCUDERIA_ID AND T2.AÑO = T.AÑO)/COUNT(INCIDENTE_ID)) AS 'PROMEDIO CURVA' 	 	 			
	FROM [SELECT_NAME_FROM_GROUP].Hechos_Incidente AS I
	JOIN (SELECT TIEMPO_ID, AÑO, CUATRIMESTRE FROM [SELECT_NAME_FROM_GROUP].Dimension_Tiempo) AS T ON T.TIEMPO_ID = I.TIEMPO_ID
	GROUP BY I.ESCUDERIA_ID, T.AÑO
GO

-- Consultas para mostrar los items pedidos
SELECT * FROM [SELECT_NAME_FROM_GROUP].Vista_Circuitos_Con_Mayor_Tiempo_Paradas
SELECT * FROM [SELECT_NAME_FROM_GROUP].Vista_Cantidad_Paradas
SELECT * FROM [SELECT_NAME_FROM_GROUP].Vista_Tiempo_Paradas
SELECT * FROM [SELECT_NAME_FROM_GROUP].Vista_Mas_Peligrosos
SELECT * FROM [SELECT_NAME_FROM_GROUP].Vista_Max_Velocidad
SELECT * FROM [SELECT_NAME_FROM_GROUP].Vista_Promedio_Incidentes
