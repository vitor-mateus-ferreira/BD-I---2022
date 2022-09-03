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

INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT, 'PARANA', 'PR', 'S', '2020-12-20' );
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT, 'SAO PAULO', 'SP', DEFAULT, DEFAULT );
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO', 'MT');

INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA',1),('CAMPO GRANDE',5);
INSERT INTO cidade (nome,estado_id) VALUES ('BAURU',2), ('LONDRINA',1);

SELECT * FROM estado;
SELECT * FROM cidade;


/*
INSERT -Lista Exercício 
Caso queira fazer na prática, execute o script do link: https://github.com/heliokamakawa/curso_bd/blob/master/05a-SELECT%20-%20script%20aula.sql
*/

-- 1) Escreva o comando para inserir um registro da tabela estado com todas as colunas. 
INSERT INTO estado VALUES (NULL,'ACRE','AC','S','2021-05-01'); 
/* 
Como id é um campo com auto incremento, definimos NULL no comando.
Como estamos inserindo todas as colunas não precisamos informar a descrição das colunas. 
Porém, devemos informar os dados na sequência correta 
**/ 

-- 2) Escreva o comando para inserir um registro da tabela estado, definindo todos os dados, exceto a  chave primária que é auto incremento.  
INSERT INTO estado (nome,sigla,ativo,data_cadastro) 
VALUES ('ALAGOAS','AL','S','2021-05-02'); 
-- Como não estamos informando todos os dados, é necessário especificar de quais colunas são 

-- 3) Escreva o comando para inserir um registro da tabela estado, definindo somente os dados  necessários.  
INSERT INTO estado (nome,sigla) VALUES ('AMAPÁ','AP'); 
/** 
id → não precisa informar porque é auto incremento  
ativo e data_cadastro → não precisa informar porque possui o valor padrão  
**/ 

-- 4) Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
-- O registro de uma cidade requer a referência do estado (cidade é dependente  do estado). Assim, é necessário, primeiro, fazer a inserção dos estados. 
INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (NULL, 'ACRELANDIA',1,'S','2021-04-28'); 
INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('ASSIS  BRASIL',1,'S','2021-03-14'); 
INSERT INTO cidade (nome,estado_id) VALUES ('BRASILEIA',1);


-- AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole,  digite os comandos e mentalize o que está fazendo na medida que digita cada comando. Uma dica  importante é que você digite primeiro no bloco de notas, com intuito de testar se realmente  consegue digitar os comandos sem a ajuda do IDE – depois teste os comandos. 
-- 5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 
INSERT INTO estado (id,nome, sigla, ativo, data_cadastro) VALUES (1, 'PARANÁ', 'PR', 'S', '2022-09-01'), (2, 'SÃO PAULO','SP', 'S', '2022-09-01'), (3, 'SANTA CATARINA', 'SC', 'S', '2022-09-01');
SELECT * FROM estado;
-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('AMAZONAS', 'AM', 'S', '2022-09-01'), ('RORAIMA','RR', 'S', '2022-09-01'), ('RONDONIA', 'RO', 'S', '2022-09-01');
SELECT * FROM estado;
-- 7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 
INSERT INTO estado (nome, sigla) VALUES ('ALAGOAS', 'AL'), ('PERNAMBUCO','PE');
SELECT * FROM estado;
-- 8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (1, 'PARANAVAÍ',1,'S','2022-09-01'); 
INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('MARINGÁ',1,'S','2022-09-01'); 
INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA',1);
SELECT * FROM cidade;

 -- 9. Faça a inserção de 2 registros de cliente.
INSERT INTO cliente (id, nome, cpf, email) VALUES(1, 'Vitor Mateus', 12345678910, vitormateus@gmail.com), (2, 'Diegor Martins', 12345678911, diego.martins@gmail.com);

  

