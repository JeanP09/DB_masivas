LOAD DATA INFILE 'C:/Users/user/Documents/DB_masivas/datos_municipios.csv'
REPLACE INTO TABLE municipio
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@var1, @var2, @dummy1, @var4, @var5)
SET
    codigo_dane_municipio = TRIM(@var4),  -- Código DANE del municipio
    nombre_municipio = TRIM(@var5),       -- Nombre del municipio
    departamento_codigo_dane_departamento = (
        SELECT codigo_dane_departamento 
        FROM departamento 
        WHERE TRIM(codigo_dane_departamento) = TRIM(@var2) 
        LIMIT 1
    );
