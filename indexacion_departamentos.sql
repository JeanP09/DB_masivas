LOAD DATA INFILE 'C:/Users/user/Documents/DB_masivas/datos_municipios.csv'
REPLACE INTO TABLE departamento
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@var1, @var2, @var3, @dummy1, @dummy2)
SET
    codigo_dane_departamento = TRIM(@var2),
    nombre_departamento = TRIM(@var3),
    region_idregion = (SELECT idregion FROM region WHERE TRIM(nombre_region) = TRIM(@var1) LIMIT 1);
