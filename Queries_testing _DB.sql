-- Queries to test the Sistemas_DB_Test
-- We are going to make and test 3 queries, testing each of the three connections that the Sistemas_DB_Test has.

-- QUERY_1 ------------------------------------------------------------------------------------------------------------------------------
-- Testing the connection between the tables "cliente" y "presupuesto"
-- Motivation: " Which is the instalation with highest relative margin"

-- Preparing the DB, without consolidation

UPDATE presupuesto
SET presupuesto.cobrado = FALSE
WHERE presupuesto.id = 4;

-- running  inner QUERY_1

SELECT cliente.nombre_completo_responsable, presupuesto.estimacion_beneficio_neto_empresa
FROM cliente, presupuesto
WHERE presupuesto.cliente_id = cliente.id
AND presupuesto.cobrado = TRUE
ORDER BY presupuesto.estimacion_beneficio_neto_empresa DESC;

-- Preparing the DB, with consolidation

UPDATE presupuesto
SET presupuesto.cobrado = TRUE
WHERE presupuesto.id = 4;

-- running inner QUERY_1 again

SELECT cliente.nombre_completo_responsable, presupuesto.estimacion_beneficio_neto_empresa
FROM cliente, presupuesto
WHERE presupuesto.cliente_id = cliente.id
AND presupuesto.cobrado = TRUE
ORDER BY presupuesto.estimacion_beneficio_neto_empresa DESC;


-- Finally running QUERY_1 again

SELECT tempo.nombre_completo_responsable, SUM(tempo.estimacion_beneficio_neto_empresa) AS consolidacion_de_beneficios_estimados
FROM (SELECT cliente.nombre_completo_responsable, presupuesto.estimacion_beneficio_neto_empresa
		FROM cliente, presupuesto
		WHERE presupuesto.cliente_id = cliente.id
		AND presupuesto.cobrado = TRUE
		ORDER BY presupuesto.estimacion_beneficio_neto_empresa DESC) AS tempo
GROUP BY nombre_completo_responsable;


-- QUERY_2 ---------------------------------------------------------------------------------------------------------------------------------
-- Testing the connection between the tables "cto_instalacion" y "presupuesto"
-- Motivation: "Which is the client from which we have earned most"

SELECT * FROM 
	(SELECT cto_instalacion.direccion, presupuesto.estimacion_beneficio_neto_empresa / presupuesto.montante_sin_IVA AS margen_relativo
	FROM cto_instalacion, presupuesto
	WHERE cto_instalacion.id = presupuesto.cto_id) AS tempo
ORDER BY tempo.margen_relativo DESC;


-- QUERY_3 ---------------------------------------------------------------------------------------------------------------------------------
-- Testing the connection between the tables "cto_instalacion" y "cliente"
-- Motivation: "Return all the instalations of the client who has the highest number of installations (name of the client an installations"

SELECT tempo3.nombre_completo_empresa AS Cliente_con_Mas_instalaciones, cto_instalacion.direccion AS Nombre_Instalacion
FROM	(SELECT * FROM (SELECT tempo.nombre_completo_empresa, COUNT(*) AS numero_de_instalaciones
							FROM (SELECT cliente.nombre_completo_empresa, cto_instalacion.direccion
									FROM cliente, cto_instalacion
									WHERE cliente.id = cto_instalacion.cliente_id) AS tempo
							GROUP BY tempo.nombre_completo_empresa) AS tempo2
		ORDER BY tempo2.numero_de_instalaciones DESC LIMIT 1) AS tempo3, cto_instalacion, cliente
WHERE tempo3.nombre_completo_empresa = cliente.nombre_completo_empresa AND cliente.id = cto_instalacion.cliente_id;

