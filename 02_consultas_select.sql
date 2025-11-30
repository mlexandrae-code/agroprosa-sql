-- 02_consultas_select.sql
-- Consultas SQL para o projeto Agroprosa

-- 1) Listar todos os projetos com nome do cliente, propriedade e técnico
SELECT
  p.id_projeto,
  c.nome         AS cliente,
  pr.nome_propriedade,
  t.nome         AS tecnico_responsavel,
  p.tipo_projeto,
  p.data_inicio,
  p.data_prevista_entrega,
  p.status
FROM projeto p
JOIN propriedade pr ON p.id_propriedade = pr.id_propriedade
JOIN cliente c      ON pr.id_cliente     = c.id_cliente
JOIN tecnico t      ON p.id_tecnico      = t.id_tecnico
ORDER BY p.data_inicio DESC;

-- 2) Listar propriedades de um município específico (ex.: Cruz do Espírito Santo)
SELECT
  pr.id_propriedade,
  pr.nome_propriedade,
  pr.municipio,
  pr.area_total,
  pr.tipo_atividade,
  c.nome AS cliente
FROM propriedade pr
JOIN cliente c ON pr.id_cliente = c.id_cliente
WHERE pr.municipio = 'Cruz do Espírito Santo'
ORDER BY pr.area_total DESC;

-- 3) Quantidade de projetos por cliente
SELECT
  c.nome AS cliente,
  COUNT(p.id_projeto) AS qtd_projetos
FROM cliente c
LEFT JOIN propriedade pr ON c.id_cliente = pr.id_cliente
LEFT JOIN projeto p      ON pr.id_propriedade = p.id_propriedade
GROUP BY c.nome
ORDER BY qtd_projetos DESC;

-- 4) Situação financeira dos projetos: valor total x valor já pago
SELECT
  p.id_projeto,
  c.nome AS cliente,
  pr.nome_propriedade,
  p.tipo_projeto,
  p.valor_total,
  COALESCE(SUM(pg.valor_pagamento), 0) AS valor_pago,
  (p.valor_total - COALESCE(SUM(pg.valor_pagamento), 0)) AS saldo_a_receber
FROM projeto p
JOIN propriedade pr ON p.id_propriedade = pr.id_propriedade
JOIN cliente c      ON pr.id_cliente     = c.id_cliente
LEFT JOIN pagamento pg ON p.id_projeto   = pg.id_projeto
GROUP BY
  p.id_projeto,
  c.nome,
  pr.nome_propriedade,
  p.tipo_projeto,
  p.valor_total
ORDER BY saldo_a_receber DESC
LIMIT 10;
