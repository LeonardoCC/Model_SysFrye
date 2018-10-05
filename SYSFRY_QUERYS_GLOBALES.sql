/*
*************************************************************************************************************
*/

ALTER TABLE `sysfrye_inve`.`INV_CABEZA_PEDIDOS` 
ADD CONSTRAINT `FK_EMPRESAS_CABEZAPEDIDO`
FOREIGN KEY (`PF_EMP_CAP_EMPRESA`)
REFERENCES `sysfrye_global`.`GLB_EMPRESAS` (`PK_EMP_CODEMPRESA`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*
*************************************************************************************************************
*/

ALTER TABLE `sysfrye_inve`.`inv_actividad_economica` 
ADD CONSTRAINT `FK_CENTROSCOS_ACT_ECON`
FOREIGN KEY  (`PF_EMP_ACE_EMPRESA`, `FK_CEN_ACE_CENTRO_COSTO`, `FK_CEN_ACE_SUB_CENTRO_COSTO`) 
REFERENCES `sysfrye_conta`.`con_centros_costos` (`PF_EMP_CEN_EMPRESA`, `PK_CEN_CENTRO_COSTO`, `PK_CEN_SUB_CENTRO_COSTO`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

/*
*************************************************************************************************************
*/

ALTER TABLE `sysfrye_inve`.`INV_TIPOS_MOVIMIENTOS` 
ADD CONSTRAINT `FK_MULTI_TIPODOC`
FOREIGN KEY (`PF_MUL_TIM_TIPO_NUMERACION`)
REFERENCES `sysfrye_global`.`GLB_MULTITABLA` (`PK_MUL_ID`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*
*************************************************************************************************************
*/

ALTER TABLE `sysfrye_inve`.`INV_CABEZA_PEDIDOS` 
ADD CONSTRAINT `FK_TIPODOC_CABEZAPEDIDOS`
FOREIGN KEY (`PF_EMP_CAP_EMPRESA`,`PK_TID_TIPO_NUMERACION`,`PF_TID_CAP_NRO_DCTO`)
REFERENCES `sysfrye_inve`.`INV_TIPOS_MOVIMIENTOS` (`PF_EMP_TIM_EMPRESA`,`PF_MUL_TIM_TIPO_NUMERACION`,`PK_TIM_TIPO_DOCUMENTO`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*
*************************************************************************************************************
*/









