CREATE SCHEMA app_public;
CREATE ROLE graphql_visitor;

CREATE TABLE IF NOT EXISTS app_public.courses (
       pk SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS app_public.assignments (
       pk SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(100),
       grade NUMERIC(5, 2),
       weight NUMERIC(3, 3),
       course_id INT NOT NULL,
       FOREIGN KEY (course_id) REFERENCES app_public.courses(pk)
);

GRANT SELECT (name,grade,weight,course_id) ON app_public.assignments TO graphql_visitor;
GRANT UPDATE (name,grade,weight,course_id) ON app_public.assignments TO graphql_visitor;
GRANT DELETE ON app_public.assignments TO graphql_visitor;

GRANT SELECT (name) ON app_public.courses TO graphql_visitor;
GRANT UPDATE (name) ON app_public.courses TO graphql_visitor;
GRANT DELETE ON app_public.courses TO graphql_visitor;

INSERT INTO app_public.courses VALUES (DEFAULT, DEFAULT, 'hello!');
INSERT INTO app_public.assignments VALUES (DEFAULT, DEFAULT, 'hiya', 100.00, 0.25, (SELECT pk FROM app_public.courses ORDER BY id LIMIT 1));
