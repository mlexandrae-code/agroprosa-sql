-- 01_insert_dados_iniciais.sql
-- Dados iniciais para o sistema Agroprosa

-- CLIENTE
INSERT INTO cliente (id_cliente, nome, cpf_cnpj, telefone, email, endereco)
VALUES
  (1, 'João da Silva', '111.111.111-11', '(83) 99999-0001', 'joao.silva@example.com', 'Sítio Boa Vista, Zona Rural, Sapé - PB'),
  (2, 'Maria Oliveira', '222.222.222-22', '(83) 98888-0002', 'maria.oliveira@example.com', 'Fazenda Lagoa Grande, Cruz do Espírito Santo - PB'),
  (3, 'Marcos Andrade', '333.333.333-33', '(83) 97777-0003', 'marcos.andrade@example.com', 'Sítio Canudos, Zona Rural, Sapé - PB');

-- TECNICO
INSERT INTO tecnico (id_tecnico, nome, cpf, registro_conselho, especialidade)
VALUES
  (1, 'Aleh Agrônoma', '444.444.444-44', 'CREA-PB 123456', 'Licenciamento Ambiental'),
  (2, 'Carlos Ramos', '555.555.555-55', 'CREA-PB 654321', 'Georreferenciamento');

-- PROPRIEDADE
INSERT INTO propriedade (id_propriedade, id_cliente, nome_propriedade, municipio, area_total, tipo_atividade, coordenadas)
VALUES
  (1, 1, 'Fazenda Boa Vista', 'Sapé', 15.0, 'Bovinocultura de leite', 'Lat -7.1000, Long -35.2000'),
  (2, 2, 'Fazenda Lagoa Grande', 'Cruz do Espírito Santo', 22.5, 'Cultivo de inhame', 'Lat -7.2000, Long -35.3000'),
  (3, 3, 'Sítio Canudos', 'Cruz do Espírito Santo', 10.0, 'Mandioca de sequeiro', 'Lat -7.2500, Long -35.3500');

-- PROJETO
INSERT INTO projeto (
  id_projeto,
  id_propriedade,
  id_tecnico,
  tipo_projeto,
  data_inicio,
  data_prevista_entrega,
  data_entrega_efetiva,
  valor_total,
  status
)
VALUES
  (1, 1, 1, 'Licenciamento Ambiental', '2025-01-10', '2025-02-10', NULL,        2500.00, 'em_andamento'),
  (2, 2, 2, 'Georreferenciamento',      '2025-01-15', '2025-03-01', NULL,        4800.00, 'em_andamento'),
  (3, 3, 1, 'Assistência Técnica',      '2025-01-05', '2025-01-31', '2025-01-28',1500.00, 'entregue');

-- DOCUMENTO
INSERT INTO documento (
  id_documento,
  id_projeto,
  tipo_documento,
  nome_arquivo,
  caminho_arquivo,
  data_upload,
  observacoes
)
VALUES
  (1, 1, 'KML',        'fazenda_boavista.kml', '/docs/kml/fazenda_boavista.kml', '2025-01-12', 'Croqui inicial'),
  (2, 1, 'PDF',        'memorial_boavista.pdf','/docs/pdf/memorial_boavista.pdf','2025-01-20', 'Memorial descritivo parcial'),
  (3, 2, 'KML',        'lagoa_grande.kml',     '/docs/kml/lagoa_grande.kml',     '2025-01-18', 'Croqui georreferenciado'),
  (4, 3, 'Relatorio',  'assistencia_canudos.pdf','/docs/pdf/assistencia_canudos.pdf','2025-01-29','Relatório final');

-- PAGAMENTO
INSERT INTO pagamento (
  id_pagamento,
  id_projeto,
  data_pagamento,
  valor_pagamento,
  forma_pagamento,
  observacoes
)
VALUES
  (1, 3, '2025-01-20',  750.00, 'PIX',    'Primeira parcela'),
  (2, 3, '2025-01-28',  750.00, 'PIX',    'Quitação do projeto'),
  (3, 1, '2025-01-25', 1000.00, 'Dinheiro','Entrada do licenciamento');
