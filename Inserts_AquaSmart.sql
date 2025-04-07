USE aquasmart;

-- 1. Inserciones para Cargo
CALL sp_insertCargo('Gerente General', 'Responsable de la gestión general de la empresa');
CALL sp_insertCargo('Supervisor Técnico', 'Supervisa las instalaciones y reparaciones');
CALL sp_insertCargo('Técnico de Campo', 'Realiza instalaciones y mantenimiento');
CALL sp_insertCargo('Asistente Administrativo', 'Apoyo en gestión documental');
CALL sp_insertCargo('Representante de Servicio', 'Atención directa al cliente');

-- 2. Inserciones para Estado
CALL sp_insertEstado('Jalisco');
CALL sp_insertEstado('Nuevo León');
CALL sp_insertEstado('Ciudad de México');
CALL sp_insertEstado('Estado de México');
CALL sp_insertEstado('Querétaro');

-- 3. Inserciones para Ciudad (relacionadas con estados existentes)
CALL sp_insertCiudad('Guadalajara', 1);
CALL sp_insertCiudad('Monterrey', 2);
CALL sp_insertCiudad('CDMX', 3);
CALL sp_insertCiudad('Toluca', 4);
CALL sp_insertCiudad('Querétaro', 5);

-- 4. Inserciones para Usuario
CALL sp_insertUsuario('admin_aquasmart', 'Admin@123', 'admin_profile.jpg', 1);
CALL sp_insertUsuario('tecnico_juan', 'Tecnico#456', 'juan_perez.jpg', 2);
CALL sp_insertUsuario('supervisor_ana', 'Super789!', 'ana_gomez.jpg', 1);
CALL sp_insertUsuario('asistente_luis', 'AsistLuis$', 'luis_martinez.jpg', 2);
CALL sp_insertUsuario('servicio_cliente', 'ServCl1ent', 'servicio_cliente.jpg', 3);

-- 5. Inserciones para Persona
CALL sp_insertPersona('Juan', 'Pérez', 'López', 35, 'juan.perez@aquasmart.com', '3312345678', 1, 'juan.plopez', 'Jpl2024!', 'juan_pl.jpg', 1);
CALL sp_insertPersona('Ana', 'Gómez', 'Martínez', 28, 'ana.gomez@aquasmart.com', '3387654321', 1, 'ana.gmartinez', 'Agm2024@', 'ana_gm.jpg', 1);
CALL sp_insertPersona('Luis', 'Martínez', 'Sánchez', 42, 'luis.martinez@aquasmart.com', '3344556677', 2, 'luis.msanchez', 'Lms2024#', 'luis_ms.jpg', 2);
CALL sp_insertPersona('María', 'López', 'García', 31, 'maria.lopez@aquasmart.com', '3355667788', 3, 'maria.lgarcia', 'Mlg2024$', 'maria_lg.jpg', 2);
CALL sp_insertPersona('Carlos', 'Sánchez', 'Ramírez', 45, 'carlos.sanchez@aquasmart.com', '3377889900', 4, 'carlos.sramirez', 'Csr2024%', 'carlos_sr.jpg', 3);

-- 6. Inserciones para Empleado
CALL sp_insertEmpleado('PERJ800101ABC', 1, 'Pedro', 'Ramírez', 'Gómez', 40, 'pedro.ramirez@aquasmart.com', '3322114455', 1, 'pedro.rgomez', 'Prg2024&', 'pedro_rg.jpg', 1);
CALL sp_insertEmpleado('GOMM750505DEF', 2, 'Mónica', 'González', 'Hernández', 48, 'monica.gonzalez@aquasmart.com', '3344556677', 2, 'monica.ghdez', 'Mgh2024*', 'monica_gh.jpg', 1);
CALL sp_insertEmpleado('LOPS820202GHI', 3, 'Sofía', 'López', 'Pérez', 41, 'sofia.lopez@aquasmart.com', '3366778899', 3, 'sofia.lperez', 'Slp2024(', 'sofia_lp.jpg', 2);
CALL sp_insertEmpleado('MART900303JKL', 4, 'Roberto', 'Martínez', 'Torres', 33, 'roberto.martinez@aquasmart.com', '3388990011', 4, 'roberto.mtorres', 'Rmt2024)', 'roberto_mt.jpg', 2);
CALL sp_insertEmpleado('DIAJ880404MNO', 5, 'Jorge', 'Díaz', 'Jiménez', 35, 'jorge.diaz@aquasmart.com', '3300112233', 5, 'jorge.djimenez', 'Jdj2024-', 'jorge_dj.jpg', 3);

-- 7. Inserciones para Cliente
CALL sp_insertCliente('Alejandro', 'Fernández', 'Ruiz', 38, 'alejandro.fr@cliente.com', '3344556677', 1, 'alejandro.fruiz', 'AfR2024+', 'alejandro_fr.jpg', 4);
CALL sp_insertCliente('Beatriz', 'Castillo', 'Morales', 29, 'beatriz.cm@cliente.com', '3355667788', 2, 'beatriz.cmorales', 'Bcm2024=', 'beatriz_cm.jpg', 4);
CALL sp_insertCliente('Daniel', 'Vega', 'Soto', 52, 'daniel.vs@cliente.com', '3366778899', 3, 'daniel.vsoto', 'Dvs2024[', 'daniel_vs.jpg', 4);
CALL sp_insertCliente('Elena', 'Ríos', 'Cruz', 44, 'elena.rc@cliente.com', '3377889900', 4, 'elena.rcruz', 'Erc2024]', 'elena_rc.jpg', 4);
CALL sp_insertCliente('Francisco', 'Mendoza', 'Ortega', 37, 'francisco.mo@cliente.com', '3388990011', 5, 'francisco.mortega', 'Fmo2024{', 'francisco_mo.jpg', 4);

