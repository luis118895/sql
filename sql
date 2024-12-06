Modelagem física 
CREATE DATABASE db_faculdade;

USE db_faculdade;

CREATE TABLE tbl_Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE,	
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(255));

insert into tbl_Alunos (nome, cpf, data_nascimento, telefone, email, endereco) values
("Luis fabiano", 48221985887, "2003-05-14", 11951681874, "flui88798@gmail.com", "Rua dos Milagres"),
("Carlos", 12345678910123, "2007-08-20", 55985854284, "carlos123@gmail.com", "Rua são jose");

-- Tabela Cursos
CREATE TABLE tbl_Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    duracao INT);

insert into tbl_Cursos (nome, descricao, duracao) values
("R H", "Recursos Humanos", 16),
("T I", "tecnologia da informação", 5 );


-- Tabela Matérias
CREATE TABLE tbl_Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    carga_horaria VARCHAR(10),
    semestre INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso));

insert into tbl_Materias(nome, carga_horaria, semestre) values
("Database Modeling & SQL", 5 , 2);


-- Tabela Professores
CREATE TABLE tbl_Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    especializacao VARCHAR(100),
    carga_horaria INT);

insert into tbl_Professores (nome, especializacao, carga_horaria) values
("Jose", "Recursos Humanos", 6);


-- Tabela Notas
CREATE TABLE tbl_Notas (
  id_nota INT AUTO_INCREMENT PRIMARY KEY,
  nota DECIMAL(5,2),
  ano INT,
  semestre INT,
  id_aluno INT,
  id_materia INT,
  FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
  FOREIGN KEY (id_materia) REFERENCES Materias(id_materia));

insert into tbl_Notas (nota, ano, semestre) values
(5.7, 4, 2);

-- Tabela Turmas
CREATE TABLE tbl_Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT,
    id_professor INT,
    semestre INT,
    horario VARCHAR(50),
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor));

insert into tbl_Turmas (semestre, horario) values
(4, "5 horas");
