-- 03_updates_deletes.sql
-- Comandos de UPDATE e DELETE para o projeto Agroprosa

/* =======================
   UPDATES
   ======================= */

-- 1) Atualizar status de um projeto para 'entregue' e preencher a data de entrega
UPDATE projeto
SET status = 'entregue',
    data_entrega_efetiva = '2025-02-08'
WHERE id_projeto = 1;

-- 2) Corrigir o telefone de um cliente
UPDATE cliente
SET telefone = '(83) 99999-9999'
WHERE id_cliente = 1;

-- 3) Ajustar o valor_total de um projeto (reajuste de orçamento)
UPDATE projeto
SET valor_total = valor_total + 300.00
WHERE id_projeto = 2;


/* =======================
   DELETES
   ======================= */

-- IMPORTANTE:
-- Sempre usar WHERE bem definido para não apagar tudo sem querer.

-- 1) Excluir um pagamento específico (por engano, duplicado)
DELETE FROM pagamento
WHERE id_pagamento = 3;

-- 2) Excluir documentos temporários de um projeto (ex.: do tipo 'KML' rascunho)
DELETE FROM documento
WHERE id_projeto = 1
  AND tipo_documento = 'KML';

-- 3) Excluir um projeto CANCELADO (exemplo) e seus documentos
--    Primeiro apaga documentos e pagamentos vinculados, depois o projeto.
--    Supondo que o projeto 2 foi cancelado:
DELETE FROM documento
WHERE id_projeto = 2;

DELETE FROM pagamento
WHERE id_projeto = 2;

DELETE FROM projeto
WHERE id_projeto = 2;
