use aquasmart;
-- Ejemplos de Procedimientos Almacenados
CALL sp_insertCargo('Gerente', 'Responsable de la gestión general de la empresa.');
CALL sp_insertCargo('Supervisor', 'Encargado de supervisar las operaciones diarias.');
CALL sp_insertCargo('Técnico', 'Realiza tareas técnicas y de mantenimiento.');
CALL sp_insertCargo('Asistente', 'Apoya en las actividades administrativas y operativas.');
CALL sp_insertCargo('Vendedor', 'Encargado de la atención a clientes y ventas.');

-- Estado
CALL sp_insertEstado('Nuevo Estado');
CALL sp_updateEstado(1, 'Estado Actualizado');
-- CALL sp_deleteEstado(1);

-- Ciudad
CALL sp_insertCiudad('Nueva Ciudad', 1);
CALL sp_updateCiudad(1, 'Ciudad Actualizada', 1);
-- CALL sp_deleteCiudad(1);

-- Usuario
CALL sp_insertUsuario('Juan Pérez', 'contrasenia123', 'foto.png', 1);
CALL sp_updateUsuario(1, 'Juan Pérez', 'nueva_contrasenia', 'nueva_foto.png', 1, 1);
-- CALL sp_deleteUsuario(1);
CALL sp_desactiveUsuario(1);

-- Persona
CALL sp_insertPersona('Juan', 'Pérez', 'García', 30, 'juan@example.com', '1234567890', 1, 'juanU', 'contrasenia123', 'foto.png', 1);
CALL sp_updatePersona(1, 'Juan', 'Pérez', 'García', 31, 'juan@example.com', '0987654321', 1, 'juanU', 'nueva_contrasenia', 'nueva_foto.png', 1, 1);
-- CALL sp_deletePersona(1);
CALL sp_desactivePersona(1);

-- Empleado
CALL sp_insertEmpleado(
    'ABC123456XYZ', 1, 'Juan', 'Gómez', 'Pérez', 30, 'juan.perez@example.com', '5551234567', 1, 'juanp', 'password123', "../img/nada.jpg", 2
);

CALL sp_insertEmpleado(
    'DEF789012LMN', 2, 'María', 'López', 'Ramírez', 28, 'maria.lopez@example.com', '5559876543', 1, 'marialu', 'securePass!', "../img/nada.jpg", 2
);

CALL sp_insertEmpleado(
    'GHI345678OPQ', 3, 'Carlos', 'Martínez', 'Hernández', 35, 'carlos.martinez@example.com', '5558765432', 1, 'carlom', 'abc123!', "../img/nada.jpg", 2
);

CALL sp_insertEmpleado(
    'JKL901234RST', 4, 'Ana', 'Fernández', 'Díaz', 27, 'ana.fernandez@example.com', '5557654321', 1, 'anafd', 'mypassword', "../img/nada.jpg", 2
);

CALL sp_insertEmpleado(
    'MNO567890UVW', 5, 'Roberto', 'Sánchez', 'Gutiérrez', 40, 'roberto.sanchez@example.com', '5556543210', 1, 'robertos', 'pass4567', "../img/nada.jpg", 2
);

CALL sp_updateEmpleado(1, 'RFC654321', 'Director', 'Juan', 'Pérez', 'García', 36, 'juan@example.com', '0987654321', 1, 'juanU2', 'nueva_contrasenia', 'nueva_foto.png', 1, 1);
-- CALL sp_deleteEmpleado(1);
CALL sp_desactiveEmpleado(1);

-- Cliente
CALL sp_insertCliente('Ana', 'López', 'Martínez', 28, 'ana@example.com', '2345678901', 1, 'anaU1', 'contrasenia123', 'foto.png', 1);
CALL sp_updateCliente(1, 'Ana', 'López', 'Martínez', 29, 'ana@example.com', '9876543210', 1, 'anaU2', 'nueva_contrasenia', 'nueva_foto.png', 1, 1);
-- CALL sp_deleteCliente(1);
CALL sp_desactiveCliente(1);

-- Medidor
CALL sp_insertMedidor('Medidor Marca X', 'Modelo A', 100, 25.5);
CALL sp_updateMedidor(1, 'Medidor Marca Y', 'Modelo B', 150, 30.0, 1);
-- CALL sp_deleteMedidor(1);
CALL sp_desactiveMedidor(1);

-- Lectura
CALL sp_insertLectura(10.5, 200, 15, '2025-01-01 10:00:00', 1);
CALL sp_updateLectura(1, 12.0, 250, 20, '2025-01-02 10:00:00', 1, 1);
-- CALL sp_deleteLectura(1);
CALL sp_desactiveLectura(1);

-- Propiedad
CALL sp_insertPropiedad('123', 'A', 'Calle Principal', 'Colonia Centro', 12345, 67890, 101, 'foto_propiedad.png', 1, 1, 1, 1);
CALL sp_updatePropiedad(1, '124', 'B', 'Calle Secundaria', 'Colonia Norte', 12346, 67891, 102, 'foto_actualizada.png', 1, 1, 1, 1);
-- CALL sp_deletePropiedad(1);
CALL sp_desactivePropiedad(1);

-- Categoría
CALL sp_insertCategoria('Categoría A', 'Descripción de la categoría A', 1);
CALL sp_updateCategoria(1, 'Categoría Actualizada', 'Descripción actualizada', 1);
-- CALL sp_deleteCategoria(1);
CALL sp_desactiveCategoria(1);

-- Servicio
CALL sp_insertServicio(1, 1, 1, 1, 1);
CALL sp_updateServicio(1, 1, 1, 1, 1, 1);
-- CALL sp_deleteServicio(1);
CALL sp_desactiveServicio(1);

-- Tarjeta
CALL sp_insertTarjeta('1234567812345678', '123', '12', '2025', 'Juan Pérez', 1);
CALL sp_updateTarjeta('1234567812345678', '456', '06', '2026', 'Juan Pérez Actualizado',1, 1);
-- CALL sp_deleteTarjeta('1234567812345678');
CALL sp_desactiveTarjeta('1234567812345678');

-- Ticket
CALL sp_insertTicket('2025-01-01 10:00:00', 150.00, 1, 1, '1234567812345678');
CALL sp_updateTicket(1, '2025-01-02 10:00:00', 200.00, 1, 1, '1234567812345678');
-- CALL sp_deleteTicket(1);

-- Detalle Servicio
CALL sp_insertDetalleServicio('Descripción del servicio', 100.00, 150.00, '2025-01-01 10:00:00', 1, 1, 1, 1);
CALL sp_updateDetalleServicio(1, 'Descripción actualizada', 120.00, 180.00, '2025-01-02 10:00:00', 1, 1, 1, 1);
-- CALL sp_deleteDetalleServicio(1);