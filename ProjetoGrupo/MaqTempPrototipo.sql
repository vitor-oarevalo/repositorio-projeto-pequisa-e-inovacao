-- Grupo 7
-- Leonardo Vieira Linge – RA 01262109
-- Manoel Alves da Silva Filho – RA 01262045
-- Matheus de Souza Menino – RA 01262022
-- Pietro Giuliani da Silva – RA 01262130
-- Thayssa Santos Marques de Souza – RA 01262057
-- Vitor Alexandre Osuna Arevalo – RA 01262052
-- Vitor Hiroyuky Tsumura – RA 01262065

CREATE DATABASE MaqTemp;
USE MaqTemp;

-- TABELA DE CADASTRO DOS USUARIOS
CREATE TABLE cadastro(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
CONSTRAINT chkEmail CHECK (email LIKE '%@%'),
senha VARCHAR(255) NOT NULL,
statuss VARCHAR(20),
CONSTRAINT chkStatus CHECK(statuss IN('Ativo', 'Inativo'))
);

INSERT INTO cadastro VALUES
	(default,'Felipe Santos Silva', 'felipe.santos@outlook.com','123456', 'Ativo'),
    (default,'Cecilia Fernandes Mendonça', 'cecilia.mendonca@outlook.com','123457', 'Ativo'),
    (default, 'Evangeline Souza Barbosa', 'evangeline.barbosa@outlook.com','123458', 'Inativo'),
    (default, 'Marcos Anderson Santiago', 'marcos.santiago@outlook.com','123459', 'Ativo');
    
SELECT * FROM cadastro;
SELECT * FROM cadastro WHERE nome = 'Empresa XYZ';
SELECT * FROM cadastro ORDER BY nome ASC;
SELECT * FROM cadastro WHERE nome LIKE 'M%';
SELECT CONCAT('Cliente: ', nome, ' | Telefone: ', telefone ) AS contato FROM cadastro;
SELECT CONCAT(nome, ' - ', cidade) AS cliente FROM cadastro;
SELECT CONCAT('Endereço: ', endereco, ', ', numero, ' - ', cidade) AS 'endereco completo' FROM cadastro;
SELECT ifnull (nome, 'Sem identificação') as nome FROM cadastro;
UPDATE cadastro SET telefone = '11999999999' WHERE idUsuario = 1;
DELETE FROM cadastro WHERE idUsuario = 1;
ALTER TABLE cadastro ADD COLUMN telefone VARCHAR(20);
ALTER TABLE cadastro MODIFY COLUMN nome VARCHAR(150);
ALTER TABLE cadastro RENAME COLUMN telefone TO telefoneContato;
ALTER TABLE cadastro DROP COLUMN cidade;
DESCRIBE cadastro;
    
-- TABELA DE CADASTRO DOS MOTORES QUE SERÃO MONITORADOS
CREATE TABLE motores(
idMotor INT PRIMARY KEY AUTO_INCREMENT,
modeloMotor VARCHAR(100), -- MODELO DO MOTOR
potencia DECIMAL(10,2), -- POTENCIA EM KW
localizacao VARCHAR(100), -- SETOR QUE O MOTOR ESTÁ NA FABRICA
statuss VARCHAR(20),
CONSTRAINT chkStatusMotor CHECK (statuss IN ('Ativo', 'Inativo'))
);
 
INSERT INTO motores VALUES
	(default, 'WEG W22', 15.00, 'Produção de tintas', 'Ativo'),
    (default, 'WEG W22 Plus', 30.00, 'Mistura de tintas', 'Inativo'),
    (default, 'WEG 22', 15.00, 'Transferência de tintas', 'Ativo');
    
SELECT * FROM motores;
SELECT modeloMotor, potencia FROM motores;
SELECT * FROM motores WHERE statuss = 'Ativo';
SELECT * FROM motores WHERE potencia > 15;
SELECT * FROM motores WHERE localizacao = 'Produção de tintas';
SELECT * FROM motores ORDER BY potencia DESC;
SELECT * FROM motores WHERE modeloMotor LIKE 'WEG%';
SELECT CONCAT(modeloMotor, ' - ', potencia, ' KW') AS motor FROM motores;
SELECT CONCAT('Motor: ', modeloMotor, ' | Setor: ', localizacao) AS informaçâo FROM motores;
SELECT CONCAT('Modelo: ', modeloMotor, ' | Potência: ', potencia, ' kW', ' | Localização: ', localizacao, ' | Status: ', statuss) AS 'dados do motor' FROM motores;
SELECT CASE WHEN potencia > 15 THEN 'Forte' ELSE 'Normal' END AS 'Nível potência' FROM motores;
UPDATE motores SET localizacao = 'Linha de produção' WHERE idMotor = 1;
UPDATE motores SET statuss = 'Inativo' WHERE idMotor = 3;
UPDATE motores SET potencia = 18.50 WHERE idMotor = 1;
DELETE FROM motores WHERE idMotor = 3;
ALTER TABLE motores ADD COLUMN fabricante VARCHAR(50);
ALTER TABLE motores ADD COLUMN numeroSerie VARCHAR(50);
ALTER TABLE motores MODIFY COLUMN modeloMotor VARCHAR(150);
ALTER TABLE motores MODIFY COLUMN potencia DECIMAL(10,2) NOT NULL;
ALTER TABLE motores RENAME COLUMN statuss TO statusMotor;
ALTER TABLE motores DROP COLUMN numeroSerie;
DESCRIBE motores;

