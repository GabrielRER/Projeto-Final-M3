CREATE DATABASE IF NOT EXISTS inventory_management;
USE inventory_management;
-- TABLE PRODUTO: 0.2
CREATE TABLE IF NOT EXISTS product (
ID INTEGER PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR (150),
 description TEXT,
 price DECIMAL (10, 2),
 quantity_in_stock INTEGER,
 minimum_quantity INTEGER,
 last_purchase_date DATE,
 bar_code VARCHAR (50),

 category_id INTEGER,
 FOREIGN KEY (category_id) REFERENCES category (ID)
);
-- TABLE Categoria: 0.1
CREATE TABLE IF NOT EXISTS category (
ID INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR (150),
description TEXT,
cod VARCHAR (50)
);
INSERT INTO category (name, description, cod) VALUES ("Frutas", "Frutas tipicas de área
frias...", "877.857");
DELETE FROM `category` WHERE id = 1;
SELECT * FROM category;
-- _________________________________
-- TABLE Venda: 0.4 ou 1.2
CREATE TABLE IF NOT EXISTS sale (
ID INTEGER PRIMARY KEY AUTO_INCREMENT,
date DATE,
amount INTEGER,
unit_price DECIMAL (10, 2),
total decimal(10, 2),

product_id INTEGER,
client_id INTEGER,
 FOREIGN KEY (product_id) REFERENCES product (ID),
 FOREIGN KEY (client_id) REFERENCES client (ID)
);
-- TABLE Cliente: 0.3
CREATE TABLE IF NOT EXISTS client (
 ID INTEGER PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR (150),
 email VARCHAR (255),
 telephone VARCHAR (11),
 address VARCHAR (255)
);
-- _________________________________
-- TABLE COMPRA:
CREATE TABLE IF NOT EXISTS purchase (
ID INTEGER PRIMARY KEY AUTO_INCREMENT,
date DATE,
amount INTEGER,
unit_price DECIMAL (10, 2),
total DECIMAL (10, 2),

supplier_id INTEGER,
product_id INTEGER,
 FOREIGN KEY (product_id) REFERENCES product (ID),
 FOREIGN KEY (supplier_id) REFERENCES supplier (ID)
);
-- TABLE FORNECEDOR:
CREATE TABLE IF NOT EXISTS supplier (
ID INTEGER PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR (150),
 email VARCHAR (255),
 telephone VARCHAR (11),
 address VARCHAR (255)
);

-- Inputs

-- Table Category:
INSERT INTO product (name, description, price, quantity_in_stock, minimum_quantity, last_purchase_date, bar_code) VALUES ("


