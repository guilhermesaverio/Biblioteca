--inserir registros

--Tabela de Assuntos 
INSERT INTO Assunto (NomeAssunto)
VALUES
('Ficção Científica'),
('Botânica'),
('Eletrônica'),
('Matemática'),
('Aventura'),
('Romance'),
('Finanças'),
('Gastronomia'),
('Terror'),
('Administração'),
('Informática'),
('Suspense');

--Verificação
SELECT * FROM Assunto;

--Tabela de editoras
INSERT INTO Editora (NomeEditora)
VALUES
('Prentice Hall'), ('O Reilly');

--verificação
SELECT * FROM EDITORA;

--mais editoras
INSERT INTO Editora (NomeEditora)
VALUES
('Aleph'), ('Microsoft Press'),
('Wiley'), ('HarperCollins'),
('Érica'), ('Novatec'),
('McGraw-Hill'), ('Apress'),
('Francisco Alves'), ('Sybex'),
('Globo'), ('Companhia das Letras'),
('Morro Branco'), ('Penguin Books'), ('Martin Claret'),
('Record'), ('Springer'), ('Melhoramentos'),
('Oxford'), ('Taschen'), ('Ediouro'), ('Bookman');

--Tabela de Autores 
--1. Inserir uma linha unica:
INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto','Eco');

--Verificação
SELECT * FROM Autor;

--inserir mais

INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES
('Daniel', 'Barret'),
('Gerald', 'Carter'),
('Mark', 'Sobell'),
('William', 'Stanek'),
('Christine', 'Bresnahan'),
('William', 'Gibson'),
('James', 'Joyce'),
('John', 'Emsley'),
('José', 'Saramago'),
('Richard', 'Silverman'),
('Robert', 'Byrnes'),
('Jay', 'Ts'),
('Robert', 'Eckstein'),
('Paul', 'Horowitz'),
('Winfield', 'Hill'),
('Joel', 'Murach'),
('Paul', 'Scherz'),
('Simon', 'Monk'),
('George', 'Orwell'),
('Ítalo', 'Calvino'),
('Machado', 'de Assis'),
('Oliver', 'Sacks'),
('Ray', 'Bradbury'),
('Walter', 'Isaacson'),
('Benjamin', 'Graham'),
('Júlio', 'Verne'),
('Marcelo', 'Gleiser'),
('Harri', 'Lorenzi'),
('Humphrey', 'Carpenter'),
('Isaac', 'Asimov'),
('Aldous', 'Huxley'),
('Arthur', 'Conan Doyle'),
('Blaise', 'Pascal'),
('Jostein', 'Gaarder'),
('Stephen', 'Hawking'),
('Stephen', 'Jay Gould'),
('Neil', 'De Grasse Tyson'),
('Charles', 'Darwin'),
('Alan', 'Turing'),
('Arthur', 'C. Clarke');

--Tabela de Livros:
INSERT INTO Livro 
(NomeLivro, ISBN13, DataPub, PreçoLivro, NumeroPaginas, IdEditora, IdAssunto)
VALUES 
('A Arte da Eletrônica', '9788582604342', '2017-03-08', 300.74, 1160, 24, 3);

--Verificação:
SELECT * FROM Livro;

INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PreçoLivro, NUmeroPaginas, IdEditora, IdAssunto)
VALUES
	('Vinte Mil Léguas Submarinas', '9788582850022', '2014-09-16', 24.50, 448, 1, 16), --Julio Verne
	('O Investigador Inteligente', '9788595080805', '2016-01-25', 79.90, 450, 7, 6); --Benjamin Graham 
	
-- Inserir em lote (bulk) a partir de um arquivo CSV
INSERT INTO Livro
(NomeLivro, ISBN13, DataPub, PreçoLivro, NumeroPaginas, IdEditora, IdAssunto)
SELECT
    L.NomeLivro,
    L.ISBN13,
    L.DataPub,
    L.PreçoLivro,
    L.NumeroPaginas,
    L.IdEditora,
    L.IdAssunto
FROM OPENROWSET(
    BULK 'C:\Importacao\Livros.txt',
    FORMATFILE = 'C:\Importacao\Formato.xml',
    CODEPAGE = '65001'
) AS L
WHERE NOT EXISTS (
    SELECT 1
    FROM Livro
    WHERE Livro.ISBN13 = L.ISBN13
);

--tabela LivroAutor:
INSERT INTO LivroAutor (IdLivro, IdAutor)
VALUES
(101, 27),
(103, 41),
(104, 24),
(105, 32),
(106, 20),
(107, 27),
(108, 1),
(109, 22),
(110, 10),
(111, 21),
(112, 5),
(113, 10),
(114, 8),
(115, 18),
(116, 19),
(117, 31),
(118, 22);

--Verificação
SELECT * FROM LivroAutor

--Verificação com INNER JOIN
SELECT NomeLivro, NomeAutor, SobrenomeAutor 
FROM Livro
INNER JOIN LivroAutor
    ON Livro.IdLivro = LivroAutor.IdLivro
INNER JOIN Autor
    ON Autor.IdAutor = LivroAutor.IdAutor
ORDER BY NomeLivro;

	

