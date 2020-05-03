create database sprint;
use sprint;
create table Cliente(
	idCliente int primary key auto_increment,
    nome varchar(40),
    email varchar(60),
    senha int
    );
create table Area(
	idArea int primary key auto_increment,
    tamanho int,
    qntSensor int,
    plantaTipo varchar(20),
    fkCliente int,
    foreign key(fkCliente) references Cliente(idCliente)
    );
create table corpo_sensor(
	idSensor int primary key auto_increment,
    estado char(1),
    check(estado='f' or estado='n'),
    fkArea int,
    foreign key(fkArea) references Area(idArea)
    );
create table dados_planta(
	idDados int primary key auto_increment,
    fkSensor int,
    foreign key (fkSensor) references corpo_sensor(idSensor),
    umidade int,
    temperatura int,
    datatempo datetime
    );

insert into Cliente (nome,email,senha) values
	('Rogério Silva','rogerio.sil@gmail.com',544469),
    ('Marcia Gonçalves','marciagonçalvez@outlook.com',99843),
    ('Pedro Clóvis','pedro.clóvis@hotmail.com',554776);
insert into Area(tamanho,qntSensor,plantaTipo,fkCliente) values
	(5000,2,'soja',1),
    (15000,4,'milho',1),
    (20000,5,'soja',2),
    (10000,3,'café',3);
insert into corpo_sensor(estado,fkArea) values
	('f',1),('f',1),
    ('f',2),('n',2),('f',2),('f',2),
    ('f',3),('f',3),('n',3),('f',3),('f',3),
    ('f',4),('f',4),('f',4);
insert into dados_planta(fkSensor,umidade,temperatura,datatempo) values
	(1,50,28,'2020-04-10 08:25:00'),
    (2,48,29,'2020-04-10 08:25:00'),
    (3,61,27,'2020-04-10 08:30:00'),
    (4,0,0,'2020-04-10 08:30:00'), /*quebrado*/
    (5,65,26,'2020-04-10 08:30:00'),
    (6,65,26,'2020-04-10 08:30:00'),
    (7,35,30,'2020-04-10 09:10:00'),
    (8,32,31,'2020-04-10 09:10:00'),
    (9,0,0,'2020-04-10 09:10:00'), /*quebrado*/
    (10,35,30,'2020-04-10 09:10:00'),
    (11,37,29,'2020-04-10 09:10:00'),
    (12,70,22,'2020-04-10 07:00:00'),
    (13,68,23,'2020-04-10 07:00:00'),
    (14,71,22,'2020-04-10 07:00:00');
select*from Cliente;
select*from Area;
select*from corpo_sensor;
select*from dados_planta;
select*from Cliente,Area,corpo_sensor,dados_planta where idCliente=fkCliente and idArea=fkArea and idSensor=fkSensor;
drop database sprint;
