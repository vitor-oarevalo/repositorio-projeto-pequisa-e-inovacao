CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
perfil VARCHAR(50),
senha VARCHAR(50) NOT NULL,
telefone CHAR(13) UNIQUE,
empresa VARCHAR(100),
localizacao VARCHAR(100)
);

CREATE TABLE suporte_cliente(
idSuporte INT,
nome VARCHAR(100),
email VARCHAR(50),
telefone CHAR(13),
mensagem TEXT
);

CREATE TABLE motor (
idMotor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
potencia DECIMAL(10,2),
fabricante VARCHAR(100),
modelo VARCHAR(100),
statuss VARCHAR(30)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(50) NOT NULL,
dataInstalacao DATE,
statuss VARCHAR(30)
);

CREATE TABLE temperatura_coletada (
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL(5,2) NOT NULL,
dataHora DATETIME NOT NULL
);

CREATE TABLE limite_temperatura (
idLimite INT PRIMARY KEY AUTO_INCREMENT,
temperaturaNormal DECIMAL(5,2),
temperaturaAlerta DECIMAL(5,2),
temperaturaCritica DECIMAL(5,2)
);

CREATE TABLE alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(30) NOT NULL,
mensagem VARCHAR(255),
dataHora DATETIME NOT NULL,
statuss VARCHAR(30)
);