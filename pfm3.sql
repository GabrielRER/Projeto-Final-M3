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
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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
INSERT INTO category (name, description) VALUES 
("Frutas", "Frutas tipicas de áreas frias"),
("Vegetais", "Vegetais variados e frescos"),
("Laticínios", "Produtos derivados do leite"),
("Carnes", "Carnes frescas e congeladas"),
("Bebidas", "Bebidas alcoólicas e não alcoólicas");
SELECT * FROM category;


-- Insert data into product table
INSERT INTO product (name, description, price, quantity_in_stock, minimum_quantity, last_purchase_date, bar_code, category_id) VALUES 
("Banana", "Banana madura", 2.50, 100, 20, '2024-05-01', '123456789012', 1),
("Alface", "Alface fresca", 1.50, 200, 30, '2024-05-03', '123456789013', 2),
("Leite", "Leite integral", 4.00, 150, 50, '2024-05-03', '123456789014', 3),
("Carne Bovina", "Carne bovina fresca", 25.00, 50, 10, '2024-05-03', '123456789015', 4),
("Cerveja", "Cerveja Brahma", 3.50, 300, 50, '2024-05-02', '123456789016', 5),
("Maçã", "Maçã Gala", 3.00, 300, 40, '2024-05-01', '123456789017', 1),
("Manga", "Manga de Qualidade", 5.25, 170, 50, '2024-05-02', '123456789018', 1),
("Laranja", "Laranja-pera docinha", 2.50, 100, 20, '2024-05-01', '123456789019', 1),
("Tomate", "Tomate Italiano", 2.45, 210, 50, '2024-05-03', '123456789020', 2),
("Pepino", "Pepino Japonês", 1.00, 120, 40, '2024-05-01', '123456789021', 2),
("Queijo Mussarela", "Queijo fresco utilizado em diversas preparações culinárias", 11.00, 230, 75, '2024-05-01', '123456789022', 3),
("Manteiga", "Produto lácteo feito do creme de leite batido", 6.00, 100, 45, '2024-05-02', '123456789023', 3),
("Carne Suína", "Carne de Porco", 15.00, 75, 10, '2024-05-02', '123456789024', 4),
("Carne de Frango", "Frangos de Alta Granja", 10.00, 60, 20, '2024-05-03', '123456789025', 4),
("Refrigerante", "Coca-Cola", 7.99, 500, 75, '2024-05-02', '123456789026', 5),
("Suco", "Delvale", 4.50, 360, 50, '2024-05-02', '123456789027', 5),
("Água", "Água mineral das nascentes da Serra do Mar", 2.99, 700, 150, '2024-05-01', '123456789028', 5)
;
SELECT * FROM product;

-- Insert data into client table
INSERT INTO client (name, email, telephone, address) VALUES 
("João Silva", "joao.silva@pdamail.com", "11987654321", "Rua A, 123"),
("Messias Machado", "messiasm@pdamail.com", "11987654322", "Rua A, 758"),
("Mario Gentil", "itsamario@pdamail.com", "11987654323", "Rua A, 859"),
("Maria Souza", "maria.souza@pdamail.com", "11987654324", "Rua B, 456"),
("Carlos Pereira", "carlos.pereira@pdamail.com", "11987654325", "Rua C, 789"),
("Santideo Soares", "santideo@pdamail.com", "11987654326", "Rua C, 85"),
("Ana Costa", "ana.costa@pdamail.com", "11987654327", "Rua D, 101"),
("Pedro Felicio", "pedrinhogameplay@pdamail.com", "11987654328", "Rua D, 13"),
("Maciel Jesus", "jesus.maciel@pdamail.com", "11987654329", "Rua D, 270"),
("Pedro Oliveira", "pedro.oliveira@pdamail.com", "11987654330", "Rua E, 202"),
("Andrei L", "andreinotmic@pdamail.com", "11987654331", "Rua E, 202")
;
SELECT * FROM client;

