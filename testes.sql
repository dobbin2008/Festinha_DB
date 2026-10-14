create database festa_db;
use festa_db;


create table bebida (id_bebida int not null auto_increment primary key, preco decimal(10,2), nome_ml varchar(100), tipo varchar(50), 
teor_alcool decimal (2,2), estoque int
);
create table genero (id_genero int not null auto_increment primary key, nome varchar(50)
);
create table locacao (id_locacao int not null primary key auto_increment, nome varchar(50), 
preco_diaria decimal(10,2), endereco varchar(100), cep varchar(8)
);      
create table artista (id_artista int not null auto_increment primary key, nome varchar(50), preco_diaria decimal(10,2), gen_musical int,
constraint fk_musica foreign key (gen_musical) references genero(id_genero) on delete set null on update cascade
);
create table pessoa (id_pessoa int not null auto_increment primary key, primeiro_nome varchar(50), ultimo_nome varchar(50), 
idade int, cpf varchar(11), genero varchar(20), bebida_preferida int, genmusical_preferido int,
constraint fk_bebida foreign key (bebida_preferida) references bebida(id_bebida) on delete set null on update cascade,
constraint fk_genero foreign key (genmusical_preferido) references genero(id_genero) on delete set null on update cascade
);
drop table pessoa;
describe bebida;
update bebida set teor_alcool = 47.3 where id_bebida = 1;


insert into pessoa(primeiro_nome, ultimo_nome, idade, cpf, genero, bebida_preferida, genmusical_preferido) 
values ('fulano', 'de tal', 60, '98734512309', 'Homem', 2, 6);

select primeiro_nome, ultimo_nome, idade, cpf, genero, b.nome_ml as bebida_favorita, g.nome as genmusical_fav from pessoa 
left join bebida b on id_bebida = bebida_preferida
left join genero g on id_genero = genmusical_preferido;
select * from pessoa;


insert into bebida (nome_ml, preco, teor_alcool, tipo, estoque) 
values ('Licor 43 750ml', 139.99, 41.0, 'Licor', 40);

insert into genero (nome) values ('Jazz');
delete from bebida where id_bebida = 6;
select * from pessoa