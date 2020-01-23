BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'RECAUDACION.JOB_PREACREDITACION');
END;



--se deja el territorio de chile para que el dia de semana que tome sea correcto.
alter session set nls_territory = 'CHILE'; 
 

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'RECAUDACION.JOB_PREACREDITACION'
      ,start_date      => TO_TIMESTAMP_TZ('2016/01/28 12:40:00.000000 -04:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=MINUTELY;INTERVAL=20'
      ,end_date        => NULL
      ,program_name    => 'RECAUDACION.PRG_PROCESOS'
      ,comments        => 'JOB que inicia la preacreditacion de los documentos, cartolas y depositos'
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'MAX_RUNS');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'STOP_ON_WINDOW_CLOSE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'RECAUDACION.JOB_PREACREDITACION'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'RECAUDACION.JOB_PREACREDITACION');
END; 