/*
Considere duas tabelas: Pedidos e ItensPedido, com os seguintes campos:

    Tabela Pedidos:
        IDPedido (identificador único do pedido)
        DataPedido (data em que o pedido foi feito)
        IDCliente (identificador único do cliente)

    Tabela ItensPedido:
        IDItem (identificador único do item do pedido)
        IDPedido (identificador do pedido ao qual o item pertence)
        IDProduto (identificador único do produto)
        Quantidade (quantidade do produto no pedido)
        PrecoUnitario (preço unitário do produto)

Problema:
Escreva uma consulta SQL que liste o nome do cliente, a data do pedido, e o valor total gasto em cada pedido. 
Apresente os resultados ordenados pelo valor total gasto em ordem decrescente.
*/

SELECT 
    c.NomeCliente AS NomeCliente,
    p.DataPedido AS DataPedido,
    SUM(ip.Quantidade * ip.PrecoUnitario) AS ValorTotalGasto
FROM
    Pedidos p
JOIN ItensPedido ip ON p.IDPedido = ip.IDPedido
JOIN Clientes c ON p.IDCliente = c.IDCliente
GROUP BY 
    c.NomeCliente, p.DataPedido
ORDER BY 
    ValorTotalGasto DESC;