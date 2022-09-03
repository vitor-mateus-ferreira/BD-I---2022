DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

CREATE TABLE estado( 				-- criando a tabela estado
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (				-- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- inserindo estados
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ','PR','S','2015-2-25');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MATO GROSSO','MT','N','2015-12-02');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',1);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',2);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);

-- SQL 89
SELECT 
	estado.*
	,cidade.* 
FROM estado, cidade;

-- SQL 92
SELECT *
FROM estado
INNER JOIN cidade;

-- 01 - O que é JOIN? Quando é necessário?
     O JOIN é uma forma de combinar colunas ou tabelas usando valores comuns entre elas. É necessário utilizar o JOIN quando precisamos relacionar
		os dados que estão em diferentes tabelas e assim obter combinação delas.
		
-- 02 - Qual a sintaxe do JOIN? Maiúscula ou minúscula faz diferença? Existe algum padrão? Explique.
   A sintaxe do JOIN não é definida dentro do SQL, porém devemos observar o padrão estipulado onde estamos nos inserido. Este caso, entre a turma.

	 
-- 04 - O que é primordial para que o resultado tenha sentido em consultas com JOIN? Explique.
   Precisamos de atenção na construção da seleção, pois qualquer erro no SELECT pode arruinar o funcioamento do JOIN
   
-- 05 - Existe mais de uma maneira de realizar o JOIN? Quantas? Qual é a mais eficiente? 
      Sim, existem ao todo 5 maneiras de realizar o JOIN, sendo elas INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN. Não existe uma que seja mais eficiente, varia de acordo com o caso.