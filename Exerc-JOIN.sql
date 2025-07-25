-- create
CREATE TABLE motorista (
  COD_mot int PRIMARY KEY,
  CPF varchar (11) NOT NULL,
  CNH varchar(10) NOT NULL,
  Nome varchar (50) NOT NULL,
  Endereco varchar (100) NOT NULL
);

CREATE TABLE veiculo(
  Placa varchar (7) PRIMARY KEY,
  Capacidade int
);

CREATE TABLE cliente(
  CodCli int PRIMARY KEY,
  Nome varchar (50) NOT NULL,
  Tel varchar (10) NOT NULL,
  Endereco varchar (100) NOT NULL,
  CPF varchar (11) NOT NULL,
  Email varchar (50) NOT NULL
);

CREATE TABLE produto(
  CodPro int PRIMARY KEY,
  custo numeric (11,2),
  decricao text,
  preco numeric (11,2),
  Nome varchar (50)
);

CREATE TABLE vendedor(
  CodVdd int PRIMARY KEY,
  CPF varchar (11),
  v_comissao numeric (4,2),
  Nome varchar (50),
  Endereco varchar (100)
);

CREATE TABLE venda(
  NumVen INT PRIMARY KEY,
  valor_total numeric (11,2) NOT NULL,
  CodVdd int,
  CodCli int,
  FOREIGN KEY (CodVdd) REFERENCES vendedor (CodVdd),
  FOREIGN KEY (CodCli) REFERENCES cliente (CodCli)
);

CREATE TABLE entrega(
  Hora time,
  Data date NOT NULL,
  NumVen int,
  Placa varchar (7),
  COD_mot int,
  FOREIGN KEY (COD_mot) REFERENCES motorista (COD_mot),
  FOREIGN KEY (Placa) REFERENCES veiculo (Placa),
  FOREIGN KEY (NumVen) REFERENCES venda (NumVen),
  PRIMARY KEY (Hora, Data, NumVen, Placa, COD_mot)
);


CREATE TABLE Item_venda(
  CodPro int,
  NumVen int,
  vUnitario numeric (11,2),
  Qtd int,
  FOREIGN KEY (CodPro) REFERENCES produto (CodPro),
  FOREIGN KEY (NumVen) REFERENCES venda (NumVen),
  PRIMARY KEY (CodPro, NumVen)
);

INSERT INTO motorista VALUES
 (0001, '15499965410', '1234567898', 'Emanuel', 'Guarabira'),
 (0002, '25698727665', '8765432197', 'Gabriel', 'Lagoa de Dentro'),
 (0003, '34576597601', '6543218790', 'Érika', 'Guarabira');

INSERT INTO veiculo VALUES
 ('I7G89HJ', 05),
 ('6H7FP09', 05),
 ('H9J8A12', 08);
 
INSERT INTO cliente VALUES
 (2, 'Mariana', '9908333210', 'Guarabira', '17600056759', 'mariana@gmail.com'),
 (6, 'Emilly', '9815432197', 'Lagoa de Dentro', '23476599998', 'emilly@gmail.com'),
 (8, 'Isadora', '9843218790', 'Guarabira', '14598765402', 'isa09@gmail.com');
 
INSERT INTO produto VALUES
 (897, 150.5, 'Nosso ferro de passar é de altíssima qualidade, bivolt e possui 8 temperaturas.', 200.0, 'Ferro de passar'),
 (756, 8500.0, 'Nossa geladeira electrolux é econômica, possui 700 litros e tecnológica com um tablet inserido em sua porta.', 10000.0, 'Geladeira'),
 (875, 2500.0, 'Ela tem capacidade de lavagem de 11kg e de secagem de 7kg, motor digital inverter que é mais silencioso e com 10 anos de garantia, além de 12 programas de lavagem.', 3499.9, 'Lava e seca'),
 (490, 739.5, 'possui um estilo moderno e atual, dispondo de espelho e espaço externo para acomodar itens fáceis de uso no seu dia-dia.', 850.0, 'Guarda-roupa');
 
