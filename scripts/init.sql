-- init.sql

-- Criar extensão para suportar UUIDs, se ainda não estiver ativada
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Criar tabela de usuários com UUID como chave primária
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

CREATE TABLE professor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL
);

ALTER TABLE aluno
ADD COLUMN IF NOT EXISTS curso_id INTEGER,
ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES curso(id) ON DELETE SET NULL;

-- Inserir 20 usuários com nomes e emails aleatórios
INSERT INTO users (name, email)
VALUES 
  ('Alice Smith', 'alice.smith@example.com'),
  ('Bob Johnson', 'bob.johnson@example.com'),
  ('Carol Williams', 'carol.williams@example.com'),
  ('David Jones', 'david.jones@example.com'),
  ('Emma Brown', 'emma.brown@example.com'),
  ('Frank Davis', 'frank.davis@example.com'),
  ('Grace Wilson', 'grace.wilson@example.com'),
  ('Henry Moore', 'henry.moore@example.com'),
  ('Isabella Taylor', 'isabella.taylor@example.com'),
  ('Jack Lee', 'jack.lee@example.com'),
  ('Kate Clark', 'kate.clark@example.com'),
  ('Liam Martinez', 'liam.martinez@example.com'),
  ('Mia Rodriguez', 'mia.rodriguez@example.com'),
  ('Noah Garcia', 'noah.garcia@example.com'),
  ('Olivia Hernandez', 'olivia.hernandez@example.com'),
  ('Patrick Martinez', 'patrick.martinez@example.com'),
  ('Quinn Lopez', 'quinn.lopez@example.com'),
  ('Rose Thompson', 'rose.thompson@example.com'),
  ('Samuel Perez', 'samuel.perez@example.com'),
  ('Tara Scott', 'tara.scott@example.com');

INSERT INTO alunos (nome, turma, curso, data_nascimento)
VALUES ('Ana Lima', '1A', 'Engenharia Civil', '2002-05-10'),
       ('Bruno Souza', '1B', 'Administração', '2003-08-15');

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia Civil', 5),
       ('Administração', 4);

INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 1),
       (2, 2);

