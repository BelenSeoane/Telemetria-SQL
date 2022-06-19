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
	A�O INT,
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
	INCIDENTE_ID INT PRIMARY KEY,
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
	MEDICION_ID INT PRIMARY KEY,
	AUTO_ID INT,
	TIPO_SECTOR_ID INT,
	TELE_AUTO_NUMERO_VUELTA INT,
	TIEMPO_ID INT,
	TELE_AUTO_VELOCIDAD DECIMAL(18,2),
	TELE_AUTO_COMBUSTIBLE DECIMAL(18,2),
	TIEMPO_VUELTA DECIMAL(18,2),
	TELE_CAJA_DESGASTE DECIMAL(18,2),
	DIF_POTENCIA DECIMAL(18,2),
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
	INSERT INTO [SELECT_NAME_FROM_GROUP].Dimension_Tiempo (A�O, CUATRIMESTRE)
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
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
		THROW 51000, 'Se produjo un error durante la migraci�n', 1;
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

-- Creacion de vistas
-- Consultas para mostrar los items pedidos