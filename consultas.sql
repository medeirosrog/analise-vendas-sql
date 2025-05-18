-- 1. Listar todas as vendas com nomes dos clientes e produtos
SELECT 
  v.id_venda,
  c.nome AS cliente,
  p.nome AS produto,
  v.data_venda,
  v.quantidade
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto;

-- 2. Vendas feitas após o dia 2025-04-05
SELECT * FROM vendas
WHERE data_venda > '2025-04-05';

-- 3. Total de produtos vendidos por cliente
SELECT 
  c.nome,
  SUM(v.quantidade) AS total_comprado
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY total_comprado DESC;

-- 4. Faturamento total por produto
SELECT 
  p.nome,
  SUM(v.quantidade * p.preco) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY faturamento DESC;

-- 5. Faturamento total por cidade
SELECT 
  c.cidade,
  SUM(v.quantidade * p.preco) AS total_vendido
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY c.cidade
ORDER BY total_vendido DESC;

-- 6. Média de valor gasto por venda
SELECT 
  AVG(v.quantidade * p.preco) AS media_valor_venda
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto;

-- 7. Clientes que compraram mais de 2 vezes
SELECT 
  c.nome,
  COUNT(v.id_venda) AS total_vendas
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome
HAVING total_vendas > 2;

-- 8. Produto mais vendido por dia
SELECT 
  v.data_venda,
  p.nome,
  SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY v.data_venda, p.nome
ORDER BY v.data_venda, total_vendido DESC;

-- 9. Produto mais lucrativo
SELECT 
  p.nome,
  SUM(p.preco * v.quantidade) AS receita
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY receita DESC
LIMIT 1;

-- 10. Produto com menor faturamento total
SELECT 
  p.nome,
  SUM(p.preco * v.quantidade) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY faturamento ASC
LIMIT 1;
