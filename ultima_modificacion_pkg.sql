
SELECT O.OWNER,
       O.OBJECT_NAME,
       O.OBJECT_ID,
       O.OBJECT_TYPE,
       O.CREATED,
       O.LAST_DDL_TIME,
       O.TIMESTAMP,
       O.STATUS,
       O.TEMPORARY,
       O.GENERATED,
       O.SECONDARY,
       O.NAMESPACE,
       O.EDITIONABLE
  FROM DBA_OBJECTS O
WHERE O.OWNER = 'RECAUDACION'
   AND O.OBJECT_NAME = 'PCK_CARGA_PREVIRED';
