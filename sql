-- Criação do banco de dados
CREATE DATABASE gestor_faculdade;
USE gestor_faculdade;

-- Tabela Alunos
CREATE TABLE tbl_Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    cpf VARCHAR(14) not null unique,
    data_nascimento DATE not null,
    telefone VARCHAR(15) not null,
    email VARCHAR(100) not null,
    endereco VARCHAR(255)
);

-- Inserindo dados na tabela Alunos
INSERT INTO tbl_Alunos (nome, cpf, data_nascimento, telefone, email, endereco) VALUES
("Luis Fabiano", "48221985887", "2003-05-14", "11951681874", "flui88798@gmail.com", "Rua dos Milagres"),
("Carlos", "12345678910123", "2007-08-20", "55985854284", "carlos123@gmail.com", "Rua SãoJosé");

-- Tabela Cursos
CREATE TABLE tbl_Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null ,
    descricao TEXT,
    duracao INT
);

-- Inserindo dados na tabela Cursos
INSERT INTO tbl_Cursos (nome, descricao, duracao) VALUES
("R H", "Recursos Humanos", 16),
("T I", "Tecnologia da Informação", 5);

-- Tabela Materias
CREATE TABLE tbl_Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    carga_horaria VARCHAR(10)  not null,
    semestre INT,
    id_curso INT not null,
    FOREIGN KEY (id_curso) REFERENCES tbl_Cursos(id_curso)
);

-- Inserindo dados na tabela Materias
INSERT INTO tbl_Materias (nome, carga_horaria, semestre, id_curso) VALUES
("Database Modeling & SQL", "5", 2, 2);  -- Associando com o curso "Tecnologia da Informação"

-- Tabela Professores
CREATE TABLE tbl_Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    especializacao VARCHAR(100) not null,
    carga_horaria INT not null,
    cpf VARCHAR(14) not null unique,
    telefone VARCHAR(15) not null,
    email VARCHAR(100) not null
);

-- Inserindo dados na tabela Professores
INSERT INTO tbl_Professores (nome, especializacao, carga_horaria, cpf, telefone, email) VALUES
("Jose", "Recursos Humanos", 6,"123.456.789-10", "11951681844", "joseexemplo@gmail.com");



-- Tabela Notas
CREATE TABLE tbl_Notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    nota DECIMAL(5,2) not null,
    ano INT not null,
    semestre INT not null,
    id_aluno INT not null,
    id_materia INT not null,
    foreign key (id_aluno) REFERENCES tbl_Alunos(id_aluno),
    foreign key (id_materia) REFERENCES tbl_Materias(id_materia)
);

-- Inserindo dados na tabela Notas
INSERT INTO tbl_Notas (nota, ano, semestre, id_aluno, id_materia) VALUES
(5.7, 2024, 2, 1, 1);  -- Nota do aluno com id_aluno = 1 para a matéria com id_materia = 1

-- Tabela Turmas
CREATE TABLE tbl_Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT not null,
    id_professor INT not null,
    semestre INT not null ,
    horario VARCHAR(50) not null ,
    FOREIGN KEY (id_materia) REFERENCES tbl_Materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES tbl_Professores(id_professor)
);

-- Inserindo dados na tabela Turmas
INSERT INTO tbl_Turmas (id_materia, id_professor, semestre, horario) VALUES
(1, 1, 2, "5 horas");  -- Associando a matéria "Database Modeling & SQL" com o professor "Jose"