-- 8. Inserciones para Medidor
CALL sp_insertMedidor('Medidor Digital V1', 'AquaSmart-D2024', 50, 1250.99);
CALL sp_insertMedidor('Medidor Analógico A5', 'AquaSmart-A2024', 30, 899.50);
CALL sp_insertMedidor('Medidor Inteligente I3', 'AquaSmart-I2024', 20, 1899.00);
CALL sp_insertMedidor('Medidor Industrial IND', 'AquaSmart-IND24', 10, 3500.75);
CALL sp_insertMedidor('Medidor Residencial R2', 'AquaSmart-R2024', 40, 750.25);

-- 9. Inserciones para Lectura
CALL sp_insertLectura(45.5, 1200, '2024-01-15 08:30:00', 1);
CALL sp_insertLectura(38.2, 980, '2024-01-15 09:15:00', 2);
CALL sp_insertLectura(52.7, 1500, '2024-01-16 10:00:00', 3);
CALL sp_insertLectura(120.8, 3200, '2024-01-16 11:45:00', 4);
CALL sp_insertLectura(28.3, 750, '2024-01-17 08:15:00', 5);

-- 10. Inserciones para Propiedad
CALL sp_insertPropiedad('123', 'A', 'Reforma', 'Centro', 20.6736, -103.344, 44100, 'casa1.jpg', 1, 1, 1, 1);
CALL sp_insertPropiedad('456', '', 'Hidalgo', 'Juárez', 20.6789, -103.351, 44110, 'casa2.jpg', 1, 2, 2, 2);
CALL sp_insertPropiedad('789', 'B', 'Vallarta', 'Ladrón de Guevara', 20.6812, -103.347, 44120, 'casa3.jpg', 1, 3, 3, 3);
CALL sp_insertPropiedad('1011', '2', 'Chapultepec', 'Americana', 20.6754, -103.362, 44130, 'casa4.jpg', 1, 4, 4, 4);
CALL sp_insertPropiedad('1213', '', 'Federalismo', 'Arcos Vallarta', 20.6825, -103.355, 44140, 'casa5.jpg', 1, 5, 5, 5);

-- 11. Inserciones para Servicio
CALL sp_insertServicio(1, 1, 1, 1, 1);
CALL sp_insertServicio(1, 2, 2, 1, 2);
CALL sp_insertServicio(1, 3, 3, 1, 3);
CALL sp_insertServicio(1, 4, 4, 1, 4);
CALL sp_insertServicio(1, 5, 5, 1, 5);

-- 12. Inserciones para Tarjeta
CALL sp_insertTarjeta('4111111111111111', '123', '12', '2025', 'ALEJANDRO FERNANDEZ RUIZ', 1);
CALL sp_insertTarjeta('5555555555554444', '456', '06', '2026', 'BEATRIZ CASTILLO MORALES', 2);
CALL sp_insertTarjeta('378282246310005', '789', '09', '2027', 'DANIEL VEGA SOTO', 3);
CALL sp_insertTarjeta('6011111111111117', '321', '03', '2028', 'ELENA RIOS CRUZ', 4);
CALL sp_insertTarjeta('3530111333300000', '654', '11', '2029', 'FRANCISCO MENDOZA ORTEGA', 5);

-- 13. Inserciones para Ticket
CALL sp_insertTicket('2024-01-15 10:30:00', 450.50, 400.00, 1, 1, '4111111111111111');
CALL sp_insertTicket('2024-01-16 11:45:00', 380.25, 350.00, 2, 2, '5555555555554444');
CALL sp_insertTicket('2024-01-17 09:15:00', 525.75, 500.00, 3, 3, '378282246310005');
CALL sp_insertTicket('2024-01-18 14:30:00', 1200.00, 1150.00, 4, 4, '6011111111111117');
CALL sp_insertTicket('2024-01-19 16:45:00', 280.50, 250.00, 5, 5, '3530111333300000');

-- 14. Inserciones para Categoria
CALL sp_insertCategoria('Agua Potable Residencial', 'Servicio básico de agua para viviendas', 150.00);
CALL sp_insertCategoria('Agua Potable Comercial', 'Servicio de agua para negocios', 250.00);
CALL sp_insertCategoria('Agua Potable Industrial', 'Servicio de agua para industria', 500.00);
CALL sp_insertCategoria('Mantenimiento Preventivo', 'Revisión periódica del sistema', 350.00);
CALL sp_insertCategoria('Reparación Emergencia', 'Servicio urgente de reparación', 600.00);

-- 15. Inserciones para DetalleServicio
CALL sp_insertDetalleServicio('Instalación medidor nuevo', '2024-01-15 10:30:00', 1, 1, 1, 1);
CALL sp_insertDetalleServicio('Cambio de tuberías', '2024-01-16 11:45:00', 2, 2, 2, 2);
CALL sp_insertDetalleServicio('Reparación fuga principal', '2024-01-17 09:15:00', 3, 3, 3, 3);
CALL sp_insertDetalleServicio('Mantenimiento sistema completo', '2024-01-18 14:30:00', 4, 4, 4, 4);
CALL sp_insertDetalleServicio('Revisión medidor defectuoso', '2024-01-19 16:45:00', 5, 5, 5, 5);