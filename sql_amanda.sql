select * from produto;
    select max(preco_unit) from produto; -- valor maximo
    select min(preco_unit) from produto; -- valor minimo
    select avg(preco_unit) from produto; -- media
    select round(avg(preco_unit),2) from produto; -- arrumar casas decimais
    select sum(preco_unit) from produto; -- soma de tudo
    select count(preco_unit) from produto; -- quantidade de produtos
    select round(sum(preco_unit) / count(cod_produto),2) from produto; -- cálculo usando as funçoẽs
   
    select max(preco_unit) from produto;
    select descricao from produto where preco_unit = 60.00;
    select descricao from produto where preco_unit = (select max(preco_unit) from produto);
    select descricao from produto where preco_unit = (select min(preco_unit) from produto);
   
    select nome, descricao_tipo
    from cad_usuario, tipo_usuario
    where cad_usuario. tipuser_cd = tipo_usuario.cod_tip_user;
   
    select descricao_tipo, count(descricao_tipo)
from cad_usuario, tipo_usuario
    where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user
    group by descricao_tipo order by descricao_tipo; -- ordenar o grupo por... (padrão: crescente)
   
    select descricao_tipo as Tipo_Usuario, count(descricao_tipo) numero
from cad_usuario, tipo_usuario
    where cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user
    group by descricao_tipo order by numero;  -- usar "as" antes de dar apelidos
   
    -- Cruc que retorne: nome dos usuarios e a quantidade de pedidos realizados por cada usuario
    select nome, count(cad_usuario_cpf) from cad_usuario, pedidos
    where cad_usuario.cpf = pedidos.cad_usuario_cpf group by nome;
   
    -- Cruc que retorne: nome do usuario e o valor total do pedido, filtrando por um código de pedido válido
    select nome, cpf, sum(preco_unit * qtditem), cod_pedido from cad_usuario, itemped, produto, pedidos
    where cad_usuario.cpf = pedidos.cad_usuario_cpf and
    pedidos.cod_pedido = itemped.ped_codpedidos and
    produto.cod_produto = itemped.prod_cod_produto and
    pedidos.cod_pedido = 10 group by nome; 
    
 -- cruc que retorne: quantidade de logradouros filtrando pela sigla do estado.
 select ds_uf_sigla, count(logradouro.cd_logradouro) Total_Logradouro
 from logradouro, bairros, cidades, uf
 where logradouro.bairros_cd_bairro = bairros.cd_bairro and
 bairros.cidade_cd_cidade = cidades.cd_cidade and
 cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;
 
 -- cruc que retorne: quantidade de logradouros filtrando pela sigla do estado. (correção)
 select ds_uf_sigla, count(cd_logradouro)
 from logradouro, bairros, cidades, uf
 where logradouro.bairros_cd_bairro = bairros.cd_bairro and
 bairros.cidade_cd_cidade = cidades.cd_cidade and
 cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;
 
 -- cruc que retorne: quantidade de bairros agrupado pela sigla do estado.
 select ds_uf_sigla, count(bairros.cd_bairro) Total_Bairro
 from bairros, cidades, uf
 where bairros.cidade_cd_cidade = cidades.cd_cidade and
 cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;
 
 -- cruc que retorne: quantidade de bairros agrupado pela sigla do estado. (correção)
 select ds_uf_sigla, count(cd_bairro)
 from bairros, cidades, uf
 where bairros.cidade_cd_cidade = cidades.cd_cidade and
 cidades.uf_cd_uf = uf.cd_uf group by ds_uf_sigla;
 
 -- cruc que retorne: preço total dos pedidos agrupando pelo código do pedido, sum(preco_unit * qtditem).
 select cod_pedido, sum(preco_unit * qtditem) Total
 from pedidos, itemped, produto
 where pedidos.cod_pedido = itemped.ped_codpedidos and
 itemped.prod_cod_produto = produto.cod_produto group by cod_pedido;
 
 -- cruc que retorne: preço total dos pedidos agrupando pelo código do pedido, sum(preco_unit * qtditem). (correção)
 select cod_pedido, sum(preco_unit*qtditem)
 from produto, pedidos, itemped
 where pedidos.cod_pedido = itemped.ped_codpedidos and
 itemped.prod_cod_produto = produto.cod_produto group by cod_pedido;
 
 -- cruc que retorne: descrição do produto e a quantidade de vezes que ele foi comprado, agrupando pela descrição do produto.
 select descricao, sum(cod_produto*qtditem)
 from produto , itemped, pedidos
 where produto.cod_produto = itemped.prod_cod_produto and itemped.cod_itemp group by descricao;
 
 
 -- cruc que retorne: quantidade de pedidos agrupando pela sigla da uf.all
 
 -- cruc que retorne:
