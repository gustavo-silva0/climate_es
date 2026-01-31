--Estimativa de altitude usando a altitude média p/ município--

--Criação de VIEW para abstração--
CREATE OR REPLACE VIEW v_estimativa_climatica_es AS
SELECT m.id,
m.geom,
m."NM_MUN",
ROUND((m.alt_mean)::numeric, 2) AS altitude_media,
e.nome_estacao AS estacao_ref,
COALESCE(e.temp_ref, 24.9)::numeric(5,2) AS temperatura_base,
COALESCE(e.altitude_ref, 36.2)::numeric(10,2) AS altitude_base,

ROUND(
	(COALESCE(e.temp_ref, 24.9) - (((m.alt_mean - COALESCE(e.altitude_ref, 36.2)) / 100) * 0.65))
	::numeric, 2) AS temperatura_estimada_celsius,
ROUND((m.precipitacao_mean)::numeric, 0) AS chuva_estimada_mm

FROM municipios_es m
JOIN estacao_referencia e ON m.id_estacao_ref = e.id_estacao_ref
ORDER BY temperatura_estimada_celsius ASC;

select * from v_estimativa_climatica_es
order by temperatura_estimada_celsius DESC;
