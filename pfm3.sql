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
-- Insert data into category table
INSERT INTO category (name, description, cod) VALUES 
("Frutas", "Frutas tipicas de áreas frias", "877.857"),
("Vegetais", "Vegetais variados e frescos", "312.684"),
("Laticínios", "Produtos derivados do leite", "429.112"),
("Carnes", "Carnes frescas e congeladas", "293.478"),
("Bebidas", "Bebidas alcoólicas e não alcoólicas", "597.321");
select * from category;


-- Insert data into product table
INSERT INTO product (name, description, price, quantity_in_stock, minimum_quantity, last_purchase_date, bar_code, category_id) VALUES 
("Banana", "Banana madura", 2.50, 100, 20, '2024-05-01', '123456789012', 1),
("Alface", "Alface fresca", 1.50, 200, 30, '2024-05-03', '123456789013', 2),
("Leite", "Leite integral", 4.00, 150, 50, '2024-05-05', '123456789014', 3),
("Carne Bovina", "Carne bovina fresca", 25.00, 50, 10, '2024-05-07', '123456789015', 4),
("Cerveja", "Cerveja Brahma", 3.50, 300, 50, '2024-05-09', '123456789016', 5);
select * from product;

-- Insert data into client table
INSERT INTO client (name, email, telephone, address) VALUES 
("João Silva", "joao.silva@pdamail.com", "11987654321", "Rua A, 123"),
("Maria Souza", "maria.souza@pdamail.com", "11987654322", "Rua B, 456"),
("Carlos Pereira", "carlos.pereira@pdamail.com", "11987654323", "Rua C, 789"),
("Ana Costa", "ana.costa@pdamail.com", "11987654324", "Rua D, 101"),
("Pedro Oliveira", "pedro.oliveira@pdamail.com", "11987654325", "Rua E, 202");
select * from client;

-- Insert data into supplier table
INSERT INTO supplier (name, email, telephone, address) VALUES 
("Fornecedor A", "fornecedorA@pdamail.com", "21987654321", "Avenida F, 123"),
("Fornecedor B", "fornecedorB@pdamail.com", "21987654322", "Avenida G, 456"),
("Fornecedor C", "fornecedorC@pdamail.com", "21987654323", "Avenida H, 789"),
("Fornecedor D", "fornecedorD@pdamail.com", "21987654324", "Avenida I, 101"),
("Fornecedor E", "fornecedorE@pdamail.com", "21987654325", "Avenida J, 202");
select * from supplier;

-- Insert data into sale table
INSERT INTO sale (date, amount, unit_price, total, product_id, client_id) VALUES 
('2024-06-01', 10, 2.50, 25.00, 1, 1),
('2024-06-02', 5, 1.50, 7.50, 2, 2),
('2024-06-03', 8, 4.00, 32.00, 3, 3),
('2024-06-04', 3, 25.00, 75.00, 4, 4),
('2024-06-05', 12, 3.50, 42.00, 5, 5);
select * from sale;

-- Insert data into purchase table
INSERT INTO purchase (date, amount, unit_price, total, supplier_id, product_id) VALUES 
('2024-05-01', 50, 2.00, 100.00, 1, 1),
('2024-05-02', 100, 1.00, 100.00, 2, 2),
('2024-05-03', 70, 3.50, 245.00, 3, 3),
('2024-05-04', 20, 22.00, 440.00, 4, 4),
('2024-05-05', 200, 2.80, 560.00, 5, 5);
select * from purchase;
