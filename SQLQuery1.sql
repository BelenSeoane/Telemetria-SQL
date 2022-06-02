﻿-------------------------------------------------------------------------
--------------------- Grupo: SELECT_NAME_FROM_GROUP ---------------------
-------------------------------------------------------------------------

USE [GD1C2022]
GO

SET ANSI_NULLS ON
GO

-- Creacion de Schema

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SELECT_NAME_FROM_GROUP')
	EXEC ('CREATE SCHEMA SELECT_NAME_FROM_GROUP AUTHORIZATION [DBO]')
GO

-- Dropeo de Objetos

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Telemetria_Freno') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Freno
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Freno') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Freno
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Telemetria_Neumatico') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Neumatico
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Posicion') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Posicion
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Neumatico') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Neumatico
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Parada_Box') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Parada_Box
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Tipo_Neumatico') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Tipo_Neumatico
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Medicion') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Medicion
GO 

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Telemetria_Motor') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Motor
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Motor') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Motor
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Caja_Cambios') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Caja_Cambios
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Carrera') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Carrera
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Incidente_X_Auto') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Incidente_X_Auto
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Incidente') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Incidente
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Bandera') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Bandera
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Auto') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Auto
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Piloto') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Piloto
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Escuderia') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Escuderia
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Sector') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Sector
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Circuito') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Circuito
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[SELECT_NAME_FROM_GROUP].Pais') AND TYPE ='U')
	DROP TABLE [SELECT_NAME_FROM_GROUP].Pais
GO

-- Creacion de Tablas sin FKs

