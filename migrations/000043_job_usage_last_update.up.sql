BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY jobs 
    ADD IF NOT EXISTS usage_last_update timestamp without time zone;

COMMIT;
