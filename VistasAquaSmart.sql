-- use aquasmart;

-- VISTA CARGO
CREATE VIEW vistaCargo AS
select * from cargo;
select * from vistaCargo;

-- VISTA ESTADO
CREATE VIEW vistaEstado AS
    SELECT 
        idEstado, nombreEstado
    FROM
        estado;
-- select *from vistaEstado;

-- VISTA CIUDAD
CREATE VIEW vistaCiudad AS
    SELECT 
        c.idCiudad, c.nombreCiudad, e.idEstado, e.nombreEstado
    FROM
        ciudad c
            JOIN
        estado e ON c.idEstado = e.idEstado;
SELECT 
    *
FROM
    vistaCiudad;
    
-- VISTA USUARIO
CREATE VIEW vistaUsuario AS
    SELECT 
        u.idUsuario,
        u.nombre,
        u.contrasenia,
        u.foto,
        u.estatus,
        u.rol,
        u.lastToken,
        u.dateLastToken
    FROM
        usuario u;
       -- select * from vistaUsuario;

-- VISTA PERSONA
CREATE VIEW vistaPersona AS
    SELECT 
        p.idPersona,
        p.nombre AS nombrePersona,
        p.apellidoM,
        p.apellidoP,
        p.edad,
        p.estatus,
        p.email,
        p.telefono,
        c.idCiudad,
        c.nombreCiudad,
        c.idEstado,
        e.nombreEstado,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.contrasenia,
        u.foto,
        u.estatus AS estatusUsuario,
        u.rol,
        u.lastToken,
        u.dateLastToken
    FROM
        persona p
            INNER JOIN
        usuario u ON p.idUsuario = u.idUsuario
            JOIN
        ciudad c ON p.idCiudad = c.idCiudad
            JOIN
        estado e ON c.idEstado = e.idEstado;
SELECT 
    *
FROM
    vistaPersona;
    
-- VISTA EMPLEADO
CREATE VIEW vistaEmpleado AS
    SELECT 
        emp.idEmpleado,
        emp.rfc,
        ca.idCargo,
        ca.nombreCargo,
        ca.descripcion,
        p.idPersona,
        p.nombre AS nombrePersona,
        p.apellidoM,
        p.apellidoP,
        p.edad,
        p.estatus,
        p.email,
        p.telefono,
        c.idCiudad,
        c.nombreCiudad,
        c.idEstado,
        e.nombreEstado,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.contrasenia,
        u.foto,
        u.estatus AS estatusUsuario,
        u.rol,
        u.lastToken,
        u.dateLastToken
    FROM
        empleado emp
            INNER JOIN
        persona p ON emp.idPersona = p.idPersona
         INNER JOIN
        usuario u ON p.idUsuario = u.idUsuario
            JOIN
        ciudad c ON p.idCiudad = c.idCiudad
            JOIN
        estado e ON c.idEstado = e.idEstado
        INNER JOIN
        cargo ca ON emp.idCargo = ca.idCargo
        ;
        select * from vistaEmpleado;
       

-- VISTA CLIENTE
CREATE VIEW vistaCliente AS
    SELECT 
        cli.idCliente,
        p.idPersona,
        p.nombre AS nombrePersona,
        p.apellidoM,
        p.apellidoP,
        p.edad,
        p.estatus,
        p.email,
        p.telefono,
        c.idCiudad,
        c.nombreCiudad,
        c.idEstado,
        e.nombreEstado,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.contrasenia,
        u.foto,
        u.estatus AS estatusUsuario,
        u.rol,
        u.lastToken,
        u.dateLastToken
    FROM
        cliente cli
            INNER JOIN
        persona p ON cli.idPersona = p.idPersona
            JOIN
        usuario u ON p.idUsuario = u.idUsuario
            JOIN
        ciudad c ON p.idCiudad = c.idCiudad
            JOIN
        estado e ON c.idEstado = e.idEstado;
        select * from vistaCliente;
        
	-- VISTA MEDIDOR
CREATE VIEW vistaMedidor AS
    SELECT 
        m.idMedidor,
        m.nombre AS nombreMedidor,
        m.modelo,
        m.cantidad,
        m.estatus AS estatusMedidor,
        m.precio
    FROM
        medidor m;
       
