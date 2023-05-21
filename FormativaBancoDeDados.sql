create database formativa;
use Formativa;

#nessa tabela esta descrito os Cargos
create table cargos(
 id bigint not null auto_increment,
 CargosNome varchar(200) not null,
 Descricao varchar(250),
 primary key(id)
 );
 
 #nessa tabela esta descrito as Regras De Acesso
 create table RegrasDeAcesso(
 id bigint not null auto_increment,
 RegrasDeAcessoNome varchar(200) not null,
 RegrasDeAcessoDescription varchar(250) not null,
 primary key(id)
 );
 
 #nessa tabela esta descrito os Usuarios
 create table Usuarios(
 id bigint not null auto_increment,
 nome varchar(200) not null,
 DataDeCadastro datetime not null default now(),
 Senha varchar(200) not null,
 Email varchar(200) not null,
 CargosFK bigint not null,
 RegrasDeAcessoFK bigint not null,
 primary key(id),
 foreign key(CargosFK) references Cargos(id),
 foreign key(RegrasDeAcessoFK) references RegrasDeAcesso(id)
 );
 

CREATE TABLE Bloco (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nomeBloco VARCHAR(1) NOT NULL,
  PRIMARY KEY (id)
);

 
 #nessa tabela esta descrito os Locais
 create table Local(
 id BIGINT NOT NULL AUTO_INCREMENT,
  nomeLocal VARCHAR(200) NOT NULL,
  bloco VARCHAR(1) NOT NULL,
  ocupacao INT NOT NULL,
  PRIMARY KEY (id)
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
 NomeEvento varchar(200) not null,
 LocalFk bigint not null,
 TotalVagas int not null,
 VagasOcupadas int not null,
 DiaHoraInicioEvento datetime not null,
 DiaHoraFinalEvento datetime not null,
 finalCheckin datetime not null,
 primary key(id),
 foreign key(localFK) references Local(id)
 );
 
create table Bilhete(
id bigint not null auto_increment,
UsuariosFK bigint not null,
EventoFK bigint not null,
HorarioDeEmissão datetime not null default now(),
primary key(id),
foreign key(UsuariosFK) references Usuarios(id),
foreign	key(EventoFK) references Evento(id)
);

#inserir Cargos
INSERT INTO cargos (CargosNome, Descricao) VALUES
('Coordenador', 'Responsável pela coordenação geral'),
('Orientador', 'Responsável pela orientação dos alunos'),
('Assistente Social', 'Responsável pelo suporte social'),
('Secretária', 'Responsável pelas atividades administrativas');

#inserir RegrasDeAcesso
INSERT INTO RegrasDeAcesso (RegrasDeAcessoNome, RegrasDeAcessoDescription) VALUES
('Admin', 'Acesso total à aplicação'),
('Gestor', 'Acesso ao cadastro de usuários, ambientes, cancelamento de eventos, etc.'),
('Usuário', 'Permite fazer reservas, mas não cadastrar usuários nem cancelar eventos'),
('Visitante', 'Permite se inscrever em um evento participante');

#inserir Usuarios
INSERT INTO Usuarios (nome, DataDeCadastro, Senha, Email, CargosFK, RegrasDeAcessoFK) VALUES
('Usuário 1', NOW(), 'senha1', 'usuario1@example.com', 1, 1),
('Usuário 2', NOW(), 'senha2', 'usuario2@example.com', 2, 2),
('Usuário 3', NOW(), 'senha3', 'usuario3@example.com', 3, 3),
('Usuário 4', NOW(), 'senha4', 'usuario4@example.com', 4, 4),
('Usuário 5', NOW(), 'senha5', 'usuario5@example.com', 1, 2),
('Usuário 6', NOW(), 'senha6', 'usuario6@example.com', 2, 3),
('Usuário 7', NOW(), 'senha7', 'usuario7@example.com', 3, 4),
('Usuário 8', NOW(), 'senha8', 'usuario8@example.com', 4, 1),
('Usuário 9', NOW(), 'senha9', 'usuario9@example.com', 1, 3),
('Usuário 10', NOW(), 'senha10', 'usuario10@example.com', 2, 4),
('Usuário 11', NOW(), 'senha11', 'usuario11@example.com', 3, 1),
('Usuário 12', NOW(), 'senha12', 'usuario12@example.com', 4, 2),
('Usuário 13', NOW(), 'senha13', 'usuario13@example.com', 1, 4),
('Usuário 14', NOW(), 'senha14', 'usuario14@example.com', 2, 1),
('Usuário 15', NOW(), 'senha15', 'usuario15@example.com', 3, 2);

#inserir Equipamentos
INSERT INTO Equipamentos (nomeEquipamentos) VALUES
('Projetor'),
('TV Smart'),
('Ar condicionado'),
('WorkStation');


INSERT INTO Bloco (nomeBloco) VALUES
('A'),
('B'),
('C'),
('D');


INSERT INTO Local (nomeLocal, blocoFK, lotMaxFK) VALUES
('Laboratório de Eletrônica 1', 1, 30),
('Sala de Reuniões 2', 2, 20),
('Auditório Principal', 3, 100),
('Sala de Estudos 3', 4, 15);

INSERT INTO Evento (NomeEvento, LocalFK, TotalVagas, VagasOcupadas, DiaHoraInicioEvento, DiaHoraFinalEvento, finalCheckin) VALUES
('Evento 1', 1, 50, 0, '2023-05-21 10:00:00', '2023-05-21 12:00:00', '2023-05-21 09:30:00'),
('Evento 2', 2, 30, 0, '2023-05-22 14:00:00', '2023-05-22 16:00:00', '2023-05-22 13:30:00'),
('Evento 3', 3, 80, 0, '2023-05-23 09:30:00', '2023-05-23 11:30:00', '2023-05-23 09:00:00'),
('Evento 4', 4, 25, 0, '2023-05-24 16:30:00', '2023-05-24 18:30:00', '2023-05-24 16:00:00'),
('Evento 5', 1, 40, 0, '2023-05-25 13:00:00', '2023-05-25 15:00:00', '2023-05-25 12:30:00'),
('Evento 6', 2, 60, 0, '2023-05-26 11:00:00', '2023-05-26 13:00:00', '2023-05-26 10:30:00');