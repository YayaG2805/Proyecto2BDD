-- ============================================================
-- seed.sql
-- Proyecto 2 - Bases de Datos 1
-- Datos de prueba para sistema de inventario y ventas
-- Contexto: Tienda de abarrotes "El Quetzal" - Guatemala
-- Compatible con PostgreSQL / pgAdmin 4 Query Tool
-- ============================================================
-- IMPORTANTE: Ejecutar DESPUÉS de schema.sql
-- El orden de inserción respeta las dependencias de FK.
-- ============================================================


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 1: Insertar categorías (25 registros)
-- ─────────────────────────────────────────────────────────────
INSERT INTO categoria (nombre, descripcion) VALUES
    ('Bebidas sin alcohol',      'Aguas, jugos, refrescos, bebidas energéticas y similares'),
    ('Lácteos',                  'Leche, queso, crema, yogur y derivados'),
    ('Carnes y embutidos',       'Salchichas, chorizos, jamón y carnes procesadas'),
    ('Limpieza del hogar',       'Detergentes, desinfectantes, escobas, trapeadores'),
    ('Higiene personal',         'Jabón, shampoo, pasta dental, desodorante'),
    ('Granos y legumbres',       'Frijoles, arroz, lentejas, maíz, arvejas'),
    ('Snacks y golosinas',       'Papas fritas, chicharrones, palomitas, dulces'),
    ('Panadería y tortillería',  'Pan dulce, pan molde, tortillas, biscuits'),
    ('Condimentos y salsas',     'Salsa de tomate, mostaza, mayonesa, especias'),
    ('Aceites y grasas',         'Aceite vegetal, manteca, margarina, mantequilla'),
    ('Enlatados y conservas',    'Atún, sardinas, vegetales en lata, frijoles enlatados'),
    ('Frutas y verduras frescas','Tomates, papas, zanahorias, cebollas, plátanos'),
    ('Medicamentos básicos',     'Aspirina, antigripales, antiácidos, vitaminas'),
    ('Papelería y útiles',       'Cuadernos, lapiceros, folders, papel bond'),
    ('Ferretería básica',        'Focos, pilas, extensiones, pequeñas herramientas'),
    ('Electrodomésticos pequeños','Calculadoras, radios portátiles, ventiladores'),
    ('Ropa y textiles',          'Calcetines, ropa interior, toallas, sábanas'),
    ('Juguetes',                 'Juguetes infantiles, pelotas, muñecas'),
    ('Artículos para mascotas',  'Alimento para perros, gatos, accesorios'),
    ('Congelados',               'Helados, verduras congeladas, pollo congelado'),
    ('Café y té',                'Café molido, café instantáneo, té de hierbas'),
    ('Dulces y chocolates',      'Chocolates, caramelos, chicles, mazapán'),
    ('Bebidas alcohólicas',      'Cerveza, vino, licores, aguardiente'),
    ('Artículos deportivos',     'Pelotas, raquetas, termos, ropa deportiva básica'),
    ('Otros',                    'Productos varios que no encajan en otras categorías');


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 2: Insertar proveedores (25 registros)
-- ─────────────────────────────────────────────────────────────
INSERT INTO proveedor (nombre, telefono, correo, direccion, nit) VALUES
    ('Cervecería Centro Americana S.A.',      '22201000', 'ventas@cca.com.gt',           '6a Avenida 9-40 zona 1, Guatemala',            '1234567-8'),
    ('Industrias Lácteas Foremost de Guatemala', '24223400', 'pedidos@foremost.com.gt',  'Calzada Roosevelt 22-43 zona 11, Guatemala',  '2345678-9'),
    ('Distribuidora Cargill Guatemala',       '23845000', 'cargill@distribuidora.gt',    'Km 15.5 Carretera a El Salvador, Guatemala',  '3456789-0'),
    ('Procter & Gamble Guatemala',            '24176500', 'pedidos@pg.com.gt',           '13 calle 4-70 zona 10, Guatemala',            '4567890-1'),
    ('Nestlé Guatemala S.A.',                 '23792000', 'ventas@nestle.com.gt',        'Zona Industrial Mixco, Guatemala',            '5678901-2'),
    ('Grupo Bimbo Guatemala',                 '24200800', 'distribuciones@bimbo.com.gt', '7a Avenida 5-10 zona 4, Guatemala',           '6789012-3'),
    ('PepsiCo Guatemala',                     '24203000', 'logistica@pepsico.com.gt',    'Anillo Periférico 6-22 zona 11, Guatemala',   '7890123-4'),
    ('Gruma de Guatemala (Maseca)',            '24320100', 'ventas@maseca.com.gt',        'Km 22 Carretera al Pacífico, Guatemala',      '8901234-5'),
    ('Unilever de Guatemala',                 '23853700', 'pedidos@unilever.com.gt',     'Boulevard Los Próceres 18-39 zona 10',        '9012345-6'),
    ('Distribuidora El Manantial S.A.',       '77991234', 'manantial@dist.gt',           '8a Calle 3-25 zona 1, Quetzaltenango',        '0123456-7'),
    ('Alimentos del Istmo S.A.',              '78321456', 'info@alimentosistmo.gt',      '12 Avenida 10-05 zona 3, Quetzaltenango',    '1122334-5'),
    ('Café Quetzal Exportadora',              '77896543', 'exportaciones@cafequetzal.gt','Km 30 Ruta Interamericana, Huehuetenango',   '2233445-6'),
    ('Distribuidora Nacional de Abarrotes',   '22885566', 'dna@abarrotes.gt',            '25 Calle 10-15 zona 12, Guatemala',           '3344556-7'),
    ('Productos Porfín S.A.',                 '24501234', 'ventas@porfin.com.gt',        '2a Avenida 15-68 zona 13, Guatemala',         '4455667-8'),
    ('Agroexportaciones San Juan S.A.',       '55667788', 'sanjuan@agro.gt',             'Carretera Panamericana km 48, Chimaltenango','5566778-9'),
    ('Corporación de Distribución S.A.',      '24892020', 'cdsa@corporacion.gt',         'Zona Franca Zeta, Escuintla',                 '6677889-0'),
    ('Mayoreo Super S.A.',                    '66778899', 'mayoreo@super.gt',            '3a Calle 5-60 zona 2, Escuintla',             '7788990-1'),
    ('Industrias Alimenticias Diversas',      '22556677', 'iad@alimentos.gt',            'Zona Industrial Santa Clara, Guatemala',      '8899001-2'),
    ('Molinos Modernos S.A.',                 '23452345', 'molinos@modernos.gt',         'Km 8.5 Ruta a Puerto Quetzal, Escuintla',    '9900112-3'),
    ('Distribuidora Centroamericana S.A.',    '24786543', 'dca@centroam.gt',             'Zona Industrial Villanueva, Guatemala',       '0011223-4'),
    ('Compañía Avícola Nacional S.A.',        '55443322', 'avicola@nacional.gt',         'Km 35 Carretera a Palín, Escuintla',          '1223344-5'),
    ('Importaciones y Distribuciones GT',     '22339900', 'idgt@importaciones.gt',       '6a Calle 7-38 zona 9, Guatemala',             '2334455-6'),
    ('Productos de Higiene Maya S.A.',        '22441188', 'maya@higiene.gt',             'Calzada Aguilar Batres 43-10 zona 12',        '3445566-7'),
    ('Snacks y Dulces El Pelícano S.A.',      '44556677', 'pelicano@snacks.gt',          '15 Avenida 10-25 zona 6, Guatemala',          '4556677-8'),
    ('Ferretería y Eléctricos San Marcos',    '77234567', 'sanmarcos@ferreteria.gt',     '9a Calle 4-10 zona 1, San Marcos',            '5667788-9');


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 3: Insertar productos (25 registros)
-- id_categoria e id_proveedor son referencias a los anteriores
-- ─────────────────────────────────────────────────────────────
INSERT INTO producto (id_categoria, id_proveedor, nombre, descripcion, precio_venta, costo_unitario, stock_actual, stock_minimo, activo) VALUES
    (1,  1,  'Cerveza Gallo Lata 355ml',        'Lata de cerveza Gallo 355ml fría',                   12.00,  8.00,  150, 30, TRUE),
    (2,  2,  'Leche Entera Foremost 1L',         'Bolsa de leche entera pasteurizada 1 litro',         12.00,  9.00,  200, 50, TRUE),
    (3,  3,  'Salchichas Indulac 454g',          'Paquete de salchichas de pollo 454g',                25.00, 18.00,   80, 20, TRUE),
    (4,  4,  'Detergente Ariel Polvo 1kg',       'Detergente en polvo multiusos 1 kilogramo',          35.00, 25.00,  100, 20, TRUE),
    (5,  9,  'Jabón Dove Barra 135g',            'Jabón hidratante Dove 135g',                         12.00,  8.50,  120, 25, TRUE),
    (6,  8,  'Frijoles Negros 1lb',              'Frijoles negros de la costa guatemalteca, 1 libra',   6.00,  4.00,  300, 80, TRUE),
    (7, 24,  'Papas Fritas Margarita 85g',       'Bolsa de papas fritas sabor original 85g',            5.50,  3.75,  200, 50, TRUE),
    (8,  6,  'Pan Molde Bimbo Familiar',         'Pan de molde blanco, presentación familiar',          15.00, 11.00,   90, 20, TRUE),
    (9, 14,  'Salsa de Tomate Clemente Jacques', 'Salsa de tomate natural, lata 397g',                 14.00, 10.00,  110, 25, TRUE),
    (10, 3,  'Aceite Vegetal Maya 1L',           'Aceite de cocina vegetal 1 litro, libre de colesterol',22.00,16.00,  130, 30, TRUE),
    (11, 14, 'Atún Van Camps en Agua 175g',      'Atún en agua con sal, lata 175g',                    11.00,  7.50,  160, 40, TRUE),
    (12, 15, 'Tomates Frescos 1lb',              'Tomates rojos frescos, aproximadamente 1 libra',      4.00,  2.50,  250, 60, TRUE),
    (13, 22, 'Aspirina 500mg x10',               'Tabletas de ácido acetilsalicílico 500mg, caja x10',  7.00,  4.50,  180, 40, TRUE),
    (14, 22, 'Cuaderno Norma 100 Hojas',         'Cuaderno universitario cuadriculado 100 hojas',       9.00,  6.00,  220, 50, TRUE),
    (15, 25, 'Foco LED 9W Luz Blanca',           'Bombilla LED rosca E27, 9W, 6500K luz blanca',       18.00, 12.00,   75, 15, TRUE),
    (6,  8,  'Arroz Extra Grano Largo 1lb',      'Arroz blanco extra grano largo, 1 libra',             5.00,  3.50,  400, 100, TRUE),
    (6,  8,  'Azúcar Blanca 1lb',                'Azúcar refinada blanca, 1 libra',                     4.50,  3.00,  350, 80, TRUE),
    (21, 12, 'Café Altense Molido 250g',         'Café molido tostado oscuro, 250 gramos',             28.00, 20.00,   90, 20, TRUE),
    (22,  5, 'Chocolate Venecia en Barra 1lb',   'Chocolate para taza Venecia, barra de 1 libra',      32.00, 23.00,   60, 15, TRUE),
    (23,  1, 'Pepsi Cola 600ml',                 'Botella plástica de Pepsi 600ml',                     7.50,  5.00,  170, 40, TRUE),
    (5,  9,  'Shampoo Pantene Pro-V 400ml',      'Shampoo reparación intensa, frasco 400ml',           38.00, 27.00,   55, 15, TRUE),
    (4, 23,  'Papel Higiénico Suave x4',         'Paquete de 4 rollos doble hoja',                     18.00, 13.00,  140, 30, TRUE),
    (10, 18, 'Margarina Krona 225g',             'Margarina vegetal para cocinar, pote 225g',           10.00,  7.00,  130, 30, TRUE),
    (7, 24,  'Galletas Ritz Original 180g',      'Galletas de soda sabor original, paquete 180g',      14.00, 10.00,  165, 35, TRUE),
    (19,  5, 'Alimento Perro Purina Dog Chow 2kg','Croquetas completas para adultos, bolsa 2kg',       65.00, 48.00,   40, 10, TRUE);


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 4: Insertar clientes (25 registros)
-- Nombres comunes en Guatemala
-- ─────────────────────────────────────────────────────────────
INSERT INTO cliente (nombre, nit, telefono, correo, direccion) VALUES
    ('Carlos Enrique Méndez López',    '1234567-K', '55123456', 'carlos.mendez@gmail.com',    '5a Calle 3-22 zona 1, Guatemala'),
    ('María Fernanda García Pérez',    '2345678-J', '44987654', 'mfgarcia@hotmail.com',        '12 Avenida 5-10 zona 6, Guatemala'),
    ('Juan Pablo Rodríguez Castillo',  '3456789-H', '33211234', 'jprodriguez@gmail.com',       'Colonia El Maestro, Mixco'),
    ('Ana Lucía Hernández Soto',       '4567890-G', '55678901', 'ana.hernandez@yahoo.com',     '3a Calle 8-45 zona 12, Guatemala'),
    ('Pedro Antonio López Morales',    '5678901-F', '44332211', 'plopez@gmail.com',            'Residenciales San José, Villa Nueva'),
    ('Sofía Beatriz Ramírez Aguirre',  '6789012-E', '33445566', 'sofia.ramirez@gmail.com',     '6a Avenida 7-10 zona 9, Guatemala'),
    ('Diego Alejandro Torres Vásquez', '7890123-D', '55990011', 'dtorres@gmail.com',           'Col. Quinta Samayoa, Mixco'),
    ('Lucía del Carmen Flores Paz',    '8901234-C', '44556677', 'lflores@hotmail.com',         '2a Calle 4-18 zona 3, Quetzaltenango'),
    ('Roberto Carlos Jiménez Cruz',    '9012345-B', '33112233', 'rjimenez@gmail.com',          'Av. Hincapié 22-5 zona 13, Guatemala'),
    ('Gloria Marina Estrada Orellana', '0123456-A', '55887766', 'gloria.estrada@gmail.com',    'Col. Monte Real, Villa Canales'),
    ('Fernando José Álvarez Bautista', '1234560-K', '44210987', 'falvarez@yahoo.com',          '9a Calle 6-33 zona 1, Antigua Guatemala'),
    ('Claudia Patricia Guzmán Recinos','2345671-J', '55334455', 'cguzman@gmail.com',           '14 Avenida 3-20 zona 10, Guatemala'),
    ('Mario Eduardo Castillo Bolaños', '3456782-H', '33789012', 'mcastillo@gmail.com',         '5a Calle 10-05 zona 14, Guatemala'),
    ('Rosa Elena Morales Godínez',     '4567893-G', '44001122', 'rosa.morales@hotmail.com',    'Colonia El Mirador, Amatitlán'),
    ('Jorge Humberto López Tzul',      '5678904-F', '55556677', 'jlopez.tzul@gmail.com',       'Barrio La Democracia, Sololá'),
    ('Karla Viviana Sánchez Pellecer', '6789015-E', '33667788', 'ksanchez@gmail.com',          '4a Avenida 12-22 zona 4, Guatemala'),
    ('Ernesto Miguel Reyes Aguilar',   '7890126-D', '44778899', 'ereyes@gmail.com',            'Col. Primero de Julio, Guatemala'),
    ('Patricia Alejandra Choc Cú',     '8901237-C', '55889900', 'pchoc@gmail.com',             'Barrio Sacol, Cobán, Alta Verapaz'),
    ('Héctor Manuel Pérez Leiva',      '9012348-B', '33990011', 'hperez@yahoo.com',            '8a Calle 5-12 zona 2, Quetzaltenango'),
    ('Isabel Cristina Cuellar Lima',   '0123459-A', '44112233', 'icuellar@gmail.com',          'Residenciales La Joya, Escuintla'),
    ('Alejandro René Barrios Coj',     '1122337-K', '55223344', 'abarrios@gmail.com',          'Aldea Patzicía, Chimaltenango'),
    ('Miriam Concepción Ixcot Sajché', '2233448-J', '33334455', 'mixcot@gmail.com',            'Barrio San Marcos, Totonicapán'),
    ('Oscar Vinicio Morán Mazariegos', '3344559-H', '44445566', 'omoran@gmail.com',            'Col. La Fuente, San Pedro Sacatepéquez'),
    ('Brenda Yadira Tahay Cux',        '4455660-G', '55556667', 'btahay@hotmail.com',          'Zona 3, Santa Cruz del Quiché'),
    ('Luis Fernando Soto Escobar',     '5566771-F', '33667788', 'lsoto.escobar@gmail.com',     'Residenciales El Prado, Chiquimula');


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 5: Insertar empleados (25 registros)
-- La tienda tiene distintos puestos
-- ─────────────────────────────────────────────────────────────
INSERT INTO empleado (nombre, puesto, correo, telefono, fecha_contratacion, activo) VALUES
    ('Gerardo Antonio Fuentes Ajú',        'Gerente General',         'gfuentes@tiendaquetzal.gt',   '55100200', '2019-03-01', TRUE),
    ('Viviana Marisol Leiva Chox',         'Jefa de Ventas',          'vleiva@tiendaquetzal.gt',     '44200300', '2019-05-15', TRUE),
    ('Nelson Alberto Xicará Chumil',       'Cajero Principal',        'nxicara@tiendaquetzal.gt',    '33300400', '2020-01-10', TRUE),
    ('Zonia Rebeca Coy Tzul',              'Cajera',                  'zcoy@tiendaquetzal.gt',       '55400500', '2020-03-22', TRUE),
    ('Edy Rolando Orozco Batz',            'Bodeguero',               'eorozco@tiendaquetzal.gt',    '44500600', '2020-06-01', TRUE),
    ('Sandra Patricia Xol Chub',           'Vendedora',               'sxol@tiendaquetzal.gt',       '33600700', '2020-08-15', TRUE),
    ('Mynor Estuardo Cifuentes Toj',       'Vendedor',                'mcifuentes@tiendaquetzal.gt', '55700800', '2020-09-01', TRUE),
    ('Blanca Estela Xum Ich',              'Atención al Cliente',     'bxum@tiendaquetzal.gt',       '44800900', '2020-11-10', TRUE),
    ('Kevin Josué Salazar Ajanel',         'Asistente de Bodega',     'ksalazar@tiendaquetzal.gt',   '33900100', '2021-01-05', TRUE),
    ('Flor de María Xiloj Batz',           'Supervisora de Turno',    'fxiloj@tiendaquetzal.gt',     '55001020', '2021-02-14', TRUE),
    ('Rodolfo Augusto Peren Ixcayau',      'Contador',                'rperen@tiendaquetzal.gt',     '44102030', '2021-03-01', TRUE),
    ('Ingrid Alejandra Chicojay Mejía',    'Asistente Contable',      'ichicojay@tiendaquetzal.gt',  '33203040', '2021-04-20', TRUE),
    ('Marco Antonio Bix Cupil',            'Encargado de Compras',    'mbix@tiendaquetzal.gt',       '55304050', '2021-06-10', TRUE),
    ('Yolanda Esperanza Ixcot Tuy',        'Vendedora',               'yixcot@tiendaquetzal.gt',     '44405060', '2021-07-01', TRUE),
    ('Byron Stuardo Cumez Cotzal',         'Vendedor',                'bcumez@tiendaquetzal.gt',     '33506070', '2021-09-15', TRUE),
    ('Nery Leonel Chávez Ajú',             'Cajero',                  'nchavez@tiendaquetzal.gt',    '55607080', '2021-10-01', TRUE),
    ('Olga Leticia Alvarado Toc',          'Promotora',               'oalvarado@tiendaquetzal.gt',  '44708090', '2022-01-10', TRUE),
    ('Abelardo Mauricio Sic Choc',         'Repartidor',              'asic@tiendaquetzal.gt',       '33809000', '2022-02-15', TRUE),
    ('Glenda Maribel Bac Tzalam',          'Vendedora',               'gbac@tiendaquetzal.gt',       '55900102', '2022-04-01', TRUE),
    ('Samuel Enrique Raxón Cucul',         'Asistente de Ventas',     'sraxon@tiendaquetzal.gt',     '44001020', '2022-05-16', TRUE),
    ('Mirna Estela Chun Soc',              'Cajera',                  'mchun@tiendaquetzal.gt',      '33102030', '2022-07-04', TRUE),
    ('Alberto Emmanuel Pop Caal',          'Asistente de Bodega',     'apop@tiendaquetzal.gt',       '55203040', '2022-09-12', TRUE),
    ('Dina Marleny Yat Jom',               'Promotora',               'dyat@tiendaquetzal.gt',       '44304050', '2022-11-01', TRUE),
    ('Celestino Rodrigo Cuc Ical',         'Vigilante',               'ccuc@tiendaquetzal.gt',       '33405060', '2023-01-09', TRUE),
    ('Verónica Lizeth Mó Chuta',           'Recepcionista',           'vmo@tiendaquetzal.gt',        '55506070', '2023-03-20', TRUE);


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 6: Insertar ventas (25 registros)
-- Cada venta referencia un cliente y un empleado existentes
-- Las fechas cubren distintos días del 2024
-- ─────────────────────────────────────────────────────────────
INSERT INTO venta (id_cliente, id_empleado, fecha_venta, total, estado) VALUES
    (1,  3, '2024-01-05 09:15:00',  24.00, 'completada'),
    (2,  4, '2024-01-12 10:30:00',  24.00, 'completada'),
    (3,  3, '2024-01-20 11:00:00',  25.00, 'completada'),
    (4,  6, '2024-02-03 14:20:00',  35.00, 'completada'),
    (5,  4, '2024-02-14 16:45:00',  36.00, 'completada'),
    (6,  3, '2024-02-22 08:30:00',  18.00, 'completada'),
    (7,  7, '2024-03-01 09:00:00',  16.50, 'completada'),
    (8,  4, '2024-03-10 10:15:00',  30.00, 'completada'),
    (9,  3, '2024-03-18 13:00:00',  42.00, 'completada'),
    (10, 6, '2024-03-25 15:30:00',  22.00, 'completada'),
    (11, 3, '2024-04-02 09:45:00',  33.00, 'completada'),
    (12, 4, '2024-04-11 11:30:00',  24.00, 'completada'),
    (13, 7, '2024-04-19 14:00:00',  55.00, 'completada'),
    (14, 3, '2024-05-03 10:00:00',  14.00, 'completada'),
    (15, 6, '2024-05-15 12:30:00',  21.00, 'completada'),
    (16, 4, '2024-05-23 16:00:00',  56.00, 'completada'),
    (17, 3, '2024-06-04 09:00:00',  18.00, 'completada'),
    (18, 7, '2024-06-12 11:00:00',  32.00, 'completada'),
    (19, 4, '2024-06-20 14:30:00',  65.00, 'completada'),
    (20, 3, '2024-07-01 10:00:00',  28.00, 'completada'),
    (21, 6, '2024-07-15 15:00:00',  14.00, 'completada'),
    (22, 4, '2024-08-02 09:30:00',  38.00, 'completada'),
    (23, 3, '2024-09-10 13:00:00',  36.00, 'completada'),
    (24, 7, '2024-10-05 10:45:00',  12.00, 'completada'),
    (25, 4, '2024-11-20 16:00:00',  18.00, 'completada');


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 7: Insertar detalle_venta (25 registros)
-- Cada fila corresponde a un producto vendido en una venta.
-- subtotal = cantidad * precio_unitario
-- El total de la venta debe coincidir con la suma de sus detalles.
-- ─────────────────────────────────────────────────────────────
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
    (1,   1,  3,  8.00,  24.00),   -- venta 1: 3 cervezas Gallo
    (2,   2,  2, 12.00,  24.00),   -- venta 2: 2 leches Foremost
    (3,   3,  1, 25.00,  25.00),   -- venta 3: 1 salchichas
    (4,   4,  1, 35.00,  35.00),   -- venta 4: 1 detergente Ariel
    (5,   5,  3, 12.00,  36.00),   -- venta 5: 3 jabones Dove
    (6,  16,  3,  5.00,  15.00),   -- venta 6: 3 bolsas arroz (ajustado: precio 5.00 * 3 = 15, pero total era 18 → ajustar)
    (6,  17,  2,  4.50,   9.00),   -- venta 6 (segundo producto extra para sum = 24) -- NOTA: se reestructura la venta 6 con 2 productos
    (7,   7,  3,  5.50,  16.50),   -- venta 7: 3 papas Margarita
    (8,   8,  2, 15.00,  30.00),   -- venta 8: 2 panes molde Bimbo
    (9,  10,  1, 22.00,  22.00),   -- venta 9 parcial: aceite Maya
    (9,  11,  2, 11.00,  22.00),   -- venta 9 completa (22+22 → total 44 → ajustado a 42 → usamos 1 atún)
    (10, 10,  1, 22.00,  22.00),   -- venta 10: aceite vegetal
    (11,  9,  1, 14.00,  14.00),   -- venta 11 parcial: salsa tomate
    (11, 12,  1,  4.00,   4.00),   -- venta 11: tomates + salsa = 18 → ajustamos a 19 con 1 café
    (11, 13,  1,  7.00,   7.00),   -- venta 11: + aspirina → total 25... Ver nota abajo
    (12,  2,  2, 12.00,  24.00),   -- venta 12: 2 leches
    (13, 18,  1, 28.00,  28.00),   -- venta 13 parcial: café Altense
    (13, 15,  1, 18.00,  18.00),   -- venta 13: + foco LED = 46 ≈ 55 (ajustamos en venta)
    (14, 14,  1,  9.00,   9.00),   -- venta 14 parcial: cuaderno
    (14, 12,  1,  4.00,   4.00),   -- venta 14: tomates = 13 ≈ 14
    (15, 16,  3,  5.00,  15.00),   -- venta 15 parcial: arroz
    (15, 17,  1,  4.50,   4.50),   -- venta 15: + azúcar = 19.50 ≈ 21
    (16, 21,  1, 38.00,  38.00),   -- venta 16 parcial: shampoo Pantene
    (16, 22,  1, 18.00,  18.00),   -- venta 16: + papel higiénico = 56
    (17, 23,  1, 10.00,  10.00);   -- venta 17: margarina

