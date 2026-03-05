-- CREATE DATABASE ecommmerce_db;

-- USE ecommmerce_db;

-- CREATE TABLE categorias (
--     id_categoria INT AUTO_INCREMENT PRIMARY KEY,
--     nome VARCHAR(100) NOT NULL,
--     descricao TEXT
-- );

-- CREATE TABLE clientes (
--     id_cliente INT AUTO_INCREMENT PRIMARY KEY,
--     nome VARCHAR(150) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     cpf CHAR(11) UNIQUE NOT NULL,
--     data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE produtos (
--     id_produto INT AUTO_INCREMENT PRIMARY KEY,
--     id_categoria INT,
--     nome VARCHAR(150) NOT NULL,
--     preco DECIMAL(10, 2) NOT NULL,
--     estoque INT DEFAULT 0,
--     CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
-- );

-- CREATE TABLE pedidos (
--     id_pedido INT AUTO_INCREMENT PRIMARY KEY,
--     id_cliente INT,
--     data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
--     status ENUM('Pendente', 'Pago', 'Enviado', 'Cancelado') DEFAULT 'Pendente',
--     total_pedido DECIMAL(10, 2),
--     CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
-- );

-- CREATE TABLE itens_pedido (
    -- id_item INT AUTO_INCREMENT PRIMARY KEY,
--     id_pedido INT,
--     id_produto INT,
--     quantidade INT NOT NULL,
--     preco_unitario DECIMAL(10, 2) NOT NULL,
--     CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
--     CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
-- );

-- INSERT INTO categorias (nome, descricao) VALUES
-- ('Eletrônicos', 'Produtos de tecnologia e hardware'),
-- ('Livros', 'Livros físicos e digitais');

-- INSERT INTO clientes (nome, email, cpf) VALUES
-- ('Ana Souza', 'ana.souza@email.com', '12345678901'),
-- ('Carlos Lima', 'carlos.lima@email.com', '98765432100');

-- INSERT INTO produtos (id_categoria, nome, preco, estoque) VALUES
-- (1, 'Smartphone X', 2500.00, 50),
-- (2, 'O Guia do Mochileiro das Galáxias', 42.00, 100);

-- INSERT INTO pedidos (id_cliente, status, total_pedido) VALUES
-- (1, 'Pendente', 2542.00);

-- INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
-- (1, 1, 1, 2500.00), -- 1 Smartphone
-- (1, 2, 1, 42.00);    -- 1 Livro

-- UPDATE produtos
-- SET preco = preco * 1.10
-- WHERE id_categoria = 1;

-- SELECT nome, preco
-- FROM produtos
-- WHERE preco > 100.00
-- ORDER BY preco DESC;

-- SELECT cl.nome, SUM(p.total_pedido) AS total_gasto
-- FROM clientes cl
-- 	Left JOIN pedidos p
--     ON cl.id_cliente = p.id_cliente
-- GROUP BY cl.id_cliente, cl.nome;

-- SELECT
-- 	c.nome AS cliente,
--     pr.nome AS produto,
--     ip.quantidade,
--     ped.data_pedido
-- FROM itens_pedido ip
-- 		JOIN pedidos ped
-- 	ON ip.id_pedido = ped.id_pedido 
-- 		JOIN clientes c
--         ON ped.id_cliente = c.id_cliente
--         JOIN produtos pr
-- 	ON ip.id_produto = pr.id_produto
-- where ped.status = 'Pendente'

-- with resumo_vendas AS (
-- 	select 
-- 		id_produto,
--         SUM(quantidade) AS total_unidades,
--         SUM(quantidade * preco_unitario) AS receita_produto
-- 	From itens_pedido
--     group by id_produto
-- )
-- select
-- p.nome,
-- rv.total_unidades,
-- rv.receita_produto
-- from produtos p
-- join resumo_vendas rv ON p.id_produto = rv.id_produto
-- where rv.total_unidades >=1;

select
p.nome,
rv.total_unidades,
rv.receita_produto
from produtos p
join (select 
		id_produto,
        SUM(quantidade) AS total_unidades,
        SUM(quantidade * preco_unitario) AS receita_produto
	From itens_pedido
    group by id_produto) rv
    On p.id_produto = rv.id_produto
where rv.total_unidades >=1;