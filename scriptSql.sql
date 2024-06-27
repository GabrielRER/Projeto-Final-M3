CREATE DATABASE control;
 
 use control;

CREATE TABLE Category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description VARCHAR(255),
  created_at TIMESTAMP
);

CREATE TABLE Product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description VARCHAR(255),
  category_id INT,
  price DECIMAL(10, 2),
  quantityInStock INT,
  supplier_id INT,
  FOREIGN KEY (category_id) REFERENCES Category(id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Client (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  address VARCHAR(100),
  phone CHAR(20),
  email VARCHAR(100)
);

CREATE TABLE Supplier (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  address VARCHAR(100),
  phone CHAR(20),
  email VARCHAR(100)
);

CREATE TABLE `Order` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  client_id INT,
  date DATE,
  total DECIMAL(10, 2),
  FOREIGN KEY (client_id) REFERENCES Client(id)
);

CREATE TABLE OrderItem (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  subtotal DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES `Order`(id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);


-- Inserções na tabela Category
INSERT INTO Category (name, description, created_at) VALUES ('Eletrônicos', 'Dispositivos eletrônicos', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Roupas', 'Vestuário para todas as idades', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Livros', 'Livros e materiais de leitura', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Móveis', 'Móveis para casa e escritório', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Alimentos', 'Produtos alimentícios', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Brinquedos', 'Brinquedos para crianças', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Ferramentas', 'Ferramentas para construção e reparo', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Esportes', 'Equipamentos esportivos', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Beleza', 'Produtos de beleza e cuidados pessoais', NOW());
INSERT INTO Category (name, description, created_at) VALUES ('Automotivo', 'Produtos para veículos', NOW());

-- Inserções na tabela Supplier
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor A', 'Rua A, 123', '1111-1111', 'a@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor B', 'Rua B, 456', '2222-2222', 'b@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor C', 'Rua C, 789', '3333-3333', 'c@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor D', 'Rua D, 101', '4444-4444', 'd@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor E', 'Rua E, 202', '5555-5555', 'e@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor F', 'Rua F, 303', '6666-6666', 'f@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor G', 'Rua G, 404', '7777-7777', 'g@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor H', 'Rua H, 505', '8888-8888', 'h@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor I', 'Rua I, 606', '9999-9999', 'i@example.com');
INSERT INTO Supplier (name, address, phone, email) VALUES ('Fornecedor J', 'Rua J, 707', '1010-1010', 'j@example.com');

-- Inserções na tabela Product
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 1', 'Descrição do produto 1', 1, 100.00, 50, 1);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 2', 'Descrição do produto 2', 2, 200.00, 30, 2);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 3', 'Descrição do produto 3', 3, 150.00, 20, 3);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 4', 'Descrição do produto 4', 4, 250.00, 10, 4);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 5', 'Descrição do produto 5', 5, 50.00, 100, 5);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 6', 'Descrição do produto 6', 6, 75.00, 60, 6);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 7', 'Descrição do produto 7', 7, 300.00, 40, 7);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 8', 'Descrição do produto 8', 8, 125.00, 70, 8);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 9', 'Descrição do produto 9', 9, 175.00, 90, 9);
INSERT INTO Product (name, description, category_id, price, quantityInStock, supplier_id) VALUES ('Produto 10', 'Descrição do produto 10', 10, 220.00, 80, 10);

-- Inserções na tabela Client
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente A', 'Rua A, 123', '1111-1111', 'clienteA@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente B', 'Rua B, 456', '2222-2222', 'clienteB@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente C', 'Rua C, 789', '3333-3333', 'clienteC@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente D', 'Rua D, 101', '4444-4444', 'clienteD@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente E', 'Rua E, 202', '5555-5555', 'clienteE@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente F', 'Rua F, 303', '6666-6666', 'clienteF@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente G', 'Rua G, 404', '7777-7777', 'clienteG@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente H', 'Rua H, 505', '8888-8888', 'clienteH@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente I', 'Rua I, 606', '9999-9999', 'clienteI@example.com');
INSERT INTO Client (name, address, phone, email) VALUES ('Cliente J', 'Rua J, 707', '1010-1010', 'clienteJ@example.com');

-- Inserções na tabela Order
INSERT INTO `Order` (client_id, date, total) VALUES (1, '2024-01-01', 300.00);
INSERT INTO `Order` (client_id, date, total) VALUES (2, '2024-01-02', 400.00);
INSERT INTO `Order` (client_id, date, total) VALUES (3, '2024-01-03', 500.00);
INSERT INTO `Order` (client_id, date, total) VALUES (4, '2024-01-04', 600.00);
INSERT INTO `Order` (client_id, date, total) VALUES (5, '2024-01-05', 700.00);
INSERT INTO `Order` (client_id, date, total) VALUES (6, '2024-01-06', 800.00);
INSERT INTO `Order` (client_id, date, total) VALUES (7, '2024-01-07', 900.00);
INSERT INTO `Order` (client_id, date, total) VALUES (8, '2024-01-08', 1000.00);
INSERT INTO `Order` (client_id, date, total) VALUES (9, '2024-01-09', 1100.00);
INSERT INTO `Order` (client_id, date, total) VALUES (10, '2024-01-10', 1200.00);

-- Inserções na tabela OrderItem
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (1, 1, 2, 200.00);
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (1, 2, 1, 100.00);
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (2, 3, 3, 450.00);
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (2, 4, 1, 200.00);
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (3, 5, 4, 200.00);
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (3, 6, 2, 150.00);
INSERT INTO OrderItem (order_id, product_id, quantity, subtotal) VALUES (4, 7, 1, 300.00);


-- Quantidade Vendida de Produtos:
SELECT 
    p.name AS product_name, 
    SUM(oi.quantity) AS total_quantity_sold
