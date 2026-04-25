-- ============================================================
-- schema.sql
-- Proyecto 2 - Bases de Datos 1
-- DDL completo para sistema de inventario y ventas de tienda
-- Compatible con PostgreSQL / pgAdmin 4 Query Tool
-- ============================================================

-- ─────────────────────────────────────────────────────────────
-- 1. ELIMINAR TABLAS (orden inverso a la creación por FKs)
-- ─────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS detalle_compra_proveedor CASCADE;
DROP TABLE IF EXISTS compra_proveedor           CASCADE;
DROP TABLE IF EXISTS detalle_venta              CASCADE;
DROP TABLE IF EXISTS venta                      CASCADE;
DROP TABLE IF EXISTS producto                   CASCADE;
DROP TABLE IF EXISTS cliente                    CASCADE;
DROP TABLE IF EXISTS empleado                   CASCADE;
DROP TABLE IF EXISTS proveedor                  CASCADE;
DROP TABLE IF EXISTS categoria                  CASCADE;

-- ─────────────────────────────────────────────────────────────
-- 2. TABLA: categoria
--    Agrupa los productos por tipo.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE categoria (
    id_categoria  INTEGER      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre        VARCHAR(100) NOT NULL UNIQUE,
    descripcion   TEXT
);

-- ─────────────────────────────────────────────────────────────
-- 3. TABLA: proveedor
--    Empresa o persona que suministra productos a la tienda.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE proveedor (
    id_proveedor  INTEGER      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre        VARCHAR(150) NOT NULL,
    telefono      VARCHAR(20),
    correo        VARCHAR(100),
    direccion     TEXT,
    nit           VARCHAR(20)  UNIQUE
);

-- ─────────────────────────────────────────────────────────────
-- 4. TABLA: producto
--    Artículo disponible para la venta.
--    Depende de categoria y proveedor principal.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE producto (
    id_producto    INTEGER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_categoria   INTEGER        NOT NULL REFERENCES categoria(id_categoria),
    id_proveedor   INTEGER        NOT NULL REFERENCES proveedor(id_proveedor),
    nombre         VARCHAR(150)   NOT NULL,
    descripcion    TEXT,
    precio_venta   NUMERIC(10,2)  NOT NULL CHECK (precio_venta   >= 0),
    costo_unitario NUMERIC(10,2)  NOT NULL CHECK (costo_unitario >= 0),
    stock_actual   INTEGER        NOT NULL CHECK (stock_actual   >= 0) DEFAULT 0,
    stock_minimo   INTEGER        NOT NULL CHECK (stock_minimo   >= 0) DEFAULT 5,
    activo         BOOLEAN        NOT NULL DEFAULT TRUE
);

-- ─────────────────────────────────────────────────────────────
-- 5. TABLA: cliente
--    Persona que compra en la tienda.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE cliente (
    id_cliente  INTEGER      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre      VARCHAR(150) NOT NULL,
    nit         VARCHAR(20)  UNIQUE,
    telefono    VARCHAR(20),
    correo      VARCHAR(100),
    direccion   TEXT
);

-- ─────────────────────────────────────────────────────────────
-- 6. TABLA: empleado
--    Trabajador de la tienda que puede atender ventas o gestionar
--    compras a proveedores.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE empleado (
    id_empleado        INTEGER      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre             VARCHAR(150) NOT NULL,
    puesto             VARCHAR(100) NOT NULL,
    correo             VARCHAR(100) UNIQUE,
    telefono           VARCHAR(20),
    fecha_contratacion DATE         NOT NULL,
    activo             BOOLEAN      NOT NULL DEFAULT TRUE
);

-- ─────────────────────────────────────────────────────────────
-- 7. TABLA: venta
--    Transacción de venta realizada a un cliente, atendida
--    por un empleado.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE venta (
    id_venta    INTEGER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente  INTEGER        NOT NULL REFERENCES cliente(id_cliente),
    id_empleado INTEGER        NOT NULL REFERENCES empleado(id_empleado),
    fecha_venta TIMESTAMP      NOT NULL DEFAULT NOW(),
    total       NUMERIC(10,2)  NOT NULL CHECK (total >= 0),
    estado      VARCHAR(20)    NOT NULL DEFAULT 'completada'
                               CHECK (estado IN ('completada', 'anulada', 'pendiente'))
);

-- ─────────────────────────────────────────────────────────────
-- 8. TABLA: detalle_venta
--    Línea de producto dentro de una venta (tabla intermedia
--    que resuelve la relación N:M entre venta y producto).
-- ─────────────────────────────────────────────────────────────
CREATE TABLE detalle_venta (
    id_detalle      INTEGER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_venta        INTEGER        NOT NULL REFERENCES venta(id_venta),
    id_producto     INTEGER        NOT NULL REFERENCES producto(id_producto),
    cantidad        INTEGER        NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2)  NOT NULL CHECK (precio_unitario >= 0),
    subtotal        NUMERIC(10,2)  NOT NULL CHECK (subtotal >= 0),
    UNIQUE (id_venta, id_producto)
);

-- ─────────────────────────────────────────────────────────────
-- 9. TABLA: compra_proveedor
--    Registro de una compra/pedido realizado a un proveedor
--    para reponer inventario. Gestionado por un empleado.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE compra_proveedor (
    id_compra    INTEGER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_proveedor INTEGER        NOT NULL REFERENCES proveedor(id_proveedor),
    id_empleado  INTEGER        NOT NULL REFERENCES empleado(id_empleado),
    fecha_compra TIMESTAMP      NOT NULL DEFAULT NOW(),
    total        NUMERIC(10,2)  NOT NULL CHECK (total >= 0),
    estado       VARCHAR(20)    NOT NULL DEFAULT 'recibida'
                                CHECK (estado IN ('recibida', 'pendiente', 'cancelada'))
);

-- ─────────────────────────────────────────────────────────────
-- 10. TABLA: detalle_compra_proveedor
--     Línea de producto dentro de una compra a proveedor.
--     Permite registrar exactamente qué se compró y a qué costo,
--     y sirve de base para actualizar el stock del producto.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE detalle_compra_proveedor (
    id_detalle_compra INTEGER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_compra         INTEGER        NOT NULL REFERENCES compra_proveedor(id_compra),
    id_producto       INTEGER        NOT NULL REFERENCES producto(id_producto),
    cantidad          INTEGER        NOT NULL CHECK (cantidad > 0),
    costo_unitario    NUMERIC(10,2)  NOT NULL CHECK (costo_unitario >= 0),
    subtotal          NUMERIC(10,2)  NOT NULL CHECK (subtotal >= 0),
    UNIQUE (id_compra, id_producto)
);
