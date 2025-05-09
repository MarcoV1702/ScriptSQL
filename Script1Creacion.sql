/*   SCRIPT SQL  TRAIDO DE POWER MODELLER   */

CREATE TABLE USUARIO (
       DNI BIGINT NOT NULL,                              
       NOMBRE CHAR(15) NOT NULL,                              
       APELLIDO CHAR(15) NOT NULL,                              
       NOMBRE_DE_USUARIO BIGINT NOT NULL,                              
       CONTRASEŅA BIGINT NOT NULL,                              
       PRIMARY KEY(DNI)
);

CREATE TABLE TORNEO (
       NUMERO_DE_TORNEO BIGINT NOT NULL,                              
       LLAVE BIGINT NOT NULL,                              
       HISTORIAL BIGINT NOT NULL,                              
       CANTIDAD_DE_EQUIPOS BIGINT NOT NULL,                              
       FECHA BIGINT NOT NULL,                              
       PREMIO BIGINT NOT NULL,                              
       PRIMARY KEY(NUMERO_DE_TORNEO)
);

CREATE TABLE ALMACEN (
       NUMERO_DE_VENTA BIGINT NOT NULL,                              
       PRODUCTO BIGINT NOT NULL,                              
       PRIMARY KEY(NUMERO_DE_VENTA)
);

CREATE TABLE CLIENTE (
       DNI BIGINT NOT NULL,                              
       NOMBRE CHAR(15) NOT NULL,                              
       APELLIDO CHAR(15) NOT NULL,                              
       DIRECCION CHAR(20) NOT NULL,                              
       TELEFONO BIGINT NOT NULL,                              
       PRIMARY KEY(DNI)
);

CREATE TABLE EQUIPO (
       NOMBRE_DEL_EQUIPO BIGINT NOT NULL,                              
       NOMBRE_TITULAR BIGINT NOT NULL,                              
       APELLIDO_TITULAR BIGINT NOT NULL,                              
       TELEFONO_TITULAR BIGINT NOT NULL,                              
       DIRECCION_TITULAR BIGINT NOT NULL,                              
       PRIMARY KEY(NOMBRE_DEL_EQUIPO)
);

CREATE TABLE GERENTE (
     DNI BIGINT NOT NULL,                              
     REPORTES BIGINT NOT NULL,                              
     PRIMARY KEY(DNI),
     FOREIGN KEY(DNI)REFERENCES USUARIO(DNI)
);

CREATE TABLE RECEPCIONISTA (
     DNI BIGINT NOT NULL,                              
     TURNO BIGINT NOT NULL,                              
     PRIMARY KEY(DNI),
     FOREIGN KEY(DNI)REFERENCES USUARIO(DNI)
);

CREATE TABLE RESERVA (
	NUMERO_RESERVA BIGINT NOT NULL,                              
    DNI BIGINT NOT NULL,                              
    TIPO CHAR(15) NOT NULL,                              
    FECHA_HORA DATETIME NOT NULL,                              
    METODO_PAGO BIGINT NOT NULL,                              
    PRIMARY KEY(NUMERO_RESERVA),
    FOREIGN KEY(DNI)REFERENCES CLIENTE(DNI)
);

CREATE TABLE ROL (
     NOMBRE_ROL BIGINT NOT NULL,                              
     DNI BIGINT NOT NULL,                              
     PERMISOS BIGINT NOT NULL,                              
     PRIMARY KEY(NOMBRE_ROL),
     FOREIGN KEY(DNI)REFERENCES USUARIO(DNI)
);

CREATE TABLE HISTORIAL_DE_RESERVA(
     RESERVA BIGINT NOT NULL,                              
     DNI BIGINT NOT NULL,                              
     CANTIDAD_DE_RESERVAS BIGINT NOT NULL,                              
     PRIMARY KEY(RESERVA,DNI),
     FOREIGN KEY(DNI)REFERENCES CLIENTE(DNI)
);

CREATE TABLE ENCARGADO_DE(
     DNI BIGINT NOT NULL,                              
     NUMERO_DE_VENTA BIGINT NOT NULL,                              
     PRIMARY KEY(DNI,NUMERO_DE_VENTA),
     FOREIGN KEY(DNI)REFERENCES RECEPCIONISTA(DNI),
     FOREIGN KEY(NUMERO_DE_VENTA)REFERENCES ALMACEN(NUMERO_DE_VENTA)
);

CREATE TABLE GESTIONA(
     NUMERO_RESERVA BIGINT NOT NULL,                              
     DNI BIGINT NOT NULL,                              
     PRIMARY KEY(NUMERO_RESERVA,DNI),
     FOREIGN KEY(NUMERO_RESERVA)REFERENCES RESERVA(NUMERO_RESERVA),
     FOREIGN KEY(DNI)REFERENCES USUARIO(DNI)
);

CREATE TABLE SE_ENCARGA_DE(
     DNI BIGINT NOT NULL,                              
     NUMERO_DE_TORNEO BIGINT NOT NULL,                              
     PRIMARY KEY(DNI,NUMERO_DE_TORNEO),
     FOREIGN KEY(DNI)REFERENCES USUARIO(DNI),
     FOREIGN KEY(NUMERO_DE_TORNEO)REFERENCES TORNEO(NUMERO_DE_TORNEO)
);

CREATE TABLE PARTICIPA_EN(
     NOMBRE_DEL_EQUIPO BIGINT NOT NULL,                              
     NUMERO_DE_TORNEO BIGINT NOT NULL,                              
     PRIMARY KEY(NOMBRE_DEL_EQUIPO,NUMERO_DE_TORNEO),
     FOREIGN KEY(NOMBRE_DEL_EQUIPO)REFERENCES EQUIPO(NOMBRE_DEL_EQUIPO),
     FOREIGN KEY(NUMERO_DE_TORNEO)REFERENCES TORNEO(NUMERO_DE_TORNEO)
);

