create database tudodebom2;

use tudodebom2;

create table cliente(
id int auto_increment primary key,
nome varchar(50) not null,
cpf varchar(50) not null
);

create table categoria(
id int auto_increment primary key,
tipo_categoria varchar(50) not null
);

create table produto(
id int auto_increment primary key,
categoria_id int not null,
nome varchar(100) not null,
estoque int not null,
preco double not null,
disponibilidade boolean not null,
desconto_flag boolean not null,
remedio_flag boolean not null,

foreign key(categoria_id) references categoria(id) 
);

create table pedido(
id int auto_increment primary key,
endereco_entrega varchar(100) not null,
total_pedido double not null,
cliente_id int not null,

foreign key(cliente_id) references cliente(id)
-- foreign key(item_nf_id) references item_nf(id)
);

create table item_pedido(
id int auto_increment primary key,
pedido_id int not null,
produto_id int not null,
quantidade int not null,
sub_total double not null,

foreign key(pedido_id) references pedido(id),
foreign key(produto_id) references produto(id)
);

insert into cliente (nome, cpf) values ("nome1", "123.123.123-123"), ("nome2", "123.123.123-123"), ("nome3", "123.123.123-123"), ("nome4", "123.123.123-123");
 
insert into categoria(nome) values ("tipo 1"), ("tipo 2"), ("tipo 3"), ("tipo 4");
 
insert into produto(categoria_id, nome, estoque, preco, disponibilidade, desconto_flag, remedio_flag) values 
(1, "prod1", 50, 2.00, true, false, true), (1, "prod1", 50, 4.00, false, true, false), (1, "prod1", 50, 6.00, true, false, true), (1, "prod1", 50, 8.00, false, true, false),
(2, "prod1", 50, 10.00, true, true, true), (2, "prod1", 50, 12.00, false, true, true), (2, "prod1", 50, 14.00, true, true, true), (2, "prod1", 50, 16.00, true, true, true),
(3, "prod1", 50, 18.00, false, true, true), (3, "prod1", 50, 20.00, true, false, true), (3, "prod1", 50, 22.00, true, true, false), (3, "prod1", 50, 24.00, false, false, true),
(4, "prod1", 50, 26.00, true, false, true),(4, "prod1", 50, 28.00, true, true, false), (4, "prod1", 50, 30.00, true, false, true), (4, "prod1", 50, 32.00, false, true, false);

insert into pedido (endereco_entrega, total_pedido, cliente_id) values ("Rua 1", 150.00 , 1), ("Rua 1", 150.00 , 2), ("Rua 1", 150.00 , 3), ("Rua 1", 150.00 , 4);

select * from pedido;

insert into item_pedido (pedido_id, produto_id, quantidade, sub_total) values 
(1, 1, 5, 15.00), (1, 2, 5, 15.00), (1, 3, 5, 15.00), (1, 4, 5, 15.00), 
(2, 5, 5, 15.00), (2, 6, 5, 15.00), (2, 7, 5, 15.00), (2, 8, 5, 15.00), 
(3, 9, 5, 15.00), (3, 10, 5, 15.00), (3, 11, 5, 15.00), (3, 12, 5, 15.00), 
(4, 13, 5, 15.00), (4, 14, 5, 15.00), (4, 15, 5, 15.00), (4, 16, 5, 15.00);

select * from item_pedido;

-- calcular apenas produtos que estiverem com descontos true
select  produto.nome, (preco + (preco * 0.2)) as valor_desconto from produto where desconto = true;

-- select c.nome'Nome Cliente', inf.nf_id 'Cod NF', inf.produto_id
select p.id 'CODIGO', p.nome 'PRODUTO', (p.preco+(p.preco*0.2))'PRECO C/DESCONTO', c.nome 'CATEGORIA' from produto p inner join categoria c on c.id = p.categoria_id where p.preco < 8 and p.preco >= 2 and p.desconto = true;

select (p.estoque - ip.quantidade) 'DESCONTADO DO BANCO' from item_pedido ip inner join produto p on p.id =  ip.produto_id where ip.pedido_id = 1;

select * from produto;

select  (select sum(estoque) from produto)-(select sum(quantidade) from item_pedido); 

-- update produto set p.qtd = (p.qtd - inf.qtd) from item_nf inf inner join produto p on p.id = inf.produto_id;


  