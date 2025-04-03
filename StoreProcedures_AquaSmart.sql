-- USE aquasmart;
-- PROPIEDAD TICKET DETALLE

/* CARGO / 0 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertCargo`(
IN v_nombreCargo VARCHAR(80),
IN v_descripcion LONGTEXT
)
BEGIN
INSERT INTO cargo VALUES (DEFAULT,v_nombreCargo,v_descripcion);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCargo`(
IN v_idCargo INT,
IN v_nombreCargo VARCHAR(80),
IN v_descripcion LONGTEXT
)
BEGIN
UPDATE cargo 
SET 
    nombreCargo = v_nombreCargo,
    descripcion =v_descripcion
WHERE
    idCargo = v_idCargo;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCargo`(
IN v_idCargo INT
)
BEGIN
DELETE FROM cargo 
WHERE
    idCargo = v_idCargo;
END || 
DELIMITER ;

/* ESTADO / 1 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertEstado`(
IN v_nombreEstado VARCHAR(80)
)
BEGIN
INSERT INTO estado VALUES (DEFAULT,v_nombreEstado);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateEstado`(
IN v_idEstado INT,
IN v_nombreEstado VARCHAR(80)
)
BEGIN
UPDATE estado 
SET 
    nombreEstado = v_nombreEstado
WHERE
    idEstado = v_idEstado;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteEstado`(
IN v_idEstado INT
)
BEGIN
DELETE FROM estado 
WHERE
    idEstado = v_idEstado;
END || 
DELIMITER ;

/* CIUDAD / 2 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertCiudad`(
IN v_nombreCiudad VARCHAR(80),
IN v_idEstado INT
)
BEGIN
INSERT INTO ciudad VALUES (DEFAULT,v_nombreCiudad,v_idEstado);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCiudad`(
IN v_idCiudad INT,
IN v_nombreCiudad VARCHAR(80),
IN v_idEstado INT
)
BEGIN
UPDATE ciudad 
SET 
    nombreCiudad = v_nombreCiudad,
    idEstado = v_idEstado
WHERE
    idCiudad = v_idCiudad;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCiudad`(
IN v_idCiudad INT
)
BEGIN
DELETE FROM ciudad 
WHERE
    idCiudad = v_idCiudad;
END || 
DELIMITER ;

/* USUARIO / 3 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUsuario`(
IN v_nombre VARCHAR(100),
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT,
IN v_rol INT
)
BEGIN
INSERT INTO usuario(nombre,contrasenia,foto,rol) VALUES (v_nombre,md5(v_contrasenia),v_foto,v_rol);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateUsuario`(
IN v_idUsuario INT,
IN v_nombre VARCHAR(100),
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT,
IN v_rol INT,
IN v_estatus INT
)
BEGIN
UPDATE usuario 
SET 
    nombre = v_nombre,
    contrasenia = md5(v_contrasenia),
    foto = v_foto,
    rol = v_rol,
    estatus = v_estatus
WHERE
    idUsuario = v_idUsuario;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteUsuario`(
IN v_idUsuario INT
)
BEGIN
DELETE FROM usuario 
WHERE
    idUsuario = v_idUsuario;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveUsuario`(
IN v_idUsuario INT
)
BEGIN
UPDATE usuario 
SET
estatus = 0
WHERE
    idUsuario = v_idUsuario;
END || 
DELIMITER ;

/* PERSONA / 4 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertPersona`(
IN v_nombre VARCHAR(75),
IN v_apellidoM VARCHAR(65), 
IN v_apellidoP VARCHAR(65), 
IN v_edad INT,
IN v_email VARCHAR(100), 
IN v_telefono VARCHAR(10), 
IN v_idCiudad INT,
IN v_nombreU VARCHAR(100),
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT,
IN v_rol INT
)
BEGIN
DECLARE v_lastID INT;
CALL sp_insertUsuario(v_nombreU,v_contrasenia,v_foto,v_rol);

SET v_lastID = LAST_INSERT_ID();

INSERT INTO persona(idPersona,nombre,apellidoM,apellidoP,edad,email,telefono,idCiudad,idUsuario) 
VALUES (DEFAULT,v_nombre,v_apellidoM,v_apellidoP,
v_edad,v_email,v_telefono,v_idCiudad,v_lastID);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePersona`(
IN v_idPersona INT,
IN v_nombre VARCHAR(75),
IN v_apellidoM VARCHAR(65), 
IN v_apellidoP VARCHAR(65), 
IN v_edad INT,
IN v_email VARCHAR(100), 
IN v_telefono VARCHAR(10), 
IN v_idCiudad INT,
IN v_nombreU VARCHAR(100),
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT,
IN v_rol INT,
IN v_estatus INT
)
BEGIN
DECLARE v_idUsuario INT;
SELECT 
    idUsuario
INTO v_idUsuario FROM
    persona
WHERE
    idPersona = v_idPersona;

CALL sp_updateUsuario(v_idUsuario,v_nombreU,v_contrasenia,v_foto,v_rol,v_estatus);

UPDATE persona 
SET 
    nombre = v_nombre,
    apellidoM = v_apellidoM,
    apellidoP = v_apellidoP,
    edad = v_edad,
    email = v_email,
    estatus = v_estatus,
    telefono = v_telefono,
    idCiudad = v_idCiudad,
    idUsuario = v_idUsuario
WHERE
    idPersona = v_idPersona;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletePersona`(
IN v_idPersona INT
)
BEGIN
DECLARE v_idUsuario INT;
SELECT 
    idUsuario
INTO v_idUsuario FROM
    persona
WHERE
    idPersona = v_idPersona;
DELETE FROM persona 
WHERE
    idPersona = v_idPersona;
CALL sp_deleteUsuario(v_idUsuario);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactivePersona`(
IN v_idPersona INT
)
BEGIN
DECLARE v_idUsuario INT;
SELECT 
    idUsuario
INTO v_idUsuario FROM
    persona
WHERE
    idPersona = v_idPersona;
UPDATE persona
SET
 estatus = 0
WHERE
    idPersona = v_idPersona;
    CALL sp_desactiveUsuario(v_idUsuario);
END || 
DELIMITER ;

/* EMPLEADO / 5 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertEmpleado`(
IN v_rfc varchar(13),
IN v_cargo int,
IN v_nombre VARCHAR(75),-- 3
IN v_apellidoM VARCHAR(65), 
IN v_apellidoP VARCHAR(65), 
IN v_edad INT, -- 6
IN v_email VARCHAR(100), 
IN v_telefono VARCHAR(10), 
IN v_idCiudad INT, -- 9
IN v_nombreU VARCHAR(100),
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT, -- 12
IN v_rol INT
)
BEGIN
DECLARE v_lastID INT;
CALL sp_insertPersona(v_nombre,v_apellidoM,v_apellidoP,v_edad,v_email,v_telefono,v_idCiudad,v_nombreU,v_contrasenia,v_foto,v_rol);
SET v_lastID = LAST_INSERT_ID();

INSERT INTO empleado 
VALUES (DEFAULT,v_rfc,v_cargo,v_lastID);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateEmpleado`(
IN v_idEmpleado INT,
IN v_rfc varchar(13),
IN v_cargo int, -- 3
IN v_nombre VARCHAR(75),
IN v_apellidoM VARCHAR(65), 
IN v_apellidoP VARCHAR(65), -- 6
IN v_edad INT,
IN v_email VARCHAR(100), 
IN v_telefono VARCHAR(10), -- 9
IN v_idCiudad INT,
IN v_nombreU VARCHAR(100),
IN v_contrasenia VARCHAR(256), -- 12
IN v_foto LONGTEXT,
IN v_rol INT,
IN v_estatus INT -- 15
)
BEGIN
DECLARE v_idPersona INT;
SELECT 
    idPersona
INTO v_idPersona FROM
    empleado
WHERE
    idEmpleado = v_idEmpleado;
CALL sp_updatePersona(v_idPersona,v_nombre,v_apellidoM,v_apellidoP,v_edad,v_email,v_telefono,v_idCiudad,v_nombreU,v_contrasenia,v_foto,v_rol,v_estatus);

UPDATE empleado
SET 
    rfc = v_rfc,
    cargo = v_cargo,
    idPersona = v_idPersona
WHERE
    idEmpleado = v_idEmpleado;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteEmpleado`(
IN v_idEmpleado INT
)
BEGIN
DECLARE v_idPersona INT;
SELECT 
    idPersona
INTO v_idPersona FROM
    empleado
WHERE
    idEmpleado = v_idEmpleado;
DELETE FROM empleado
WHERE
    idEmpleado = v_idEmpleado;
CALL sp_deletePersona(v_idPersona);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveEmpleado`(
IN v_idEmpleado INT
)
BEGIN
DECLARE v_idPersona INT;
SELECT 
    idPersona
INTO v_idPersona FROM
    empleado
WHERE
    idEmpleado = v_idEmpleado;
CALL sp_desactivePersona(v_idPersona);
END || 
DELIMITER ;

/* CLIENTE / 6 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertCliente`(
IN v_nombre VARCHAR(75),
IN v_apellidoM VARCHAR(65), 
IN v_apellidoP VARCHAR(65), 
IN v_edad INT,
IN v_email VARCHAR(100), 
IN v_telefono VARCHAR(10), 
IN v_idCiudad INT,
IN v_nombreU VARCHAR(100),
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT,
IN v_rol INT
)
BEGIN
DECLARE v_lastID INT;
CALL sp_insertPersona(v_nombre,v_apellidoM,v_apellidoP,v_edad,v_email,v_telefono,v_idCiudad,v_nombreU,v_contrasenia,v_foto,v_rol);
SET v_lastID = LAST_INSERT_ID();

INSERT INTO cliente 
VALUES (DEFAULT,v_lastID);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCliente`(
IN v_idCliente INT,
IN v_nombre VARCHAR(75),
IN v_apellidoM VARCHAR(65),-- 3 
IN v_apellidoP VARCHAR(65), 
IN v_edad INT,
IN v_email VARCHAR(100), -- 6
IN v_telefono VARCHAR(10), 
IN v_idCiudad INT,
IN v_nombreU VARCHAR(100),-- 9
IN v_contrasenia VARCHAR(256),
IN v_foto LONGTEXT,
IN v_rol INT, -- 12
IN v_estatus INT
)
BEGIN
DECLARE v_idPersona INT;
SELECT 
    idPersona
INTO v_idPersona FROM
    cliente
WHERE
    idCliente = v_idCliente;
CALL sp_updatePersona(v_idPersona,v_nombre,v_apellidoM,v_apellidoP,v_edad,v_email,v_telefono,v_idCiudad,v_nombreU,v_contrasenia,v_foto,v_rol,v_estatus);

UPDATE cliente
SET 
    idPersona = v_idPersona
WHERE
    idCliente = v_idCliente;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCliente`(
IN v_idCliente INT
)
BEGIN
DECLARE v_idPersona INT;
SELECT 
    idPersona
INTO v_idPersona FROM
    cliente
WHERE
    idCliente = v_idCliente;
DELETE FROM cliente
WHERE
    idCliente = v_idCliente;
CALL sp_deletePersona(v_idPersona);
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveCliente`(
IN v_idCliente INT
)
BEGIN
DECLARE v_idPersona INT;
SELECT 
    idPersona
INTO v_idPersona FROM
    cliente
WHERE
    idCliente = v_idCliente;
CALL sp_desactivePersona(v_idPersona);
END || 
DELIMITER ;

/* MEDIDOR / 7 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertMedidor`(
in v_nombre varchar(65), 
in v_modelo varchar(70),
in v_cantidad int, 
in v_precio double
)
BEGIN
INSERT INTO medidor VALUES (DEFAULT,v_nombre,v_modelo,v_cantidad,DEFAULT,v_precio);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateMedidor`(
IN v_idMedidor INT,
in v_nombre varchar(65), 
in v_modelo varchar(70),
in v_cantidad int, 
in v_precio double,
in v_estatus int
)
BEGIN
UPDATE medidor
SET 
    nombre = v_nombre,
    modelo = v_modelo,
    cantidad = v_cantidad,
    precio = v_precio,
    estatus = v_estatus
WHERE
    idMedidor = v_idMedidor;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteMedidor`(
IN v_idMedidor INT
)
BEGIN
DELETE FROM medidor
WHERE
    idMedidor = v_idMedidor;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveMedidor`(
IN v_idMedidor INT
)
BEGIN
UPDATE medidor 
SET
estatus = 0
WHERE
   idMedidor = v_idMedidor;
END || 
DELIMITER ;

/* LECTURA / 8 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertLectura`(
in v_flujo double, 
in v_pulsaciones double, 
in v_fecha datetime,
in v_idMedidor INT
)
BEGIN
INSERT INTO lectura VALUES (DEFAULT,default,v_flujo,v_pulsaciones,v_fecha,v_idMedidor);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateLectura`(
IN v_idLectura INT,
in v_flujo double, 
in v_pulsaciones double,
in v_fecha datetime,
in v_idMedidor INT,
in v_estatus int
)
BEGIN
UPDATE lectura
SET 
    flujo = v_flujo,
    pulsaciones = v_pulsaciones,
    fecha = v_fecha,
    estatus = v_estatus,
    idMedidor = v_idMedidor
WHERE
    idLectura = v_idLectura;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteLectura`(
IN v_idLectura INT
)
BEGIN
DELETE FROM lectura
WHERE
     idLectura = v_idLectura;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveLectura`(
IN v_idLectura INT
)
BEGIN
UPDATE lectura 
SET
estatus = 0
WHERE
   idLectura = v_idLectura;
END || 
DELIMITER ;

/* PROPIEDAD / 9 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertPropiedad`(
in v_numExt varchar(15), 
in v_numInt varchar(15), 
in v_calle varchar(75), 
in v_colonia varchar(75), 
in v_latitud double, 
in v_longitud double, 
in v_codigoP int, 
in v_foto longtext, 
in v_estatus int, 
in v_idCliente int, 
in v_idCiudad int, 
in v_idMedidor int
)
BEGIN
INSERT INTO propiedad VALUES (DEFAULT,v_numExt,v_numInt,v_calle,v_colonia,v_latitud,v_longitud,v_codigoP,v_foto,v_estatus,v_idCliente,v_idCiudad,v_idMedidor);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePropiedad`(
IN v_idPropiedad INT,
in v_numExt varchar(15), 
in v_numInt varchar(15), 
in v_calle varchar(75), 
in v_colonia varchar(75), 
in v_latitud double, 
in v_longitud double, 
in v_codigoP int, 
in v_foto longtext, 
in v_estatus int, 
in v_idCliente int, 
in v_idCiudad int, 
in v_idMedidor int
)
BEGIN
UPDATE propiedad
SET 
 numExt = v_numExt, 
 numInt = v_numInt, 
 calle= v_calle ,
 colonia= v_colonia,
 latitud= v_latitud ,
 longitud= v_longitud, 
 codigoP= v_codigoP ,
 foto= v_foto ,
 estatus= v_estatus, 
 idCliente= v_idCliente, 
 idCiudad= v_idCiudad,
 idMedidor= v_idMedidor
WHERE
    idPropiedad = v_idPropiedad;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletePropiedad`(
IN v_idPropiedad INT
)
BEGIN
DELETE FROM propiedad
WHERE
     idPropiedad = v_idPropiedad;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactivePropiedad`(
IN v_idPropiedad INT
)
BEGIN
UPDATE propiedad 
SET
estatus = 0
WHERE
   idPropiedad = v_idPropiedad;
END || 
DELIMITER ;

/* SERVICIO / 10 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertServicio`(
in v_estatus int,
in v_idPropiedad int, 
in v_idCliente int, 
in v_idCategoria int, 
in v_idCiudad int
)
BEGIN
INSERT INTO servicio VALUES (DEFAULT,v_estatus,v_idPropiedad,v_idCliente,v_idCategoria,v_idCiudad);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateServicio`(
IN v_idServicio INT,
in v_estatus int,
in v_idPropiedad int, 
in v_idCliente int, 
in v_idCategoria int, 
in v_idCiudad int
)
BEGIN
UPDATE servicio
SET 
estatus= v_estatus, 
idPropiedad=v_idPropiedad, 
idCliente=v_idCliente,
idCategoria=v_idCategoria, 
idCiudad= v_idCiudad 
WHERE
    idServicio = v_idServicio;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteServicio`(
IN v_idServicio INT
)
BEGIN
DELETE FROM servicio
WHERE
     idServicio = v_idServicio;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveServicio`(
IN v_idServicio INT
)
BEGIN
UPDATE servicio 
SET
estatus = 0
WHERE
   idServicio = v_idServicio;
END || 
DELIMITER ;

/* TARJETA / 10 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertTarjeta`(
in v_numTarjeta varchar(16),
in v_cvv varchar(10) ,
in v_mes varchar(20) ,
in v_año varchar(4) ,
in v_nombreTitular varchar(150), 
in v_idCliente int
)
BEGIN
INSERT INTO tarjeta VALUES (v_numTarjeta,v_cvv,v_mes,v_año,v_nombreTitular,default,v_idCliente);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateTarjeta`(
in v_numTarjeta varchar(16),
in v_cvv varchar(10) ,
in v_mes varchar(20) ,
in v_año varchar(4) ,
in v_nombreTitular varchar(150), 
in v_estatus int,
in v_idCliente int
)
BEGIN
UPDATE tarjeta
SET 
  numTarjeta=v_numTarjeta,
  cvv=v_cvv,
  mes=v_mes,
  año=v_año,
  nombreTitular=v_nombreTitular,
  estatus = v_estatus,
  idCliente=v_idCliente
WHERE
 numTarjeta=v_numTarjeta;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteTarjeta`(
in v_numTarjeta varchar(16)
)
BEGIN
DELETE FROM tarjeta
WHERE
     numTarjeta = v_numTarjeta;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveTarjeta`(
in v_numTarjeta varchar(16)
)
BEGIN
UPDATE tarjeta 
SET
estatus = 0
WHERE
   numTarjeta = v_numTarjeta;
END || 
DELIMITER ;

/* TICKET / 12 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertTicket`(
in v_fecha datetime, 
in v_total double ,
in v_subtotal double,
in v_idEmpleado int, 
in v_idCliente int ,
in v_numTarjeta varchar(16)
)
BEGIN
INSERT INTO ticket VALUES (default,v_fecha,v_total,v_subtotal,v_idEmpleado,v_idCliente,v_numTarjeta);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateTicket`(
in v_idTicket int,
in v_fecha datetime, 
in v_total double ,
in v_subtotal double,
in v_idEmpleado int, 
in v_idCliente int ,
in v_numTarjeta varchar(16)
)
BEGIN
UPDATE ticket
SET 
  fecha=v_fecha,
  total=v_total,
  subtotal = v_subtotal,
  idEmpleado=v_idEmpleado,
  idCliente=v_idCliente,
  numTarjeta=v_numTarjeta
WHERE
 idTicket=v_idTicket;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteTicket`(
in v_idTicket int
)
BEGIN
DELETE FROM ticket
WHERE
     idTicket=v_idTicket;
END || 
DELIMITER ;

/* CATEGORIA / 13 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertCategoria`(
in v_nombre varchar(75), 
in v_descripcion longtext
)
BEGIN
INSERT INTO categoria VALUES (default,v_nombre,v_descripcion,default);
END|| 
DELIMITER ;
drop procedure sp_insertCategoria;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCategoria`(
in v_idCategoria int,
in v_nombre varchar(75), 
in v_descripcion longtext, 
in v_estatus int
)
BEGIN
UPDATE categoria 
SET 
nombre = v_nombre,
descripcion = v_descripcion,
estatus = v_estatus
WHERE
   idCategoria = v_idCategoria;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteCategoria`(
in v_idCategoria int
)
BEGIN
DELETE FROM categoria 
WHERE
   idCategoria = v_idCategoria;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_desactiveCategoria`(
IN v_idCategoria INT
)
BEGIN
UPDATE  categoria 
SET
estatus = 0
WHERE
   idCategoria = v_idCategoria;
END || 
DELIMITER ;

/* DETALLE SERVICIO / 13 */

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertDetalleServicio`(
in v_descripcion longtext,
in v_fecha datetime, 
in v_idCliente int ,
in v_idServicio int ,
in v_idLectura int, 
in v_idTicket int
)
BEGIN
INSERT INTO detalleservicio VALUES (default,v_descripcion,v_subtotal,v_total,v_fecha,v_idCliente,v_idServicio,v_idLectura,v_idTicket);
END|| 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateDetalleServicio`(
in v_idDetalle int,
in v_descripcion longtext, 
in v_fecha datetime, 
in v_idCliente int ,
in v_idServicio int ,
in v_idLectura int, 
in v_idTicket int
)
BEGIN
UPDATE detalleservicio 
SET 
descripcion =v_descripcion,
subtotal=v_subtotal,
total=v_total,
fecha=v_fecha,
idCliente=v_idCliente,
idServicio=v_idServicio,
idLectura=v_idLectura,
idTicket=v_idTicket
WHERE
    idDetalle = v_idDetalle;
END || 
DELIMITER ;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteDetalleServicio`(
in v_idDetalle int
)
BEGIN
DELETE FROM detalleservicio 
WHERE
   idDetalle = v_idDetalle;
END || 
DELIMITER ;

