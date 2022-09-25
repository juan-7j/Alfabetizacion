-- https://www.db4free.net/signup.php

-- D2~+6SrMBnnPS[ZE

-- create database control_servicio_social;
-- use control_servicio_social;
-- CREATE DATABASE id19409844_controlserviciosocial;
-- use id19409844_controlserviciosocial;

CREATE TABLE SUPER_ADMINS(

	IDENTIDAD VARCHAR(15) NOT NULL PRIMARY KEY,
    NOMBRES VARCHAR(30) NOT NULL,
    APELLIDOS VARCHAR(30) NOT NULL,
    EDAD INT NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    CELULAR VARCHAR(15) NOT NULL,
    CORREO VARCHAR(70) NOT NULL,
    ROL VARCHAR(15) NOT NULL,
    OCUPACION VARCHAR(30) NOT NULL,
    CLAVE_ESTUDIANTES VARCHAR(30) NOT NULL,
    CLAVE_DIRECTIVOS VARCHAR(30) NOT NULL,
    CLAVE_ADMINS VARCHAR(30) NOT NULL,
    CONTRA VARCHAR(100) NOT NULL,
    TYC VARCHAR(7) NOT NULL
);

CREATE TABLE ADMINS(

	IDENTIDAD VARCHAR(15) NOT NULL PRIMARY KEY,
    NOMBRES VARCHAR(30) NOT NULL,
    APELLIDOS VARCHAR(30) NOT NULL,
    EDAD INT NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    CELULAR VARCHAR(15) NOT NULL,
    CORREO VARCHAR(70) NOT NULL,
    ROL VARCHAR(15) NOT NULL,
    OCUPACION VARCHAR(30) NOT NULL,
    DONDE_LABORA VARCHAR(30) NOT NULL,
    CONTRA VARCHAR(100) NOT NULL,
    TYC VARCHAR(7) NOT NULL

);

CREATE TABLE DIRECTIVOS (

	IDENTIDAD VARCHAR(15) NOT NULL PRIMARY KEY,
    NOMBRES VARCHAR(30) NOT NULL,
    APELLIDOS VARCHAR(30) NOT NULL,
    EDAD INT NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    CELULAR VARCHAR(15) NOT NULL,
    CORREO VARCHAR(70) NOT NULL,
    ROL VARCHAR(15) NOT NULL,
    OCUPACION VARCHAR(30) NOT NULL,
    DONDE_LABORA VARCHAR(30) NOT NULL,
    CONTRA VARCHAR(100) NOT NULL,
    TYC VARCHAR(7) NOT NULL
);


CREATE TABLE ESTUDIANTES (

	IDENTIDAD VARCHAR(15) NOT NULL PRIMARY KEY,
    NOMBRES VARCHAR(30) NOT NULL,
    APELLIDOS VARCHAR(30) NOT NULL,
    EDAD INT NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    CELULAR VARCHAR(15) NOT NULL,
    CORREO VARCHAR(70) NOT NULL,
    ROL VARCHAR(15) NOT NULL,
    GRADO VARCHAR(5) NOT NULL,
    NOMBRE_TECNICA VARCHAR(30) NOT NULL,
    CONTRA VARCHAR(100) NOT NULL,
    TYC VARCHAR(7) NOT NULL

);
CREATE TABLE TAREAS (

    ID_TAREA INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_CREADOR VARCHAR(15) NOT NULL,
    NOMBRE_TAREA VARCHAR(40) NOT NULL,
    DESCRIPCION TEXT(300) NOT NULL,
    FECHA_CREACION DATE NOT NULL,
    FECHA_LIMITE DATE NOT NULL,
    NUMERO_HORAS INT NOT NULL,
    OBJETIVO VARCHAR(200) NOT NULL,
    PARA_QUE_GRADO VARCHAR(15) NOT NULL,
    ESTADO_TAREA VARCHAR(15) NOT NULL,
    N_PERSONAS INT NOT NULL,
	FOREIGN KEY (ID_CREADOR) REFERENCES DIRECTIVOS(IDENTIDAD)

);

CREATE TABLE POSTULADOS (

    ID_POSTULACION INT AUTO_INCREMENT PRIMARY KEY,
    ID_POSTULADO VARCHAR(15) NOT NULL,
    ID_TAREA int(15) NOT NULL,
    FECHA_POSTULACION DATE NOT NULL,
    ESTADO_POSTULACION VARCHAR(15) NOT NULL,
    FOREIGN KEY (ID_POSTULADO) REFERENCES ESTUDIANTES(IDENTIDAD),
    FOREIGN KEY (ID_TAREA) REFERENCES TAREAS(ID_TAREA)
);


CREATE TABLE HORAS (
    ID_DATO INT AUTO_INCREMENT PRIMARY KEY,
    ID_ESTUDIANTE VARCHAR(15) NOT NULL,
    ID_TAREA int not NULL,
    NOMBRE_TAREA VARCHAR(100) NOT NULL,
    FECHA_CREACION DATE NOT NULL,
    HORAS INT NOT NULL,
    FOREIGN KEY (ID_TAREA) REFERENCES TAREAS(ID_TAREA),
    FOREIGN KEY (ID_ESTUDIANTE) REFERENCES ESTUDIANTES(IDENTIDAD)
);


CREATE TABLE RETIRADOS (
    ID_RETIRO INT AUTO_INCREMENT PRIMARY KEY,
    ID_RETIRADO VARCHAR(15) NOT NULL,
    NOMBRES VARCHAR(30) NOT NULL,
    APELLIDOS VARCHAR(30) NOT NULL,
    EDAD INT NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    FECHA_RETIRO DATE NOT NULL,
    CELULAR VARCHAR(15) NOT NULL,
    CORREO VARCHAR(70) NOT NULL,
    ROL VARCHAR(15) NOT NULL,
    GRADO_CURSADO VARCHAR(5) NOT NULL,
    NOMBRE_TECNICA VARCHAR(30) NOT NULL,
    TOTAl_HORAS INT NOT NULL,
    TYC VARCHAR(7) NOT NULL,
    FOREIGN KEY(ID_RETIRADO) REFERENCES ESTUDIANTES(IDENTIDAD)
);

CREATE TABLE EGRESADOS (
    ID_EGRESO INT AUTO_INCREMENT PRIMARY KEY,
    ID_EGRESADO VARCHAR(15) NOT NULL,
    NOMBRES VARCHAR(30) NOT NULL,
    APELLIDOS VARCHAR(30) NOT NULL,
    EDAD INT NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    FECHA_RETIRO DATE NOT NULL,
    CELULAR VARCHAR(15) NOT NULL,
    CORREO VARCHAR(70) NOT NULL,
    ROL VARCHAR(15) NOT NULL,
    GRADO_CURSADO VARCHAR(5) NOT NULL,
    NOMBRE_TECNICA VARCHAR(30) NOT NULL,
    TOTAl_HORAS INT NOT NULL,
    TYC VARCHAR(7) NOT NULL,
    FOREIGN KEY (ID_EGRESADO) REFERENCES ESTUDIANTES(IDENTIDAD)
);

CREATE TABLE MODIFICACIONES(

    ID_MODIFICACION INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_MODIFICADOR VARCHAR(15) NOT NULL,
    FECHA_MODIFICACION DATE NOT NULL,
    TIPO_MODIFICACION VARCHAR(100) NOT NULL,
    FOREIGN KEY(ID_MODIFICADOR) REFERENCES DIRECTIVOS(IDENTIDAD)

);

INSERT INTO SUPER_ADMINS (IDENTIDAD, NOMBRES, APELLIDOS, EDAD, FECHA_REGISTRO, CELULAR, CORREO, ROL, OCUPACION, CLAVE_ESTUDIANTES, CLAVE_DIRECTIVOS, CLAVE_ADMINS, CONTRA, TYC)
VALUES ('1011', 'Juan', 'Uribe',16, '2006-01-08', '3187001941', 'juanjose.uribe@inemjose.edu.co', 'super-admin', 'revisar', 'est1','dir1','adm1', 'felizComoSiempre', 'acepto');

