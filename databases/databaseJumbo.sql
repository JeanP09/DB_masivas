CREATE DATABASE IF NOT EXISTS databaseJumbo;

USE databaseJumbo;

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    marca VARCHAR(100),
    modelo VARCHAR(100),
    capacidad VARCHAR(50),
    categoria VARCHAR(50),
    precio_actual DECIMAL(10,2),
    year_lanzamiento INT
) ENGINE=InnoDB;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_compra DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
) ENGINE=InnoDB;

CREATE TABLE DetallesCompra (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    precio_compra DECIMAL(10,2),
    cantidad INT,
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
) ENGINE=InnoDB;

CREATE TABLE Garantias (
    id_garantia INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Inserciones a las tablasd
INSERT INTO Productos (nombre, marca, modelo, capacidad, categoria, precio_actual, year_lanzamiento)
VALUES 
('Nevera Mabe 300L', 'Mabe', 'MB300', '300 Litros', 'Nevera', 1800000, 2023),
('Televisor Samsung 55"', 'Samsung', 'QLED55', '55 Pulgadas', 'Televisor', 3000000, 2023);

INSERT INTO Clientes (nombre, email, telefono)
VALUES 
('Juan Pérez', 'juanperez@email.com', '3001234567');

INSERT INTO Compras (id_cliente, fecha_compra)
VALUES (1, '2023-06-15');

INSERT INTO DetallesCompra (id_compra, id_producto, precio_compra, cantidad)
VALUES (1, 1, 1800000, 1);

INSERT INTO Garantias (id_compra, id_producto, fecha_inicio, fecha_fin)
VALUES (1, 1, '2023-06-15', '2025-06-15');

SELECT * FROM Productos;
SELECT * FROM Clientes;
SELECT * FROM Compras;
SELECT * FROM DetallesCompra;
SELECT * FROM Garantias;

DELIMITER $$

CREATE PROCEDURE depreciar_precios()
BEGIN
    UPDATE Productos
    SET precio_actual = precio_actual * (1 - 0.10);
END$$

DELIMITER ;
-- DROP EVENT depreciar_precios_event;

CREATE EVENT IF NOT EXISTS depreciar_precios_event
ON SCHEDULE EVERY 1 YEAR
STARTS '2025-02-17 12:12:30'
DO
  CALL depreciar_precios();

SELECT * FROM Productos;


  
SELECT g.id_garantia, c.id_compra, p.nombre, p.marca, p.modelo, dc.precio_compra AS precio_original, p.precio_actual AS precio_actual
FROM Garantias g
JOIN Compras c ON g.id_compra = c.id_compra
JOIN DetallesCompra dc ON c.id_compra = dc.id_compra
JOIN Productos p ON dc.id_producto = p.id_producto
WHERE c.id_cliente = 1 AND p.id_producto = 1;
