
CREATE TABLE Alunos (
    IdAluno INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    DataNascimento DATE,
    IdDoCurso INT,
    Email VARCHAR(100)
);

CREATE TABLE Cursos (
    IdDoCurso INT PRIMARY KEY AUTO_INCREMENT,
    Curso VARCHAR(100) NOT NULL
);

DELIMITER $
CREATE PROCEDURE InserirCurso(IN Curso VARCHAR(100))
BEGIN
    INSERT INTO Cursos (Curso) VALUES (Curso);
END $
DELIMITER ;

DELIMITER $
CREATE PROCEDURE InserirAluno(IN Nome VARCHAR(50), IN Sobrenome VARCHAR(50), IN DataNascimento DATE, IN IdDoCurso INT)
BEGIN
    DECLARE EmailAluno VARCHAR(100);
    SET EmailAluno = CONCAT(LOWER(REPLACE(Nome, ' ', '.')), '.', LOWER(REPLACE(Sobrenome, ' ', '.')), '@dominio.com');

    INSERT INTO Alunos (Nome, Sobrenome, DataNascimento, IdDoCurso, Email) VALUES (Nome, Sobrenome, DataNascimento, IdDoCurso, EmailAluno);
END$
DELIMITER ;

CALL InserirCurso('Analise e Desenvolvimento de Sistemas');

CALL InserirAluno('Matheus', 'Laia', '2005-04-15', 1);
CALL InserirAluno('Matheus', 'Laia', '2007-07-17', 2);

SELECT * FROM Cursos;

SELECT * FROM Alunos;
