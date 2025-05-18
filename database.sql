-- LIMPA AS TABELAS, SE JÁ EXISTIREM
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT,
    cidade TEXT,
    estado TEXT
);

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    nome TEXT,
    categoria TEXT,
    preco REAL
);

CREATE TABLE vendas (
    id_venda INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_produto INTEGER,
    data_venda DATE,
    quantidade INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- INSERÇÃO DE CLIENTES
INSERT INTO clientes VALUES (1, 'Ana Souza', 'Fortaleza', 'CE');
INSERT INTO clientes VALUES (2, 'Bruno Lima', 'Quixadá', 'CE');
INSERT INTO clientes VALUES (3, 'Carla Mendes', 'Limoeiro do Norte', 'CE');
INSERT INTO clientes VALUES (4, 'Daniel Silva', 'Mossoró', 'RN');
INSERT INTO clientes VALUES (5, 'Eduarda Rocha', 'Natal', 'RN');

-- INSERÇÃO DE PRODUTOS
INSERT INTO produtos VALUES (1, 'Caneca Branca', 'Utilidades', 15.00);
INSERT INTO produtos VALUES (2, 'Camiseta Personalizada', 'Vestuário', 35.00);
INSERT INTO produtos VALUES (3, 'Mousepad', 'Informática', 20.00);
INSERT INTO produtos VALUES (4, 'Chaveiro', 'Acessórios', 8.00);
INSERT INTO produtos VALUES (5, 'Agenda 2025', 'Papelaria', 25.00);

-- INSERÇÃO DE VENDAS
INSERT INTO vendas VALUES (1, 1, 1, '2025-04-01', 2);
INSERT INTO vendas VALUES (2, 2, 3, '2025-04-02', 1);
INSERT INTO vendas VALUES (3, 3, 2, '2025-04-03', 1);
INSERT INTO vendas VALUES (4, 1, 5, '2025-04-04', 1);
INSERT INTO vendas VALUES (5, 4, 1, '2025-04-05', 4);
INSERT INTO vendas VALUES (6, 5, 4, '2025-04-06', 2);
INSERT INTO vendas VALUES (7, 2, 2, '2025-04-07', 1);
INSERT INTO vendas VALUES (8, 3, 1, '2025-04-08', 1);
INSERT INTO vendas VALUES (9, 1, 3, '2025-04-09', 1);
INSERT INTO vendas VALUES (10, 5, 2, '2025-04-10', 3);
