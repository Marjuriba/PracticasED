-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDD_practicas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BDD_practicas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDD_practicas` ;
USE `BDD_practicas` ;

-- -----------------------------------------------------
-- Table `BDD_practicas`.`Ubicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`Ubicacion` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`Ubicacion` (
  `id_ubicacion` INT NOT NULL AUTO_INCREMENT,
  `edificio` VARCHAR(50) NOT NULL,
  `aula` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`id_ubicacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NULL,
  `rol` ENUM('Docente', 'Administrativo', 'Conserje', 'Directivo', 'Otro') NOT NULL,
  `departamento` VARCHAR(50) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`Proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `telefono` INT(9) NULL,
  `email` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(100) NULL,
  `fecha_alta` DATE NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`Articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`Articulo` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`Articulo` (
  `id_articulo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  `tipo` ENUM('Equipo Informatico', 'Mobiliario', 'Material Escolar') NOT NULL,
  `cantidad` INT(4) NOT NULL,
  `estado` ENUM('Nuevo', 'Usado', 'Dañado', 'En reparacion') NOT NULL,
  `costo_unitario` DECIMAL(7,2) NULL,
  `id_ubicacion` INT NOT NULL,
  `id_usuario_registro` INT NOT NULL,
  `fecha_registro` DATE NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_articulo`),
  INDEX `fk_ArtUbicacion_idx` (`id_ubicacion` ASC) VISIBLE,
  INDEX `fk_ArtUsuario_idx` (`id_usuario_registro` ASC) VISIBLE,
  INDEX `fk_ArtProveedor_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_ArtUbicacion`
    FOREIGN KEY (`id_ubicacion`)
    REFERENCES `BDD_practicas`.`Ubicacion` (`id_ubicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ArtUsuario`
    FOREIGN KEY (`id_usuario_registro`)
    REFERENCES `BDD_practicas`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ArtProveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `BDD_practicas`.`Proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`EquiposInformaticos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`EquiposInformaticos` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`EquiposInformaticos` (
  `id_articulo` INT NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `modelo` VARCHAR(50) NULL,
  `sistema_operativo` VARCHAR(50) NOT NULL,
  `subtipo` ENUM('PC', 'Portatil', 'Impresora', 'Proyector', 'Periferico', 'Otro') NOT NULL,
  `especificaciones` VARCHAR(200) NULL,
  PRIMARY KEY (`id_articulo`),
  CONSTRAINT `fk_InfArticulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `BDD_practicas`.`Articulo` (`id_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`Mobiliario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`Mobiliario` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`Mobiliario` (
  `id_articulo` INT NOT NULL,
  `material` VARCHAR(100) NOT NULL,
  `dimensiones` VARCHAR(100) NULL,
  `color` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  CONSTRAINT `fk_MobArticulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `BDD_practicas`.`Articulo` (`id_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`MaterialEscolar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`MaterialEscolar` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`MaterialEscolar` (
  `id_articulo` INT NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  CONSTRAINT `fk_EscArticulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `BDD_practicas`.`Articulo` (`id_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDD_practicas`.`Movimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDD_practicas`.`Movimiento` ;

CREATE TABLE IF NOT EXISTS `BDD_practicas`.`Movimiento` (
  `id_movimiento` INT NOT NULL AUTO_INCREMENT,
  `id_articulo` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `tipo` ENUM('Traslado', 'Reparacion', 'Baja') NOT NULL,
  `id_ubicacion_origen` INT NOT NULL,
  `id_ubicacion_destino` INT NULL,
  `id_proveedor_destino` INT NULL,
  `id_usuario_responsable` INT NOT NULL,
  `cantidad` INT(4) NOT NULL,
  `motivo` VARCHAR(200) NULL,
  PRIMARY KEY (`id_movimiento`),
  INDEX `fk_MovArticulo_idx` (`id_articulo` ASC) VISIBLE,
  INDEX `fk_MovOrigen_idx` (`id_ubicacion_origen` ASC) VISIBLE,
  INDEX `fk_MovUsuario_idx` (`id_usuario_responsable` ASC) VISIBLE,
  INDEX `fk_MovProveedor_idx` (`id_proveedor_destino` ASC) VISIBLE,
  CONSTRAINT `fk_MovArticulo`
    FOREIGN KEY (`id_articulo`)
    REFERENCES `BDD_practicas`.`Articulo` (`id_articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovOrigen`
    FOREIGN KEY (`id_ubicacion_origen`)
    REFERENCES `BDD_practicas`.`Ubicacion` (`id_ubicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovProveedor`
    FOREIGN KEY (`id_proveedor_destino`)
    REFERENCES `BDD_practicas`.`Proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovUsuario`
    FOREIGN KEY (`id_usuario_responsable`)
    REFERENCES `BDD_practicas`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovDestino`
    FOREIGN KEY (`id_ubicacion_destino`)
    REFERENCES `BDD_practicas`.`Ubicacion` (`id_ubicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