-- VISTA LECTURA
CREATE VIEW vistaLectura AS
    SELECT 
        l.idLectura,
        l.estatus AS estatusLectura,
        l.flujo,
        l.pulsaciones,
        l.fecha,
        m.idMedidor,
        m.nombre AS nombreMedidor,
        m.modelo,
        m.cantidad,
        m.estatus AS estatusMedidor,
        m.precio
    FROM
        lectura l
            INNER JOIN
        medidor m ON l.idMedidor = m.idMedidor;
       select * from vistaLectura; 
        
	-- VISTA PROPIEDAD
   CREATE VIEW vistaPropiedad AS
    SELECT 
        pro.idPropiedad,
        pro.numExt,
        pro.numInt,
        pro.calle,
        pro.colonia,
        pro.latitud,
        pro.longitud,
        pro.codigoP,
        pro.foto,
        pro.estatus AS estatusPropiedad,
        ci.idCiudad AS idciudadPropidedad,
        ci.nombreCiudad AS nomCiudad,
        cli.idCliente,
        est.idEstado AS idestadoPropiedad,
        est.nombreEstado AS nomEstado,
        p.idPersona,
        p.nombre AS nombrePersona,
        p.apellidoM,
        p.apellidoP,
        p.edad,
        p.estatus,
        p.email,
        p.telefono,
        c.idCiudad,
        c.nombreCiudad,
        c.idEstado,
        e.nombreEstado,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.contrasenia,
        u.foto AS fotoUsuario,
        u.estatus AS estatusUsuario,
        u.rol,
        u.lastToken,
        u.dateLastToken,
        m.idMedidor,
        m.nombre AS nombreMedidor,
        m.modelo,
        m.cantidad,
        m.estatus AS estatusMedidor,
        m.precio
    FROM
        propiedad pro
            INNER JOIN
        cliente cli ON pro.idCliente = cli.idCliente
            JOIN
        persona p ON cli.idPersona = p.idPersona
            JOIN
        ciudad c ON p.idCiudad = c.idCiudad
            JOIN
        estado e ON c.idEstado = e.idEstado
            JOIN
        medidor m ON pro.idMedidor = m.idMedidor
            JOIN
        usuario u ON p.idUsuario = u.idUsuario
        INNER JOIN 
        ciudad ci ON pro.idCiudad = ci.idCiudad
        INNER JOIN 
        estado est ON ci.idEstado = est.idEstado;
        select * from vistaPropiedad;
        
        
	-- VISTA TARJETA
CREATE VIEW vistaTarjeta AS
    SELECT 
        t.numTarjeta,
        t.cvv,
        t.mes,
        t.año,
        t.nombreTitular,
        t.estatus AS estatusTarjeta,
        cli.idCliente,
        p.idPersona,
        p.nombre AS nombrePersona,
        p.apellidoM,
        p.apellidoP,
        p.edad,
        p.estatus AS estatusPersona,
        p.email,
        p.telefono,
        c.idCiudad,
        c.nombreCiudad,
        c.idEstado,
        e.nombreEstado,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.contrasenia,
        u.foto,
        u.estatus AS estatusUsuario,
        u.rol,
        u.lastToken,
        u.dateLastToken
    FROM
        tarjeta t
            INNER JOIN
        cliente cli ON t.idCliente = cli.idCliente
            JOIN
        persona p ON cli.idPersona = p.idPersona
            JOIN
        usuario u ON p.idUsuario = u.idUsuario
            JOIN
        ciudad c ON p.idCiudad = c.idCiudad
            JOIN
        estado e ON c.idEstado = e.idEstado;
        select * from vistaTarjeta;

-- VISTA CATEGORIA
CREATE VIEW vistaCategoria AS
    SELECT 
        cat.idCategoria,
        cat.nombre AS nombreCategoria,
        cat.descripcion,
        cat.estatus AS estatusCategoria
    FROM
        categoria cat;

