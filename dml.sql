INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES
('Ornamentales', 'Productos exterior', 'Productos exterior', 'Ornamentales.jpg'),
('Indoor', 'Productos interior', 'Productos interior', 'indoor.jpg');

INSERT INTO producto (codigo_producto, nombre_producto, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES
('P001', 'Mesa de jardín', 'Ornamentales', '200m', 'Proveedor A', 'Mesa de madera', 500, 100000, 15000),
('P002', 'Sofá de sala', 'Indoor', '220m', 'Proveedor B', 'Sofa de cuero', 30, 400000, 40000);

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) VALUES
('OF001', 'Cucuta', 'Colombia', 'Norte de Santander', '68004', '62626260652', 'Calle 10-52', 'Apto 2'),
('OF002', 'Bga', 'Colombia', 'Santander', '00100', '15151848181', 'Calle 40-15', 'Casa 1'),
('OF003', 'Madrid', 'Espana', 'Espana', '00002', '5616515', 'Calle 12-14', 'Casa 9');

INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES
(1001, 'Simon', 'Mantilla', 'Gonzalez', '007', 'Simon@HOTmail.com', 'OF001', 7, 'Rep.ventas'),
(11, 'Jorge', 'Jaimes', 'Gonzalez', '007', 'Jorge@notHOTmail.com', 'OF001', 7, 'Empleado'),
(7, 'Johlver', 'Pardo', 'Garcia', '007', 'Johlver@HOTmail.com', 'OF001', 7, 'Jefe');

INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES
(1097490430, 'Pepita Confesuda', 'Pepa', 'Pig', '155151151', '5154945262', 'Calle 123', 'Casa 2', 'Bga', 'Santander', 'Colombia', '00100', 1001, 5000000),
(1005338578, 'Max Steel', 'Max', 'Steel', '51511512', '151155616516', 'Calle 456', 'Casa 3', 'Madrid', 'Espana', 'Espana', '00002', 11, 2000000);

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) VALUES
(0001, '2008-07-01', '2008-07-10', '2008-07-05', 'Entregado', 'Entrega rápida', 1097490430),
(0002, '2024-07-02', '2024-07-12', NULL, 'Pendiente', NULL, 1005338578),
(0003, '2009-07-02', '2009-07-12', NULL, 'Rechazado', NULL, 1097490430),
(0004, '2012-01-01', '2012-01-10', '2012-01-05', 'Entregado', 'Entrega rápida', 1097490430);



INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES
(0001, 'P001', 2, 100000, 1122),
(0002, 'P002', 4, 400000, 3344);

INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total) VALUES
(1097490430, 'Paypal', '666', '2008-07-01', 200000),
(1005338578, 'Transferencia', '999', '2024-07-02', 1600000);
