-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_municipios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_municipios
-- -----------------------------------------------------
-- Esquema de la base de datos
CREATE SCHEMA IF NOT EXISTS `db_municipios` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db_municipios`;

-- Tabla region
CREATE TABLE IF NOT EXISTS `db_municipios`.`region` (
  `idregion` INT NOT NULL AUTO_INCREMENT,
  `nombre_region` VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (`idregion`)
) ENGINE = InnoDB;

-- Tabla departamento
CREATE TABLE IF NOT EXISTS `db_municipios`.`departamento` (
  `codigo_dane_departamento` INT NOT NULL AUTO_INCREMENT,
  `nombre_departamento` VARCHAR(45) NOT NULL,
  `region_idregion` INT NOT NULL,
  PRIMARY KEY (`codigo_dane_departamento`),
  INDEX `fk_departamento_region1_idx` (`region_idregion` ASC),
  CONSTRAINT `fk_departamento_region1`
    FOREIGN KEY (`region_idregion`)
    REFERENCES `db_municipios`.`region` (`idregion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Tabla municipio
CREATE TABLE IF NOT EXISTS `db_municipios`.`municipio` (
  `codigo_dane_municipio` FLOAT NOT NULL AUTO_INCREMENT,
  `nombre_municipio` VARCHAR(45) NOT NULL,
  `departamento_codigo_dane_departamento` INT NOT NULL,
  PRIMARY KEY (`codigo_dane_municipio`),
  INDEX `fk_municipio_departamento_idx` (`departamento_codigo_dane_departamento` ASC),
  CONSTRAINT `fk_municipio_departamento`
    FOREIGN KEY (`departamento_codigo_dane_departamento`)
    REFERENCES `db_municipios`.`departamento` (`codigo_dane_departamento`)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
) ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
