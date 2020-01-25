Sistemas_DB_Test:
===========================
(Author JRGene)

Summary:
--------

Design and deployment of an operational DB of a system integration-
maintenance company.

Content:
--------
- Schema of the Data Base
- Data to test the schema.
- Users privileges sentences.
- DB testing queries of the DB.

Index of the tables:
-------------------- 

A- Little Ring
a.1- cliente
a.2- cto_instalacion
a.3- presupuesto
     a.3.1- albaran (Not used)


B- Big Ring (Not developed)
b.1- PMTO or "Partes_de_mantenimiento"
b.2- PMTO_R_TECNICO (Intermediate Table)
b.3- TECNICO
b.4- TECNICO_R_PTRABAJO (Intermediate Table)
b.5- PTRABAJO
b.6- INCIDENCIA


Installation
-------------

Required modules include:
- MySQL/MariaDB

package-SW used:
- XAMP at the server side, using phpMyAdmin as administration tool 
- HeidiSQL at the side of the client.

Next steps:
----------
- Development and testing of the Big Ring.
- Development of views, functions and procedures in order to
  facilitate the use of the DB.
- Exploit the DB adquiring statics related with finance an operation.
- Run scenario analysis using the data adquire in order to match 
  human tecnnical resources with incidences based on maintenance.
