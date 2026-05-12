# 1.  este é o ponto por vamos começar!  neste contexto,  vamos "pegar/fazer uso"  de um "computador/maquina" que já virá com o python 3.10 pronto 
# aqui, estamos indicando o uso do python - em versão especifica -  a partir de um " pedço" do linux - necessario para criar/executar a aplicação
# a este "pedaço" damos o nome de Imagem Base - dentro desta Imagem Base temos 3 elementos importantes:
        # 1. O kernel linux: a parte central que "conversa" com o processador 
        # 2. ferramentas do sistema: comandos essenciais para, por exemplo, mover arquivos, criar pastas, gerenciar rede, entre outros...
        # o python na versão 3.10: aqui está o core/engine que irá ler a aplicação - modelo machine learning;
FROM python:3.10-slim

# 2. aqui, estamos indicando o local/onde os arquivos estarão - dentro do "computador/maquina" que estamos criando -a partir do Docker - neste caso, numa pasta que estamos nomeando como /app
WORKDIR /app 

# 3. aqui, estamos copiando o script "teste_modelo_tcc.py" -  do "computador/maquina" real - nosso pc - para dentro do Docker 
 
COPY teste_modelo_tcc.py .

# 4. agora, estamos indicando quais são as depedencias necessarias para que minha aplciação funcione - a partir do Docker.
# é possivel fazer estas referencias de instalação em partes; aqui, abaixo, por exemplo, estamos fazer as instalações bsicas necessarias para qualque modelo ML
RUN pip install pandas scikit-learn numpy  

# 5. quando o Docker for "ligado/inicializado" ele poderá "rodar" nosso script!
CMD ["python", "teste_modelo_tcc.py"]