-- Insert data into supplier table
INSERT INTO supplier (name, email, telephone, address) VALUES 
("Fornecedor A", "fornecedorA@pdamail.com", "21987654321", "Avenida F, 123"),
("Fornecedor B", "fornecedorB@pdamail.com", "21987654322", "Avenida G, 456"),
("Fornecedor C", "fornecedorC@pdamail.com", "21987654323", "Avenida H, 789"),
("Fornecedor D", "fornecedorD@pdamail.com", "21987654324", "Avenida I, 101"),
("Fornecedor E", "fornecedorE@pdamail.com", "21987654325", "Avenida J, 202");
SELECT * FROM supplier;

-- Insert data into sale table
INSERT INTO sale (date, amount, unit_price, total, product_id, client_id) VALUES 
('2024-05-02', 10, 2.50, 25.00, 1, 1),
('2024-05-02', 5, 2.50, 12.50, 8, 1),
('2024-05-02', 8, 4.50, 36.00, 16, 1),
('2024-05-02', 10, 3.00, 30.00, 6, 7),
('2024-05-03', 12, 1.50, 18.00, 2, 2),
('2024-05-03', 5, 3.00, 15.00, 6, 2),
('2024-05-03', 7, 4.50, 31.50, 16, 2),
('2024-05-03', 10, 2.45, 24.50, 9, 2),
('2024-05-03', 5, 3.00, 15.00, 6, 1),
('2024-05-03', 2, 4.50, 9.00, 16, 5),
('2024-05-03', 5, 2.50, 12.50, 1, 5),
('2024-05-04', 15, 7.99, 119.85, 15, 8),
('2024-05-04', 8, 1.50, 12.00, 2, 8),
('2024-05-04', 10, 7.99, 79.90, 15, 3),
('2024-05-04', 8, 3.00, 24.00, 6, 4),
('2024-05-04', 3, 4.50, 13.50, 16, 4),
('2024-05-05', 20, 2.99, 59.80, 17, 9),
('2024-05-05', 10, 4.00, 40.00, 3, 9),
('2024-05-05', 5, 7.99, 39.95, 15, 9),
('2024-05-05', 5, 3.00, 15.00, 6, 9),
('2024-05-05', 3, 2.50, 7.50, 1, 6),
('2024-05-05', 5, 2.45, 12.25, 9, 6),
('2024-05-06', 25, 7.99, 199.75, 15, 10),
('2024-05-06', 3, 2.50, 7.50, 8, 10),
('2024-05-06', 30, 2.99, 89.70, 17, 10),
('2024-05-06', 5, 4.50, 22.50, 16, 10),
('2024-05-06', 10, 2.99, 29.90, 17, 11),
('2024-05-07', 5, 2.99, 14.95, 17, 5),
('2024-05-07', 4, 10.00, 40.00, 14, 5),
('2024-05-07', 10, 7.99, 79.90, 15, 4),
('2024-05-07', 5, 25.00, 125.00, 4, 4),
('2024-05-07', 6, 3.00, 18.00, 6, 4),
('2024-05-07', 4, 2.45, 9.80, 9, 4),
('2024-05-07', 5, 4.00, 20.00, 3, 4),
('2024-05-07', 25, 2.99, 74.75, 17, 2),
('2024-05-08', 15, 4.00, 60.00, 3, 3),
('2024-05-08', 7, 1.50, 10.50, 2, 3),
('2024-05-08', 8, 4.50, 36.00, 16, 3),
('2024-05-08', 5, 25.00, 125.00, 4, 3),
('2024-05-08', 6, 2.50, 15.00, 1, 6),
('2024-05-09', 30, 2.99, 89.70, 17, 8),
('2024-05-09', 10, 3.50, 313.95, 5, 8),
('2024-05-09', 8, 4.00, 32.00, 3, 8),
('2024-05-09', 5, 10.00, 50.00, 14, 8),
('2024-05-09', 5, 2.50, 12.50, 8, 8),
('2024-05-10', 20, 7.99, 159.80, 15, 11),
('2024-05-10', 3, 10.00, 30.00, 14, 11),
('2024-05-10', 3, 25.00, 75.00, 4, 11),
('2024-05-10', 7, 6.00, 42.00, 12, 11),
('2024-05-10', 20, 2.99, 59.80, 17, 11),
('2024-05-11', 5, 4.00, 20.00, 3, 10),
('2024-05-11', 20, 5.25, 105.00, 7, 6),
('2024-05-11', 10, 11.00, 110.00, 11, 6),
('2024-05-11', 15, 7.99, 119.85, 15, 3),
('2024-05-11', 15, 15.00, 225.00, 13, 3),
('2024-05-11', 8, 15.00, 120.00, 13, 7),
('2024-05-11', 5, 11.00, 55.00, 11, 5),
('2024-05-11', 10, 5.25, 52.50, 7, 11);

