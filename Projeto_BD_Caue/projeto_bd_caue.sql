DROP DATABASE IF EXISTS mecanica; 

 

CREATE DATABASE mecanica; 

  

USE mecanica; 

  

CREATE TABLE telefone(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, telefone VARCHAR(255) NOT NULL UNIQUE  

, descricao VARCHAR(255) NOT NULL UNIQUE );  

  

INSERT INTO (telefone, descricao) VALUES ('0000-0000', 'telefone fixo fonecedora X'); 

INSERT INTO (telefone, descricao) VALUES ('1111-1111', 'telefone pessoal gerente da fornecedora Y'); 

INSERT INTO (telefone, descricao) VALUES ('2222-2222', 'telefone pessoal do dono da fornecedora Z'); 

 

CREATE TABLE estado(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, nome VARCHAR(255) NOT NULL UNIQUE  

, sigla VARCHAR(255) NOT NULL UNIQUE  

, ativo CHAR NOT NULL DEFAULT 'S' 

, CHECK (ativo IN ('S', 'N'))  

);  

 

INSERT INTO (nome, sigla) VALUES (‘PARANÁ’, ‘PR’); 

INSERT INTO (nome, sigla) VALUES (‘SÃO PAULO’, ‘SP’); 

INSERT INTO (nome, sigla) VALUES (‘SANTA CATARINA’, ‘SC’); 

  

CREATE TABLE cidade(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, nome VARCHAR(255) NOT NULL  

,estado_id INT NOT NULL  

,FOREIGN KEY (estado_id) REFERENCES estado (id)  

, ativo CHAR NOT NULL DEFAULT 'S' 

, CHECK (ativo IN ('S', 'N'))  

);  

  

INSERT INTO (nome, estado_id) VALUES (‘PARANAVAÍ’, 1); 

INSERT INTO (nome, estado_id) VALUES (‘SÃO PAULO’, 2); 

INSERT INTO (nome, estado_id) VALUES (‘FLORIANÓPOLIS’, 3); 

 

CREATE TABLE fornecedor(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, nome VARCHAR(255) NOT NULL UNIQUE  

, cep VARCHAR(255) NOT NULL UNIQUE  

, cnpj VARCHAR(255) NOT NULL UNIQUE   

, endereco VARCHAR(255) NOT NULL   

, cidade_id INT NOT NULL   

, telefone_id INT NOT NULL  

, FOREIGN KEY (cidade_id) REFERENCES cidade(id)  

, FOREIGN KEY (telefone_id) REFERENCES telefone(id)  

);  

 

INSERT INTO (nome, cep, cnpj, endereco, cidade_id, telefone_id) VALUES ( 'lojaX’, ‘11111-111', ‘22.222.222\0001-22’, ‘rua X’, ‘1’,’1’); 

INSERT INTO (nome, cep, cnpj, endereco, cidade_id, telefone_id) VALUES (‘lojaY’, ‘22222-222’, ‘11.111.111\0001-22’, ‘rua Y’,’2’,’2’); 

INSERT INTO (nome, cep, cnpj, endereco, cidade_id, telefone_id) VALUES (‘lojaZ’, ‘33333-333’,’33.333.333\001-22’, ‘rua Z’,’3’,’3’); 

  

CREATE TABLE funcionario(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, nome VARCHAR(255) NOT NULL UNIQUE  

, cpf VARCHAR(255) NOT NULL UNIQUE  

, cargo VARCHAR(255) NOT NULL UNIQUE   

, cidade_id INT NOT NULL   

, FOREIGN KEY (cidade_id) REFERENCES cidade(id) 

);  

 

INSERT INTO (nome, cpf, cargo, cidade_id) VALUES (‘Jonas da Silva’,’111.111.111-11’, ‘gerente’, ‘1’ ); 

INSERT INTO (nome, cpf, cargo, cidade_id) VALUES (‘Edimar dos Santos’, ‘222.222.222-22’, ‘mecanico’,’1’); 

INSERT INTO (nome, cpf, cargo, cidade_id) VALUES (‘Robson Oliveira’, ‘333.333.333-33’, ‘mecanico’,’1’); 

 

  

CREATE TABLE caixa(  

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, conta_corrente FLOAT NOT NULL  

,  funcionario_id INT NOT NULL  

, FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)  

);  

 

INSERT INTO (conta_corrente, funcionario_id) VALUES (100000,’1’); 

  

CREATE TABLE pecas(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, nome VARCHAR(255) NOT NULL UNIQUE  

, codigo_barra VARCHAR(255) NOT NULL UNIQUE  

, categoria VARCHAR(255) NOT NULL UNIQUE   

, estoque INT NOT NULL  

, preco_unitario FLOAT NOT NULL  

, ativo CHAR NOT NULL DEFAULT 'S' 

, CHECK (ativo IN ('S', 'N'))  

);  

 

INSERT INTO (nome, codigo_barra, categoria, estoque, preco_unitario) VALUES (‘capacete’,’111111’,’utencilios’,3,100); 