-- TABELA PARA ARMAZENAR A TEMPERATURA RECEBIDA
CREATE TABLE leituraTemperatura(
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
modeloMotor VARCHAR(100), -- AQUI O CERTO SERIA SER OS MESMOS MODELO DA TABELA ANTERIOR
temperatura DECIMAL (5,2), -- TEMPERATURA EM ºC
dtLeitura DATETIME DEFAULT CURRENT_TIMESTAMP, -- MOMENTO QUE FOI FEITA A MEDIÇÃO
situacao VARCHAR(20),
CONSTRAINT chkSituacao CHECK (situacao IN('Normal', 'Atenção', 'Alerta'))
);


INSERT INTO leituraTemperatura (modeloMotor, temperatura, situacao) VALUES
	('WEG W22', 52.50, 'Normal'),
    ('WEG W22 PLUS',72.50, 'Atenção'),
    ('WEG 22', 80.90, 'Alerta');
    
SELECT * FROM leituraTemperatura;
SELECT * FROM leituraTemperatura WHERE temperatura > 70;
SELECT * FROM leituraTemperatura WHERE situacao = 'Alerta';
SELECT * FROM leituraTemperatura ORDER BY temperatura DESC;
SELECT CONCAT('Motor: ', modeloMotor, ' | Temperatura: ', temperatura, ' ºC') AS leitura FROM leituraTemperatura;
SELECT CONCAT(modeloMotor, ' - ', temperatura, ' ºC - ', situacao) AS monitoramento FROM leituraTemperatura;
UPDATE leituraTemperatura SET situacao = 'Atenção' WHERE idLeitura = 1;
DELETE FROM leituraTemperatura WHERE idLeitura = 1;
ALTER TABLE leituraTemperatura ADD COLUMN unidade VARCHAR(5);
ALTER TABLE leituraTemperatura MODIFY COLUMN situacao VARCHAR(30);
ALTER TABLE leituraTemperatura RENAME COLUMN dtLeitura TO dataLeitura;
ALTER TABLE leituraTemperatura DROP COLUMN unidade;
DESCRIBE leituraTemperatura;


-- 	Tabelas para armazenar os alertas dos ocorridos
CREATE TABLE alertas(
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
modeloMotor VARCHAR(100),
temperatura DECIMAL(5,2), -- temperatura que foi registrada
dtAlerta DATETIME DEFAULT CURRENT_TIMESTAMP, -- MOMENTO QUE O ALERTA ACONTECEU
nivel VARCHAR(20),
CONSTRAINT chkNivel CHECK (nivel IN('Atenção','Alerta')),
statuss VARCHAR(20),
CONSTRAINT chkStatusAlerta CHECK (statuss IN ('Pendente', 'Resolvido')) 
);

INSERT INTO alertas (modeloMotor, temperatura, nivel, statuss) VALUES
	('WEG 22', 80.90, 'Alerta', 'Resolvido'),
    ('WEG W22', 70.50,'Atenção', 'Pendente');
    
SELECT * FROM alertas;
SELECT * FROM alertas WHERE statuss = 'Pendente';
SELECT * FROM alertas WHERE temperatura >= 70;
SELECT CONCAT('Motor: ', modeloMotor, ' | Temperatura: ', temperatura, ' ºC',' | Nível: ', nivel, ' | Status: ', statuss) AS alerta FROM alertas;
UPDATE alertas SET statuss = 'Resolvido' WHERE idAlerta = 2;
DELETE FROM alertas WHERE idAlerta = 2;
ALTER TABLE alertas ADD COLUMN descricao VARCHAR(200);
ALTER TABLE alertas MODIFY COLUMN descricao VARCHAR(300);
ALTER TABLE alertas RENAME COLUMN dtAlerta TO dataAlerta;
ALTER TABLE alertas DROP COLUMN descricao;
DESCRIBE alertas;