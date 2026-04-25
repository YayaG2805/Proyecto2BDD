-- ============================================================
-- indexes.sql
-- Proyecto 2 - Bases de Datos 1
-- Índices explícitos para optimizar consultas frecuentes
-- Compatible con PostgreSQL / pgAdmin 4 Query Tool
-- ============================================================
-- IMPORTANTE: Ejecutar DESPUÉS de schema.sql y seed.sql
-- ============================================================


-- ─────────────────────────────────────────────────────────────
-- ÍNDICE 1: producto(nombre)
-- ─────────────────────────────────────────────────────────────
-- Justificación:
--   El nombre del producto es el campo más usado para buscarlo
--   desde la interfaz de la tienda (buscador de productos,
--   autocompletado en caja). Sin índice, cada búsqueda recorre
--   todos los registros de la tabla producto.
--   Mejora consultas como:
--     SELECT * FROM producto WHERE nombre ILIKE 'Coca%';
--     SELECT * FROM producto WHERE nombre = 'Leche Entera Foremost 1L';
-- ─────────────────────────────────────────────────────────────
CREATE INDEX idx_producto_nombre
    ON producto (nombre);


-- ─────────────────────────────────────────────────────────────
-- ÍNDICE 2: producto(id_categoria)
-- ─────────────────────────────────────────────────────────────
-- Justificación:
--   Es muy común filtrar o listar productos por categoría
--   (e.g., "mostrar todos los lácteos", "buscar en limpieza").
--   Este índice acelera los JOINs entre producto y categoria,
--   y los filtros por id_categoria.
--   Mejora consultas como:
--     SELECT p.nombre, c.nombre AS categoria
--     FROM producto p
--     JOIN categoria c ON p.id_categoria = c.id_categoria
--     WHERE p.id_categoria = 2;
-- ─────────────────────────────────────────────────────────────
CREATE INDEX idx_producto_categoria
    ON producto (id_categoria);


-- ─────────────────────────────────────────────────────────────
-- ÍNDICE 3: venta(fecha_venta)
-- ─────────────────────────────────────────────────────────────
-- Justificación:
--   El reporte de ventas por período (diario, semanal, mensual)
--   es la consulta más frecuente para la administración de la
--   tienda. Sin índice, el DBMS debe escanear toda la tabla
--   venta para encontrar las ventas de un rango de fechas.
--   Mejora consultas como:
--     SELECT * FROM venta
--     WHERE fecha_venta BETWEEN '2024-03-01' AND '2024-03-31';
--     SELECT SUM(total) FROM venta WHERE fecha_venta::DATE = CURRENT_DATE;
-- ─────────────────────────────────────────────────────────────
CREATE INDEX idx_venta_fecha
    ON venta (fecha_venta);


-- ─────────────────────────────────────────────────────────────
-- ÍNDICE 4: venta(id_cliente)
-- ─────────────────────────────────────────────────────────────
-- Justificación:
--   Para consultar el historial de compras de un cliente
--   específico (útil para atención al cliente y fidelización).
--   También se usa en JOINs entre venta y cliente.
--   Mejora consultas como:
--     SELECT v.id_venta, v.fecha_venta, v.total
--     FROM venta v
--     WHERE v.id_cliente = 5
--     ORDER BY v.fecha_venta DESC;
-- ─────────────────────────────────────────────────────────────
CREATE INDEX idx_venta_cliente
    ON venta (id_cliente);


-- ─────────────────────────────────────────────────────────────
-- ÍNDICE 5: detalle_venta(id_venta, id_producto)  —  compuesto
-- ─────────────────────────────────────────────────────────────
-- Justificación:
--   Las consultas que expanden el detalle de una venta
--   (qué productos se vendieron y en qué cantidad) son
--   muy frecuentes al generar facturas o reportes de ventas.
--   Un índice compuesto sobre (id_venta, id_producto) cubre
--   tanto los lookups por venta como la restricción UNIQUE
--   que evita duplicar el mismo producto en una misma venta.
--   PostgreSQL ya crea un índice para UNIQUE, pero hacerlo
--   explícito permite documentarlo y controlarlo.
--   Mejora consultas como:
--     SELECT dv.cantidad, dv.precio_unitario, dv.subtotal, p.nombre
--     FROM detalle_venta dv
--     JOIN producto p ON dv.id_producto = p.id_producto
--     WHERE dv.id_venta = 1;
-- ─────────────────────────────────────────────────────────────
CREATE INDEX idx_detalle_venta_venta_producto
    ON detalle_venta (id_venta, id_producto);


-- ─────────────────────────────────────────────────────────────
-- ÍNDICE 6 (bonus): producto(stock_actual)
-- ─────────────────────────────────────────────────────────────
-- Justificación:
--   El sistema necesita generar alertas cuando el stock de
--   un producto cae por debajo del mínimo. Esta consulta se
--   ejecuta periódicamente o en tiempo real.
--   Mejora consultas como:
--     SELECT nombre, stock_actual, stock_minimo
--     FROM producto
--     WHERE stock_actual <= stock_minimo AND activo = TRUE;
-- ─────────────────────────────────────────────────────────────
CREATE INDEX idx_producto_stock
    ON producto (stock_actual);