INSERT INTO vendedor VALUES
 (009, '29908343210', 90.0, 'Debora', 'Alagoinha'),
 (007, '09815432197', 90.0, 'Elenilson', 'Mamanguape'),
 (006, '98072927662', 90.0, 'Mariana', 'João Pessoa'),
 (008, '19843218790', 90.0, 'José Barros', 'Caiana');
 
 INSERT INTO venda VALUES
 (12, 10000.0, 008, 8),
 (22, 200.0, 007, 2),
 (13, 3499.9, 009, 6);
 
INSERT INTO entrega VALUES
 ('10:50', '2025/07/10', 12, 'I7G89HJ', 0001),
 ('12:00', '2025/06/06', 13, '6H7FP09', 0002),
 ('09:22', '2025/06/18', 22, 'H9J8A12', 0003);
 
INSERT INTO Item_venda VALUES
 (897, 22, 200.0, 1),
 (756, 12, 10000.0, 1),
 (875, 13, 3499.9, 1);
 
--JOIN: junta informações de 2 tabelas diferentes com valores relacionados, isso é feito por chaves estr. e prim.
--usamos INNER JOIN para relacionar o número da venda com o vendedor que a realizou
SELECT venda.NumVen, vendedor.Nome AS NomeVendedor --nome da tabela + nome da coluna pro sql entender
FROM venda
INNER JOIN vendedor ON venda.CodVdd = vendedor.CodVdd; --OBS: INNER só mostra o núm. de venda se o cod do vendedor dessa venda existir na tabela vendedor

--venda.NumVen: estamos pedindo o número da venda
--vendedor.Nome: pedimos o nome do vendedor que fez a venda
--AS NomeVendedor: nome da coluna que dá o resultado (nome do vendedor q fez a venda)
--FROM venda: apontamos a tabela principal pro sql buscar
--INNER JOIN vendedor: estamos juntando a tabela venda com vendedor
--ON venda.CodVdd = vendedor.CodVdd: dizemos a ligação entre as duas tabelas (quando o cod do vendedor [CodVdd] na tabela venda for igual ao cod do vendedor na tabela vendedor)
--OBS: ON = condição da junção, diz como o sl deve juntar as tabelas

SELECT produto.nome, Item_venda.NumVen --pedimos o nome do do produto em produto e o núm. de venda de Item_venda 
FROM produto --tabela base
LEFT JOIN Item_venda ON produto.CodPro = Item_venda.CodPro; --junta a tabela Item_venda com produto e mostra tudo que tiver na tabela produto, mesmo se o cod do produto n aparecer em Item_venda
--LEFT JOIN: mostra todos as informaçções da tabela da esquerda (nesse caso, produto), mesmo se não tiver correspondência na tabela Item_venda
 
SELECT venda.NumVen, venda.valor_total, vendedor.Nome AS NomeVendedor --pedimos pro sql trazer o núm. de venda de venda, o valor total da venda de venda e o nome do venededor de vendedor
FROM venda --tabela base
RIGHT JOIN vendedor ON venda.CodVdd = vendedor.CodVdd; --junta as tabelas venda e vendedor e mostra todos os vendedores da tabela vendedor, mesmo que não tenham vendido nada
--RIGHT JOIN: mostra todas as informações da tabela da direita (nesse caso, vendedor), mesmo que não tenha correspondência com a tabela venda

SELECT produto.CodPro, Item_venda.NumVen --pedimos pro sql trazer o cod. dos produtos de produto e o num. de vendedor do Item_venda
FROM produto --tabela base
FULL OUTER JOIN Item_venda ON produto.CodPro = Item_venda.CodPro; --junta as tabelas produto e Item_venda, e traz tudo de todas as tabelas (a da direita e a da esquerda) mesmo que não tenha correspondência
