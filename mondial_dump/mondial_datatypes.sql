BEGIN;
-- DROP TYPE geocoord;

CREATE TYPE geocoord AS (
	latitude numeric(10,7),
	longitude numeric(10,7));

COMMIT;
