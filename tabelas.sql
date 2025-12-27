CREATE TABLE Autor (
IdAutor SMALLINT IDENTITY,
NomeAutor VARCHAR(50) NOT NULL,
SobrenomeAutor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY(IdAutor)
);

SP_HELP Autor;

CREATE TABLE Editora(
IdEditora SMALLINT PRIMARY KEY IDENTITY,
NomeEditora VARCHAR(50) NOT NULL
);

CREATE TABLE Assunto(
IdAssunto TINYINT PRIMARY KEY IDENTITY,
NomeAssunto VARCHAR(25) NOT NULL
);

CREATE TABLE Livro(
IdLivro SMALLINT NOT NULL PRIMARY KEY IDENTITY(100,1),
NomeLivro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13) UNIQUE NOT NULL,
DataPub DATE,
PreçoLivro MONEY NOT NULL,
NumeroPaginas SMALLINT NOT NULL,
IdEditora SMALLINT NOT NULL,
IdAssunto TINYINT NOT NULL,
CONSTRAINT fk_id_editora FOREIGN KEY(IdEditora)
 REFERENCES Editora(IdEditora) ON DELETE CASCADE,
CONSTRAINT fk_id_assunto FOREIGN KEY(IdAssunto)
 REFERENCES Assunto(IdAssunto) ON DELETE CASCADE,
CONSTRAINT verifica_preco CHECK(PreçoLivro >= 0)
);

CREATE TABLE LivroAutor(
IdLivro SMALLINT NOT NULL,
IdAutor SMALLINT NOT NULL,
CONSTRAINT fk_id_livros FOREIGN KEY(IdLivro)REFERENCES Livro(IdLivro),
CONSTRAINT fk_id_autores FOREIGN KEY(IdAutor)REFERENCES Autor(IdAutor),
CONSTRAINT pk_livro_autor PRIMARY KEY(IdLivro, IdAutor)
);

SELECT NAME FROM Biblioteca.sys.tables;

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



