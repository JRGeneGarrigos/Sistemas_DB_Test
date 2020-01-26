-- Sistemas_DB Sample Database Schema
-- Version 1.0

-- Copyright (c) 2020, Ramon Gene Garrigos. 
-- All rights reserved.

-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
--  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
--  * Neither the name of Oracle nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS Sistemas_DB_test;
CREATE SCHEMA Sistemas_DB_test;
USE Sistemas_DB_test;

--
-- Table structure for table `CLIENTE`
--

CREATE TABLE CLIENTE (
  id SMALLINT UNSIGNED NOT NULL,
  nombre_completo_responsable VARCHAR(45) NOT NULL,
  DNI VARCHAR(9) NOT NULL,
  nombre_completo_empresa VARCHAR(45) NOT NULL,
  CIF VARCHAR(9) NOT NULL,
  IBAN VARCHAR(24),
  nombre_notario VARCHAR(45),
  localidad_notario VARCHAR(20),
  numero_reg_mercantil VARCHAR(20),
  fecha_reg_mercantil DATE,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `CTO_INSTALACION`
--

CREATE TABLE CTO_INSTALACION (
  id SMALLINT UNSIGNED NOT NULL,
  cliente_id SMALLINT UNSIGNED NOT NULL,
  cto_activo BOOLEAN DEFAULT TRUE,
  fecha_alta DATE DEFAULT NULL,
  fecha_baja DATE DEFAULT NULL,
  direccion VARCHAR(255) NOT NULL,
  cuota_global_yr_mto_sin_IVA DECIMAL(7,2) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  CONSTRAINT fk_CTO_INSTALACION_cliente_id FOREIGN KEY (cliente_id) REFERENCES CLIENTE (id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --
-- -- Table structure for table `ALBARAN`
-- --

-- CREATE TABLE ALBARAN (
  -- id VARCHAR(10) NOT NULL,
  -- nombre_proveedor VACHAR(20) NOT NULL,-- DEMES, CASMAR, SALTOKI, INSTANT-BYTE, etc
  -- montante_sin_IVA DECIMAL(7,2) NOT NULL,
  -- fecha_recepcion YEAR DEFAULT NULL,
  -- descripcion VARCHAR(100) NOT NULL,
  -- last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  -- PRIMARY KEY  (id),
  -- CONSTRAINT fk_ALBARAN_presupues_id FOREIGN KEY (presupuesto_id) REFERENCES CLIENTE (id) ON DELETE RESTRICT ON UPDATE CASCADE,
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `PRESUPUESTO`
--

CREATE TABLE PRESUPUESTO (
  id SMALLINT UNSIGNED NOT NULL,
  cto_id SMALLINT UNSIGNED NOT NULL,
  cliente_id SMALLINT UNSIGNED NOT NULL,
  -- tecnico_id SMALLINT UNSIGNED NOT NULL,
  fecha_presupuesto DATE NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  montante_sin_IVA DECIMAL(7,2) NOT NULL,
  estimacion_beneficio_neto_empresa DECIMAL(7,2) NOT NULL,
  estimacion_total_horas_tecnico SMALLINT UNSIGNED NOT NULL,
  cuota_amortizacion BOOLEAN NOT NULL,
  obra_nueva BOOLEAN NOT NULL,
  aceptado BOOLEAN DEFAULT FALSE,
  ejecutado BOOLEAN DEFAULT FALSE,
  fecha_ejecutado DATE, -- it must be update a posteriori
  cobrado BOOLEAN DEFAULT FALSE,
  fecha_cobrado DATE, -- it must be update a posteriori
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  CONSTRAINT fk_PRESUPUESTO_cto_id FOREIGN KEY (cto_id) REFERENCES CTO_INSTALACION (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_PRESUPUESTO_cliente_id FOREIGN KEY (cliente_id) REFERENCES CLIENTE (id) ON DELETE RESTRICT ON UPDATE CASCADE
  -- CONSTRAINT fk_PRESUPUESTO_tecnico_id FOREIGN KEY (tecnico_id) REFERENCES TECNICO (id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- "ON DELETE RESTRICT ON UPDATE CASCADE" means that if the parent record is deleted, any child records are also deleted. ...


------------------------------------------------------ BIG_RING---------------------------------------------------------------
--
-- Table structure for table `PMTO`
--



--
-- Table structure for table `PMTO_R_TECNICO`
--



--
-- Table structure for table `TECNICO`
--



--
-- Table structure for table `TECNICO_R_PTRABAJO`
--



--
-- Table structure for table `PTRABAJO`
--



--
-- Table structure for table `INCIDENCIA`
--



''--------------------------------------------------------------------------------------------------------------------------------------------

