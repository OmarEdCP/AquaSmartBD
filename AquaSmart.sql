-- DROP DATABASE IF EXISTS aquasmart;
CREATE DATABASE aquasmart;
USE aquasmart;

/* CATALOGO ESTADO */
CREATE TABLE estado (
    idEstado INT NOT NULL AUTO_INCREMENT,
    nombreEstado VARCHAR(80) NOT NULL,
    CONSTRAINT pk_idEstado PRIMARY KEY (idEstado)
);

/* CATALOGO CIUDAD */
CREATE TABLE ciudad (
    idCiudad INT NOT NULL AUTO_INCREMENT,
    nombreCiudad VARCHAR(80) NOT NULL,
    idEstado INT NOT NULL,
    CONSTRAINT pk_idCiudad PRIMARY KEY (idCiudad),
    CONSTRAINT fk_EstadoCiudad FOREIGN KEY (idEstado)
        REFERENCES estado (idEstado)
);

/* CATALOGO USUARIO */
CREATE TABLE usuario (
    idUsuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    contrasenia VARCHAR(256) NOT NULL,
    foto LONGTEXT,
    estatus INT NOT NULL DEFAULT 1,
    rol INT NOT NULL DEFAULT 3,
    lastToken VARCHAR(65) DEFAULT "",
    dateLastToken DATETIME,
    CONSTRAINT pk_idUsuario PRIMARY KEY (idUsuario)
);

/* CATALOGO PERSONA */
CREATE TABLE persona (
    idPersona INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(75) NOT NULL,
    apellidoM VARCHAR(65),
    apellidoP VARCHAR(65),
    edad INT NOT NULL,
    estatus INT NOT NULL DEFAULT 1,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    idCiudad INT NOT NULL,
    idUsuario INT NOT NULL,
    CONSTRAINT pk_idPersona PRIMARY KEY (idPersona),
    CONSTRAINT fk_idCiudadPersona FOREIGN KEY (idCiudad)
        REFERENCES ciudad (idCiudad),
    CONSTRAINT fk_idUsuarioPersona FOREIGN KEY (idUsuario)
        REFERENCES usuario (idUsuario)
);

CREATE TABLE cargo(
idCargo INT NOT NULL AUTO_INCREMENT,
nombreCargo varchar(255) NOT NULL,
descripcion longtext NOT NULL,
CONSTRAINT pk_idCargo PRIMARY KEY (idCargo)
);

/* CATALOGO EMPLEADO */
CREATE TABLE empleado (
    idEmpleado INT NOT NULL AUTO_INCREMENT,
    rfc VARCHAR(13) NOT NULL,
    idCargo INT NOT NULL,
    idPersona INT NOT NULL,
    CONSTRAINT pk_idEmpleado PRIMARY KEY (idEmpleado),
    CONSTRAINT fk_idPersonaEmpleado FOREIGN KEY (idPersona)
        REFERENCES persona (idPersona),
        CONSTRAINT fk_idCargoEmpleado FOREIGN KEY (idCargo)
        REFERENCES cargo (idCargo)
);

/* CATALOGO CLIENTE */
CREATE TABLE cliente (
    idCliente INT NOT NULL AUTO_INCREMENT,
    idPersona INT NOT NULL,
    CONSTRAINT pk_idCliente PRIMARY KEY (idCliente),
    CONSTRAINT fk_idPersonaCliente FOREIGN KEY (idPersona)
        REFERENCES persona (idPersona)
);

/* CATALOGO MEDIDOR */
CREATE TABLE medidor (
    idMedidor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(65) NOT NULL,
    modelo VARCHAR(70) NOT NULL,
    cantidad INT NOT NULL,
    estatus INT NOT NULL DEFAULT 1,
    precio DOUBLE NOT NULL,
    CONSTRAINT pk_idMedidor PRIMARY KEY (idMedidor)
);

/* CATALOGO MEDIDOR */
CREATE TABLE lectura (
    idLectura INT NOT NULL AUTO_INCREMENT,
    estatus INT NOT NULL DEFAULT 1,
    flujo DOUBLE NOT NULL,
    pulsaciones DOUBLE NOT NULL,
    fecha DATETIME NOT NULL,
    idMedidor INT NOT NULL,
    CONSTRAINT pk_idLectura PRIMARY KEY (idLectura),
    CONSTRAINT fk_idMedidorLectura FOREIGN KEY (idMedidor)
        REFERENCES medidor (idMedidor)
);

