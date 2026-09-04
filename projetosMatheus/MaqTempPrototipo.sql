CREATE DATABASE MaqTemp;
USE MaqTemp;


-- TABELA DE CADASTRO DOS USUARIOS
CREATE TABLE cadastro(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100),
CONSTRAINT chkEmail CHECK (email LIKE '%@%'),
statuss VARCHAR(20),
CONSTRAINT chkStatus CHECK(statuss IN('Ativo', 'Inativo')),
tipoUsuario VARCHAR(30),
CONSTRAINT chkTipo CHECK (tipoUsuario IN ('Operador', 'Admin'))
);

INSERT INTO cadastro VALUES
	(default,'Felipe Santos Silva', 'felipe.santos@outlook.com', 'Ativo', 'Admin'),
    (default,'Cecilia Fernandes Mendonça', 'cecilia.mendonca@outlook.com', 'Ativo', 'Operador'),
    (default, 'Evangeline Souza Barbosa', 'evangeline.barbosa@outlook.com', 'Inativo', 'Operador'),
    (default, 'Marcos Anderson Santiago', 'marcos.santiago@outlook.com', 'Ativo', 'Admin');
    
SELECT * FROM cadastro;
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
DESCRIBE motores;

-- TABELA PARA ARMAZENAR A TEMPERATURA RECEBIDA
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
DESCRIBE leituraTemperatura;

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
DESCRIBE alertas;