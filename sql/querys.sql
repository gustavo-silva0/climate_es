--1. Análise de municípios que possuem temperaturas e altitudes--
--ideais para a plantação de café arábica e café conilon--
SELECT id, "NM_MUN", altitude_media, temperatura_estimada_celsius,
CASE WHEN temperatura_estimada_celsius BETWEEN  18 AND 22
AND altitude_media >= 450 THEN 'APTIDÃO: CAFÉ ARÁBICA'
WHEN temperatura_estimada_celsius > 22 AND altitude_media < 450 THEN 'APTIDÃO: CAFÉ CONILON'
ELSE 'OUTRAS CULTURAS / TRANSIÇÃO'
END AS "CLASSIFICAÇÃO DE APTIDÃO"
FROM v_estimativa_climatica_es
ORDER BY "CLASSIFICAÇÃO DE APTIDÃO";

--2. Cálculo de ERRO ABSOLUTO (EA) referente às estaçõesde base-
SELECT "NM_MUN", altitude_media, temperatura_base, temperatura_estimada_celsius,
ROUND(ABS(temperatura_base - temperatura_estimada_celsius)::numeric, 2) AS erro_absoluto
FROM v_estimativa_climatica_es
WHERE "NM_MUN" IN ('Vitória', 'Boa Esperança', 'São Mateus', 'Muniz Freire');

--3.Simulação que consulta os municípios que ficarão--
--com a temperatura média abaixo dos 20°C caso a temperatura média da Terra aumente ~=2°C--
WITH simulacao AS (
	SELECT "NM_MUN", altitude_media, temperatura_estimada_celsius,
	ROUND((temperatura_estimada_celsius + 2)::numeric, 2) AS temperatura_futura
	FROM v_estimativa_climatica_es)
SELECT *,
CASE WHEN temperatura_futura < 20 THEN 'ABAIXO DOS 20°C'
END "CLASSIFICAÇÃO DE TEMPERATURA"
FROM simulacao
WHERE temperatura_futura < 20
ORDER BY "NM_MUN";

--4.Diferença de amplitude térmica de cada microrregião--
SELECT m."NM_RGI" AS regiao, COUNT(m.id) AS total_municipios, 
ROUND(AVG(v.temperatura_estimada_celsius)::numeric, 2) AS temperatura_media,
MIN(v.temperatura_estimada_celsius) AS temperatura_min_regiao,
MAX(v.temperatura_estimada_celsius) AS temperatura_max_regiao,
ROUND(MAX(temperatura_estimada_celsius) - MIN(temperatura_estimada_celsius)::numeric, 2) AS
amplitude_regional
FROM municipios_es m
JOIN v_estimativa_climatica_es v ON m.id = v.id
GROUP BY m."NM_RGI"
ORDER BY amplitude_regional DESC;

--5.Cidades com temperaturas médias acima dos 23°C terão uma demanda projetada--
--por ar-condicionado maior, o que exige infraestrutra elétrica mais robusta--
SELECT "NM_MUN", temperatura_estimada_celsius AS temperatura_media
FROM v_estimativa_climatica_es
WHERE temperatura_estimada_celsius >= 23
ORDER BY "NM_MUN";


select "NM_RGI" as regiao, avg(alt_mean), count(id)
from municipios_es
group by regiao
order by avg(alt_mean)

select * from v_estimativa_climatica_es
order by chuva_estimada_mm