FROM 
    OrderItem oi
JOIN 
    Product p ON oi.product_id = p.id
GROUP BY 
    p.name
ORDER BY 
    total_quantity_sold DESC;
    
-- Valor Gasto por Cliente:
SELECT 
    c.name AS client_name, 
    SUM(o.total) AS total_spent
FROM 
    `Order` o
JOIN 
    Client c ON o.client_id = c.id
GROUP BY 
    c.name
ORDER BY 
    total_spent DESC;

-- Valor de Produtos em Estoque:
SELECT 
    p.name AS product_name, 
    (p.price * p.quantityInStock) AS total_value_in_stock
FROM 
    Product p
ORDER BY 
    total_value_in_stock DESC;


-- Quantos produtos temos em cada categoria?:
SELECT 
    c.name AS category_name, 
    COUNT(p.id) AS total_products
FROM 
    Product p
JOIN 
    Category c ON p.category_id = c.id
GROUP BY 
    c.name
ORDER BY 
    total_products DESC;

-- Fornecedores que mais forneceram produtos:
SELECT 
    s.name AS supplier_name, 
    COUNT(p.id) AS total_products_supplied
FROM 
    Product p
JOIN 
    Supplier s ON p.supplier_id = s.id
GROUP BY 
    s.name
ORDER BY 
    total_products_supplied DESC;


-- Vendas por Categoria:
SELECT 
    c.name AS category_name, 
    SUM(oi.subtotal) AS total_sales
FROM 
    OrderItem oi
JOIN 
    Product p ON oi.product_id = p.id
JOIN 
    Category c ON p.category_id = c.id
GROUP BY 
    c.name
ORDER BY 
    total_sales DESC;

-- Vendas por Produto:
SELECT 
    p.name AS product_name, 
    SUM(oi.subtotal) AS total_sales
FROM 
    OrderItem oi
JOIN 
    Product p ON oi.product_id = p.id
GROUP BY 
    p.name
ORDER BY 
    total_sales DESC;

-- Quantidade de Produtos por Fornecedor:
SELECT 
    s.name AS supplier_name, 
    COUNT(p.id) AS total_products
FROM 
    Product p
JOIN 
    Supplier s ON p.supplier_id = s.id
GROUP BY 
    s.name
ORDER BY 
    total_products DESC;

-- Valor em Produtos por Categoria:
SELECT 
    c.name AS category_name, 
    SUM(p.price * p.quantityInStock) AS total_value
FROM 
    Product p
JOIN 
    Category c ON p.category_id = c.id
GROUP BY 
    c.name
ORDER BY 
    total_value DESC;


-- Média por Cliente gasto por dia:
SELECT 
    c.name AS client_name, 
    AVG(o.total) AS average_spent_per_day
FROM 
    `Order` o
JOIN 
    Client c ON o.client_id = c.id
GROUP BY 
    c.name
ORDER BY 
    average_spent_per_day DESC;

-- Total de Vendas por Dia:
SELECT 
    o.date AS sale_date, 
    SUM(o.total) AS total_sales
FROM 
    `Order` o
GROUP BY 
    o.date
ORDER BY 
    sale_date;

-- Número de Pedidos por Cliente:
SELECT 
    c.name AS client_name, 
    COUNT(o.id) AS total_orders
FROM 
    `Order` o
JOIN 
    Client c ON o.client_id = c.id
GROUP BY 
    c.name
ORDER BY 
    total_orders DESC;


-- Total de Produtos Vendidos por Dia:
SELECT 
    o.date AS sale_date, 
    SUM(oi.quantity) AS total_products_sold
FROM 
    OrderItem oi
JOIN 
    `Order` o ON oi.order_id = o.id
GROUP BY 
    o.date
ORDER BY 
    sale_date;


-- Valor Médio dos Pedidos por Cliente:
SELECT 
    c.name AS client_name, 
    AVG(o.total) AS average_order_value
FROM 
    `Order` o
JOIN 
    Client c ON o.client_id = c.id
GROUP BY 
    c.name
ORDER BY 
    average_order_value DESC;


-- Total de Vendas por Fornecedor:
SELECT 
    s.name AS supplier_name, 
    SUM(oi.subtotal) AS total_sales
FROM 
    OrderItem oi
JOIN 
    Product p ON oi.product_id = p.id
JOIN 
    Supplier s ON p.supplier_id = s.id
GROUP BY 
    s.name
ORDER BY 
    total_sales DESC;

-- Quantidade de Produtos em Estoque por Categoria:
SELECT 
    c.name AS category_name, 
    SUM(p.quantityInStock) AS total_quantity_in_stock
FROM 
    Product p
JOIN 
    Category c ON p.category_id = c.id
GROUP BY 
    c.name
ORDER BY 
    total_quantity_in_stock DESC;
    
-- Seleciona dias com total de vendas acima de 500
SELECT 
    o.date AS sale_date, 
    SUM(o.total) AS total_sales
FROM 
    `Order` o
GROUP BY 
    o.date
HAVING 
    SUM(o.total) > 500;
    
-- Seleciona clientes com mais de 3 pedidos
SELECT 
    c.name AS client_name, 
    COUNT(o.id) AS total_orders
FROM 
    `Order` o
JOIN 
    Client c ON o.client_id = c.id
GROUP BY 
    c.name
HAVING 
    COUNT(o.id) > 3;
    
-- Seleciona categorias com quantidade de produtos em estoque acima de 50
SELECT 
    c.name AS category_name, 
    SUM(p.quantityInStock) AS total_quantity_in_stock
FROM 
    Product p
JOIN 
    Category c ON p.category_id = c.id
GROUP BY 
    c.name
HAVING 
    SUM(p.quantityInStock) > 50;
