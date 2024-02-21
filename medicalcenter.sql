DROP DATABASE IF EXISTS medicalcenter_db;

CREATE DATABASE medicalcenter_db;

\c medicalcenter_db;
--MAY NEED TO SIMPLIFY PATIENT VISIT AND DIAGNOSIS
CREATE TABLE medicalcenter(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)NOT NULL
);

CREATE TABLE doctor(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE patient(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    doctor_name TEXT REFERENCES doctor(name),
    doctor_id INTEGER REFERENCES doctor(id),
    diagnosis_id INTEGER REFERENCES diagnosis(id)
);

CREATE TABLE visit(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctor(id),
    doctor_name TEXT REFERENCES doctor(name),
    patient_name TEXT REFERENCES patient(name),
    patient_id INTEGER REFERENCES patient(id),
    diagnosis_id INTEGER REFERENCES diagnosis(id)
);

CREATE TABLE diagnosis(
    id SERIAL PRIMARY KEY,
    diagnosis_name VARCHAR(100) NOT NULL ,                                    --name of diagnosis
    visit_id INTEGER REFERENCES visit(id)
);





--CREATE TABLE medicalcenter(
--    id SERIAL PRIMARY KEY,
--    name VARCHAR(50)NOT NULL
--);
--
--CREATE TABLE doctor(
--    id SERIAL PRIMARY KEY,
--    name VARCHAR(50) NOT NULL
--);
--
--CREATE TABLE patient(
--    id SERIAL PRIMARY KEY,
--    name VARCHAR(50) NOT NULL,
--    doctor_id INTEGER REFERENCES doctor(id),
--    diagnosis_id INTEGER REFERENCES diagnosis(id)
--);
--
--CREATE TABLE visit(
--    id SERIAL PRIMARY KEY,
--    doctor_id INTEGER REFERENCES doctor(id),
--    patient_id INTEGER REFERENCES patient(id),
--    diagnosis_id INTEGER REFERENCES diagnosis(id),
--    visit_date DATE NOT NULL
--);
--
--CREATE TABLE diagnosis(
--    id SERIAL PRIMARY KEY,
--    diagnosis_name VARCHAR(100) NOT NULL ,                                    --name of diagnosis
--    visit_id INTEGER REFERENCES visit(id)
--);