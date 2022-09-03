/**
eliminando base de dados
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;

CREATE DATABASE aula_banco;

USE aula_banco;

CREATE TABLE estado(
id INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(255) NOT NULL, -- CONSTRAINT INLINE
sigla CHAR(2) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CHECK (ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE
);

-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (1, 'PARANÁ', 'PR', 'S', '2020-12-15');
-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (2, 'PARANÁ', 'PR', 'S', '2020-12-15');
-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (3, 'PARANÁ', 'PR', 'S', '2020-12-15');

SELECT id, nome, sigla, ativo, data_cadastro FROM estado;

CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
, CONSTRAINT pk_cidade PRIMARY KEY (id)
, CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
, CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
, CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);

INSERT INTO cidade (nome, estado_id) VALUES ('CURITIBA', 1);

SELECT * FROM CIDADE; 


