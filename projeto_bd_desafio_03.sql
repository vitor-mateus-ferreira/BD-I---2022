DROP DATABASE IF EXISTS projeto_bd;
CREATE DATABASE projeto_bd;
USE projeto_bd;

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE 
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'  
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
);

INSERT INTO estado (id,nome,sigla,ativo) VALUES(NULL,'PARANÁ','PR','S');
INSERT INTO estado (id,nome,sigla,ativo) VALUES(NULL,'SÃO PAULO','SP','S');
INSERT INTO estado (id,nome,sigla,ativo) VALUES(NULL,'ESPIRITO SANTO','ES','S');

CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
,nome VARCHAR(255) NOT NULL
,estado_id INT NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT estado_id FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
);


INSERT INTO cidade (nome,estado_id)
VALUES ('PARANAVAÍ', '1');
INSERT INTO cidade (nome,estado_id)
VALUES ('SUMARÉ', '2');
INSERT INTO cidade (nome,estado_id)
VALUES ('VITÓRIA', '3');

CREATE TABLE produto(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE
,preco DECIMAL(8,2) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
);

INSERT INTO produto (id,nome, preco, ativo) VALUES(NULL,'ATM', 119.000,'S');
INSERT INTO produto (id,nome, preco, ativo) VALUES(NULL,'LEITOR DE CARTÕES', 900.00, 'S');
INSERT INTO produto (id,nome, preco, ativo) VALUES(NULL,'DIGITALIZADORA DE CHEQUES', 3000.00, 'S');

CREATE TABLE filial(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE
,cnpj VARCHAR(18) NOT NULL UNIQUE
,centro_de_custos VARCHAR(255) NOT NULL 
,cidade_id INT NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CONSTRAINT cidade_id FOREIGN KEY (cidade_id) REFERENCES cidade (id)
,CONSTRAINT filial_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
);

INSERT INTO filial (nome, cnpj, centro_de_custos, cidade_id, ativo) VALUES('PARANAVAÍ', '11.111.111/0001-00' ,'PARANAVAÍ', 1 , 'S');
INSERT INTO filial (nome, cnpj, centro_de_custos, cidade_id, ativo) VALUES('SUMARÉ', '22.222.222/0002-00', 'SUMARÉ', 2 ,  'S');
INSERT INTO filial (nome, cnpj, centro_de_custos, cidade_id, ativo) VALUES('VITÓRIA', '33.333.333/0003-00', 'VITÓRIA', 3, 'S');

CREATE TABLE fornecedor(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE
,cnpj VARCHAR(18) NOT NULL UNIQUE
,endereco VARCHAR(255) NOT NULL  
,ativo CHAR(1) NOT NULL DEFAULT 'S'

);

INSERT INTO fornecedor (id,nome, cnpj, endereco, ativo) VALUES(NULL,'PERTO S.A', '11.111.111/0004-00' ,'RUA INGLATERRA', 'S');
INSERT INTO fornecedor (id,nome, cnpj, endereco, ativo) VALUES(NULL,'GERTEC S.A', '22.222.222/0005-00', 'AVENIDA SAO JOAO', 'S');
INSERT INTO fornecedor (id,nome, cnpj, endereco, ativo) VALUES(NULL,'PROTEGE S.A', '33.333.333/0006-00', 'RUA DO VENTRE LIVRE', 'S');

CREATE TABLE orcamento(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,prazo_entrega VARCHAR(255) NOT NULL
,aprovacao CHAR(1) NOT NULL DEFAULT 'S'
,valor_orcado DECIMAL (8,2) NOT NULL  
,ativo CHAR(1) NOT NULL DEFAULT 'S'
);

INSERT INTO orcamento (id, prazo_entrega, aprovacao, valor_orcado, ativo) VALUES(NULL,'100 DIAS', 'S' ,'112000.00', 'S');
INSERT INTO orcamento (id, prazo_entrega, aprovacao, valor_orcado, ativo) VALUES(NULL,'20 DIAS', 'S', '790.00', 'S');
INSERT INTO orcamento (id, prazo_entrega, aprovacao, valor_orcado, ativo) VALUES(NULL,'10 DIAS', 'S', '2900.00', 'S');

SELECT id,nome,sigla,ativo FROM estado;
SELECT id,nome,estado_id,ativo FROM cidade;
SELECT id,nome,preco,ativo FROM produto;
SELECT * FROM filial;
SELECT * FROM fornecedor;
SELECT * FROM orcamento;