CREATE DATABASE monitoramentoTemperatura;
USE monitoramentoTemperatura;
-- DROP DATABASE monitoramentoTemperatura;
CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL,
    senha VARCHAR(16) NOT NULL,
    telefone VARCHAR(15),
    CONSTRAINT chkEmail CHECK (email LIKE '%@%')
);

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(10),
    modelo VARCHAR(8),
    localizacao VARCHAR(30),
    statuss VARCHAR(10),
    CONSTRAINT chkStatus CHECK (statuss IN ('ATIVO', 'INATIVO'))	
);

CREATE TABLE leitura (
	idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(5, 2),
    dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
    nivel VARCHAR(15),
    CONSTRAINT chkNivel CHECK (nivel IN ('NORMAL', 'ACIMA DO PADRÃO', 'PERIGO'))
);

INSERT INTO usuario (nome, email, senha, telefone) VALUES
('Vitor Arevalo', 'vitor.oarevalo@sptech.school', 'XE57r68tvyu', '11 98121-2121'),
('Thayssa', 'thayssa@sptech.school', 'u93bu9b32uj', '11 91345-3212'),
('Manoel', 'manoel@sptech.school', 'nan94rfsdff', '11 92828-9032'),
('Vitor Hiroyuky', 'vitor@sptech.school', 'sjidv9wb880bu', '11 92382-3022'),
('Raquel', 'raquel@sptech.school', 'uf9webf2u9uiv', '11 91282-8228'),
('José', 'jose@sptech.school', 'insvd9s8sbuvn', '11 92857-3223'),
('Alberta', 'alberta@sptech.school', 'alberta123', '11 91291-9219');

SELECT * FROM usuario;

INSERT INTO sensor (nome, modelo, localizacao, statuss) VALUES
('LM35-001', 'LM35', 'Setor de Produção', 'ATIVO'),
('DHT11-001', 'DHT11', 'Setor de Embalagem', 'INATIVO'),
('LDR-001', 'LDR', 'Setor de Produção', 'INATIVO');

SELECT * FROM sensor;

INSERT INTO leitura (temperatura, nivel) VALUES 
(26.0, 'NORMAL'),
(52.3, 'NORMAL'),
(78.2, 'NORMAL'),
(85.6, 'ACIMA DO PADRÃO'),
(92.1, 'PERIGO');

SELECT * FROM leitura;