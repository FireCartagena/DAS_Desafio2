-- Eliminar la base de datos si ya existe
IF DB_ID('tienda_tecnologia') IS NOT NULL
BEGIN
    DROP DATABASE tienda_tecnologia;
END
GO

-- Crear la base de datos
CREATE DATABASE tienda_tecnologia 
ON (
    NAME = 'tienda_tecnologia_data', 
    FILENAME = 'D:\UDB Virtual\DAS901 Desarrollo de Aplicaciones con Software Propietario\3 Actividades\3 Desafio 2\TiendaTecnologia\tienda_tecnologia.mdf',
    SIZE = 10MB, 
    MAXSIZE = 15MB, 
    FILEGROWTH = 10MB
)
LOG ON(
    NAME = 'tienda_tecnologia_log', 
    FILENAME = 'D:\UDB Virtual\DAS901 Desarrollo de Aplicaciones con Software Propietario\3 Actividades\3 Desafio 2\TiendaTecnologia\tienda_tecnologia.ldf',
    SIZE = 9MB, 
    MAXSIZE = 15MB, 
    FILEGROWTH = 5MB
);
GO

-- Usar la base de datos
USE tienda_tecnologia;
GO

-- Crear tablas
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    NombreUsuario NVARCHAR(50) NOT NULL,
    Contrasena NVARCHAR(255) NOT NULL,
    Rol NVARCHAR(20) NOT NULL,
    CONSTRAINT CHK_Rol CHECK (Rol IN ('Usuario', 'Administrador'))
);

CREATE TABLE Categoria (
	CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
	NombreCategoria NVARCHAR(255) NOT NULL
);

CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
	CategoriaID INT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Cantidad INT NOT NULL,
	CONSTRAINT FK_Productos_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

CREATE TABLE Sesiones (
    SesionID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT NULL,
    FechaInicio DATETIME NOT NULL,
    FechaFin DATETIME NULL,
    CONSTRAINT FK_Sesiones_Usuarios FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    ProductoID INT NOT NULL,
    CantidadVendida INT NOT NULL,
    TotalVenta DECIMAL(10, 2) NOT NULL,
    FechaVenta DATETIME NOT NULL,
    CONSTRAINT FK_Ventas_Productos FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Índices
CREATE NONCLUSTERED INDEX idx_cantidad_producto ON Productos(Cantidad);
CREATE NONCLUSTERED INDEX idx_categoria_producto ON Productos(CategoriaID);

-- Insertar datos
INSERT INTO Usuarios (NombreUsuario, Contrasena, Rol) 
VALUES 
('admin', 'hash_123456', 'Administrador'),
('usuario', 'hash_password1', 'Usuario');

INSERT INTO Categoria (NombreCategoria) 
VALUES 
('Laptops'),
('Smartphones'),
('Accesorios'),
('Periféricos');

INSERT INTO Productos (CategoriaID, Nombre, Descripcion, Precio, Cantidad) 
VALUES 
(1, 'Laptop HP', 'Laptop con 16GB RAM y 512GB SSD', 1200.00, 10),
(4, 'Mouse Logitech', 'Mouse inalámbrico ergonómico', 25.50, 50),
(4, 'Monitor Samsung', 'Monitor LED de 24 pulgadas', 180.99, 20);

INSERT INTO Sesiones (UsuarioID, FechaInicio, FechaFin) 
VALUES 
(1, '2024-11-17 08:00:00', '2024-11-17 12:00:00'),
(2, '2024-11-16 09:30:00', '2024-11-16 10:30:00'),
(NULL, '2024-11-15 14:00:00', NULL);

INSERT INTO Ventas (ProductoID, CantidadVendida, TotalVenta, FechaVenta) 
VALUES 
(1, 2, 2400.00, '2024-11-15 10:00:00'),
(2, 5, 127.50, '2024-11-16 11:30:00');
