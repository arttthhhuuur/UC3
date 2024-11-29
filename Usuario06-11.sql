CREATE TABLE Cliente(
	ID_Cliente INT PRIMARY KEY,
	Nome_Cliente VARCHAR(50) NOT NULL,
	Data_Nascimento DATE,
	CPF_Cliente CHAR(11) NOT NULL,
	Endereco_Cliente VARCHAR(150) NOT NULL,
	Genero CHAR(1),
	Salario NUMERIC
);

create table Produtos(
	ID_Produto INT PRIMARY KEY,
	Nome_Produto VARCHAR(30) NOT NULL,
	Descricao TEXT NOT NULL,
	Preco Numeric CHECK (PRECO > 0) NOT NULL,
	Qtde_Estoque SMALLINT DEFAULT 0
);

CREATE TABLE Pedidos(
	ID_Pedido SERIAL PRIMARY KEY,
	ID_Cliente INT NOT NULL REFERENCES clientes(ID_Cliente),
	ID_Produto INT NOT NULL,
	Qtde SMALLINT NOT NULL,
	FOREING KEY (ID_Produto) REFERENCES produtos(ID_Produto)
);

CREATE TABLE Categoria(
	ID_Categoria INT PRIMARY KEY,
	Nome_categoria VARCHAR(30) NOT NULL
);

CREATE TABLE Historico_Salarial(
	ID_Historico SERIAL PRIMARY KEY,
	ID_Cliente INT REFERENCES Cliente(ID_Cliente),
	Data_Alteracao DATE,
	Salario MONEY
);

SELECT * FROM Historico_Salarial

Create or REPLACE FUNCTION Atualizacao_Salario() returns
trigger as $$ begin
insert into historico_salarial(id_cliente, data_alteracao, salario)
values(new.id_cliente, now(), new.salario);
return null;
end;
$$ language plpgsql;

create or replace trigger trigger_atualiza_salario
after insert or update on Cliente
for each row
execute function atualizacao_salario()

update cliente set salario = '1500' where id_cliente = 3
update cliente set salario = '4000' where id_cliente = 1
update cliente set salario = '1624.66' where nome_cliente = 'Felipe'

Create or REPLACE FUNCTION Atualizacao_Preco() returns
trigger as $$ begin
insert into Produtos(id_produto, nome_produto, descricao, preco, qtde_estoque, categoria)
values(new.id_produto, now(), new.preco);
return null;
end;
$$ language plpgsql;

create or replace trigger trigger_atualizar_preco
after insert or update on Produtos
for each row
execute function atualizacao_preco()

update Produtos set preco = '40' where ID_Produto = 1
select * from

ALTER TABLE Produtos ADD categoria INT
ALTER TABLE produtos ADD CONSTRAINT ID_Categoria
FOREIGN KEY(Categoria) references Categoria(ID_Categoria)


INSERT INTO Produtos (ID_Produto, Nome_Produto, Descricao, Preco, Qtde_Estoque, Categoria)
VALUES
	(6, 'Agua 5L', 'Garrafa de agua 5L', 9.99, 100, 1),
	(7, 'Pepsi 2L', 'Pepao 2L', 7.90, 50, 2),
	(8, 'Arroz', 'tio joao', 7.99, 200, 3),
	(9, 'bola', 'redonda', 12.99, 10, 4);

INSERT INTO Pedidos(ID_Pedido, ID_Cliente, ID_Produto, Qtde)
	VALUES
	(1, 1, 1, 3),
	(2, 2, 2, 2);

INSERT INTO Cliente (ID_Cliente, Nome_Cliente, Data_Nascimento, CPF_Cliente, Endereco_Cliente, Genero, Salario)
VALUES 
	(1, 'João', '1990-01-01', '12345678901', 'Rua A, 123', 'M', 3000)
	(2, 'Felipe', '1985-05-10', '23456789012', 'Rua B, 456', 'M', 3500)
	(3, 'Maria', '1992-08-15', '34567890123', 'Rua C, 789',	'F'	4000)
	(4, 'João', '1988-03-20', '45678901234', 'Rua D, 101', 'M', 3200)
    (5, 'Pedro', '1988-03-20', '45678901234', 'Rua D, 101', 'M', 3000);
	
