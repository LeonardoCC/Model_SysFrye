-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_cabeza_monedas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_cabeza_monedas` (
  `PK_CAM_COD_MONEDA` INT(11) NOT NULL,
  `CAM_DESCRIPCION` VARCHAR(50) NOT NULL,
  `CAM_SIGLA` VARCHAR(3) NOT NULL,
  `CAM_OPERADOR` VARCHAR(1) NOT NULL,
  `CAM_MANEJO_IVA` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`PK_CAM_COD_MONEDA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_detalle_moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_detalle_moneda` (
  `PF_CAM_DEM_COD_MONEDA` INT(11) NOT NULL,
  `PK_DEM_FECHA` DATE NOT NULL,
  `DEM_VALOR` FLOAT NOT NULL,
  PRIMARY KEY (`PF_CAM_DEM_COD_MONEDA`, `PK_DEM_FECHA`),
  CONSTRAINT `FK_CABEZA_DETALLE_MONEDAS`
    FOREIGN KEY (`PF_CAM_DEM_COD_MONEDA`)
    REFERENCES `sysfrye_global`.`glb_cabeza_monedas` (`PK_CAM_COD_MONEDA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_empresas` (
  `PK_EMP_CODEMPRESA` INT(11) NOT NULL,
  `EMP_NOMEMPRESA` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_EMP_CODEMPRESA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_multitabla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_multitabla` (
  `PK_MUL_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `MUL_CODTABLA` VARCHAR(10) NULL DEFAULT NULL,
  `MUL_CONSECUTIVO` INT(11) NULL DEFAULT NULL,
  `MUL_DESCRIPCION` VARCHAR(50) NULL DEFAULT NULL,
  `MUL_SWITCH` VARCHAR(1) NULL DEFAULT NULL,
  `MUL_SUBCONSULTA` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MUL_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_perfiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_perfiles` (
  `PK_PER_CODPERFIL` INT(11) NOT NULL,
  `PER_NOMPERFIL` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_PER_CODPERFIL`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_ubicacion` (
  `PK_UBI_COD_UBICACION` INT(11) NOT NULL AUTO_INCREMENT,
  `UBI_COD_PAIS` VARCHAR(3) NULL DEFAULT NULL,
  `UBI_COD_DEPARTAMENTO` VARCHAR(3) NULL DEFAULT NULL,
  `UBI_COD_CIUDAD` VARCHAR(3) NULL DEFAULT NULL,
  `UBI_NOM_PAIS` VARCHAR(50) NULL DEFAULT NULL,
  `UBI_NOM_DEPARTAMENTO` VARCHAR(50) NULL DEFAULT NULL,
  `UBI_NOM_CIUDAD` VARCHAR(50) NULL DEFAULT NULL,
  `UBI_INDICATIVO` VARCHAR(5) NULL DEFAULT NULL,
  `UBI_ABREVIATURA` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_UBI_COD_UBICACION`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sysfrye_global`.`glb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sysfrye_global`.`glb_usuarios` (
  `PK_USU_CODUSUARIO` VARCHAR(15) NOT NULL,
  `USU_NOMUSUARIO` VARCHAR(60) NOT NULL,
  `FK_PER_USU_CODPERFIL` INT(11) NOT NULL,
  `FK_EMP_USU_CODEMPRESA` INT(11) NOT NULL,
  `FK_ARE_USU_CODAREA` VARCHAR(10) NOT NULL,
  `FK_MUL_USU_TIPO_NUMERACION` VARCHAR(3) NOT NULL,
  `USU_PERIODO` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`PK_USU_CODUSUARIO`),
  INDEX `fk_GLB_USUARIOS_GLB_PERFILES_idx` (`FK_PER_USU_CODPERFIL` ASC),
  INDEX `fk_GLB_USUARIOS_GLB_EMPRESAS1_idx` (`FK_EMP_USU_CODEMPRESA` ASC),
  CONSTRAINT `fk_GLB_USUARIOS_GLB_EMPRESAS1`
    FOREIGN KEY (`FK_EMP_USU_CODEMPRESA`)
    REFERENCES `sysfrye_global`.`glb_empresas` (`PK_EMP_CODEMPRESA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GLB_USUARIOS_GLB_PERFILES`
    FOREIGN KEY (`FK_PER_USU_CODPERFIL`)
    REFERENCES `sysfrye_global`.`glb_perfiles` (`PK_PER_CODPERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;