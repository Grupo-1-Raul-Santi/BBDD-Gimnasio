--Tabla TIPOS
CREATE TABLE TIPOS (
    ID_TIPO NVARCHAR2(6),
    NOMBRE_TIPO NVARCHAR2(50) NOT NULL,
    CONSTRAINT ID_TIPO_PK PRIMARY KEY (ID_TIPO)
);
--Tabla SALAS
CREATE TABLE SALAS (
    ID_SALA NVARCHAR2(6),
    NOMBRE_SALA NVARCHAR2(50) NOT NULL,
    EXTENSION NUMBER(6),
    CONSTRAINT ID_SALA_PK PRIMARY KEY (ID_SALA)
);

--Tabla MONITORES
CREATE TABLE MONITORES (
    ID_MONITOR NVARCHAR2(6),
    NOMBRE_MONITOR NVARCHAR2(50) NOT NULL,
    APELLIDO_MONITOR NVARCHAR2(50),
    DNI NVARCHAR2(10) NOT NULL UNIQUE,
    DIRECCION NVARCHAR2(50),
    CONSTRAINT ID_MONITOR_PK PRIMARY KEY (ID_MONITOR)
);

--Tabla ACTIVIDADES
CREATE TABLE ACTIVIDADES (
    ID_ACTIVIDAD NVARCHAR2(6),
    DESCRIPCION NVARCHAR2(50),
    ID_TIPO NVARCHAR2(6),
    ID_SALA NVARCHAR2(6),
    ID_MONITOR NVARCHAR2(6),
    CONSTRAINT ID_ACTIVIDAD_PK PRIMARY KEY (ID_ACTIVIDAD),
    CONSTRAINT ID_TIPO_FK FOREIGN KEY (ID_TIPO) REFERENCES TIPOS (ID_TIPO),
    CONSTRAINT ID_SALA_FK FOREIGN KEY (ID_SALA) REFERENCES SALAS (ID_SALA),
    CONSTRAINT ID_MONITOR_FK FOREIGN KEY (ID_MONITOR) REFERENCES MONITORES (ID_MONITOR)
);

--Tabla SOCIOS
CREATE TABLE SOCIOS (
    ID_SOCIO NVARCHAR2(6),
    NOMBRE_SOCIO NVARCHAR2(50) NOT NULL,
    APELLIDO_SOCIO NVARCHAR2(50),
    DNI NVARCHAR2(10) NOT NULL UNIQUE,
    DIRECCION NVARCHAR2(50),
    CONSTRAINT ID_SOCIO_PK PRIMARY KEY (ID_SOCIO)
);

--Tabla REALIZAN
CREATE TABLE REALIZAN (
    ID_SOCIO NVARCHAR2(6),
    ID_ACTIVIDAD NVARCHAR2(6),
    FECHA NVARCHAR2(250),
    CONSTRAINT REALIZAN_PK PRIMARY KEY (ID_SOCIO, ID_ACTIVIDAD, FECHA),
    CONSTRAINT ID_SOCIO_FK FOREIGN KEY (ID_SOCIO) REFERENCES SOCIOS (ID_SOCIO),
    CONSTRAINT ID_ACTIVIDAD_FK FOREIGN KEY (ID_ACTIVIDAD) REFERENCES ACTIVIDADES (ID_ACTIVIDAD)
);

--Borrar tablas
DROP TABLE REALIZAN;
DROP TABLE SOCIOS;
DROP TABLE ACTIVIDADES;
DROP TABLE MONITORES;
DROP TABLE SALAS;
DROP TABLE TIPOS;

--SECUENCIAS

--Creaci?n de id secuencial ACTIVIDADES
CREATE SEQUENCE ACT_SEQ
START WITH 1
INCREMENT BY 1;

--Creaci?n de id secuencial MONITORES
CREATE SEQUENCE MON_SEQ
START WITH 1
INCREMENT BY 1;

--Creaci?n de id secuencial REALIZAN
CREATE SEQUENCE REA_SEQ
START WITH 1
INCREMENT BY 1;

--Creaci?n de id secuencial SALAS
CREATE SEQUENCE SALA_SEQ
START WITH 1
INCREMENT BY 1;

--Creaci?n de id secuencial SOCIOS
CREATE SEQUENCE SOCIO_SEQ
START WITH 1
INCREMENT BY 1;

--Creaci?n de id secuencial TIPOS
CREATE SEQUENCE TIPO_SEQ
START WITH 1
INCREMENT BY 1;

--TRIGGERS

--Creaci?n TRIGGER en ACTIVIDADES
CREATE TRIGGER TRIG_ACT
BEFORE INSERT ON ACTIVIDADES
FOR EACH ROW
BEGIN
SELECT ACT_SEQ.NEXTVAL INTO :NEW.ID_ACTIVIDAD FROM DUAL;
END;

--Creaci?n TRIGGER en MONITORES
CREATE TRIGGER TRIG_MON
BEFORE INSERT ON MONITORES
FOR EACH ROW
BEGIN
SELECT MON_SEQ.NEXTVAL INTO :NEW.ID_MONITOR FROM DUAL;
END;