INSERT INTO (nome, codigo_barra, categoria, estoque, preco_unitario) VALUES (‘oleo’,’222222’,’manutencao’,10,28); 

INSERT INTO (nome, codigo_barra, categoria, estoque, preco_unitario) VALUES (‘freio’,’333333’,’sistema de frenagem’,10,10); 

 

  

CREATE TABLE venda(  

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, total FLOAT NOT NULL  

, forma_pagamento VARCHAR(255) NOT NULL  

, nota_fiscal VARCHAR(255) NOT NULL  

, data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 

);  

 

INSERT INTO (total, forma_pagamento,nota_fiscal) VALUES (100,’cartao’,’111111-1’); 

INSERT INTO (total, forma_pagamento,nota_fiscal) VALUES (200,’cartao’,’222222-1’) 

INSERT INTO (total, forma_pagamento,nota_fiscal) VALUES (50,’dinheiro’,’333333-1’); 

  

CREATE TABLE itens_venda(  

quantidade VARCHAR(255) NOT NULL  

, preco VARCHAR(255) NOT NULL  

, venda_id INT NOT NULL  

, pecas_id INT NOT NULL  

,FOREIGN KEY (venda_id) REFERENCES venda(id)  

,FOREIGN KEY (pecas_id) REFERENCES pecas(id)  

);  

  

CREATE TABLE compra(  

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, total FLOAT NOT NULL  

, forma_pagamento VARCHAR(255) NOT NULL  

, nota_fiscal VARCHAR(255) NOT NULL  

, data_compra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 

, funcionario_id INT NOT NULL  

, fornecedor_id INT NOT NULL  

, FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)  

, FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)  

);  

  

CREATE TABLE itens_compra(  

quantidade VARCHAR(255) NOT NULL  

, preco VARCHAR(255) NOT NULL  

, compra_id INT NOT NULL  

, pecas_id INT NOT NULL  

, FOREIGN KEY (compra_id) REFERENCES compra(id)  

, FOREIGN KEY (pecas_id) REFERENCES pecas(id)  

);  

  

CREATE TABLE contas_pagar(  

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

,valor_final FLOAT NOT NULL  

, status VARCHAR(255) NOT NULL  

, quantidade_parcelas INT NOT NULL  

, compra_id INT NOT NULL  

,FOREIGN KEY (compra_id) REFERENCES compra(id)  

);  

  

CREATE TABLE contas_receber(  

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

,valor_final FLOAT NOT NULL  

, status VARCHAR(255) NOT NULL  

, quantidade_parcelas INT NOT NULL  

, venda_id INT NOT NULL  

,FOREIGN KEY (venda_id) REFERENCES venda(id)  

);  

  

CREATE TABLE itens_caixa(  

 quantidade VARCHAR(255) NOT NULL  

, caixa_id INT NOT NULL 

, contas_receber_id INT NOT NULL  

, contas_pagar_id INT NOT NULL  

, FOREIGN KEY (caixa_id) REFERENCES caixa(id)  

, FOREIGN KEY (contas_receber_id) REFERENCES contas_receber(id)  

, FOREIGN KEY (contas_pagar_id) REFERENCES contas_pagar(id) 

);  

  

CREATE TABLE servico( 

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 

, nome VARCHAR(255) NOT NULL UNIQUE 

, descricao VARCHAR(255) NOT NULL UNIQUE  

, funcionario_id INT NOT NULL  

, FOREIGN KEY (funcionario_id) REFERENCES funcionario(id) 

);  

  

CREATE TABLE servicos_venda(  

quantidade VARCHAR(255) NOT NULL  

, preco VARCHAR(255) NOT NULL  

, venda_id INT NOT NULL  

, servico_id INT NOT NULL  

, FOREIGN KEY (venda_id) REFERENCES venda (id)  

, FOREIGN KEY (servico_id) REFERENCES servico (id)  

);  

  

CREATE TABLE  cliente(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, nome VARCHAR(255) NOT NULL UNIQUE  

, cpf VARCHAR(255) NOT NULL UNIQUE  

, endereco VARCHAR(255) NOT NULL UNIQUE  

, cidade_id INT NOT NULL   

, cidade_estado_id INT NOT NULL  

, telefone_id INT NOT NULL  

, FOREIGN KEY (cidade_id) REFERENCES cidade(id)  

, FOREIGN KEY (cidade_estado_id) REFERENCES estado(id)  

, FOREIGN KEY (telefone_id) REFERENCES telefone(id)  

);  

  

CREATE TABLE veiculo(   

id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  

, modelo VARCHAR(255) NOT NULL UNIQUE  

, marca VARCHAR(255) NOT NULL UNIQUE  

, placa VARCHAR(255) NOT NULL UNIQUE   

, cliente_id INT NOT NULL  

, FOREIGN KEY (cliente_id) REFERENCES cliente (id) 

); 