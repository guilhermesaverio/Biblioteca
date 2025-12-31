 --Adicionar uma nova coluna a uma tabela existente.
 ALTER TABLE Livro
 ADD Edição SMALLINT;

 --Alterar o tipo de dados de uma coluna
 ALTER TABLE Livro
 ALTER COLUMN Edição TINYINT;

 --Adicionar chave primaria
 ALTER TABLE NomeTabela
 ADD PRIMARY KEY (Coluna);

 --Excluir uma constraint de uma coluna
 ALTER TABLE NomeTAbela
 DROP CONSTRAINT NomeConstraint;

 --Verificar nomes das contraints:
 sp_help Livro;

 --excluir uma coluna de uma tabela
 ALTER TABLE Livro
 DROP COLUMN Edição;

 --Excluir uma tabela: DROP TABLE
 DROP TABLE NomeTabela;

 -- Renomear uma tabela: sp_rename
 --sp_rename 'nome atual', 'novo nome';
 sp_rename 'tbl_livros', 'Livro';