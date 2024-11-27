DROP DATABASE IF EXISTS venta_instrumentos;
CREATE DATABASE venta_instrumentos;
USE venta_instrumentos;


CREATE TABLE distribuidor (
    id_distribuidor int not null auto_increment PRIMARY KEY,
        nombre varchar(100),
        telefono varchar(20)
 );
CREATE TABLE instrumento (
    id_instrumento int not null auto_increment PRIMARY KEY,
    id_distribuidor int,
        nombre VARCHAR(200),
        tipo_instrumento VARCHAR(200),
        modelo VARCHAR(200),
        precio DECIMAL(10,2)
);
CREATE TABLE cliente(
    id_cliente int not null auto_increment PRIMARY KEY,
        nombre VARCHAR(100),
        email VARCHAR(200)
);
CREATE TABLE venta(
    id_venta int not null auto_increment PRIMARY KEY,
    id_cliente int,
        fecha DATE,
        total DECIMAL(10,2)
); 
CREATE TABLE detalle_venta(
    id_detalle_venta int not null auto_increment PRIMARY KEY,
    id_venta int,
    id_instrumento int,
        cantidad INT,
        precio_venta DECIMAL(10,2)
);

ALTER TABLE instrumento
    ADD CONSTRAINT fk_const_id_distribuidor
    FOREIGN KEY (id_distribuidor) REFERENCES distribuidor(id_distribuidor);
    
ALTER TABLE venta
	ADD CONSTRAINT fk_const_id_cliente
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
    
ALTER TABLE detalle_venta
	ADD CONSTRAINT fk_const_id_venta
    FOREIGN KEY(id_venta) REFERENCES venta(id_venta);
    
ALTER TABLE detalle_venta
    ADD CONSTRAINT fk_const_id_instrumento
    FOREIGN KEY(id_instrumento) REFERENCES instrumento(id_instrumento);