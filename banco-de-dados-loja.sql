create database LOJA;
use LOJA;

create table CLIENTE (
    ID_CLIENTE int auto_increment primary key,
    NOME varchar(50) not null,
    ENDERECO varchar(100) not null
);

create table PEDIDO (
    ID_PEDIDO int auto_increment primary key,
    ID_CLIENTE int,
    DATA_PEDIDO date not null,
    foreign key (ID_CLIENTE) 
		references CLIENTE(ID_CLIENTE)
);

create table ITEM_PEDIDO (
    ID_ITEM int auto_increment primary key,
    ID_PEDIDO int,
    QTD_ITEM int not null,
    foreign key (ID_PEDIDO) 
		references PEDIDO (ID_PEDIDO)
);

insert into CLIENTE (NOME, ENDERECO) 
values 
	('João', 'Rua A, 123'),
	('Maria', 'Rua B, 456');

INSERT INTO PEDIDO (ID_CLIENTE, DATA_PEDIDO) 
VALUES 
	(1, '2023-03-01'),
	(2, '2023-03-02');

INSERT INTO ITEM_PEDIDO (ID_PEDIDO, QTD_ITEM) 
VALUES 
	(1, 10),
	(1, 5),
	(2, 20);

select PEDIDO.ID_PEDIDO, PEDIDO.DATA_PEDIDO, CLIENTE.NOME
from PEDIDO
inner join CLIENTE on PEDIDO.ID_CLIENTE = CLIENTE.ID_CLIENTE;

select ITEM_PEDIDO.ID_ITEM, ITEM_PEDIDO.QTD_ITEM
from ITEM_PEDIDO
inner join PEDIDO on ITEM_PEDIDO.ID_PEDIDO = PEDIDO.ID_PEDIDO
where PEDIDO.ID_PEDIDO = 1;