-- VISTA DE SERVICIO
CREATE VIEW vistaServicio AS
    SELECT 
        s.idServicio,
        s.estatus AS estatusServicio,
        ciu.idCiudad AS ciudadServ,
        ciu.nombreCiudad as nomCiudad,
        ciu.idEstado AS estadoServ,
        est.nombreEstado AS nomEstado,
        pro.idPropiedad,
        pro.numExt,
        pro.numInt,
        pro.calle,
        pro.colonia,
        pro.latitud,
        pro.longitud,
        pro.codigoP,
        pro.foto,
        pro.estatus AS estatusPropiedad,
        cli.idCliente,
        p.idPersona,
        p.nombre AS nombrePersona,
        p.apellidoM,
        p.apellidoP,
        p.edad,
        p.estatus,
        p.email,
        p.telefono,
        c.idCiudad,
        c.nombreCiudad,
        c.idEstado,
        e.nombreEstado,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.contrasenia,
        u.foto AS fotoUsuario,
        u.estatus AS estatusUsuario,
        u.rol,
        u.lastToken,
        u.dateLastToken,
        m.idMedidor,
        m.nombre AS nombreMedidor,
        m.modelo,
        m.cantidad,
        m.estatus AS estatusMedidor,
        m.precio,
        cat.idCategoria,
        cat.nombre AS nombreCategoria,
        cat.descripcion,
        cat.estatus AS estatusCategoria
    FROM
        servicio s
            INNER JOIN
        categoria cat ON s.idCategoria = cat.idCategoria
            JOIN
        propiedad pro ON s.idPropiedad = pro.idPropiedad
            JOIN
        cliente cli ON s.idCliente = cli.idCliente
            JOIN
        persona p ON cli.idPersona = p.idPersona
            JOIN
        ciudad c ON p.idCiudad = c.idCiudad
            JOIN
        estado e ON c.idEstado = e.idEstado
            JOIN
        medidor m ON pro.idMedidor = m.idMedidor
            JOIN
        usuario u ON p.idUsuario = u.idUsuario
        join
        ciudad ciu ON s.idCiudad = ciu.idCiudad
        join
        estado est on ciu.idEstado = est.idEstado;
        
        select * from vistaServicio;
        
-- VISTA DE TICKET
CREATE VIEW vistaTicket AS
SELECT 
    tic.idTicket, 
    tic.fecha AS fechaTicket, 
    tic.total,  

    -- Información del empleado
    emp.idEmpleado,
    emp.rfc,
    ca.idCargo,
    ca.nombreCargo,
    ca.descripcion AS descripcionCargo,
    empP.idPersona AS personaEmpleado,
    empP.nombre AS nombreEmpleado,
    empP.apellidoM AS apellidoMEmpleado,
    empP.apellidoP AS apellidoPEmpleado,
    empP.edad AS edadEmpleado,
    empP.estatus AS estatusPersonaEmpleado,
    empP.email AS emailEmpleado,
    empP.telefono AS telefonoEmpleado,
    cE.idCiudad AS idCiudadEmpleado,
    cE.nombreCiudad AS nombreCiudadEmpleado,
    eE.idEstado AS idEstadoEmpleado,
    eE.nombreEstado AS nombreEstadoEmpleado,
    uE.idUsuario AS idUsuarioEmpleado,
    uE.nombre AS nombreUsuarioEmpleado,
    uE.rol AS rolEmpleado,
    uE.foto AS fotoEmpleado,
    uE.estatus AS estatusEmpleado,
    uE.lastToken AS lastEmpleado,
    uE.dateLastToken AS dateEmpleado,
    
    -- Información del cliente
    c.idCliente,
    cliP.idPersona AS personaCliente,
    cliP.nombre AS nombreCliente, 
    cliP.apellidoM AS clienteApellidoM, 
    cliP.apellidoP AS clienteApellidoP,
    cliP.edad AS clienteEdad, 
    cliP.estatus AS estatusPersonaCliente, 
    cliP.email AS emailCliente, 
    cliP.telefono AS telefonoCliente,
    cliP.idCiudad AS idCiudadCliente,  
    cliPC.nombreCiudad AS nombreCiudadCliente,
    cliE.idEstado AS idEstadoCliente,
    cliE.nombreEstado AS nombreEstadoCliente,
    uC.idUsuario AS idUsuarioCliente,
    uC.nombre AS nombreUsuarioCliente,
    uC.rol AS rolCliente,
    uC.foto AS fotoCliente,
    uC.estatus AS estatusCliente,
    uC.lastToken AS lastCliente,
    uC.dateLastToken AS dateCliente,

    -- Información de la tarjeta
    t.numTarjeta, 
    t.cvv, 
    t.mes, 
    t.año, 
    t.nombreTitular

FROM 
    ticket tic
