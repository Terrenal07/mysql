SELECT * FROM sys.clientes;
SELECT * FROM sys.pedidos;
CREATE TABLE sys.pedidos (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_producto INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id),
  FOREIGN KEY (id_producto) REFERENCES productos(id),
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id),
  CONSTRAINT fk_pedido_producto FOREIGN KEY (id_producto) REFERENCES productos(ID)
);
INSERT INTO sys.Pedidos (id_cliente, id_producto, Fecha_Pedido)
VALUES (1, 4, '2023-04-15');
/*recomendable joins*/
SELECT sys.clientes.nombre, sys.pedidos.fecha_pedido
FROM sys.clientes
INNER JOIN sys.pedidos ON sys.clientes.id = sys.pedidos.id_cliente;
/*no muy recomendable*/
SELECT sys.clientes.nombre, sys.pedidos.fecha_pedido
FROM sys.clientes,sys.pedidos
where sys.clientes.id = sys.pedidos.id_cliente;