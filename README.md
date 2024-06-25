# Inventory Management System

## Descrição do Projeto

Este projeto é um sistema de gerenciamento de inventário desenvolvido em SQL. Ele permite gerenciar produtos, categorias e outros aspectos relacionados ao controle de estoque de uma empresa.

## Tecnologias Utilizadas

- MySQL
- SQL

## Estrutura do Banco de Dados

### Tabela: `product`

Esta tabela armazena informações sobre os produtos no inventário.

| Coluna               | Tipo         | Descrição                                        |
|----------------------|--------------|--------------------------------------------------|
| ID                   | INTEGER      | Identificador único do produto (chave primária). |
| name                 | VARCHAR(150) | Nome do produto.                                 |
| description          | TEXT         | Descrição do produto.                            |
| price                | DECIMAL(10,2)| Preço do produto.                                |
| quantity_in_stock    | INTEGER      | Quantidade em estoque.                           |
| minimum_quantity     | INTEGER      | Quantidade mínima necessária em estoque.         |
| last_purchase_date   | DATE         | Data da última compra.                           |
| bar_code             | VARCHAR(50)  | Código de barras do produto.                     |
| category_id          | INTEGER      | Referência à categoria do produto (chave estrangeira). |

### Tabela: `category`

Esta tabela armazena informações sobre as categorias dos produtos.

| Coluna | Tipo     | Descrição                                        |
|--------|----------|--------------------------------------------------|
| ID     | INTEGER  | Identificador único da categoria (chave primária).|
| name   | VARCHAR(100) | Nome da categoria.                           |

## Funcionalidades Principais

- Adicionar, editar e remover produtos.
- Adicionar, editar e remover categorias.
- Consultar produtos por categoria.
- Verificar quantidade mínima de estoque.

## Instruções de Instalação e Execução

1. Certifique-se de ter o MySQL instalado em seu sistema.
2. Crie um banco de dados chamado `inventory_management`:
   ```sql
   CREATE DATABASE IF NOT EXISTS inventory_management;
   ```
3. Execute o script SQL fornecido (`pfm3.sql`) para criar as tabelas e inserir os dados necessários:
   ```sql
   USE inventory_management;
   SOURCE /caminho/para/pfm3.sql;
   ```
4. O banco de dados está pronto para ser utilizado.

## Exemplos de Consultas SQL

### 1. Inserir um novo produto
```sql
INSERT INTO product (name, description, price, quantity_in_stock, minimum_quantity, last_purchase_date, bar_code, category_id)
VALUES ('Produto Exemplo', 'Descrição do produto exemplo', 99.99, 50, 10, '2023-01-01', '1234567890123', 1);
```

### 2. Consultar todos os produtos de uma determinada categoria
```sql
SELECT * FROM product WHERE category_id = 1;
```

### 3. Atualizar a quantidade em estoque de um produto
```sql
UPDATE product SET quantity_in_stock = 100 WHERE ID = 1;
```

### 4. Remover um produto
```sql
DELETE FROM product WHERE ID = 1;
```
