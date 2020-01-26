-- Sistemas_DB Sample Database Schema

-- Version 1.0



-- Copyright (c) 2020, Ramon Gene Garrigos. 

-- All rights reserved.



-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:


--  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other 
--    materials provided with the distribution.

--  * Neither the name of Oracle nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written 
--    permission.



-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
-- OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

USE Sistemas_DB_test;

--
-- Lets fulfill with sample data the little ring to test the knowledge learnt, just fulfilling the tables: CLIENTE,
--

-- First fulfilling the table CLIENTE
-- (id, nombre_completo_responsable,DNI,nombre_completo_empresa,CIF,IBAN,nombre_notario,localidad_notario,
-- numero_reg_mercantil,fecha_reg_mercantil,last_update);
INSERT INTO CLIENTE VALUES 
(1,'Marcos Garcia','84848484B','quepasa','B48484848','FACEFACEFACEFACEFACEFACEFACEFACE','Juan Larra','Marte','1111','2002-01-01',NOW()),
(2,'Bili Martinez','55555555V','supersuave','V55555555','WINDWINDWINDWINDWINDWINDWINDWIND','Juan Larra','Marte','2222','1975-01-01',NOW()),
(3,'Larri Sanchez','73737373M','veschica','M37373737','GOGEGOGEGOGEGOGEGOGEGOGEGOGEGOGE','Juan Larra','Marte','3333','1997-01-01',NOW());

SELECT * FROM CLIENTE;

-- Second fulfilling the table CTO_INSTALACION
-- (id,cto_activo,fecha_alta,fecha_baja,direccion,cuota_global_yr_mto_sin_IVA,last_update);
INSERT INTO CTO_INSTALACION VALUES 
(1,1,TRUE,'2020-01-11',NULL,'Avd Europa 1, Marte',40,NOW()),
(2,2,TRUE,'2020-01-14',NULL,'Avd Asia 2, Marte',40,NOW()),
(3,3,TRUE,'2020-01-25',NULL,'Avd America 3, Marte',50,NOW()),
(4,2,TRUE,NULL,NULL,'Avd Africa 4, Marte',45,NOW());

SELECT * FROM CTO_INSTALACION;

-- Third fulfilling the table PRESUPUESTO
-- (id,cto_id,cliente_id,*tecnico_id*,fecha_presupuesto,descripcion,montante_sin_IVA,estimacion_beneficio_neto_empresa,
--  estimacion_total_horas_tecnico,cuota_amortizacion,obra_nueva,aceptado,ejecutado,fecha_ejecutado, cobrado,fecha_cobrado,
--  last_update);
INSERT INTO PRESUPUESTO VALUES 
(1,1,1,'2020-01-5','Vivienda',2300.50,1400,40,FALSE,TRUE,TRUE,TRUE,'2020-01-10',TRUE,'2020-01-11', NOW()),
(2,2,2,'2020-01-8','Vivienda',1800,1000,35,FALSE,TRUE,TRUE,TRUE,'2020-01-12',TRUE,'2020-01-14', NOW()),
(3,3,3,'2020-01-15','Vivienda',3200,2200,50,FALSE,TRUE,TRUE,TRUE,'2020-01-22',TRUE,'2020-01-25', NOW()),
(4,4,2,'2020-01-25','Estudio de Grabacion',1980.25,1300,30,FALSE,TRUE,TRUE,TRUE,'2020-01-28',FALSE,NULL, NOW());

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
