# data-analysis-python

Este é um repositório que descreve o processo de criação de um algoritmo de árvores de decisão para correlacionar variáveis. Contextualizando: a base de dados contém informações a respeito de vendas de uma empresa que produz produtos para cabelo de forma personalizada. A personalização dos produtos pode ser feita a partir de formulários preenchidos pelos clientes em momentos anteriores à compra. O objetivo deste modelo é encontrar a correlação entre os compradores e potenciais compradores (leads), comparando os interesses dos clientes com as vendas efetuadas, afim de aumentar a assertividade do envio de links para preenchimento do formulário e melhorar as vendas.

Inicialmente, realizei a conexão com a base de dados fornecida em PostgreSQL, com as credenciais fornecidas pela empresa. As queries foram desenvolvidas utilizando linguagem SQL. Porém, no algoritmo em Python, optei por apenas coletar todas as bases e fazer a manipulação dos dados no próprio Python devido à minha familiaridade com a linguagem. Caso deseje ver como seria a query em linguagem SQL, observe o arquivo queries.sql presente neste repositório. Após a coleta dos dados a conexão é fechada como boa prática para garantir o bom funcionamento do banco.

A manipulação de dados se desenvolveu de acordo com a seguintes etapas:
- Importação de dados utilizando SQL;
- Remoção de colunas consideradas descartáveis;
- Joins realizados utilizando chaves de interesse;
- Remoção de dados do tipo NA e similares; e
- One-Hot-Encoding de variáveis categóricas.

OBS: realizei a remoção de colunas baseado no entendimento que possuo sobre o negócio e no que imagino afetar com mais intensidade o resultado de vendas e em tentativas para reduzir over-fitting do modelo, devido ao curto espaço de tempo em que escrevi o algoritmo. Em próximas etapas, recomendo a utilização de elementos gráficos como plots das variáveis e execução de algoritmos como o PCA, que reduz a dimensionalidade dos dados e permite análise mais profunda das correlações entre eles.

OBS2: após os primeiros treinamentos do modelo e pesquisa em diversas referências, constatei que o One-Hot-Encoding pode influenciar de maneira negativa a qualidade do modelo. Assim, optei por excluir as colunas que necessitassem deste procedimento.

Em seguida, dividi os dados em conjuntos de treino e teste com uma proporção de 70% e 30%, respectivamente. Decidi pela implementação de um modelo de árvores de decisão conhecido como XGBoost, que é um algoritmo construído com o objetivo de aumentar a eficiência computacional (através de paralelizações do algoritmo) e permite um maior refinamento do modelo tanto em questão de hiperparâmetros quanto em parâmetros de regularização. Assim, é possivel controlar com mais eficácia um possível over-fitting. Algoritmos de referência (benchmarks) como árvores de decisão regulares e regressão logística poderiam ser utilizados e uma comparação entre o XGBoost e tais algoritmos poderia ser realizada.

As árvores de decisão se aplicam perfeitamente a este caso, pois o que determinei como a metodologia correta para a resolução deste problema foi segmentar os perfis de clientes através das árvores e verificar quais grupos possuem a maior probabilidade de efetuação de um pedido. A partir da segmentação, a campanha de marketing da empresa pode se tornar mais eficiente ao fazer envios para grupos de interesse apontados pelo algoritmo.

Treinei o modelo com os hiperparâmetros padrão e obtive uma acurácia considerada aceitável em uma primeira análise, de 87%. No entanto, em uma investigação aprofundada, constatei que o algoritmo produzia um vetor de predições com zeros, ou seja, ele acertou 87% dos casos, onde a variável alvo (binária 1 ou 0) era igual a 0, mas errou todos os casos onde o valor desejado era igual a 1. Portanto, foi preciso alterar os hiperparâmetro do modelo para melhorar qualitativamente sua acurácia. 

Após ajustes em diferentes propriedades, atingi o modelo mais adequado para o problema dentro do prazo desejado. O modelo construído atingiu uma acurácia de 81% e uma taxa de assertividade de 11% entre os valores 1 do conjunto de teste.

Com um maior entendimento do negócio e maior domínio sobre as bases de dados o modelo construído poderia ser muito mais eficiente. A curva ROC apresentada pelo modelo ficou aquém do desejado, já que a área abaixo da mesma atingiu valor próximo a 0,5, o que caracteriza um modelo fraco.