CREATE TABLE [SELECT_NAME_FROM_GROUP].Medicion (
	ID_MEDICION INT PRIMARY KEY IDENTITY(1,1),
	TELE_AUTO_CODIGO INT,
	TELE_AUTO_NUMERO_VUELTA INT,
	TELE_AUTO_DISTANCIA_CARRERA DECIMAL(18,6),
	TELE_AUTO_DISTANCIA_VUELTA DECIMAL(18,2),
	TELE_AUTO_TIEMPO_VUELTA DECIMAL(18,10),
	TELE_AUTO_POSICION DECIMAL(18,0),
	TELE_AUTO_VELOCIDAD DECIMAL(18,2),
	TELE_AUTO_COMBUSTIBLE DECIMAL(18,2),
	CODIGO_CARRERA INT,
	CODIGO_SECTOR INT,
	TELE_MOTOR_ID INT,
	TELE_CAJA_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Freno (
	TELE_FRENO_ID INT PRIMARY KEY IDENTITY(1,1),
	TELE_FRENO_POSICION_ID INT,
	TELE_FRENO_TEMPERATURA DECIMAL(18,2),
	TELE_FRENO_GROSOR_PASTILLA DECIMAL(18,2), 
	ID_MEDICION INT,
	FRENO_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Freno (
	FRENO_ID INT PRIMARY KEY IDENTITY(1,1),
	FRENO_NRO_SERIE NVARCHAR(255),
	FRENO_TAMANIO_DISCO DECIMAL (18,2)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Motor (
	TELE_MOTOR_ID INT PRIMARY KEY IDENTITY(1,1),
	TELE_MOTOR_POTENCIA DECIMAL(18,6),
	TELE_MOTOR_RPM DECIMAL(18,6),
	TELE_MOTOR_TEMP_ACEITE DECIMAL(18,6),
	TELE_MOTOR_TEMP_AGUA DECIMAL(18,6),
	MOTOR_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Motor (
	MOTOR_ID INT PRIMARY KEY IDENTITY(1,1),
	MOTOR_MODELO NVARCHAR(255),
	MOTOR_NRO_SERIE NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios (
	TELE_CAJA_ID INT PRIMARY KEY IDENTITY(1,1),
	TELE_CAJA_RPM DECIMAL(18,2),
	TELE_CAJA_TEMP_ACEITE DECIMAL(18,2),
	TELE_CAJA_DESGASTE DECIMAL(18,2),
	CAJA_CAMBIO_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Caja_Cambios (
	CAJA_CAMBIO_ID INT PRIMARY KEY IDENTITY(1,1),
	CAJA_MODELO NVARCHAR(50),
	CAJA_NRO_SERIE NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Posicion (
	ID_POSICION INT PRIMARY KEY IDENTITY(1,1),
	DESCRIPCION VARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Neumatico (
	TELE_NEUMATICO_ID INT PRIMARY KEY IDENTITY(1,1),
	TELE_NEUMATICO_PRESION DECIMAL(18,6),
	TELE_NEUMATICO_PROFUNDIDAD DECIMAL(18,6),
	TELE_NEUMATICO_TEMPERATURA DECIMAL(18,6),
	ID_MEDICION INT,
	NEUMATICO_ID INT,
	TELE_NEUMATICO_POSICION_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Neumatico (
	ID_NEUMATICO INT PRIMARY KEY IDENTITY(1,1),
	NEUMATICO_NRO_SERIE NVARCHAR(255),
	PARADA_INGRESO INT,
	PARADA_EGRESO INT,
	NEUMATICO_TIPO_ID INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Tipo_Neumatico (
	ID_TIPO_NEUMATICO INT PRIMARY KEY IDENTITY(1,1),
	TIPO_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Parada_Box (
	ID_PARADA_BOX INT PRIMARY KEY IDENTITY(1,1),
	PARADA_BOX_TIEMPO DECIMAL(18,2),
	PARADA_BOX_VUELTA DECIMAL(18,0)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Auto (
	ID_AUTO INT PRIMARY KEY IDENTITY(1,1),
	AUTO_MODELO NVARCHAR(255),
	AUTO_NUMERO INT,
	ID_PILOTO INT,
	ID_ESCUDERIA INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Incidente (
	ID_INCIDENTE INT PRIMARY KEY IDENTITY(1,1),
	CODIGO_BANDERA INT,
	INCIDENTE_TIEMPO DECIMAL(18,2),
	CODIGO_SECTOR INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Bandera (
	ID_BANDERA INT PRIMARY KEY IDENTITY(1,1),
	BANDERA_DESCRIPCION NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Piloto (
	ID_PILOTO INT PRIMARY KEY IDENTITY(1,1),
	PILOTO_NOMBRE NVARCHAR(50),
	PILOTO_APELLIDO NVARCHAR(50),
	PILOTO_NACIONALIDAD INT,
	PILOTO_FECHA_NACIMIENTO DATE
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Escuderia (
	ID_ESCUDERIA INT PRIMARY KEY IDENTITY(1,1),
	ESCUDERIA_NOMBRE NVARCHAR(255),
	ESCUDERIA_NACIONALIDAD INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Carrera (
	CODIGO_CARRERA INT PRIMARY KEY,
	CARRERA_FECHA DATE,
	CARRERA_CLIMA NVARCHAR(100),
	CARRERA_TOTAL_CARRERA DECIMAL(18,2),
	CARRERA_CANT_VUELTAS INT,
	CIRCUITO_CODIGO INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Sector (
	CODIGO_SECTOR INT PRIMARY KEY,
	SECTOR_DISTANCIA DECIMAL(18,2),
	SECTOR_TIPO NVARCHAR(255),
	CIRCUITO_CODIGO INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Circuito (
	CIRCUITO_CODIGO INT PRIMARY KEY,
	CIRCUITO_NOMBRE NVARCHAR(255),
	PAIS_CODIGO INT
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Pais (
	ID_PAIS INT PRIMARY KEY IDENTITY(1,1),
	PAIS_NOMBRE NVARCHAR(255)
);

CREATE TABLE [SELECT_NAME_FROM_GROUP].Incidente_X_Auto (
	ID_AUTO INT NOT NULL,
	ID_INCIDENTE INT NOT NULL,
	INCIDENTE_TIPO NVARCHAR(255),
	INCIDENTE_NRO_VUELTA DECIMAL(18,0)
	PRIMARY KEY(ID_AUTO, ID_INCIDENTE)
);

-- Agrego FKs

-- Medicion
ALTER TABLE [SELECT_NAME_FROM_GROUP].Medicion ADD FOREIGN KEY (TELE_AUTO_CODIGO) REFERENCES [SELECT_NAME_FROM_GROUP].Auto (ID_AUTO);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Medicion ADD FOREIGN KEY (CODIGO_CARRERA) REFERENCES [SELECT_NAME_FROM_GROUP].Carrera (CODIGO_CARRERA);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Medicion ADD FOREIGN KEY (CODIGO_SECTOR) REFERENCES [SELECT_NAME_FROM_GROUP].Sector (CODIGO_SECTOR);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Medicion ADD FOREIGN KEY (TELE_MOTOR_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Telemetria_Motor (TELE_MOTOR_ID);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Medicion ADD FOREIGN KEY (TELE_CAJA_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios (TELE_CAJA_ID);

-- Telemetria_Freno
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Freno ADD FOREIGN KEY (TELE_FRENO_POSICION_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Posicion (ID_POSICION);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Freno ADD FOREIGN KEY (ID_MEDICION) REFERENCES [SELECT_NAME_FROM_GROUP].Medicion (ID_MEDICION);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Freno ADD FOREIGN KEY (FRENO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Freno (FRENO_ID);

-- Telemetria_Motor
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Motor ADD FOREIGN KEY (MOTOR_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Motor (MOTOR_ID);

-- Telemetria_Caja_Cambios
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios ADD FOREIGN KEY (CAJA_CAMBIO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Caja_Cambios (CAJA_CAMBIO_ID);

-- Telemetria_Neumatico
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Neumatico ADD FOREIGN KEY (ID_MEDICION) REFERENCES [SELECT_NAME_FROM_GROUP].Medicion (ID_MEDICION);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Neumatico ADD FOREIGN KEY (NEUMATICO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Neumatico (ID_NEUMATICO);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Telemetria_Neumatico ADD FOREIGN KEY (TELE_NEUMATICO_POSICION_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Posicion (ID_POSICION);

-- Neumatico
ALTER TABLE [SELECT_NAME_FROM_GROUP].Neumatico ADD FOREIGN KEY (PARADA_INGRESO) REFERENCES [SELECT_NAME_FROM_GROUP].Parada_Box (ID_PARADA_BOX);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Neumatico ADD FOREIGN KEY (PARADA_EGRESO) REFERENCES [SELECT_NAME_FROM_GROUP].Parada_Box (ID_PARADA_BOX);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Neumatico ADD FOREIGN KEY (NEUMATICO_TIPO_ID) REFERENCES [SELECT_NAME_FROM_GROUP].Tipo_Neumatico (ID_TIPO_NEUMATICO);

-- Auto
ALTER TABLE [SELECT_NAME_FROM_GROUP].Auto ADD FOREIGN KEY (ID_PILOTO) REFERENCES [SELECT_NAME_FROM_GROUP].Piloto (ID_PILOTO);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Auto ADD FOREIGN KEY (ID_ESCUDERIA) REFERENCES [SELECT_NAME_FROM_GROUP].Escuderia (ID_ESCUDERIA);

-- Incidente
ALTER TABLE [SELECT_NAME_FROM_GROUP].Incidente ADD FOREIGN KEY (CODIGO_BANDERA) REFERENCES [SELECT_NAME_FROM_GROUP].Bandera (ID_BANDERA);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Incidente ADD FOREIGN KEY (CODIGO_SECTOR) REFERENCES [SELECT_NAME_FROM_GROUP].Sector (CODIGO_SECTOR);

-- Piloto
ALTER TABLE [SELECT_NAME_FROM_GROUP].Piloto ADD FOREIGN KEY (PILOTO_NACIONALIDAD) REFERENCES [SELECT_NAME_FROM_GROUP].Pais (ID_PAIS);

-- Escuderia
ALTER TABLE [SELECT_NAME_FROM_GROUP].Escuderia ADD FOREIGN KEY (ESCUDERIA_NACIONALIDAD) REFERENCES [SELECT_NAME_FROM_GROUP].Pais (ID_PAIS);

-- Carrera
ALTER TABLE [SELECT_NAME_FROM_GROUP].Carrera ADD FOREIGN KEY (CIRCUITO_CODIGO) REFERENCES [SELECT_NAME_FROM_GROUP].Circuito (CIRCUITO_CODIGO);

-- Sector
ALTER TABLE [SELECT_NAME_FROM_GROUP].Sector ADD FOREIGN KEY (CIRCUITO_CODIGO) REFERENCES [SELECT_NAME_FROM_GROUP].Circuito (CIRCUITO_CODIGO);

-- Circuito
ALTER TABLE [SELECT_NAME_FROM_GROUP].Circuito ADD FOREIGN KEY (PAIS_CODIGO) REFERENCES [SELECT_NAME_FROM_GROUP].Pais (ID_PAIS);

-- Incidente_X_Auto
ALTER TABLE [SELECT_NAME_FROM_GROUP].Incidente_X_Auto ADD FOREIGN KEY (ID_AUTO) REFERENCES [SELECT_NAME_FROM_GROUP].Auto (ID_AUTO);
ALTER TABLE [SELECT_NAME_FROM_GROUP].Incidente_X_Auto ADD FOREIGN KEY (ID_INCIDENTE) REFERENCES [SELECT_NAME_FROM_GROUP].Incidente (ID_INCIDENTE);

-- Drop Stored Procedures
IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_motor') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_motor
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_caja_cambios') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_caja_cambios
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_bandera') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_bandera
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_parada_box') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_parada_box
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_freno') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_freno
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_tipo_neumatico') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_tipo_neumatico
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_posicion') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_posicion
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_pais') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_pais
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_piloto') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_piloto
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_escuderia') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_escuderia
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_piloto') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_piloto
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_auto') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_auto
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_circuito') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_circuito
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_sector') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_sector
GO

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_carrera') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_carrera
GO

/*IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_neumatico') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_neumatico
GO*/

IF EXISTS (SELECT NAME FROM sys.procedures WHERE object_id = OBJECT_ID ('[SELECT_NAME_FROM_GROUP].migracion_telemetria_motor') AND TYPE ='P')
	DROP PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_telemetria_motor
GO

-- Creacion de Stored Procedures

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_motor AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Motor (MOTOR_MODELO, MOTOR_NRO_SERIE)
	SELECT DISTINCT TELE_MOTOR_MODELO, TELE_MOTOR_NRO_SERIE
	FROM [gd_esquema].Maestra
	WHERE TELE_MOTOR_MODELO IS NOT NULL AND TELE_MOTOR_NRO_SERIE IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_caja_cambios AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Caja_Cambios (CAJA_MODELO, CAJA_NRO_SERIE)
	SELECT DISTINCT TELE_CAJA_MODELO, TELE_CAJA_NRO_SERIE
	FROM [gd_esquema].Maestra
	WHERE TELE_CAJA_MODELO IS NOT NULL AND TELE_CAJA_NRO_SERIE IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_bandera AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Bandera (BANDERA_DESCRIPCION)
	SELECT DISTINCT INCIDENTE_BANDERA
	FROM [gd_esquema].Maestra
	WHERE INCIDENTE_BANDERA IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_parada_box AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Parada_Box (PARADA_BOX_TIEMPO, PARADA_BOX_VUELTA)
	SELECT DISTINCT PARADA_BOX_TIEMPO, PARADA_BOX_VUELTA
	FROM [gd_esquema].Maestra
	WHERE PARADA_BOX_TIEMPO IS NOT NULL AND PARADA_BOX_VUELTA IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_freno AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Freno (FRENO_NRO_SERIE, FRENO_TAMANIO_DISCO)
	SELECT DISTINCT TELE_FRENO1_NRO_SERIE, TELE_FRENO1_TAMANIO_DISCO FROM [gd_esquema].Maestra WHERE TELE_FRENO1_NRO_SERIE IS NOT NULL AND TELE_FRENO1_TAMANIO_DISCO IS NOT NULL
		UNION
	SELECT DISTINCT TELE_FRENO2_NRO_SERIE, TELE_FRENO2_TAMANIO_DISCO FROM [gd_esquema].Maestra WHERE TELE_FRENO2_NRO_SERIE IS NOT NULL AND TELE_FRENO2_TAMANIO_DISCO IS NOT NULL
		UNION
	SELECT DISTINCT TELE_FRENO3_NRO_SERIE, TELE_FRENO3_TAMANIO_DISCO FROM [gd_esquema].Maestra WHERE TELE_FRENO3_NRO_SERIE IS NOT NULL AND TELE_FRENO3_TAMANIO_DISCO IS NOT NULL
		UNION
	SELECT DISTINCT TELE_FRENO4_NRO_SERIE, TELE_FRENO4_TAMANIO_DISCO FROM [gd_esquema].Maestra WHERE TELE_FRENO4_NRO_SERIE IS NOT NULL AND TELE_FRENO4_TAMANIO_DISCO IS NOT NULL
	
END
GO

-- Se podría hacer con uno solo en vez de todos los union, no se si es requsito contemplar todo o no.
-- Cualquier cosa borren o modifiquen
CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_tipo_neumatico AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Tipo_Neumatico (TIPO_DESCRIPCION)
	SELECT DISTINCT NEUMATICO1_TIPO_NUEVO FROM gd_esquema.Maestra WHERE NEUMATICO1_TIPO_NUEVO IS NOT NULL
		UNION
	SELECT DISTINCT NEUMATICO2_TIPO_NUEVO FROM gd_esquema.Maestra WHERE NEUMATICO2_TIPO_NUEVO IS NOT NULL 
		UNION
	SELECT DISTINCT NEUMATICO3_TIPO_NUEVO FROM gd_esquema.Maestra WHERE NEUMATICO3_TIPO_NUEVO IS NOT NULL 
		UNION
	SELECT DISTINCT NEUMATICO4_TIPO_NUEVO FROM gd_esquema.Maestra WHERE NEUMATICO4_TIPO_NUEVO IS NOT NULL 
		UNION
	SELECT DISTINCT NEUMATICO1_TIPO_VIEJO FROM gd_esquema.Maestra WHERE NEUMATICO1_TIPO_VIEJO IS NOT NULL 
		UNION
	SELECT DISTINCT NEUMATICO2_TIPO_VIEJO FROM gd_esquema.Maestra WHERE NEUMATICO2_TIPO_VIEJO IS NOT NULL 
		UNION
	SELECT DISTINCT NEUMATICO3_TIPO_VIEJO FROM gd_esquema.Maestra WHERE NEUMATICO3_TIPO_VIEJO IS NOT NULL 
		UNION
	SELECT DISTINCT NEUMATICO4_TIPO_VIEJO FROM gd_esquema.Maestra WHERE NEUMATICO4_TIPO_VIEJO IS NOT NULL 
END
GO

-- Lo mismo que la anterior, si tenemos que cubrir todas las combinaciones son mas SELECT
CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_posicion AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Posicion (DESCRIPCION)
	SELECT DISTINCT TELE_NEUMATICO1_POSICION FROM gd_esquema.Maestra WHERE TELE_NEUMATICO1_POSICION IS NOT NULL
		UNION
	SELECT DISTINCT TELE_NEUMATICO2_POSICION FROM gd_esquema.Maestra WHERE TELE_NEUMATICO2_POSICION IS NOT NULL
		UNION
	SELECT DISTINCT TELE_NEUMATICO3_POSICION FROM gd_esquema.Maestra WHERE TELE_NEUMATICO3_POSICION IS NOT NULL
		UNION
	SELECT DISTINCT TELE_NEUMATICO4_POSICION FROM gd_esquema.Maestra WHERE TELE_NEUMATICO4_POSICION IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_pais AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Pais (PAIS_NOMBRE)
	SELECT DISTINCT ESCUDERIA_NACIONALIDAD FROM gd_esquema.Maestra WHERE ESCUDERIA_NACIONALIDAD IS NOT NULL
		UNION
	SELECT DISTINCT PILOTO_NACIONALIDAD FROM gd_esquema.Maestra WHERE PILOTO_NACIONALIDAD IS NOT NULL
		UNION
	SELECT DISTINCT CIRCUITO_PAIS FROM gd_esquema.Maestra WHERE CIRCUITO_PAIS IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_piloto AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Piloto (PILOTO_NOMBRE, PILOTO_APELLIDO, PILOTO_NACIONALIDAD, PILOTO_FECHA_NACIMIENTO)
	SELECT DISTINCT M.PILOTO_NOMBRE, M.PILOTO_APELLIDO, P.ID_PAIS, M.PILOTO_FECHA_NACIMIENTO
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT ID_PAIS, PAIS_NOMBRE FROM [SELECT_NAME_FROM_GROUP].Pais) AS P ON P.PAIS_NOMBRE = M.PILOTO_NACIONALIDAD
	WHERE	PILOTO_NOMBRE IS NOT NULL AND 
			PILOTO_APELLIDO IS NOT NULL AND 
			PAIS_NOMBRE IS NOT NULL AND
			PILOTO_FECHA_NACIMIENTO IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_escuderia AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Escuderia (ESCUDERIA_NOMBRE, ESCUDERIA_NACIONALIDAD)
	SELECT DISTINCT M.ESCUDERIA_NOMBRE, P.ID_PAIS
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT ID_PAIS, PAIS_NOMBRE FROM[SELECT_NAME_FROM_GROUP].Pais) AS P ON P.PAIS_NOMBRE = M.ESCUDERIA_NACIONALIDAD 
	WHERE M.ESCUDERIA_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_auto AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Auto (AUTO_MODELO, AUTO_NUMERO, ID_PILOTO, ID_ESCUDERIA)
	SELECT DISTINCT M.AUTO_MODELO, M.AUTO_NUMERO, P.ID_PILOTO, E.ID_ESCUDERIA
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT ID_PILOTO, PILOTO_NOMBRE, PILOTO_APELLIDO FROM [SELECT_NAME_FROM_GROUP].Piloto) AS P ON P.PILOTO_NOMBRE = M.PILOTO_NOMBRE AND P.PILOTO_APELLIDO = M.PILOTO_APELLIDO
	JOIN (SELECT ID_ESCUDERIA, ESCUDERIA_NOMBRE FROM Escuderia) AS E ON E.ESCUDERIA_NOMBRE = M.ESCUDERIA_NOMBRE
	WHERE	M.AUTO_MODELO IS NOT NULL AND
			M.AUTO_NUMERO IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_circuito AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Circuito (CIRCUITO_CODIGO, CIRCUITO_NOMBRE, PAIS_CODIGO)
	SELECT DISTINCT M.CIRCUITO_CODIGO, M.CIRCUITO_NOMBRE, P.ID_PAIS
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT ID_PAIS, PAIS_NOMBRE FROM [SELECT_NAME_FROM_GROUP].Pais) AS P ON P.PAIS_NOMBRE = M.CIRCUITO_PAIS
	WHERE	CIRCUITO_CODIGO IS NOT NULL AND 
			CIRCUITO_NOMBRE IS NOT NULL AND 
			PAIS_NOMBRE IS NOT NULL	
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_sector AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Sector (CODIGO_SECTOR, SECTOR_DISTANCIA, SECTOR_TIPO, CIRCUITO_CODIGO)
	SELECT DISTINCT M.CODIGO_SECTOR, M.SECTOR_DISTANCIA, M.SECTO_TIPO, C.CIRCUITO_CODIGO
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT CIRCUITO_CODIGO, CIRCUITO_NOMBRE, PAIS_CODIGO FROM [SELECT_NAME_FROM_GROUP].Circuito) AS C ON C.CIRCUITO_CODIGO = M.CIRCUITO_CODIGO
	WHERE	CODIGO_SECTOR IS NOT NULL AND 
			SECTOR_DISTANCIA IS NOT NULL AND 
			SECTO_TIPO IS NOT NULL AND 
			C.CIRCUITO_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_carrera AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Carrera (CODIGO_CARRERA, CARRERA_FECHA, CARRERA_CLIMA, CARRERA_TOTAL_CARRERA, CARRERA_CANT_VUELTAS, CIRCUITO_CODIGO)
	SELECT DISTINCT M.CODIGO_CARRERA, M.CARRERA_FECHA, M.CARRERA_CLIMA, M.CARRERA_TOTAL_CARRERA, M.CARRERA_CANT_VUELTAS, C.CIRCUITO_CODIGO
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT CIRCUITO_CODIGO, CIRCUITO_NOMBRE, PAIS_CODIGO FROM [SELECT_NAME_FROM_GROUP].Circuito) AS C ON C.CIRCUITO_CODIGO = M.CIRCUITO_CODIGO
	WHERE CODIGO_CARRERA IS NOT NULL AND CARRERA_FECHA IS NOT NULL AND CARRERA_CLIMA IS NOT NULL AND CARRERA_TOTAL_CARRERA IS NOT NULL AND CARRERA_CANT_VUELTAS IS NOT NULL AND C.CIRCUITO_CODIGO IS NOT NULL
END
GO

/*CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_neumatico AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Neumatico (ID_NEUMATICO, NEUMATICO_NRO_SERIE, PARADA_INGRESO, PARADA_EGRESO, NEUMATICO_TIPO_ID)
	SELECT DISTINCT M.ID_NEUMATICO, M.NEUMATICO_NRO_SERIE, I.PARADA_BOX, E.PARADA_BOX, T.ID_TIPO_NEUMATICO
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT ID_TIPO_NEUMATICO, TIPO_DESCRIPCION FROM [SELECT_NAME_FROM_GROUP].Tipo_Neumatico) AS T ON T.ID_TIPO_NEUMATICO = M.NEUMATICO_TIPO_ID
	JOIN (SELECT ID_PARADA_BOX, PARADA_BOX_TIEMPO, PARADA_BOX_VUELTO FROM [SELECT_NAME_FROM_GROUP].Tipo_Neumatico) AS I ON I.PARADA_BOX=M.PARADA_INGRESO
	JOIN (SELECT ID_PARADA_BOX, PARADA_BOX_TIEMPO, PARADA_BOX_VUELTO FROM [SELECT_NAME_FROM_GROUP].Tipo_Neumatico) AS E ON E.PARADA_BOX=M.PARADA_EGRESO
	WHERE ID_NEUMATICO IS NOT NULL AND NEUMATICO_NRO_SERIE IS NOT NULL AND PARADA_INGRESO IS NOT NULL AND PARADA_EGRESO IS NOT NULL AND NEUMATICO_TIPO_ID IS NOT NULL
END
GO
VER ESTE TEMA PORQUE CAMBIARON LOS CAMPOS DE LA TABLA MAESTRA EN LA FE DE ERRATAS*/

CREATE PROCEDURE [SELECT_NAME_FROM_GROUP].migracion_telemetria_motor AS
BEGIN
	INSERT INTO [SELECT_NAME_FROM_GROUP].Telemetria_Motor (TELE_MOTOR_POTENCIA, TELE_MOTOR_RPM, TELE_MOTOR_TEMP_ACEITE, TELE_MOTOR_TEMP_AGUA, MOTOR_ID)
	SELECT DISTINCT M.TELE_MOTOR_POTENCIA, M.TELE_MOTOR_RPM, M.TELE_MOTOR_TEMP_ACEITE, M.TELE_MOTOR_TEMP_AGUA, MOT.MOTOR_ID
	FROM [gd_esquema].Maestra AS M
	JOIN (SELECT MOTOR_ID, MOTOR_MODELO, MOTOR_NRO_SERIE FROM [SELECT_NAME_FROM_GROUP].Motor) AS MOT ON MOT.MOTOR_NRO_SERIE=M.TELE_MOTOR_NRO_SERIE
	WHERE TELE_MOTOR_POTENCIA IS NOT NULL AND TELE_MOTOR_RPM IS NOT NULL AND TELE_MOTOR_TEMP_ACEITE IS NOT NULL AND TELE_MOTOR_TEMP_AGUA IS NOT NULL AND MOTOR_ID IS NOT NULL
END
GO

-- Comienza migracion
BEGIN TRANSACTION
BEGIN TRY
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_motor
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_caja_cambios
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_bandera
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_parada_box
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_freno
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_tipo_neumatico
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_posicion
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_pais
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_piloto
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_escuderia
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_auto
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_circuito
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_sector
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_carrera
	--EXECUTE [SELECT_NAME_FROM_GROUP].migracion_neumatico
	EXECUTE [SELECT_NAME_FROM_GROUP].migracion_telemetria_motor
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
		THROW 51000, 'Se produjo un error durante la migración', 1;
END CATCH
BEGIN
COMMIT TRANSACTION
END

-- Muestro las tablas finales
SELECT * FROM [SELECT_NAME_FROM_GROUP].Motor
SELECT * FROM [SELECT_NAME_FROM_GROUP].Caja_Cambios
SELECT * FROM [SELECT_NAME_FROM_GROUP].Bandera
SELECT * FROM [SELECT_NAME_FROM_GROUP].Parada_Box
SELECT * FROM [SELECT_NAME_FROM_GROUP].Freno ORDER BY FRENO_TAMANIO_DISCO
SELECT * FROM [SELECT_NAME_FROM_GROUP].Tipo_Neumatico
SELECT * FROM [SELECT_NAME_FROM_GROUP].Posicion
SELECT * FROM [SELECT_NAME_FROM_GROUP].Pais
SELECT * FROM [SELECT_NAME_FROM_GROUP].Piloto
SELECT * FROM [SELECT_NAME_FROM_GROUP].Escuderia 
SELECT * FROM [SELECT_NAME_FROM_GROUP].Auto ORDER BY ID_ESCUDERIA
SELECT * FROM [SELECT_NAME_FROM_GROUP].Circuito
SELECT * FROM [SELECT_NAME_FROM_GROUP].Sector
SELECT * FROM [SELECT_NAME_FROM_GROUP].Carrera
SELECT * FROM [SELECT_NAME_FROM_GROUP].Telemetria_Motor

SELECT * FROM gd_esquema.Maestra

/*
SELECT * FROM [SELECT_NAME_FROM_GROUP].Neumatico
SELECT * FROM [SELECT_NAME_FROM_GROUP].Telemetria_Neumatico
SELECT * FROM [SELECT_NAME_FROM_GROUP].Telemetria_Freno
SELECT * FROM [SELECT_NAME_FROM_GROUP].Telemetria_Motor
SELECT * FROM [SELECT_NAME_FROM_GROUP].Telemetria_Caja_Cambios
SELECT * FROM [SELECT_NAME_FROM_GROUP].Medicion
SELECT * FROM [SELECT_NAME_FROM_GROUP].Incidente
SELECT * FROM [SELECT_NAME_FROM_GROUP].Incidente_X_Auto
*/