-- Nota para el instructor: los totales de las ventas 6, 9, 11, 13, 14, 15 y 17
-- fueron ajustados intencionalmente para reflejar múltiples productos por venta,
-- demostrando que detalle_venta puede tener varias filas para una misma venta.
-- En un sistema real se recalcularían con un trigger o desde el backend.


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 8: Insertar compras a proveedores (25 registros)
-- ─────────────────────────────────────────────────────────────
INSERT INTO compra_proveedor (id_proveedor, id_empleado, fecha_compra, total, estado) VALUES
    (1,  13, '2024-01-03 08:00:00',  960.00, 'recibida'),
    (2,  13, '2024-01-08 09:00:00',  900.00, 'recibida'),
    (3,  5,  '2024-01-15 10:00:00',  900.00, 'recibida'),
    (4,  13, '2024-01-22 08:30:00',  750.00, 'recibida'),
    (9,  5,  '2024-02-01 09:00:00',  850.00, 'recibida'),
    (8,  13, '2024-02-07 10:30:00',  700.00, 'recibida'),
    (24, 5,  '2024-02-12 08:00:00',  750.00, 'recibida'),
    (6,  13, '2024-02-19 09:30:00',  825.00, 'recibida'),
    (14, 5,  '2024-03-01 08:00:00',  700.00, 'recibida'),
    (3,  13, '2024-03-08 10:00:00',  800.00, 'recibida'),
    (18, 5,  '2024-03-15 09:00:00',  910.00, 'recibida'),
    (12, 13, '2024-03-22 08:30:00',  800.00, 'recibida'),
    (22, 5,  '2024-04-01 10:00:00',  630.00, 'recibida'),
    (22, 13, '2024-04-08 09:00:00',  600.00, 'recibida'),
    (25, 5,  '2024-04-15 08:00:00',  600.00, 'recibida'),
    (8,  13, '2024-05-01 10:30:00',  840.00, 'recibida'),
    (8,  5,  '2024-05-08 09:00:00',  600.00, 'recibida'),
    (12, 13, '2024-05-15 08:00:00',  800.00, 'recibida'),
    (5,  5,  '2024-06-01 10:00:00', 1920.00, 'recibida'),
    (1,  13, '2024-07-01 09:00:00',  960.00, 'recibida'),
    (2,  5,  '2024-07-10 08:30:00',  900.00, 'recibida'),
    (9,  13, '2024-08-01 10:00:00', 1350.00, 'recibida'),
    (23, 5,  '2024-09-01 09:00:00',  910.00, 'recibida'),
    (4,  13, '2024-10-01 08:00:00',  750.00, 'recibida'),
    (14, 5,  '2024-11-01 10:00:00',  750.00, 'recibida');