INSERT INTO Categoria (ID_Categoria, Nome_Categoria)
VALUES
	(1, 'agua'),
	(2, 'refrigerante'),
	(3, 'comida'),
	(4, 'brinquedos');
UPDATE Produtos SET Categoria = 2 WHERE ID_Produto = 2;
UPDATE Produtos SET Categoria = 1 WHERE ID_Produto = 1;

--------------------------------

SELECT * FROM PRECO
SELECT * FROM Historico_Salarial
SELECT * FROM Cliente
SELECT * FROM Pedidos
SELECT * FROM Produtos
SELECT * FROM Categoria
SELECT DISTINCT Descricao FROM Produtos
SELECT DISTINCT Nome_Cliente FROM Cliente
SELECT DISTINCT CPF_Cliente FROM Cliente
SELECT Nome_Cliente, CPF_Cliente FROM Cliente WHERE Genero = 'F'
SELECT Nome_Cliente, Salario FROM Cliente WHERE Genero = 'M'AND Salario >= 3000
SELECT COUNT(*) AS Numero_de_Cliente FROM Cliente
SELECT COUNT(*) AS Cliente_Mulheres FROM Cliente WHERE Genero = 'F'
SELECT COUNT(*) AS ID_Produto FROM Produtos --EXERCICIO1
SELECT COUNT(Qtde) FROM Pedidos WHERE ID_Cliente = 2 --EXERCICIO1
SELECT COUNT(*) AS Qtde FROM Pedidos WHERE ID_Produto = 1 --EXERCICIO1
SELECT COUNT(DISTINCT ID_Cliente) FROM Cliente --EXERCICIO1
SELECT AVG(Salario) AS Media_Salarial FROM Cliente
SELECT AVG(Preco) AS Media_de_Preco FROM Produtos --EXERCICIO2(1)
SELECT AVG(Qtde) AS Quantidade_Media FROM Pedidos --EXERCICIO2(2)
SELECT AVG(total_pedidos) AS media_pedidos_por_cliente --EXERCICIO02(3)
SELECT AVG(total_pedidos) AS media_pedidos_por_cliente
FROM (
    SELECT ID_Cliente, COUNT(*) AS total_pedidos
    FROM Pedidos
    GROUP BY ID_Cliente
) AS pedidos_por_cliente; --EXERCICIO02(4)
SELECT SUM(Salario) FROM Cliente
SELECT SUM(Preco/3) FROM Produtos
SELECT Genero, COUNT(*) AS Usuarios FROM Cliente GROUP BY Genero;
SELECT SUM(preco%10) FROM Produtos --EXERCICIO5(3)

SELECT nome_cliente, qtde
FROM Cliente, Pedidos
WHERE Pedidos.id_cliente = Cliente.id_cliente AND qtde > 2

SELECT nome_cliente, qtde
FROM Cliente, Pedidos
WHERE Pedidos.qtde = Cliente.id_cliente AND qtde > 2 --EXERCICIO3

SELECT Cliente.nome_cliente, Produtos.nome_produto, Pedidos.qtde, 
SUM(Produtos.preco * Pedidos.qtde) AS valor_total
FROM Clientes
JOIN Pedidos ON Cliente.ID_Cliente = Pedidos.ID_Cliente

SELECT ID_Pedido, Nome_Produto, Qtde
FROM pedidos pe
JOIN Produtos
ON pe.id_produto = produtos.id_produto
JOIN Cliente cl
ON pe.id_cliente = cl.id_cliente
WHERE id_pedido = 2 --pesquisar qual foi o pedido

SELECT ID_Pedido, Nome_Produto, Qtde
FROM pedidos
JOIN Produtos
ON pedidos.id_produto = produtos.id_produto
JOIN Cliente
ON pedidos.id_cliente = cliente.id_cliente

--EXERCICIO

--SELECIONE TODOS OS PEDIDOS QUE VORAM COMPRADOS POR COMPRADOS POR UM DETERMINADO USUARIO
SELECT Pedidos.ID_Pedido, Produtos.Nome_Produto, Pedidos.Qtde
FROM Pedidos
JOIN Produtos
ON Pedidos.ID_Produto = Produtos.ID_Produto
WHERE Pedidos.ID_Cliente = 1