INNER JOIN empleado emp ON tic.idEmpleado = emp.idEmpleado
INNER JOIN cargo ca ON emp.idCargo = ca.idCargo
INNER JOIN persona empP ON emp.idPersona = empP.idPersona  
INNER JOIN ciudad cE ON cE.idCiudad = empP.idCiudad
INNER JOIN estado eE ON eE.idEstado = cE.idEstado
LEFT JOIN usuario uE ON uE.idUsuario = empP.idUsuario  -- Permite empleados sin usuario
INNER JOIN cliente c ON tic.idCliente = c.idCliente 
INNER JOIN persona cliP ON c.idPersona = cliP.idPersona 
INNER JOIN ciudad cliPC ON cliP.idCiudad = cliPC.idCiudad  
INNER JOIN estado cliE ON cliPC.idEstado = cliE.idEstado
LEFT JOIN usuario uC ON uC.idUsuario = cliP.idUsuario  -- Permite clientes sin usuario
LEFT JOIN tarjeta t ON tic.numTarjeta = t.numTarjeta;  -- Permite tickets sin tarjeta

    SELECT * FROM vistaTicket;
    
    
    
-- VISTA DE DETALLE SERVICIO
CREATE VIEW vistaDetalleServicio AS
    SELECT 
        ds.idDetalle,
        ds.descripcion AS descripcionDetalle,
        ds.fecha AS fechaDetalle,
        cli.idCliente,  
        cliP.nombre AS nombreCliente, 
        cliP.apellidoM AS clienteApellidoM, 
        cliP.apellidoP AS clienteApellidoP,
        cliP.edad AS clienteEdad, 
        cliP.estatus AS estatusPersonaCliente, 
        cliP.email AS emailCliente, 
        cliP.telefono AS telefonoCliente,
        cliPC.idCiudad AS idCiudadCliente,  
        cliPC.nombreCiudad AS nombreCiudadCliente,
        cliE.idEstado AS idEstadoCliente,
        cliE.nombreEstado AS nombreEstadoCliente,
        uC.idUsuario AS idUsuarioCliente,
        uC.nombre AS nombreUsuarioCliente,
        uC.rol AS rolCliente,

        s.idServicio,
        s.estatus AS estatusServicio,
        prop.numExt AS numExtPropiedad,
        prop.numInt AS numIntPropiedad,
        prop.calle AS callePropiedad,
        prop.colonia AS coloniaPropiedad,
        prop.latitud AS latitudPropiedad,
        prop.longitud AS longitudPropiedad,
        prop.codigoP AS codigoPropiedad,
        prop.foto AS fotoPropiedad,

        l.idLectura,
        l.flujo,
        l.pulsaciones,
        l.fecha AS fechaLectura,
        l.estatus AS estatusLectura,

        -- Información del ticket
        t.idTicket,
        t.fecha AS fechaTicket,  
        t.total AS totalTicket,
                t.subtotal,
        ticTac.numTarjeta, 
        ticTac.mes, 
        ticTac.año, 
        ticTac.nombreTitular

    FROM 
        detalleServicio ds

    INNER JOIN cliente cli ON ds.idCliente = cli.idCliente
    INNER JOIN persona cliP ON cli.idPersona = cliP.idPersona 
    INNER JOIN ciudad cliPC ON cliPC.idCiudad = cliP.idCiudad
    INNER JOIN estado cliE ON cliE.idEstado = cliPC.idEstado
    INNER JOIN usuario uC ON uC.idUsuario = cliP.idUsuario
    INNER JOIN servicio s ON ds.idServicio = s.idServicio
    INNER JOIN propiedad prop ON s.idPropiedad = prop.idPropiedad
    INNER JOIN lectura l ON ds.idLectura = l.idLectura
    INNER JOIN ticket t ON ds.idTicket = t.idTicket
    INNER JOIN tarjeta ticTac ON t.numTarjeta = ticTac.numTarjeta;
    
 -- drop view vistaDetalleServicio;

DESCRIBE detalleServicio;
DESCRIBE cliente;
DESCRIBE persona;
DESCRIBE ciudad;
DESCRIBE estado;
DESCRIBE usuario;
DESCRIBE servicio;
DESCRIBE propiedad;
DESCRIBE lectura;
DESCRIBE ticket;
DESCRIBE tarjeta;