--------------------------------
-- Inserción de Usuarios
--------------------------------
INSERT INTO Usuario (nombre, apellidos, email, rol, departamento) VALUES 
('Laura', 'Gómez Pérez', 'laura.gomez@centro.edu', 'Docente', 'Informática'),
('Carlos', 'López Martínez', 'carlos.lopez@centro.edu', 'Administrativo', 'Secretaría'),
('Marta', 'Sánchez Ruiz', 'marta.sanchez@centro.edu', 'Otro', 'Mantenimiento');

--------------------------------
-- Inserción de Proveedores
--------------------------------
INSERT INTO Proveedor (nombre, telefono, email, direccion, fecha_alta) VALUES 
('Informática Global S.A.', 612345678, 'contacto@infoglobal.com', 'Calle Tecnología 10, Madrid', '2023-02-10'),
('Muebles y Diseño SL', 631234567, 'ventas@mueblesydiseno.com', 'Avda. Madera 22, Barcelona', '2022-09-05'),
('Papelería Total', 687654321, 'info@papeleriatotal.es', 'Calle del Papel 15, Sevilla', '2024-01-15'),
('Redes y Conexiones', 600123456, 'soporte@redesyconexiones.net', 'Calle Red 18, Valencia', '2023-06-20');

--------------------------------
-- Inserción de Ubicaciones
--------------------------------
INSERT INTO Ubicacion (edificio, aula, descripcion) VALUES 
('Edificio A', 'Aula 101', 'Aula principal de informática'),
('Edificio B', 'Aula 205', 'Sala de reuniones administrativa'),
('Edificio A', 'Aula 102', 'Almacén de mobiliario'),
('Edificio C', 'Laboratorio 1', 'Laboratorio de redes'),
('Edificio B', 'Despacho 12', 'Despacho dirección académica');

--------------------------------
-- Inserción de Artículos
--------------------------------
INSERT INTO Articulo (nombre, descripcion, tipo, cantidad, estado, costo_unitario, id_ubicacion, id_usuario_registro, fecha_registro, id_proveedor) VALUES 
('Ordenador HP ProDesk', 'Equipo de sobremesa con Windows 10', 'Equipo Informatico', 10, 'Nuevo', 650.00, 1, 1, '2024-09-15', 1),
('Mesa de profesor', 'Mueble robusto de madera', 'Mobiliario', 2, 'Usado', 120.00, 2, 2, '2024-07-01', 2),
('Proyector Epson', 'Proyector HD con HDMI', 'Equipo Informatico', 1, 'Nuevo', 320.00, 1, 1, '2024-06-10', 1),
('Sillas escolares', 'Conjunto de sillas para alumnos', 'Mobiliario', 30, 'Usado', 25.00, 3, 2, '2024-03-12', 2),
('Lotes de bolígrafos', 'Caja de 50 bolígrafos negros', 'Material Escolar', 5, 'Nuevo', 5.50, 2, 3, '2024-04-20', 3),
('Router Cisco', 'Router empresarial para laboratorio', 'Equipo Informatico', 1, 'En reparación', 450.00, 4, 1, '2024-10-05', 4);

--------------------------------
-- Inserción de Equipos Informáticos
--------------------------------
INSERT INTO EquiposInformaticos (id_articulo, marca, modelo, sistema_operativo, subtipo, especificaciones) VALUES 
(1, 'HP', 'ProDesk 400 G7', 'Windows 10 Pro', 'PC', 'Intel i5, 8GB RAM, SSD 256GB'),
(3, 'Epson', 'EB-S41', 'Firmware Epson', 'Proyector', 'SVGA 3300 lúmenes, HDMI'),
(6, 'Cisco', 'RV340', 'Cisco OS', 'Otro', 'Dual WAN, VPN, 4 Puertos LAN');

--------------------------------
-- Inserción de Mobiliario
--------------------------------
INSERT INTO Mobiliario (id_articulo, material, dimensiones, color) VALUES 
(2, 'Madera maciza', '120x60x75 cm', 'Marrón'),
(4, 'Plástico y metal', '45x45x85 cm', 'Azul');

--------------------------------
-- Inserción de Material Escolar
--------------------------------
INSERT INTO MaterialEscolar (id_articulo, tipo, marca) VALUES 
(5, 'Bolígrafo', 'BIC');

--------------------------------
-- Inserción de Movimientos
--------------------------------
INSERT INTO Movimiento (id_articulo, fecha, tipo, id_ubicacion_origen, id_ubicacion_destino, id_proveedor_destino, id_usuario_responsable, cantidad, motivo) VALUES 
(1, '2024-09-20', 'Traslado', 1, 4, NULL, 1, 3, 'Instalación en laboratorio de redes'),
(3, '2024-10-10', 'Reparación', 1, NULL, 1, 1, 1, 'Problemas con la lámpara del proyector'),
(4, '2024-03-15', 'Traslado', 3, 2, NULL, 2, 10, 'Redistribución de sillas en aulas'),
(5, '2024-05-01', 'Baja', 2, NULL, 3, 3, 1, 'Material obsoleto');