--SELECIONE TODOS OS PRODUTOS EM UMA DETERMINADA CATEGORIA
SELECT Produtos.Nome_Produto, Produtos.Descricao, Produtos.Preco
FROM Produtos
JOIN Categoria
ON Produtos.Categoria = Categoria.ID_Categoria
WHERE Categoria.Nome_Categoria = 'agua';

--left join
SELECT Produtos.Nome_Produto, Categoria.Nome_Categoria
FROM Produtos
LEFT JOIN Categoria
ON Produtos.Categoria = Categoria.ID_Categoria;

--right join
SELECT Nome_Cliente, ID_Pedido
FROM Cliente 
RIGHT JOIN Pedidos
on Cliente .ID_Cliente = Pedidos.ID_Cliente

--cross join
SELECT Nome_Produto, Categoria
FROM Produtos
CROSS JOIN Cliente

--full outer join
SELECT Produtos.Nome_Produto, Categoria.Nome_Categoria
FROM Produtos
FULL OUTER JOIN Categoria
ON Produtos.Categoria = Categoria.ID_Categoria;

--SELECIONE TODAS AS CATEGORIAS E CCONTE QUANTOS PRODUTOS EXISTEM EM CADA UMA, INCLUINDO CATEGORIAS QUE NAO POSSUEM PRODUTOS (UANDO LEFT JOIN)
SELECT 
    Categoria.Nome_Categoria,
    COUNT(Produtos.ID_Produto) AS Quantidade_Produtos
FROM 
    Categoria
LEFT JOIN 
    Produtos
ON 
    Categoria.ID_Categoria = Produtos.Categoria
GROUP BY 
    Categoria.Nome_Categoria;
	
/*liste todos os pedidos e os usurios que os realizaram,
mas incluea tambem os pedidos que ainda nao possuem usuarios associados (RIGHT JOIN)*/

SELECT Pedidos.ID_Pedido, Cliente.Nome_Cliente
FROM Pedidos
RIGHT JOIN Cliente
ON Pedidos.ID_Cliente = Cliente.ID_Cliente

/*lgggggggggggggggggggggggggggggggggggggggggggg*/
	
SELECT * FROM Produtos_Comprados

CREATE OR REPLACE VIEW produtos_comprados AS
SELECT 
    PE.ID_Pedido AS Numero_Pedidos,
    CL.Nome_Cliente AS Nome_Cliente,
    PR.Nome_Produto AS Nome_Produto,
    PE.Qtde AS Quantidade,
    (PE.Qtde * PR.Preco) AS Fatura
FROM 
    Pedidos PE
INNER JOIN 
    Produtos PR
ON 
    PE.ID_Produto = PR.ID_Produto
INNER JOIN 
    Cliente CL
ON 
    PE.ID_Cliente = CL.ID_Cliente;
	
--____________________________________________________________

--crie a view de produto_categoria: selecione todos os produtos e suas categorias
--exercicio1

CREATE OR REPLACE VIEW produto_categoria AS
SELECT 
    produtos.id_produto AS ID_Produto,
    produtos.nome_produto AS Nome_Produto,
    categoria.nome_categoria AS Nome_Categoria
FROM 
    produtos
LEFT JOIN 
    categoria
ON 
    produtos.categoria = categoria.id_categoria;
	
SELECT * FROM Produto_Categoria

--crie a view de produto_feitos: selecione todos os pedidos e seus usuarios (right)

CREATE OR REPLACE VIEW produto_feitos AS
SELECT 
    pedidos.id_pedido AS ID_Pedido,
    pedidos.id_produto AS ID_Produto,
    pedidos.qtde AS Quantidade,
    cliente.id_cliente AS ID_Cliente,
    cliente.nome_cliente AS Nome_Cliente
FROM 
    pedidos
RIGHT JOIN 
    cliente
ON 
    pedidos.id_cliente = cliente.id_cliente;
	
SELECT * FROM Produto_feitos

--indice
create index on cliente (id_cliente)
create index on Produtos (id_produto)
create index on Pedidos (id_pedido)

