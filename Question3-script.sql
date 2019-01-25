-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `idPatient` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `gender` ENUM('M', 'F') NULL,
  `age` INT(3) NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  `syndrome_description` TEXT(400) NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene mutations` (
  `idMutations` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` VARCHAR(45) NULL,
  `gene_description` TEXT(400) NULL,
  `DNA_supplier_ID` INT NOT NULL,
  PRIMARY KEY (`idMutations`),
  INDEX `fk_Mutations_1_idx` (`DNA_supplier_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Mutations_1`
    FOREIGN KEY (`DNA_supplier_ID`)
    REFERENCES `mydb`.`Patients` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
