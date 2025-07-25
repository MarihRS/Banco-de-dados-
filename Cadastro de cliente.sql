-- criação da tabela Clientes
CREATE TABLE Clientes (
  id_cliente int NOT NULL,
  Nome varchar (100) NOT NULL,
  CPF varchar (11) NOT NULL UNIQUE,
  Email varchar (100) NOT NULL,
  Data_Nascimento date NOT NULL,
  primary key (id_cliente)
);

-- criação da tabela Enderecos
CREATE TABLE Enderecos (
  id_endereco int NOT NULL,
  id_cliente int NOT NULL,
  rua varchar (100) NOT NULL,
  numero int NOT NULL,
  bairro varchar (50) NOT NULL,
  complemento varchar (100),
  cidade varchar (100) NOT NULL,
  UF varchar (2) NOT NULL,
  CEP varchar (8) NOT NULL,
  ponto_de_referencia varchar (100) NOT NULL,
  primary key (id_endereco),
  foreign key (id_cliente) references Clientes(id_cliente)
);

-- Inserção dos Clientes
INSERT INTO Clientes (id_cliente, nome, cpf, email, data_nascimento) VALUES
(1, 'Maria Silva', '11122233344', 'maria.silva@email.com', '1990-01-01'),
(2, 'João Santos', '22233344455', 'joao.santos@email.com', '1985-03-15'),
(3, 'Ana Oliveira', '33344455566', 'ana.oliveira@email.com', '1992-07-22'),
(4, 'Pedro Lima', '44455566677', 'pedro.lima@email.com', '1995-10-10'),
(5, 'Carla Souza', '55566677788', 'carla.souza@email.com', '1988-05-05');

-- Inserção dos Endereços
INSERT INTO Enderecos (id_endereco, id_cliente, rua, numero, bairro, complemento, cidade, uf, cep, ponto_de_referencia) VALUES
-- Cliente 1 (Norte)
(1, 1, 'Rua das Palmeiras', 123, 'Centro', NULL, 'Manaus', 'AM', '69000000', 'Próximo ao mercado'),
(2, 1, 'Avenida Brasil', 456, 'Zona Norte', 'Apt 101', 'Manaus', 'AM', '69000123', 'Perto da escola'),

-- Cliente 2 (Nordeste)
(3, 2, 'Rua da Praia', 789, 'Boa Viagem', NULL, 'Recife', 'PE', '50000000', 'Frente ao parque'),
(4, 2, 'Avenida Recife', 321, 'Imbiribeira', 'Casa', 'Recife', 'PE', '50000123', 'Ao lado do shopping'),

-- Cliente 3 (Sudeste)
(5, 3, 'Rua Augusta', 654, 'Consolação', NULL, 'São Paulo', 'SP', '01000000', 'Próximo ao metrô'),
(6, 3, 'Avenida Paulista', 987, 'Bela Vista', 'Apt 202', 'São Paulo', 'SP', '01000123', 'Perto do MASP'),

-- Cliente 4 (Centro-Oeste)
(7, 4, 'Rua Goiás', 111, 'Setor Oeste', NULL, 'Goiânia', 'GO', '74000000', 'Próximo ao estádio'),
(8, 4, 'Avenida Tocantins', 222, 'Centro', 'Casa', 'Goiânia', 'GO', '74000123', 'Perto da igreja'),

-- Cliente 5 (Sul)
(9, 5, 'Rua das Flores', 333, 'Centro', NULL, 'Curitiba', 'PR', '80000000', 'Perto da praça'),
(10, 5, 'Avenida Paraná', 444, 'Santa Felicidade', 'Apt 303', 'Curitiba', 'PR', '80000123', 'Ao lado do restaurante');

--alteração da tabela e adição de uma nova coluna
ALTER TABLE Enderecos
ADD Regiao varchar(20);

--update da nova coluna
update Enderecos
set Regiao = case
  when UF in ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC') then 'Norte'
  when UF in ('MA', 'PI', 'CE', 'RN', 'PE', 'PB', 'SE', 'AL', 'BA') then 'Nordeste'
  when UF in ('SP', 'RJ', 'ES', 'MG') then 'Sudeste'
  when UF in ('PR', 'RS', 'SC') then 'Sul'
  when UF in ('MT', 'MS', 'GO', 'DF') then 'Centro-Oeste'
  ELSE NULL
END;

-- exibição dos dados 
select * from Clientes;
select * from Enderecos;
