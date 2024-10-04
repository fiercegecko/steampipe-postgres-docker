DROP EXTENSION IF EXISTS steampipe_postgres_aws CASCADE;
CREATE EXTENSION IF NOT EXISTS steampipe_postgres_aws;

CREATE EXTENSION IF NOT EXISTS ltree;

DROP SERVER IF EXISTS steampipe_aws;
CREATE SERVER steampipe_aws FOREIGN DATA WRAPPER steampipe_postgres_aws 
OPTIONS (
    config 'access_key="foo"
            secret_key="bar"
            regions=["us-east-1"]'
);

DROP SCHEMA IF EXISTS aws CASCADE;
CREATE SCHEMA aws;
COMMENT ON SCHEMA aws IS 'steampipe aws fdw';

IMPORT FOREIGN SCHEMA aws FROM SERVER steampipe_aws INTO aws;
