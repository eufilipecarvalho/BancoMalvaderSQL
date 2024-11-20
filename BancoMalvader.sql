create database BancoMalvader;

create table usuario(
id_usuario int auto_increment primary key not null,
nome varchar (100),
cpf varchar (11),
data_nascimento date,
telefone varchar (15),
tipo_usuario enum ('funcionario','cliente'),
senha varchar (50)
);

create table funcionario (
id_funcionario int auto_increment primary key not null,
codigo_funcionario varchar (20),
cargo varchar (50),
id_usuario int not null,
foreign key (id_usuario) references usuario (id_usuario)
on delete cascade
on update cascade
)ENGINE=InnoDB;

alter table usuario ENGINE=InnoDB;

create table cliente (
id_cliente int auto_increment primary key not null,
id_usuario int,
foreign key (id_usuario) references usuario (id_usuario)
on delete cascade
on update cascade
)ENGINE=InnoDB;


create table endereco (
id_enredeco int auto_increment primary key not null,
cep varchar (10),
local varchar (100),
numero_casa int,
bairro varchar (50),
cidade varchar (50),
estado varchar (2),
id_usuario int,
foreign key (id_usuario) references usuario (id_usuario)
on delete cascade
on update cascade
)ENGINE=InnoDB;


create table conta (
id_conta int auto_increment primary key not null,
numero_conta varchar (20),
agencia varchar (10),
saldo decimal (15,2),
tipo_conta enum ('poupanca','corrente'),
id_cliente int,
foreign key (id_cliente) references cliente (id_cliente)
on delete cascade
on update cascade
)ENGINE=InnoDB;

create table conta_corrente (
id_conta_corrente int auto_increment primary key not null,
limite decimal (15,2),
data_vencimento date,
id_conta int,
foreign key (id_conta) references conta (id_conta)
on delete cascade
on update cascade
)ENGINE=InnoDB;

create table conta_poupanca (
id_conta_poupanca int auto_increment primary key not null,
taxa_rendimento decimal (5,2),
id_conta int,
foreign key (id_conta) references conta (id_conta)
on delete cascade
on update cascade
)ENGINE=InnoDB;

create table transacao (
id_transacao int auto_increment primary key not null,
tipo_transacao enum ('deposito','saque','transferencia'),
valor decimal (15,2),
data_hora timestamp,
id_conta int,
foreign key (id_conta) references conta (id_conta)
on delete cascade
on update cascade
)ENGINE=InnoDB;


create table relatorio (
id_relatorio int auto_increment primary key,
tipo_relatorio varchar (50),
data_geracao timestamp,
conteudo text,
id_funcionario int,
foreign key (id_funcionario) references	funcionario (id_funcionario)
on delete cascade
on update cascade
);


create table endereco (
id_enredeco int auto_increment primary key not null,
cep varchar (10),
`local` varchar (100),
numero_casa int,
bairro varchar (50),
cidade varchar (50),
estado varchar (2),
id_usuario int,
foreign key (id_usuario) references usuario (id_usuario)
on delete cascade
on update cascade
)ENGINE=InnoDB;

