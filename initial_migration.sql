CREATE SCHEMA app_public;

CREATE TABLE IF NOT EXISTS app_public.courses (
       pk SERIAL NOT NULL PRIMARY KEY,
       id UUID NOT NULL UNIQUE,
       name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS app_public.assignments (
       pk SERIAL NOT NULL PRIMARY KEY,
       id UUID NOT NULL UNIQUE,
       name VARCHAR(100),
       grade NUMERIC(5, 2),
       weight NUMERIC(3, 3),
       course_id INT NOT NULL,
       FOREIGN KEY (course_id) REFERENCES app_public.courses(pk)
);

GRANT SELECT (id,name,grade,weight,course_id) ON assignments TO graphql_visitor;
GRANT UPDATE (name,grade,weight,course_id) ON assignments TO graphql_visitor;
GRANT DELETE ON assignments TO graphql_visitor;

GRANT SELECT (id,name) ON courses TO graphql_visitor;
GRANT UPDATE (name) ON courses TO graphql_visitor;
GRANT DELETE ON courses TO graphql_visitor;
