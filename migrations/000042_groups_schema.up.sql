BEGIN;

CREATE SCHEMA IF NOT EXISTS groups;

CREATE TABLE IF NOT EXISTS folders (
       id uuid NOT NULL DEFAULT uuid_generate_v1(),
       parent_id uuid REFERENCES folders(id) ON DELETE CASCADE,
       full_name text UNIQUE NOT NULL,
       name text,

       PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS groups (
       id uuid NOT NULL DEFAULT uuid_generate_v1(),
       folder_id uuid REFERENCES folders(id) ON DELETE CASCADE,
       name text,

       PRIMARY KEY (id),
       UNIQUE(folder_id, name)
);

CREATE TABLE IF NOT EXISTS subject_types (
       id uuid NOT NULL DEFAULT uuid_generate_v1(),
       name character varying(32) UNIQUE NOT NULL,

       PRIMARY KEY (id)
)

INSERT INTO subject_types (id, name) VALUES
    ( 'cc90c7d8-355e-4691-8233-58d0cc366814', 'person' ),
    ( 'cc11c4d7-d487-48c5-b817-a278813b9541', 'group' )
    ON CONFLICT (id) DO NOTHING;

CREATE TABLE IF NOT EXISTS members (
       id uuid NOT NULL DEFAULT uuid_generate_v1(),
       subject_id text NOT NULL,
)

COMMIT;
