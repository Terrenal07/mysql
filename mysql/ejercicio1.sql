SELECT * FROM sys.productos ORDER BY UnidadesEnStock desc;
/*crear tabla de productos*/
CREATE TABLE sys.Productos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    UnidadesEnStock INT,
    FechaAlta DATE,
    Descuento DECIMAL(4,2) CHECK (Descuento IN (0, 0.05, 0.10, 0.20, 0.50))
);
/*llenar tabla*/
INSERT INTO sys.Productos (Nombre, UnidadesEnStock, FechaAlta, Descuento)
VALUES
    ('patatas', 20, '2023-01-01', 0.10),
    ('sardinas', 15, '2023-02-05', 0.20),
    ('leche frita', 10, '2023-03-10', 0.05),
    ('alpacas', 5, '2023-04-15', 0),
    ('12 huevos', 30, '2023-05-20', 0.50),
DELETE FROM sys.productos WHERE id>5;
SELECT ID, Nombre, UnidadesEnStock, DATE_FORMAT(FechaAlta, '%d/%m/%Y') AS Fecha, Descuento
FROM sys.Productos;