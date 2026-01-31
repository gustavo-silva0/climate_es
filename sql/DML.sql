--Inserção dos valores da estação de referência--
INSERT INTO estacao_referencia (id_estacao_ref, nome_estacao, altitude_ref,
temp_ref, data_ref, fonte_ref)
VALUES (1, 'Vitória', 36.2, 24.9, '20-08-2024', 'INMET');

UPDATE municipios_es SET id_estacao_ref = 1;

--Inserindo pontos e dado de precipitação para a estação de Vitória--
UPDATE estacao_referencia SET
precipitacao_ref = 1384.4,
geom = ST_SetSRID(ST_MakePoint(-40.31, -20.31), 4674)
WHERE nome_estacao = 'Vitória';

--Inserindo novas estações e seus respectivos dados--
INSERT INTO estacao_referencia (id_estacao_ref, nome_estacao, altitude_ref, temp_ref, precipitacao_ref, geom)
VALUES (2, 'Boa Esperança', 100, 24.0, 1341, ST_SetSRID(ST_MakePoint(-40.29, -18.54), 4674)),
	   (3, 'São Mateus', 25, NULL, 1341, ST_SetSRID(ST_MakePoint(-39.85, -18.71), 4674)),
	   (4, 'Muniz Freire', 530, NULL, 1380.9, ST_SetSRID(ST_MakePoint(-41.41, -20.46), 4674));

--Atualizando dados na tabela "estacao_referencia"
UPDATE estacao_referencia SET 
data_ref = '24-07-2021',
fonte_ref = 'INMET'
WHERE nome_estacao = 'São Mateus';

UPDATE estacao_referencia SET 
data_ref = '28-04-2024',
fonte_ref = 'INMET'
WHERE nome_estacao = 'Muniz Freire';

UPDATE estacao_referencia SET 
data_ref = '29-09-2023',
fonte_ref = 'INMET'
WHERE nome_estacao = 'Boa Esperança';

UPDATE municipios_es m
SET id_estacao_ref = (
    SELECT e.id_estacao_ref
    FROM estacao_referencia e
    ORDER BY m.geom <-> e.geom
    LIMIT 1
);

--Adicionando dados de temperatura de São Mateus e Muniz Freire utilizando média aritmética--
--das temperaturas máximas e mínimas anuais da Normal Climática - INMET
UPDATE estacao_referencia SET
temp_ref = 25.4
WHERE nome_estacao = 'São Mateus';

UPDATE estacao_referencia SET
temp_ref = 22.6
WHERE nome_estacao = 'Muniz Freire';