/* CATALOGO PROPIEDAD */
CREATE TABLE propiedad (
    idPropiedad INT NOT NULL AUTO_INCREMENT,
    numExt VARCHAR(15) NOT NULL,
    numInt VARCHAR(15),
    calle VARCHAR(75) NOT NULL,
    colonia VARCHAR(75) NOT NULL,
    latitud double NOT NULL,
    longitud double NOT NULL,
    codigoP INT NOT NULL,
    foto LONGTEXT,
    estatus INT NOT NULL DEFAULT 1,
    idCliente INT NOT NULL,
    idCiudad INT NOT NULL,
    idMedidor INT NOT NULL,
    CONSTRAINT pk_idPropiedad PRIMARY KEY (idPropiedad),
    CONSTRAINT fk_idClientePropiedad FOREIGN KEY (idCliente)
        REFERENCES cliente (idCliente),
    CONSTRAINT fk_idCiudadPropiedad FOREIGN KEY (idCiudad)
        REFERENCES ciudad (idCiudad),
    CONSTRAINT fk_idMonitorPropiedad FOREIGN KEY (idMedidor)
        REFERENCES medidor (idMedidor)
);

/* CATALOGO TARJETA */
CREATE TABLE tarjeta (
    numTarjeta VARCHAR(16) NOT NULL,
    cvv VARCHAR(10) NOT NULL,
    mes VARCHAR(20) NOT NULL,
    año VARCHAR(4) NOT NULL,
    nombreTitular VARCHAR(150) NOT NULL,
    estatus int not null default 1,
    idCliente INT NOT NULL,
    CONSTRAINT pk_idTarjeta PRIMARY KEY (NumTarjeta),
    CONSTRAINT fk_ClienteTarjeta FOREIGN KEY (IdCliente)
        REFERENCES cliente (IdCliente)
);

/* CATALOGO CATEGORIA */
CREATE TABLE categoria (
    idCategoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(75) NOT NULL,
    descripcion LONGTEXT,
    estatus INT NOT NULL DEFAULT 1,
    precio double not null,
    CONSTRAINT pk_idCategoria PRIMARY KEY (IdCategoria)
);

/* CATALOGO SERVICIO */
CREATE TABLE servicio (
    idServicio INT NOT NULL AUTO_INCREMENT,
    estatus INT NOT NULL DEFAULT 1,
    idPropiedad INT NOT NULL,
    idCliente INT NOT NULL,
    idCategoria INT NOT NULL,
    idCiudad INT NOT NULL,
    CONSTRAINT pk_idServicio PRIMARY KEY (IdServicio),
    CONSTRAINT fk_idPropiedadServicio FOREIGN KEY (IdPropiedad)
        REFERENCES propiedad (IdPropiedad),
    CONSTRAINT fk_idCategoriaServicio FOREIGN KEY (IdCategoria)
        REFERENCES categoria (IdCategoria),
    CONSTRAINT fk_ClienteServicio FOREIGN KEY (IdCliente)
        REFERENCES cliente (IdCliente),
    CONSTRAINT fk_CiudadServicio FOREIGN KEY (IdCiudad)
        REFERENCES ciudad (IdCiudad)
);

/* CATALOGO TICKET */
CREATE TABLE ticket (
    idTicket INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    total DOUBLE NOT NULL,
    subtotal DOUBLE NOT NULL,
    idEmpleado INT NOT NULL,
    idCliente INT NOT NULL,
    numTarjeta VARCHAR(16) NOT NULL,
    CONSTRAINT pk_Ticket PRIMARY KEY (IdTicket),
    CONSTRAINT fk_EmpleadoTicket FOREIGN KEY (IdEmpleado)
        REFERENCES empleado (IdEmpleado),
    CONSTRAINT fk_ClienteTicket FOREIGN KEY (IdCliente)
        REFERENCES cliente (IdCliente),
    CONSTRAINT fk_TarjetaTicket FOREIGN KEY (NumTarjeta)
        REFERENCES tarjeta (NumTarjeta)
);

/* CATALOGO CATEGORIA */
CREATE TABLE detalleServicio (
    idDetalle INT NOT NULL AUTO_INCREMENT,
    descripcion LONGTEXT,
    fecha DATETIME NOT NULL,
    idCliente INT NOT NULL,
    idServicio INT NOT NULL,
    idLectura INT NOT NULL,
    idTicket INT NOT NULL,
    CONSTRAINT pk_Detalle PRIMARY KEY (IdDetalle),
    CONSTRAINT fk_ClienteDetalle FOREIGN KEY (IdCliente)
        REFERENCES cliente (IdCliente),
    CONSTRAINT fk_ServicioeDetalle FOREIGN KEY (IdServicio)
        REFERENCES servicio (IdServicio),
    CONSTRAINT fk_LecturaDetalle FOREIGN KEY (IdLectura)
        REFERENCES lectura (IdLectura),
    CONSTRAINT fk_TicketDetalle FOREIGN KEY (IdTicket)
        REFERENCES ticket (IdTicket)
);