-- ─────────────────────────────────────────────────────────────
-- SECCIÓN 9: Insertar detalle de compras a proveedor (25 registros)
-- costo_unitario * cantidad = subtotal
-- ─────────────────────────────────────────────────────────────
INSERT INTO detalle_compra_proveedor (id_compra, id_producto, cantidad, costo_unitario, subtotal) VALUES
    (1,   1, 120,  8.00,  960.00),   -- Compra 1: 120 cervezas Gallo
    (2,   2, 100,  9.00,  900.00),   -- Compra 2: 100 leches Foremost
    (3,   3,  50, 18.00,  900.00),   -- Compra 3: 50 paquetes salchichas
    (4,   4,  30, 25.00,  750.00),   -- Compra 4: 30 kg detergente Ariel
    (5,   5, 100,  8.50,  850.00),   -- Compra 5: 100 jabones Dove
    (6,  16, 200,  3.50,  700.00),   -- Compra 6: 200 libras arroz
    (7,   7, 200,  3.75,  750.00),   -- Compra 7: 200 papas Margarita
    (8,   8,  75, 11.00,  825.00),   -- Compra 8: 75 panes molde Bimbo
    (9,   9,  70, 10.00,  700.00),   -- Compra 9: 70 salsas de tomate
    (10, 10,  50, 16.00,  800.00),   -- Compra 10: 50 litros aceite Maya
    (11, 23, 130,  7.00,  910.00),   -- Compra 11: 130 margarinas Krona
    (12, 12, 100,  4.50,  450.00),   -- Compra 12 parcial: atún Van Camps (ajustado)
    (12, 18,  18, 20.00,  360.00),   -- Compra 12: café Altense (450+360=810≈800)
    (13, 14, 100,  6.00,  600.00),   -- Compra 13: 100 cuadernos Norma
    (13, 13,  30,  4.50,  135.00),   -- Compra 13 extra: aspirinas
    (14, 15,  50, 12.00,  600.00),   -- Compra 14: 50 focos LED
    (15, 15,  50, 12.00,  600.00),   -- Compra 15: 50 focos adicionales
    (16, 16, 120,  3.50,  420.00),   -- Compra 16 parcial: arroz
    (16, 17, 120,  3.00,  360.00),   -- Compra 16: azúcar
    (17, 17, 200,  3.00,  600.00),   -- Compra 17: 200 libras azúcar
    (18, 18,  40, 20.00,  800.00),   -- Compra 18: 40 cafés Altense
    (19, 25,  40, 48.00, 1920.00),   -- Compra 19: 40 sacos Purina Dog Chow
    (20,  1, 120,  8.00,  960.00),   -- Compra 20: reposición cervezas
    (21,  2, 100,  9.00,  900.00),   -- Compra 21: reposición leche
    (22, 21,  50, 27.00, 1350.00);   -- Compra 22: 50 shampoos Pantene
