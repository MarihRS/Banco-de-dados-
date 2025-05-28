CREATE TABLE Estudantes (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    curso VARCHAR(30),
    idade INT,
    nota DECIMAL(3,1),
    cidade VARCHAR(30)
);

INSERT INTO Estudantes (id, nome, curso, idade, nota, cidade) VALUES
(01, 'Emanuel', 'Informática', 18, 10, 'Guarabira'),
(02, 'Mariana', 'Informática', 17, 10, 'João Pessoa'),
(03, 'Aline', 'Informática', 18, 6, 'Sapé'),
(04, 'Antônio', 'Informática', 16, 8, 'Sertãozinho'),
(05, 'Érika', 'Informática', 17, 6, 'Serra da Raíz'),
(06, 'Adrielle', 'Edificações', 16, 5, 'Araçagi'),
(07, 'Amanda', 'Edificações', 17, 9, 'Dona Inês'),
(08, 'Alisson', 'Contabilidade', 16, 6, 'Alagoinha'),
(09, 'Isadora', 'Contabilidade', 16, 7, 'Alagoa Grande'),
(10, 'Emilly', 'Informática', 17, 9, 'Sapé');

--EXERCÍCIO 1
SELECT * FROM Estudantes WHERE nome LIKE 'A%';

--EXERCÍCIO 2
SELECT * FROM Estudantes ORDER BY nota DESC;

--EXERCÍCIO 3
SELECT AVG(nota) FROM Estudantes;
SELECT MIN(nota) FROM Estudantes;
SELECT MAX(nota) FROM Estudantes;

--EXERCÍCIO 4
SELECT COUNT(*) AS "Quantidade de estudantes" FROM Estudantes;

--EXERCÍCIO 5
SELECT curso, COUNT(*) AS "Quantidade de estudantes por curso"
FROM Estudantes
GROUP BY curso;

--EXERCÍCIO 6
SELECT SUM(idade) FROM Estudantes;

--EXERCÍCIO 7
SELECT curso, COUNT(*) AS "Total de estudantes"
FROM Estudantes
GROUP BY curso
HAVING COUNT(*) > 5;

--EXERCÍCIO 8
SELECT curso, AVG(nota) AS "Média de notas"
FROM Estudantes
WHERE cidade LIKE 'S%'
GROUP BY curso
HAVING AVG(nota) > 7;