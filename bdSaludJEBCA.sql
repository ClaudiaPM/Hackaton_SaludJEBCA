CREATE DATABASE bdSaludJEBCA;


-- MySQL Script generated by MySQL Workbench
-- Fri Jun  2 04:32:30 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paises` (
  `idpais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamentos` (
  `iddepartamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NULL,
  PRIMARY KEY (`iddepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comunidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comunidades` (
  `idcomunidades` INT NOT NULL AUTO_INCREMENT,
  `nombre_comunidad` VARCHAR(55) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `cantidad_personas` INT NOT NULL,
  `cantidad_establecimientos` INT NOT NULL,
  `cantidad_personal` INT NOT NULL,
  `idpais` INT NULL,
  `iddepartamento` INT NULL,
  PRIMARY KEY (`idcomunidades`),
  INDEX `idpais_idx` (`idpais` ASC),
  INDEX `idepartamento _idx` (`iddepartamento` ASC),
  CONSTRAINT `idpais`
    FOREIGN KEY (`idpais`)
    REFERENCES `mydb`.`Paises` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idepartamento `
    FOREIGN KEY (`iddepartamento`)
    REFERENCES `mydb`.`Departamentos` (`iddepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Establecimientos_Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Establecimientos_Medicos` (
  `idestablecimiento_medico` INT NOT NULL AUTO_INCREMENT,
  `nombre_establecimiento` VARCHAR(75) NOT NULL,
  `direccion` VARCHAR(75) NOT NULL,
  `horario` DATE NOT NULL,
  `cantidad_personal` INT NOT NULL,
  `cantidad_usuarios` INT NOT NULL,
  PRIMARY KEY (`idestablecimiento_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comunidad_Establecimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comunidad_Establecimientos` (
  `idcomunidad_establecimiento` INT NOT NULL AUTO_INCREMENT,
  `idcomunidad` INT NOT NULL,
  `idestablecimiento` INT NOT NULL,
  PRIMARY KEY (`idcomunidad_establecimiento`),
  INDEX `idcomunidad _idx` (`idcomunidad` ASC),
  INDEX `idestablecimiento _idx` (`idestablecimiento` ASC),
  CONSTRAINT `idcomunidad `
    FOREIGN KEY (`idcomunidad`)
    REFERENCES `mydb`.`Comunidades` (`idcomunidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idestablecimiento `
    FOREIGN KEY (`idestablecimiento`)
    REFERENCES `mydb`.`Establecimientos_Medicos` (`idestablecimiento_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipos_Sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipos_Sangre` (
  `idtipo_sangre` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(11) NULL,
  PRIMARY KEY (`idtipo_sangre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parentescos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parentescos` (
  `idparentesco` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idparentesco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Examenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Examenes` (
  `idexamen` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idexamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sintomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sintomas` (
  `idSintomas` INT NOT NULL AUTO_INCREMENT,
  `NivelSintomas` VARCHAR(45) NOT NULL,
  `NombreSintomas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSintomas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enfermedades` (
  `idenfermedad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `detalle` VARCHAR(78) NOT NULL,
  `fecha_enfermedad` DATE NOT NULL,
  `idsintomas` INT NOT NULL,
  `fechai_sintomas` DATE NOT NULL,
  PRIMARY KEY (`idenfermedad`),
  INDEX `idsintomas_idx` (`idsintomas` ASC),
  CONSTRAINT `idsintomas`
    FOREIGN KEY (`idsintomas`)
    REFERENCES `mydb`.`Sintomas` (`idSintomas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cirugias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cirugias` (
  `idcirugia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(55) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idcirugia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamentos` (
  `idmedicamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historial_Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Historial_Usuarios` (
  `idhistorial_usuario` INT NOT NULL AUTO_INCREMENT,
  `detalle` VARCHAR(75) NOT NULL,
  `idmedicamentos` INT NOT NULL,
  `fechai_medicamento` DATE NOT NULL,
  `idexamen` INT NOT NULL,
  `fechai_examen` DATE NOT NULL,
  `idenfermedad` INT NOT NULL,
  `fechai_enfermedad` DATE NOT NULL,
  `idcirugia` INT NOT NULL,
  `fechai_cirugia` DATE NOT NULL,
  PRIMARY KEY (`idhistorial_usuario`),
  INDEX `idexamen_idx` (`idexamen` ASC),
  INDEX `idenfermedad_idx` (`idenfermedad` ASC),
  INDEX `idcirugia_idx` (`idcirugia` ASC),
  INDEX `idmedicamentos_idx` (`idmedicamentos` ASC),
  CONSTRAINT `idexamen`
    FOREIGN KEY (`idexamen`)
    REFERENCES `mydb`.`Examenes` (`idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idenfermedad`
    FOREIGN KEY (`idenfermedad`)
    REFERENCES `mydb`.`Enfermedades` (`idenfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcirugia`
    FOREIGN KEY (`idcirugia`)
    REFERENCES `mydb`.`Cirugias` (`idcirugia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmedicamentos`
    FOREIGN KEY (`idmedicamentos`)
    REFERENCES `mydb`.`Medicamentos` (`idmedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles_Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles_Usuarios` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NOT NULL,
  `apellido` VARCHAR(75) NOT NULL,
  `usuario` VARCHAR(20) NOT NULL,
  `clave` VARCHAR(15) NOT NULL,
  `edad` INT NOT NULL,
  `genero` VARCHAR(1) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `idtipo_sangre` INT NOT NULL,
  `idparentesco` INT NOT NULL,
  `idcomunidad` INT NOT NULL,
  `idhistorial_usuario` INT NOT NULL,
  `idrol_usuario` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `idtipo_sangre_idx` (`idtipo_sangre` ASC),
  INDEX `idparentesco_idx` (`idparentesco` ASC),
  INDEX `idcomunidad_idx` (`idcomunidad` ASC),
  INDEX `idhistoria_usuario_idx` (`idhistorial_usuario` ASC),
  INDEX `idrol_usuario_idx` (`idrol_usuario` ASC),
  CONSTRAINT `idtipo_sangre`
    FOREIGN KEY (`idtipo_sangre`)
    REFERENCES `mydb`.`Tipos_Sangre` (`idtipo_sangre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idparentesco`
    FOREIGN KEY (`idparentesco`)
    REFERENCES `mydb`.`Parentescos` (`idparentesco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcomunidad`
    FOREIGN KEY (`idcomunidad`)
    REFERENCES `mydb`.`Comunidades` (`idcomunidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idhistoria_usuario`
    FOREIGN KEY (`idhistorial_usuario`)
    REFERENCES `mydb`.`Historial_Usuarios` (`idhistorial_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idrol_usuario`
    FOREIGN KEY (`idrol_usuario`)
    REFERENCES `mydb`.`Roles_Usuarios` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Especialidades` (
  `idespecialidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespecialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles_Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles_Personal` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personal` (
  `idpersonal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(55) NOT NULL,
  `apellido` VARCHAR(55) NOT NULL,
  `genero` VARCHAR(1) NOT NULL,
  `idestablecimiento` INT NOT NULL,
  `idespecialidad` INT NOT NULL,
  `idrol` INT NOT NULL,
  PRIMARY KEY (`idpersonal`),
  INDEX `idestablecimiento _idx` (`idestablecimiento` ASC),
  INDEX `idespecialidad_idx` (`idespecialidad` ASC),
  INDEX `idrol_idx` (`idrol` ASC),
  CONSTRAINT `idestablecimiento `
    FOREIGN KEY (`idestablecimiento`)
    REFERENCES `mydb`.`Establecimientos_Medicos` (`idestablecimiento_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idespecialidad`
    FOREIGN KEY (`idespecialidad`)
    REFERENCES `mydb`.`Especialidades` (`idespecialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idrol`
    FOREIGN KEY (`idrol`)
    REFERENCES `mydb`.`Roles_Personal` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historiales_Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Historiales_Medicos` (
  `idhistorial_medico` INT NOT NULL AUTO_INCREMENT,
  `detalles` VARCHAR(45) NOT NULL,
  `idpersonal` INT NOT NULL,
  `detalles` VARCHAR(45) NOT NULL,
  `fechac_historial` DATE NOT NULL,
  `idsintomas` INT NOT NULL,
  `fechaci_examen` DATE NULL,
  `idcirugia` INT NULL,
  `fechaci_cirugia` DATE NULL,
  `idmedicamentos` INT NULL,
  `fechaci_medicamento` DATE NULL,
  `idexamen` INT NULL,
  `fechaci_examen` DATE NULL,
  PRIMARY KEY (`idhistorial_medico`),
  INDEX `idpersonal_idx` (`idpersonal` ASC),
  INDEX `idcirugia_idx` (`idcirugia` ASC),
  INDEX `idmedicamentos_idx` (`idmedicamentos` ASC),
  INDEX `idsintomas_idx` (`idsintomas` ASC),
  INDEX `idexamen_idx` (`idexamen` ASC),
  CONSTRAINT `idpersonal`
    FOREIGN KEY (`idpersonal`)
    REFERENCES `mydb`.`Personal` (`idpersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcirugia`
    FOREIGN KEY (`idcirugia`)
    REFERENCES `mydb`.`Cirugias` (`idcirugia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmedicamentos`
    FOREIGN KEY (`idmedicamentos`)
    REFERENCES `mydb`.`Medicamentos` (`idmedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idsintomas`
    FOREIGN KEY (`idsintomas`)
    REFERENCES `mydb`.`Sintomas` (`idSintomas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idexamen`
    FOREIGN KEY (`idexamen`)
    REFERENCES `mydb`.`Examenes` (`idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inventario` (
  `idinventraio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NOT NULL,
  `stock` INT NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  `idestablecimiento_medico` INT NOT NULL,
  PRIMARY KEY (`idinventraio`),
  CONSTRAINT `idestablecimiento_medico`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Establecimientos_Medicos` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
