-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mounirtestfinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mounirtestfinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mounirtestfinal` DEFAULT CHARACTER SET latin1 ;
USE `mounirtestfinal` ;

-- -----------------------------------------------------
-- Table `mounirtestfinal`.`fos_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mounirtestfinal`.`fos_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(180) CHARACTER SET 'utf8' NOT NULL,
  `username_canonical` VARCHAR(180) CHARACTER SET 'utf8' NOT NULL,
  `email` VARCHAR(180) CHARACTER SET 'utf8' NOT NULL,
  `email_canonical` VARCHAR(180) CHARACTER SET 'utf8' NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `salt` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `confirmation_token` VARCHAR(180) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `password_requested_at` DATETIME NULL DEFAULT NULL,
  `roles` LONGTEXT CHARACTER SET 'utf8' NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UNIQ_957A647992FC23A8` (`username_canonical` ASC),
  UNIQUE INDEX `UNIQ_957A6479A0D96FBF` (`email_canonical` ASC),
  UNIQUE INDEX `UNIQ_957A6479C05FB297` (`confirmation_token` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mounirtestfinal`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mounirtestfinal`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `theTitle` VARCHAR(150) NOT NULL,
  `theText` TEXT NOT NULL,
  `theDate` TIMESTAMP NULL,
  `fos_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_fos_user_idx` (`fos_user_id` ASC),
  CONSTRAINT `fk_article_fos_user`
    FOREIGN KEY (`fos_user_id`)
    REFERENCES `mounirtestfinal`.`fos_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mounirtestfinal`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mounirtestfinal`.`section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `theTitle` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `theTitle_UNIQUE` (`theTitle` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mounirtestfinal`.`section_has_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mounirtestfinal`.`section_has_article` (
  `section_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `article_id`),
  INDEX `fk_section_has_article_article1_idx` (`article_id` ASC),
  INDEX `fk_section_has_article_section1_idx` (`section_id` ASC),
  CONSTRAINT `fk_section_has_article_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `mounirtestfinal`.`section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_article_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mounirtestfinal`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
