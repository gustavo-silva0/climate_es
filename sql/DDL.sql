--Criação da tabela "estacao_referencia"
CREATE TABLE estacao_referencia (
	id_estacao_ref INT,
	nome_estacao VARCHAR(50) NOT NULL,
	altitude_ref NUMERIC(10,2) CHECK (altitude_ref >=0),
	temp_ref NUMERIC (5,2),
	data_ref DATE,
	fonte_ref VARCHAR(50),
	CONSTRAINT pk_id_estacao_ref PRIMARY KEY (id_estacao_ref)
);

ALTER TABLE municipios_es
ADD CONSTRAINT pk_id_municipios PRIMARY KEY (id);

ALTER TABLE municipios_es
ADD id_estacao_ref INT; 

ALTER TABLE municipios_es
ADD CONSTRAINT fk_estacao_ref_municipios_es
FOREIGN KEY (id_estacao_ref)
REFERENCES estacao_referencia (id_estacao_ref);

--Adicionando precipitação e pontos cartográficos na tabela "estacao_referencia"
ALTER TABLE estacao_referencia
ADD COLUMN precipitacao_ref NUMERIC(10,2),
ADD COLUMN geom geometry (Point, 4674);