--Creaci?n TRIGGER en REALIZAN
CREATE TRIGGER TRIG_REA
BEFORE INSERT ON REALIZAN
FOR EACH ROW
BEGIN
SELECT REA_SEQ.NEXTVAL INTO :NEW.ID_SOCIO FROM DUAL;
END;

--Creaci?n TRIGGER en SALAS
CREATE TRIGGER TRIG_SALA
BEFORE INSERT ON SALAS
FOR EACH ROW
BEGIN
SELECT SALA_SEQ.NEXTVAL INTO :NEW.ID_SALA FROM DUAL;
END;

--Creaci?n TRIGGER en TIPOS
CREATE TRIGGER TRIG_TIPO
BEFORE INSERT ON TIPOS
FOR EACH ROW
BEGIN
SELECT TIPO_SEQ.NEXTVAL INTO :NEW.ID_TIPO FROM DUAL;
END;

--Creaci?n TRIGGER en SOCIOS
CREATE TRIGGER TRIG_SOCIO
BEFORE INSERT ON SOCIOS
FOR EACH ROW
BEGIN
SELECT SOCIO_SEQ.NEXTVAL INTO :NEW.ID_SOCIO FROM DUAL;
END;

--INSERTS

--1? Insertar TIPOS
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('SPINING');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('BODY PUMP');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('ZUMBA');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('YOGA');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('PILATES');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('GAP');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('ESPALDA SANA');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('CROSSFIT');
INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ('BODY COMBAT');

--2? Insertar SALAS
INSERT INTO SALAS (NOMBRE_SALA, EXTENSION) VALUES ('SALA 1', 200);
INSERT INTO SALAS (NOMBRE_SALA, EXTENSION) VALUES ('SALA 2', 600);
INSERT INTO SALAS (NOMBRE_SALA, EXTENSION) VALUES ('SALA 3', 300);
INSERT INTO SALAS (NOMBRE_SALA, EXTENSION) VALUES ('SALA 4', 700);
INSERT INTO SALAS (NOMBRE_SALA, EXTENSION) VALUES ('SALA 5', 800);

--3? Insertar MONITORES
INSERT INTO MONITORES (NOMBRE_MONITOR, APELLIDO_MONITOR, DNI, DIRECCION) VALUES ('RAUL', 'MARTIN', '76543219Z', 'ZARAGOZA');
INSERT INTO MONITORES (NOMBRE_MONITOR, APELLIDO_MONITOR, DNI, DIRECCION) VALUES ('SANTI', 'BALLESTIN', '25473819P', 'ZARAGOZA');
--4?Insertar ACTIVIDADES
INSERT INTO ACTIVIDADES (DESCRIPCION, ID_TIPO, ID_SALA, ID_MONITOR) VALUES ('SPINING EN SALA 1', 1, 1, 1);
INSERT INTO ACTIVIDADES (DESCRIPCION, ID_TIPO, ID_SALA, ID_MONITOR) VALUES ('ZUMBA EN SALA 3', 3, 3, 1);
INSERT INTO ACTIVIDADES (DESCRIPCION, ID_TIPO, ID_SALA, ID_MONITOR) VALUES ('YOGA EN SALA 4', 4, 4, 2);
INSERT INTO ACTIVIDADES (DESCRIPCION, ID_TIPO, ID_SALA, ID_MONITOR) VALUES ('PILATES EN SALA 5', 5, 5, 1);
INSERT INTO ACTIVIDADES (DESCRIPCION, ID_TIPO, ID_SALA, ID_MONITOR) VALUES ('GAP EN SALA 1', 6, 1, 2);
--5?Insertar SOCIOS
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('JOSERRA', 'GIMENO', '18493728P', 'C/JOSERRA');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('JOSETE', 'MELENDEZ', '18493729P', 'C/JOSETE');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('MARTA', 'HUSILLOS', '18493730P', 'C/MARTA');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('SANDRA', 'FANTONI', '18493731P', 'C/FANTONI');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('PABLO', 'DEVICENTE', '18493732P', 'C/PABLO');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('IGNACIO', 'VELA', '18493733P', 'C/VELA');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('LARA', 'FERRER', '18493734P', 'C/FERRER');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('MONICA', 'CASAS', '18493735P', 'C/CASAS');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('DANIEL', 'GARCIA', '184937236P', 'C/GARCIA');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('JAVIER', 'GIL', '18493737P', 'C/GIL');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('MANUEL', 'ALVIRA', '18493738P', 'C/ALVIRA');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('PHILIPA', 'BATHER', '18493739P', 'C/PHILIPA');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('JORGE', 'FERNANDEZ', '18493740P', 'C/JORGE');
INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ('JOSE', 'RODRIGEZ', '18493741P', 'C/JOSE');
--6?Insertar REALIZAN
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (1, 2, '12/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (2, 1, '15/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (3, 5, '13/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (12, 3, '13/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (5, 4, '11/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (7, 1, '15/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (9, 5, '13/04/2021');
INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (8, 3, '23/04/2021');