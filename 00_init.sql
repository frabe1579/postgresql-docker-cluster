CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'replicator_password';
SELECT pg_create_physical_replication_slot('replication_slot');

CREATE USER barman SUPERUSER PASSWORD 'barman';
CREATE USER streaming_barman WITH REPLICATION ENCRYPTED PASSWORD 'stm_barman_pw';
SELECT pg_create_physical_replication_slot('barman');
GRANT EXECUTE ON FUNCTION pg_backup_start(text, boolean) to barman;
GRANT EXECUTE ON FUNCTION pg_backup_stop(boolean) to barman;
-- GRANT EXECUTE ON FUNCTION pg_start_backup(text, boolean, boolean) to barman;
-- GRANT EXECUTE ON FUNCTION pg_stop_backup() to barman;
-- GRANT EXECUTE ON FUNCTION pg_stop_backup(boolean, boolean) to barman;
GRANT EXECUTE ON FUNCTION pg_switch_wal() to barman;
GRANT EXECUTE ON FUNCTION pg_create_restore_point(text) to barman;

GRANT pg_read_all_settings TO barman;
GRANT pg_read_all_stats TO barman;
GRANT pg_checkpoint TO barman;