SELECT * FROM sale;

-- Insert data into purchase table
INSERT INTO purchase (date, amount, unit_price, total, supplier_id, product_id) VALUES 
('2024-05-01', 124, 2.00, 100.00, 1, 1),
('2024-05-01', 339, 2.30, 805.00, 1, 6),
('2024-05-01', 113, 1.99, 238.80, 1, 8),
('2024-05-01', 840, 1.20, 1200.00, 5, 17),
('2024-05-01', 120, 0.50, 60.00, 2, 10),
('2024-05-01', 245, 8.50, 2125.00, 3, 11),
('2024-05-02', 393, 3.00, 1200.00, 5, 16),
('2024-05-02', 600, 6.00, 3900.00, 5, 15),
('2024-05-02', 310, 2.15, 709.50, 5, 5),
('2024-05-02', 107, 4.00, 560.00, 3, 12),
('2024-05-02', 200, 4.00, 1120.00, 1, 7),
('2024-05-02', 98, 12.00, 1200.00, 4, 13),
('2024-05-03', 227, 0.99, 232.65, 2, 2),
('2024-05-03', 229, 1.45, 348.00, 2, 9),
('2024-05-03', 193, 2.90, 580.00, 3, 3),
('2024-05-03', 63, 20.00, 1400.00, 4, 4),
('2024-05-03', 72, 8.50, 680.00, 4, 14);

select * from purchase;

/*-------------------------------------------------------------------------------------------------------------------------------------------*/

-- Consultas:

-- Qual produto mais vendido?
SELECT product.id AS id_produto,
product.name AS nome_produto,
COUNT(sale.product_id) AS quantidade_vendas
FROM product
LEFT JOIN sale ON product.id = sale.product_id
GROUP BY product.id, product.name
ORDER BY quantidade_vendas DESC;

-- Qual cliente gastou mais?

SELECT client.id AS id_cliente,
client.name AS nome_cliente,
SUM(sale.total) AS valor_gasto
FROM client
LEFT JOIN sale ON client.id = sale.client_id
GROUP BY client.id, client.name
ORDER BY valor_gasto DESC;

-- Qual o valor total de cada produto temos em estoque?
SELECT id, 
name, 
quantity_in_stock, 
price AS unit_price, 
(price * quantity_in_stock) AS total_price 
FROM product;

-- Quantos produtos temos em cada categoria?
SELECT product.category_id,
category.name, 
COUNT(product.category_id) AS quantidade_produtos
FROM product
JOIN category ON product.category_id = category.id
GROUP BY product.category_id
ORDER BY quantidade_produtos DESC;

-- Lucro em cima de cada produto
SELECT product.id AS id_produto,
product.name AS nome_produto,
purchase.unit_price AS valor_de_compra,
product.price AS valor_de_revenda,
(product.price - purchase.unit_price) AS lucro
FROM product
JOIN purchase ON product.id = purchase.product_id;

-- Valor Bruto Vendido
SELECT SUM(total) AS valor_bruto_vendido
FROM sale;

-- Valor Liquido Vendido
SELECT SUM((sale.unit_price - purchase.unit_price) * sale.amount) AS total_liquido
FROM sale
JOIN purchase ON sale.product_id = purchase.product_id;

