/*Criando um Banco de Dados para a Padaria*/
CREATE DATABASE Padaria_Pao_Genial;
USE Padaria_Pao_Genial;

/*Tabeça Função*/
CREATE TABLE funcao (
   id_funcao int not null,
   nome_funcao varchar(50),
   PRIMARY KEY(id_funcao)

);

/*Tabela Funcionários*/
CREATE TABLE funcionarios (
    id_funcionario INT not null AUTO_INCREMENT,
    id_funcao int,
    nome_funcionario varchar(80),
    senha int not null,
    CPF varchar(20),
    email varchar(80),
    rua varchar(30),
    telefone varchar(20),
    numero int,
    bairro varchar(80),
    cidade varchar(20),
    UF char(2),
    data_admissao date,
    salario decimal(10,2),
    PRIMARY KEY(id_funcionario),
    FOREIGN KEY (id_funcao) REFERENCES funcao(id_funcao)
);    

/*Tabela Fornecedores*/
CREATE TABLE fornecedores (
    id_fornecedor int not null AUTO_INCREMENT,
    nome_fornecedor varchar(80),
    CNPJ varchar(15),
    email varchar(80),
    telefone varchar(20),
    rua varchar(30),
    numero int,
    bairro varchar(80),
    cidade varchar(20),
    UF char(2),
    
    PRIMARY KEY(id_fornecedor)
);

/*Tabela Produto*/
CREATE TABLE produto (
    id_produto int not null AUTO_INCREMENT,
    id_fornecedor int not null,
    nome_produto varchar(80),
    descricao varchar(200),
    precoun decimal(10,2),
    unmedida char(10),
    validade date,
    
    PRIMARY KEY(id_produto),
    FOREIGN KEY(id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

/*Tabela Caixa*/
CREATE TABLE caixa (
    id_caixa int not null AUTO_INCREMENT,
    id_funcionario int not null,
    data_abertura date,
    data_fechamento date,
    hora_abertura time,
    hora_fechamento time,
    valor_inicial decimal(10,2),
    valor_final decimal(10,2),
    
    PRIMARY KEY(id_caixa),
    FOREIGN KEY(id_funcionario) REFERENCES funcionarios(id_funcionario)

);

/*Tabela Forma de Pagamento*/
CREATE TABLE forma_pagamento (
    id_forma_pag int not null AUTO_INCREMENT,
    descricao varchar(50),
    
    PRIMARY KEY(id_forma_pag)
);

/*Tabela Estoque*/
CREATE TABLE estoque ( 
    id_estoque int not null AUTO_INCREMENT,
    qtd_atual int,
    qtd_min int,
    qtd_max int,
    
    PRIMARY KEY(id_estoque)
);

/*Tabela Comanda*/
CREATE TABLE comanda (
   id_comanda int not null AUTO_INCREMENT,
   data_abertura date,
   hora_abetura time,
   status varchar(10),
   qtd int,
   
   PRIMARY KEY(id_comanda)
);

/*Tabela Venda*/
CREATE TABLE venda (
   id_venda int not null AUTO_INCREMENT,
   id_caixa int not null,
   id_forma_pag int not null,
   data_dia date,
   hora time,
   total decimal(10,2),
   
   PRIMARY KEY(id_venda),
   FOREIGN KEY(id_caixa) REFERENCES caixa(id_caixa),
   FOREIGN KEY(id_forma_pag) REFERENCES forma_pagamento(id_forma_pag)

);

/*Tabela ItemVenda*/
CREATE TABLE itemvenda (
   id_item int not null AUTO_INCREMENT,
   id_produto int not null,
   id_venda int not null,
   preco_un decimal(10,2),
   qtd int,
   
   PRIMARY KEY(id_item),
   FOREIGN KEY(id_produto) REFERENCES produto(id_produto),
   FOREIGN KEY(id_venda) REFERENCES venda(id_venda)

);

/*Tabela Movimento Caixa*/
CREATE TABLE movimentocaixa (
   id_movimentocaixa int not null AUTO_INCREMENT,
   id_caixa int not null,
   valor decimal(10,2),
   data_hora datetime,
   observacao varchar(100),
   
   PRIMARY KEY(id_movimentocaixa),
   FOREIGN KEY(id_caixa) REFERENCES caixa(id_caixa)
);

/*Tabela Movimento estoque*/
CREATE TABLE movimentoestoque (
   id_movimentoestoque int not null AUTO_INCREMENT,
   id_produto int not null,
   id_funcionario int not null,
   observacao varchar(100),
   data_hora datetime,
   qtd int,
   
   PRIMARY KEY(id_movimentoestoque),
   FOREIGN KEY(id_produto) REFERENCES produto(id_produto),
   FOREIGN KEY(id_funcionario) REFERENCES funcionarios(id_funcionario)
);
    
