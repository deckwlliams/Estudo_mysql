CREATE DATABASE estudos;
USE estudos;

CREATE TABLE tbl_professor(
    func INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE tbl_disciplina(
    cod_disc INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_h INTEGER,
    ementa TEXT,
    biblio TEXT,
    justufucativa TEXT,
    prof_resp INTEGER NOT NULL,
    CONSTRAINT fk_reso FOREIGN KEY (prof_resp) REFERENCES tbl_professor(func)
);

CREATE TABLE tbl_curso(
    codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    duracao INTEGER, 
    autoriza VARCHAR(50),
    prof_coord INTEGER NOT NULL,
    CONSTRAINT fk_coord FOREIGN KEY (prof_coord) REFERENCES tbl_professor(func)
);

CREATE TABLE tbl_grade(
    num_seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ano_ini INTEGER,
    sem_ini INTEGER, 
    cod_curso INTEGER,
    CONSTRAINT fk_curso FOREIGN KEY (cod_curso) REFERENCES tbl_curso(codigo)
);

CREATE TABLE tbl_gradedisc(
    codigo_curso INTEGER NOT NULL,
    num_seq INTEGER NOT NULL,
    CONSTRAINT pk_gradedisc PRIMARY KEY (codigo_curso, num_seq),
    CONSTRAINT fk_cursogr FOREIGN KEY (codigo_curso) REFERENCES tbl_curso(codigo),
    CONSTRAINT fk_gradegr FOREIGN KEY (num_seq) REFERENCES tbl_grade(num_seq)
);

CREATE TABLE tbl_ministra(
    func_prof INTEGER NOT NULL,
    codigo_disc INTEGER NOT NULL,
    ano_minist INTEGER NOT NULL,
    sem_minist INTEGER NOT NULL,
    CONSTRAINT pk_ministra PRIMARY KEY (func_prof, codigo_disc, ano_minist, sem_minist),
    CONSTRAINT fk_profdisc FOREIGN KEY (func_prof) REFERENCES tbl_professor(func),
    CONSTRAINT fk_dismin FOREIGN KEY (codigo_disc) REFERENCES tbl_disciplina(cod_disc)
);
/* um exemplo de on delete e on update*/

CREATE TABLE tbl_departamento(
id_depto    INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_depto  VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_funcionario(
id_func    integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome       VARCHAR(100) NOT NULL,
salario    DOUBLE,
depto      INTEGER,

CONSTRAINT fk_depto FOREIGN KEY (depto) REFERENCES tbl_departamento(id_depto)
  on delete CASCADE on update CASCADE
);

INSERT INTO tbl_professor (nome, email)
VALUES
('João Silva', 'joao.silva@faculdade.edu'),
('Maria Souza', 'maria.souza@faculdade.edu'),
('Carlos Almeida', 'carlos.almeida@faculdade.edu');

INSERT INTO tbl_curso (nome, duracao, autoriza, prof_coord)
VALUES
('Análise e Desenvolvimento de Sistemas', 3, 'MEC2024', 1),
('Engenharia de Software', 5, 'MEC2023', 2),
('Ciência da Computação', 4, 'MEC2022', 3);

INSERT INTO tbl_disciplina (nome, carga_h, ementa, biblio, justufucativa, prof_resp)
VALUES
('Programação I', 80, 'Lógica e fundamentos', 'Livro X', 'Base da computação', 1),
('Banco de Dados', 60, 'Modelo relacional', 'Livro Y', 'Essencial para sistemas', 2),
('Algoritmos Avançados', 70, 'Estruturas complexas', 'Livro Z', 'Avanço lógico', 3);

INSERT INTO tbl_grade (ano_ini, sem_ini, cod_curso)
VALUES
(2025, 1, 1),
(2025, 1, 2),
(2025, 2, 3);

INSERT INTO tbl_gradedisc (codigo_curso, num_seq)
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO tbl_ministra (func_prof, codigo_disc, ano_minist, sem_minist)
VALUES
(1, 1, 2025, 1),
(2, 2, 2025, 1),
(3, 3, 2025, 2);

INSERT INTO tbl_departamento (nome_depto)
VALUES ('Recursos Humanos'),
       ('Tecnologia'),
       ('Financeiro');
INSERT INTO tbl_funcionario (nome, salario, depto)
VALUES
('João Pereira', 3500.00, 1),
('Maria Silva', 4200.50, 2),
('Carlos Andrade', 5000.00, 2),
('Ana Souza', 3100.00, 3);


SELECT * FROM tbl_professor;
SELECT * FROM tbl_curso;
SELECT * FROM tbl_disciplina;
SELECT * FROM tbl_grade;
SELECT * FROM tbl_gradedisc;
SELECT * FROM tbl_ministra;
SELECT * FROM tbl_departamento;
SELECT * FROM tbl_funcionario;


