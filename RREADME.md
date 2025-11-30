# Sistema de Gestão para Escritório de Projetos Agropecuários – Agroprosa

Este repositório contém os scripts SQL da disciplina de Modelagem de Banco de Dados, referentes ao mini-mundo de um escritório de projetos agropecuários.

## 🧱 Modelo Lógico (Resumo)

Tabelas principais:

- `cliente` (id_cliente, nome, cpf_cnpj, telefone, email, endereco)
- `propriedade` (id_propriedade, id_cliente, nome_propriedade, municipio, area_total, tipo_atividade, coordenadas)
- `tecnico` (id_tecnico, nome, cpf, registro_conselho, especialidade)
- `projeto` (id_projeto, id_propriedade, id_tecnico, tipo_projeto, data_inicio, data_prevista_entrega, data_entrega_efetiva, valor_total, status)
- `documento` (id_documento, id_projeto, tipo_documento, nome_arquivo, caminho_arquivo, data_upload, observacoes)
- `pagamento` (id_pagamento, id_projeto, data_pagamento, valor_pagamento, forma_pagamento, observacoes)

> As tabelas foram criadas previamente com base no DER e no modelo lógico desenvolvidos nas etapas anteriores da Experiência Prática.

## 🛠 Ferramentas Utilizadas

- Banco de Dados: MySQL ou PostgreSQL
- Ferramenta de gerenciamento:
  - MySQL Workbench (para MySQL)
  - ou PGAdmin (para PostgreSQL)

## 🚀 Como Executar os Scripts

1. Crie o banco de dados no seu SGBD (MySQL/PostgreSQL).
2. Crie as tabelas de acordo com o modelo lógico.
3. Execute os scripts na seguinte ordem:

   ```text
   01_insert_dados_iniciais.sql
   02_consultas_select.sql
   03_updates_deletes.sql
