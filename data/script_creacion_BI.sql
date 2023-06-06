USE GD1C2023
GO

/* Creacion de tablas dimensionales */

CREATE TABLE MargeCreoQueOdioGDD.BI_Tiempo (
	ID_TIEMPO INT IDENTITY(1,1),
	ANIO INT NOT NULL,
	MES INT NOT NULL,
	PRIMARY KEY (ID_TIEMPO)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Dia (
	ID_DIA INT IDENTITY(1,1),
	DIA NVARCHAR(50) NOT NULL,
	PRIMARY KEY (ID_DIA)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Rango_Horario (
	ID_RANGO_HORARIO INT IDENTITY(1,1),
	HORA_INICIO INT NOT NULL,
	HORA_FIN INT NOT NULL,
	PRIMARY KEY (ID_RANGO_HORARIO)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Provincia (
	ID_PROVINCIA INT IDENTITY(1,1),
	PROVINCIA NVARCHAR(255) NOT NULL,
	PRIMARY KEY (ID_PROVINCIA)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Localidad (
	ID_LOCALIDAD INT IDENTITY(1,1),
	LOCALIDAD NVARCHAR(255) NOT NULL,
	ID_PROVINCIA INT NOT NULL, -- FK
	PRIMARY KEY (ID_LOCALIDAD)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Direccion (
	ID_DIRECCION INT IDENTITY(1,1),
	DIRECCION NVARCHAR(255) NOT NULL,
	ID_LOCALIDAD INT NOT NULL, -- FK
	PRIMARY KEY (ID_DIRECCION)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Rango_Etario (
	ID_RANGO_ETARIO INT IDENTITY(1,1),
	EDAD_INICIAL INT NOT NULL,
	EDAD_FINAL INT NOT NULL,
	PRIMARY KEY (ID_RANGO_ETARIO)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Tipo_Medio_Pago (
	ID_TIPO_PAGO INT IDENTITY(1,1),
	MEDIO_PAGO NVARCHAR(255) NOT NULL,
	PRIMARY KEY (ID_TIPO_PAGO)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Tipo_Local (
	ID_TIPO_LOCAL INT IDENTITY(1,1),
	TIPO_LOCAL NVARCHAR(255),
	PRIMARY KEY (ID_TIPO_LOCAL)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Categoria_Local (
	ID_CATEGORIA_LOCAL INT IDENTITY(1,1),
	CATEGORIA NVARCHAR(255),
	ID_TIPO_LOCAL INT NOT NULL, -- FK
	PRIMARY KEY (ID_CATEGORIA_LOCAL)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Local (
	ID_LOCAL INT IDENTITY(1,1),
	NOMBRE NVARCHAR(255),
	DESCRIPCION NVARCHAR(255),
	ID_CATEGORIA INT, -- FK
	ID_DIRECCION INT, -- FK
	PRIMARY KEY (ID_LOCAL)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Tipo_Movilidad (
	ID_TIPO_MOVILIDAD INT IDENTITY(1,1),
	TIPO_MOVILIDAD NVARCHAR(255),
	PRIMARY KEY (ID_TIPO_MOVILIDAD)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Tipo_Paquete (
	ID_TIPO_PAQUETE INT IDENTITY(1,1),
	TIPO_PAQUETE NVARCHAR(255),
	MEDIDA_ANCHO INT,
	MEDIDA_LARGO INT,
	MEDIDA_ALTO INT,
	PESO_MAXIMO FLOAT,
	VALOR_ASEGURADO FLOAT, -- TODO: VAN TODOS LOS CAMPOS?
	PRIMARY KEY (ID_TIPO_PAQUETE)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Estado_Pedido (
	ID_ESTADO_PEDIDO INT IDENTITY(1,1),
	ESTADO NVARCHAR(255),
	PRIMARY KEY (ID_ESTADO_PEDIDO)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Estado_Mensajeria (
	ID_ESTADO_MENSAJERIA INT IDENTITY(1,1),
	ESTADO NVARCHAR(255),
	PRIMARY KEY (ID_ESTADO_MENSAJERIA)
);

CREATE TABLE MargeCreoQueOdioGDD.BI_Estado_Reclamo (
	ID_ESTADO_RECLAMO INT IDENTITY(1,1),
	ESTADO NVARCHAR(255),
	PRIMARY KEY (ID_ESTADO_RECLAMO)
);

/* Alter tables */

ALTER TABLE MargeCreoQueOdioGDD.BI_Localidad
ADD CONSTRAINT FK_BI_PROVINCIA_ID
FOREIGN KEY (ID_PROVINCIA) REFERENCES MargeCreoQueOdioGDD.BI_Provincia

ALTER TABLE MargeCreoQueOdioGDD.BI_Direccion
ADD CONSTRAINT FK_BI_LOCALIDAD_ID
FOREIGN KEY (ID_LOCALIDAD) REFERENCES MargeCreoQueOdioGDD.BI_Localidad

ALTER TABLE MargeCreoQueOdioGDD.BI_Categoria_Local
ADD CONSTRAINT FK_BI_TIPO_LOCAL_ID
FOREIGN KEY (ID_TIPO_LOCAL) REFERENCES MargeCreoQueOdioGDD.BI_Tipo_Local

ALTER TABLE MargeCreoQueOdioGDD.BI_Local
ADD CONSTRAINT FK_BI_CATEGORIA_LOCAL_ID
FOREIGN KEY (ID_CATEGORIA_LOCAL) REFERENCES MargeCreoQueOdioGDD.BI_Categoria_Local

ALTER TABLE MargeCreoQueOdioGDD.BI_Local
ADD CONSTRAINT FK_BI_DIRECCION_LOCAL_ID
FOREIGN KEY (ID_DIRECCION) REFERENCES MargeCreoQueOdioGDD.BI_Direccion

/* Creacion de procedures */


/* Creacion de vistas */