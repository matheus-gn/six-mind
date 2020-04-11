create database Leitor_de_umidade
default character set utf8
default collate utf8_general_ci;

use Leitor_de_umidade;

create  table cadastro_cliente -- Cadastro do cliente do site 
(
	codcliente int primary key auto_increment,
    clinome varchar (50) not null,
    cliemail varchar (50) not null,
    clisenha text
) default charset = utf8;

insert into cadastro_cliente -- Exemplos de dados 
(clinome, cliemail, clisenha)
values
('Arnaldo', 'arnaldo@gmail.com', '12345678'),
('Silvia', 'silvia@gmail.com', '12345678'),
('Elimar', 'elimar@gmail.com', '12345678'),
('Daniel', 'daniel@gmail.com', '12345678');

create table cadastro_adm -- Site cadastro adm's
(
	codadm int primary key auto_increment,
    admnome varchar (50) not null,
    admsenha text
) default charset = utf8;

 insert into cadastro_adm 
 (admnome, admsenha) 
 values 
 ('Arthur', MD5('12345678')),
 ('Matheus', MD5('12345678')),
 ('Igor', MD5('12345678')),
 ('José', MD5('12345678')),
 ('Zigon', MD5('12345678')),
 ('Vicente', MD5('12345678'));

create table corpo_sensor -- Dados do sensor exposto no site
(
	idsensor int primary key auto_increment,
	plantatipo varchar (50),
	sensorlocal varchar (50),
    estado char (1),
    check (estado = 'S' or estado = 'N')
) default charset = utf8;

insert into corpo_sensor
(plantatipo, sensorlocal, estado)
values
('Soja', 'A1', 'S'),
('Soja', 'A1', 'N'),
('Soja', 'A1', 'S'),
('Soja', 'A1', 'S'),
('Feijão', 'A2', 'S'),
('Alface', 'A3', 'S');

create table dados_planta -- Dados da planta expostos no site
(
	iddados int primary key auto_increment,
    temperatura double,
    umidade double,
    datatempo datetime,
    fksensor int,
    foreign key (fksensor)
    references corpo_sensor (idsensor)
)default charset = utf8;

insert into dados_planta
(temperatura, umidade, datatempo, fksensor)
values
('20.0', '60', '2020-04-06 18:46:00', 1),
('21.0', '15', '2020-04-03 18:46:00', 2),
('19.8', '70', '2020-04-06 18:46:00', 3),
('20.5', '80', '2020-04-06 18:46:00', 6);

select * from cadastro_cliente;
select * from cadastro_adm;
select * from corpo_sensor;
select * from dados_planta;
select * from corpo_sensor, dados_planta
where fksensor = idsensor;
select * from corpo_sensor, dados_planta
where fksensor = idsensor and plantatipo = 'Alface';