-- Tabela de Alunos
CREATE TABLE Alunos (
    aluno_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Tabela de Professores
CREATE TABLE Professores (
    professor_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    especialidade VARCHAR(255),
    telefone VARCHAR(20)
);

-- Tabela de Disciplinas
CREATE TABLE Disciplinas (
    disciplina_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    professor_id INT REFERENCES Professores(professor_id)
);

-- Tabela de Matrículas
CREATE TABLE Matriculas (
    matricula_id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES Alunos(aluno_id),
    disciplina_id INT REFERENCES Disciplinas(disciplina_id),
    data_matricula DATE
);

-- Tabela de Notas
CREATE TABLE Notas (
    nota_id SERIAL PRIMARY KEY,
    matricula_id INT REFERENCES Matriculas(matricula_id),
    nota DECIMAL(4, 2),
    data_avaliacao DATE
);

-- Inserir alunos
INSERT INTO Alunos (nome, data_nascimento, endereco, telefone) VALUES
('João Silva', '2005-03-15', 'Rua A, 123', '11999999999'),
('Maria Oliveira', '2006-07-20', 'Rua B, 456', '11988888888'),
('Pedro Santos', '2007-11-10', 'Rua C, 789', '11977777777');

-- Inserir professores
INSERT INTO Professores (nome, especialidade, telefone) VALUES
('Ana Souza', 'Matemática', '11966666666'),
('Carlos Pereira', 'História', '11955555555'),
('Laura Almeida', 'Português', '11944444444');

-- Inserir disciplinas
INSERT INTO Disciplinas (nome, professor_id) VALUES
('Matemática', 1),
('História', 2),
('Português', 3);

-- Inserir matrículas
INSERT INTO Matriculas (aluno_id, disciplina_id, data_matricula) VALUES
(1, 1, '2023-08-01'),
(2, 2, '2023-08-01'),
(3, 3, '2023-08-01');

-- Inserir notas
INSERT INTO Notas (matricula_id, nota, data_avaliacao) VALUES
(1, 8.5, '2023-09-10'),
(2, 7.0, '2023-09-10'),
(3, 9.5, '2023-09-10');

-- Alunos com nome que começa com 'M'
SELECT * FROM Alunos WHERE nome LIKE 'M%';

-- Alunos nascidos após 2006
SELECT * FROM Alunos WHERE data_nascimento > '2006-01-01';

-- Professores de Matemática
SELECT * FROM Professores WHERE especialidade = 'Matemática';

-- Professores com nome que contém 'a'
SELECT * FROM Professores WHERE nome LIKE '%a%';

-- Disciplinas com nome que termina com 'a'
SELECT * FROM Disciplinas WHERE nome LIKE '%a';

-- Disciplinas ministradas pelo professor com ID 1
SELECT * FROM Disciplinas WHERE professor_id = 1;
