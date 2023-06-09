SELECT * FROM ok.escola;

select id_municipio, avg(nota_idesp_ef_iniciais) as media_idesp_ef_iniciais,
avg (nota_idesp_ef_finais) AS media_idesp_ef_finais, 
avg (nota_idesp_em) AS media_idesp_em
from escola 
group by id_municipio;  

select id_municipio, ano, avg(nota_idesp_ef_iniciais) as media_idesp_ef_iniciais,
avg (nota_idesp_ef_finais) AS media_idesp_ef_finais, 
avg (nota_idesp_em) AS media_idesp_em
from escola 
group by id_municipio, ano;  

select id_municipio, avg(nota_idesp_ef_iniciais+nota_idesp_ef_finais+nota_idesp_em) as media_composiçao_conjunta
from escola 
group by id_municipio;  