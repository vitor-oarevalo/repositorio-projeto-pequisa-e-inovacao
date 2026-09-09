create database MaqTemp;

use MaqTemp;

 -- Tabela responsável pelo cadastro e controle dos sensores utilizados pela MAQTEMP
CREATE TABLE sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    temperaturaIdeal FLOAT NOT NULL,
    locall VARCHAR(20) UNIQUE,
    statuss VARCHAR(40),
    dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chkStatus CHECK (statuss IN ('Ativo', 'Inativo'))
) AUTO_INCREMENT = 1000;


-- Tabela responsável pelo cadastro dos motores elétricos monitorados pela MAQTEMP
CREATE TABLE motor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    modelo VARCHAR(50),
    potencia FLOAT,
    status VARCHAR(40),
    CONSTRAINT chkStatusMotor 
    CHECK (status IN ('Ativo', 'Inativo'))
) AUTO_INCREMENT = 1;


-- Tabela responsável pelo armazenamento das medições de temperatura realizadas pelos sensores
CREATE TABLE medicao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    temperatura FLOAT NOT NULL,
    dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
    sensor INT NOT NULL
) ;

-- Inserts de exemplo:

INSERT INTO sensor (tipo, temperaturaIdeal, locall, statuss)
VALUES
('Termopar', 70, 'Motor 01', 'Ativo'),
('Termistor', 65, 'Motor 02', 'Ativo'),
('Termopar', 75, 'Motor 03', 'Ativo');


INSERT INTO motor (nome, modelo, potencia, status)
VALUES
('Motor 01', 'WEG W22', 15, 'Ativo'),
('Motor 02', 'WEG W22', 20, 'Ativo'),
('Motor 03', 'WEG W21', 10, 'Ativo');

INSERT INTO medicao (temperatura, sensor)
VALUES
(62.5, 1000),
(68.3, 1001),
(73.8, 1002);




