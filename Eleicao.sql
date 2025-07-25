CREATE TABLE Candidatos (
    candidatos_id INT PRIMARY KEY,
    candidatos_nome VARCHAR(100),
    partido VARCHAR(50)
);

CREATE TABLE Votos (
    votos_id INT PRIMARY KEY,
    candidatos_id INT,
    regioes_id INT,
    voto_count INT
);

CREATE TABLE Regioes (
    regioes_id INT PRIMARY KEY,
    regioes_nome VARCHAR(100)
);

CREATE TABLE Urnas (
    id_urna INT PRIMARY KEY,
    secao INT,
    municipio VARCHAR(100),
    estado VARCHAR(100),
    quantidade_eleitores INT
);

CREATE TABLE Presenca (
  id_presenca INT PRIMARY KEY,
  municipio VARCHAR(100),
  ano_eleicao INT,
  presenca_total INT
);

insert into Candidatos (candidatos_id, candidatos_nome, partido) values
(01, 'Antônio', 'PT'),
(02, 'Emanuel', 'PL'),
(03, 'Emilly', 'PL'),
(04, 'Gabriel', 'PL'),
(05, 'Isadora', 'PT');

insert into Votos (votos_id, candidatos_id, regioes_id, voto_count) values
(10, 01, 01, 550),
(22, 02, 02, 100),
(03, 03, 05, 700),
(54, 04, 02, 300),
(05, 05, 04, 800);

insert into Regioes (regioes_id, regioes_nome) values
(01, 'Sul'),
(02, 'Nordeste'),
(03, 'Norte'),
(04, 'Centro Oeste'),
(05, 'Sudeste');

insert into Urnas (id_urna, secao, municipio, estado, quantidade_eleitores) values
(01, 22, 'Porto Alegre', 'Rio Grande do Sul', 40000),
(02, 30, 'Guarabira', 'Paraíba', 30000),
(03, 45, 'Rio Branco', 'Acre', 5000),
(04, 20, 'Goiânia', 'Goiás', 10000),
(05, 50, 'São Paulo', 'São Paulo', 700000);

insert into Presenca (id_presenca, municipio, ano_eleicao, presenca_total) values
(01, 'Porto Alegre', 2025, 40000),
(02, 'Guarabira', 2025, 5000),
(03, 'Rio Branco', 2025, 10000),
(04, 'Goiânia', 2025, 10100),
(05, 'São Paulo', 2025, 650000);

select sum(voto_count) AS "Total de votos por candidato" from votos;

select regioes_id, avg(voto_count) AS "Média de votos" 
from votos
group by regioes_id;

select candidatos_id, regioes_id, voto_count
from votos 
where voto_count = ( select max(voto_count)
from votos 
);

select regioes_id, max(voto_count)
from votos 
group by regioes_id
order by max(voto_count) desc;

select candidatos_id, voto_count
from votos 
where voto_count = ( select max(voto_count)
from votos 
);

select candidatos_id, sum(voto_count)
from votos
group by candidatos_id
having sum(voto_count) > 500;

select regioes_id, candidatos_id, 
sum(voto_count) AS "Total de votos"
from votos
group by regioes_id, candidatos_id
order by regioes_id, candidatos_id;

select estado, avg(quantidade_eleitores) AS "Média de eleitores"
from Urnas
group by estado
having avg(quantidade_eleitores) > 10000;

select municipio, avg(presenca_total) AS "Média de presença"
from Presenca
group by municipio
having avg(presenca_total) > 10000;
