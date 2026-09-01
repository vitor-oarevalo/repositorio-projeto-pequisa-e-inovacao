use sprint1;

create table cadastroProjeto(
	idEmpresa int primary key auto_increment,
    nome varchar(50),
    cnpj char(18) unique
);

insert into cadastroProjeto values
	(default, 'AkzoNobel', '52.872.147/0001-98');
    
select * from cadastroProjeto;
insert into cadastroProjeto (nome, cpnj)values
	('Lukscolor', '46.928.552/0001-65'),
    ('Suvinil' ,'55.132.202/0001-89');

use sprint1;

create table registroSensor(
	idRegistro int,
    valorRegistro tinyint,
    hrRegistro datetime
);

insert into registroSensor values
	(1, 123, '2026-08-28 22:47:00');
    
select * from registroSensor;
insert into registroSensor values 
	(2, 89, '2025-09-08 12:09:47'),
	(5, 95, '2025-01-12 09:45:28');

alter table registroSensor modify column valorRegistro float not null;
alter table registroSensor modify column hrRegistro datetime not null;
describe registroSensor;

use sprint1;

create table SensorProjeto(
	idSensor int primary key,
    nome varchar(20),
    dtInstalacao date
);

alter table SensorProjeto modify column nome varchar(20) default 'LM35';
insert into SensorProjeto values 
	(1, 'LM35', '2026-08-28');
select * from SensorProjeto;
insert into SensorProjeto values 
	(2, 'LM35', '2025-09-08'),
    (5, 'LM35' , '2025-01-12');