-- CREATE database Loja_Virtual;

-- USE Loja_Virtual;

-- CREATE TABLE clientes (
-- id INT AUTO_INCREMENT PRIMARY KEY,
-- nome VARCHAR(100) NOT NULL,
-- email VARCHAR(100) UNIQUE NOT NULL,
-- telefone VARCHAR(15),
-- endereco TEXT,
-- criado_em TIMESTAMP DEFAULT current_timestamp
-- );

-- drop table clientes

-- CREATE TABLE clientes (
-- id_cliente INT AUTO_INCREMENT PRIMARY KEY,
-- nome VARCHAR(100) NOT NULL,
-- email VARCHAR(100) UNIQUE NOT NULL,
-- telefone VARCHAR(15),
-- endereco TEXT,
-- criado_em TIMESTAMP DEFAULT current_timestamp
-- );

-- CREATE TABLE produtos (
-- id_produto INT AUTO_INCREMENT PRIMARY KEY,
-- nome VARCHAR(100) NOT NULL,
-- descricao TEXT,
-- preco DECIMAL(10, 2) NOT NULL,
-- estoque INT DEFAULT 0,
-- criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE PEDIDOS (
-- id_pedido INT auto_increment PRIMARY KEY,
-- id_cliente INT NOT NULL,
-- data_pedido TIMESTAMP DEFAULT current_timestamp,
-- status ENUM('Pendente', 'Enviado', 'Concluido', 'Cancelado') DEFAULT 'Pendente',
-- total DECIMAL(10, 2) DEFAULT 0,
-- FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
-- );

-- CREATE TABLE itens_pedidos (
-- id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
-- id_pedido INT NOT NULL,
-- id_produto INT NOT NULL,
-- quantidade INT NOT NULL,
-- preco_unitario DECIMAL(10, 2) NOT NULL,
-- subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,
-- FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
-- FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
-- );

-- CREATE TABLE pagamentos (
-- id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
-- id_pedido INT NOT NULL,
-- data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- valor DECIMAL(10, 2) NOT NULL,
-- metodo ENUM ('Cartao', 'Boleto', 'Pix', 'Dinheiro'),
-- status ENUM ('Aprovado', 'Pendente', 'Recusado') DEFAULT 'Pendente',
-- FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
-- );

-- INSERT INTO clientes (nome, email, telefone, endereco)
-- VALUES
-- ('Joao Silva', 'joao@gmail.com', '(55) 3222-0737', 'Rua dos Andradas, 1015, Santa Maria'),
-- ('Maria Oliveira', 'maria@hotmail.com', '(21) 91234-5678', 'Av. B, 456, Rio de Janeiro');

-- INSERT INTO produtos (nome, descricao, preco, estoque)
-- VALUES
-- ('Notebook', 'Notebook com 16 GB RAM HD 512 GB SSD', 4500.00, 10),
-- ('Mouse', 'Mouse sem fio com alta precisao', 150.00, 50),
-- ('Cadeira Gamer', 'Cadeira Ergonomica e Confortavel', 1200.00, 5);

-- INSERT INTO pedidos (id_cliente, total)
-- VALUES
-- (1, 0),
-- (2, 0);

-- INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, preco_unitario)
-- VALUES
-- (1, 1, 1, 4500.00), -- Pedido 1: 1 Notebook
-- (1, 2, 2, 150.00),  -- Pedido 1: 2 Mouse
-- (2, 3, 1, 1200.00); -- Pedido 2: 1 Cadeira Gamer


