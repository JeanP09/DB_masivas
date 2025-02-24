LOAD DATA INFILE 'C:/Users/user/Documents/DB_masivas/datos_municipios.csv'
REPLACE INTO TABLE region
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@nombre_region) SET nombre_region = TRIM(@nombre_region);