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

INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA',1),('MARINGA',1);
INSERT INTO cidade (nome,estado_id) VALUES ('BAURU',2), ('LONDRINA',1);

UPDATE estado SET nome = 'PARANA' WHERE id =1;
UPDATE estado SET nome = 'PARANA', ATIVO = 'N' WHERE id = 1;
UPDATE estado SET nome = 'Paraná', ativo = 'S', data_cadastro = '2020-10-15' WHERE id = 1;
UPDATE estado SET data_cadastro = CURRENT_TIMESTAMP WHERE id = 1;
UPDATE estado SET nome = 'PARANÁ', data_cadastro = DEFAULT WHERE id = 1;

UPDATE cidade SET ativo = 'N' WHERE estado_id = 1;

SELECT * FROM estado;
SELECT * FROM cidade;

