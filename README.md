# data-analysis-python

Teste de Markdown

Este é um repositório que descreve o processo de criação de um algoritmo de árvores de decisão para correlacionar variáveis. Contextualizando: a base de dados contém informações a respeito de vendas de uma empresa que produz produtos para cabelo de forma personalizada. A personalização dos produtos pode ser feita a partir de formulários preenchidos pelos clientes, que antes de iniciar o processo de compra devem passar por essa etapa de preenchimento.

Inicialmente, realizei a conexão com a base de dados fornecida em PostgreSQL, com as credenciais fornecidas pela empresa. As queries foram desenvolvidas utilizando linguagem SQL. Porém, no algoritmo em Python, optei por apenas coletar todas as bases e fazer a manipulação dos dados no próprio Python devido à minha familiaridade com a linguagem. Caso deseje ver como seria a query em linguagem SQL, observe o arquivo queries.sql presente neste repositório. Após a coleta dos dados a conexão é fechada como boa prática para garantir o bom funcionamento do banco.

A manipulação de dados se desenvolveu de acordo com a seguintes etapas:
- Importação de dados utilizando SQL;
- Remoção de colunas consideradas descartáveis;
- Joins realizados utilizando chaves de interesse;
- Remoção de dados do tipo NA e similares; e
- One-Hot-Encoding de variáveis categórias.