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

create table dados_sensor -- Dados do sensor expostos no site
(
	iddados int primary key auto_increment,
    plantatipo varchar (50),
    qtdgrao int,
    sensorarea varchar (50),
    qtdsensor int,
    temperatura double,
    umidade double,
    datatempo datetime
)default charset = utf8;

insert into dados_sensor
(plantatipo, qtdgrao, sensorarea, qtdsensor, temperatura, umidade, datatempo)
VALUES
('Soja', '1000000', '1°Ectar', '30', '20.0', '15', '2020-04-06 18:46:00');

select * from DADOSSENSOR;