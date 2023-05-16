create database formativa_turma1;

#nessa tabela esta descrito os Cargos
 create table Cargos(
 id bigint not null auto_increment,
 CargosNome varchar(200) not null,
 Descricao varchar(250),
 primary key(id)
 );
 
 #nessa tabela esta descrito as Regras De Acesso
 create table RegrasDeAcesso(
 id bigint not null auto_increment,
 RegrasDeAcessoname varchar(200) not null,
 RegrasDeAcessoDescription varchar(250) not null,
 primary key(id)
 );
 
 #nessa tabela esta descrito os Usuarios
 create table Usuarios(
 id bigint not null auto_increment,
 nome varchar(200) not null,
 dataDeCadastro datetime not null default now(),
 senha varchar(200) not null,
 email varchar(200) not null,
 CargosFK bigint not null,
 RegrasDeAcessoFK bigint not null,
 primary key(id),
 foreign key(CargosFK) references Cargos(id),
 foreign key(RegrasDeAcessoFK) references RegrasDeAcesso(id)
 );
 
 #nessa tabela esta descrito os Locais
 create table Local(
 id bigint not null auto_increment,
 nomeLocal varchar(200) not null,
 lotMaxFK int not null,
 blocoFK bigint not null,
 primary key(id)
 );
 
 #nessa tabela esta descrito os Equipamentos
 create table Equipamentos(
 id bigint not null auto_increment,
 nomeEquipamentos varchar(200) not null,
 primary key(id)
 );
 
 #nessa tabela esta descrito a Lista De Controle
 create table ListaDeControle(
 id bigint not null auto_increment,
 nomeLocalFK bigint not null,
 EquipamentosFK bigint not null,
 primary key(id),
 foreign key(nomeLocalFK) references local(id),
 foreign key(equipamentosFK) references Equipamentos(id)
 );
 
 create table Evento(
 id bigint not null auto_increment,
 nomeEvento varchar(200) not null,
 LocalFk bigint not null,
 TotalVagas int not null,
 VagasOcupadas int not null,
 DiaHoraInicioEvento datetime not null,
 FinalCheckin datetime not null,