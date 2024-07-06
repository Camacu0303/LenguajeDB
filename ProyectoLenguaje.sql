sqlplus / as sysdba
ALTER SESSION SET "_oracle_script"=true;

CREATE USER DBAdmin IDENTIFIED BY "Password";
GRANT DBA TO DBAdmin;

/Crear conexion a Oracle con nuevo usuario, y crear tablas/


CREATE TABLE Sucursal (
    Id_Sucursal  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Nombre VARCHAR2(100),
    Ubicacion VARCHAR2(200),
    Telefono VARCHAR2(20),
    CONSTRAINT PK_SUCURSAL PRIMARY KEY(Id_Sucursal)
);


CREATE TABLE Categoria (
    Id_Categoria NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY  ,
    Nombre VARCHAR2(100),
    Activo NUMBER(1),
    ruta_imagen VARCHAR2(1024),
    Descripcion VARCHAR2(500),
    CONSTRAINT PK_CATEGORIA PRIMARY KEY(Id_Categoria)
);


CREATE TABLE Producto (
    Id_Producto NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Descripcion VARCHAR2(500),
    Precio NUMBER(10, 2),
    Stock NUMBER,
    ruta_imagen VARCHAR2(1024),
    Id_Categoria NUMBER,
    Id_Sucursal NUMBER,
    Activo NUMBER(1), 
    FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria),
    FOREIGN KEY (Id_Sucursal) REFERENCES Sucursal(Id_Sucursal)
);

CREATE TABLE Accesorio (
    Id_Accesorio NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100),
    Descripcion VARCHAR2(500),
    Precio NUMBER(10, 2),
    Stock NUMBER,
    Id_Categoria NUMBER,
    CONSTRAINT FK_Categoria_Accesorio FOREIGN KEY (Id_Categoria) 
    REFERENCES Categoria(Id_Categoria)
);




CREATE TABLE Empleado (
    Id_Empleado  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    Nombre VARCHAR2(100),
    password  VARCHAR2(512) NOT NULL,
    Apellido VARCHAR2(100),
    Correo VARCHAR2(200),
    Telefono VARCHAR2(20),
    ruta_imagen VARCHAR2(1024),
    Id_Sucursal NUMBER,
    Activo NUMBER(1),
    FOREIGN KEY (Id_Sucursal) REFERENCES Sucursal(Id_Sucursal)
);

CREATE TABLE Cliente (
    Id_Cliente  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100),
    Apellidos VARCHAR2(100),
    Telefono VARCHAR2(20),
    Correo VARCHAR2(200),
    Direccion VARCHAR2(500)
);


CREATE TABLE Venta(
    Id_venta  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Subtotal NUMBER(10, 2),
    IVA NUMBER(10, 2),
    TOTAL NUMBER(10, 2),
    Id_Cliente NUMBER,
    Id_Producto NUMBER,       
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);



CREATE TABLE Pedido (
    Id_Pedido NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY ,
    Id_Cliente NUMBER,
    Fecha_Pedido TIMESTAMP,
    Estado VARCHAR2(20),
    Total NUMBER(10, 2),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

CREATE TABLE Detalle_Pedido (
    Id_Detalle  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Id_Pedido NUMBER,
    Id_Producto NUMBER,
    Cantidad NUMBER,
    Precio NUMBER(10, 2),
    Total NUMBER(10, 2),
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);

CREATE TABLE Usuario (
  id_usuario NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  username VARCHAR2(20) NOT NULL,
  password VARCHAR2(512) NOT NULL,
  nombre VARCHAR2(20) NOT NULL,
  apellido VARCHAR2(30) NOT NULL,
  correo VARCHAR2(25),
  telefono VARCHAR2(15),
  ruta_imagen VARCHAR2(1024),
  activo NUMBER(1),
  CONSTRAINT usuario_pk PRIMARY KEY (id_usuario)
);


ALTER TABLE Usuario DROP COLUMN id_usuario;

ALTER TABLE Usuario ADD (
  id_usuario NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (START WITH 1) PRIMARY KEY
);

CREATE TABLE Devolucion (
    Id_Devolucion  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Id_Cliente NUMBER,
    Id_Producto NUMBER,
    Fecha_Devolucion DATE,
    Cantidad NUMBER,
    Motivo VARCHAR2(500),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);

CREATE TABLE rol (
  Id_Rol  NUMBER  GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  Nombre VARCHAR2(20),
  Id_Usuario NUMBER,
  CONSTRAINT fk_rol_usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);
------------------------------------------------------------------------
--------------------------INSERTS---------------------------------------

INSERT INTO categoria (id_categoria, nombre, ruta_imagen, activo) VALUES 
(1, 'Monitores', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/695858/media/catalog/category/MONITORES.jpg', 1)

INSERT INTO producto (id_producto, id_categoria, descripcion, precio, stock, ruta_imagen, activo, id_sucursal) VALUES
(1, 1, 'Monitor AOC 19', 23000, 5, 'https://c.pxhere.com/images/ec/fd/d67b367ed6467eb826842ac81d3b-1453591.jpg!d', 1, 1);

INSERT INTO Sucursal (Id_Sucursal, Nombre, Ubicacion, Telefono)
VALUES (1, 'Sucursal Central', 'Calle Principal 123, Ciudad', '1234567890');

INSERT INTO usuario (id_usuario, username, password, nombre, apellido, correo, telefono, ruta_imagen, activo)  
VALUES (1, 'Juan', '123','Juan', 'P�rez', 'juan@example.com', '123456789', 1, 1);

INSERT INTO usuario (id_usuario, username, password, nombre, apellido, correo, telefono, ruta_imagen, activo)  
VALUES(2, 'rebeca', '456', 'Rebeca', 'Contreras Mora', 'acontreras@gmail.com', '5456-8789', 'https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg', 1)

INSERT INTO usuario (id_usuario, username, password, nombre, apellido, correo, telefono, ruta_imagen, activo) 
VALUES(3, 'pedro', '789', 'Pedro', 'Mena Loria', 'lmena@gmail.com', '7898-8936', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854', 1);

INSERT INTO rol (id_rol, nombre, id_usuario) VALUES
(1, 'Administrador', 1)
INSERT INTO rol (id_rol, nombre, id_usuario) VALUES
(2, 'Cliente', 2);
INSERT INTO rol (id_rol, nombre, id_usuario) VALUES
(3, 'Cliente', 3);

SELECT*FROM usuario

DELETE FROM USUARIO
WHERE ID_USUARIO=22;


SELECT u.ID_usuario,u.Nombre,r.nombre
FROM usuario u
JOIN rol r ON u.id_usuario=r.id_usuario;