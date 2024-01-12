/*
Você precisa criar uma consulta que liste os produtos mais vendidos, mostrando o nome do produto, 
a quantidade total vendida e a categoria do produto. 
Além disso, inclua apenas os produtos que foram vendidos mais de 100 unidades.
*/

SELECT 
    p.NomeProduto AS NomeProduto,
    SUM(ip.Quantidade) AS QuantidadeTotalVendida,
    p.Categoria AS CategoriaProduto
FROM 
    ItensPedido ip
JOIN Produtos p ON ip.IDProduto = p.IDProduto
GROUP BY 
    p.NomeProduto, p.Categoria
HAVING 
    SUM(ip.Quantidade) > 100
ORDER BY 
    QuantidadeTotalVendida DESC;
