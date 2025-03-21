-- Inserindo Residentes
INSERT INTO RESIDENTE (CPF, Nome, Idade, Sexo, EndCep, EndRua, EndNum, Tel1, Tel2, Tel3, Instituicao, Remuneracao)
VALUES
('11111111111', 'Carlos Silva', 28, 'M', '50000000', 'Rua A', '123', '81999999999', NULL, NULL, 'UFPE', 3000.00),
('22222222222', 'Mariana Souza', 26, 'F', '50010000', 'Rua B', '456', '81988888888', NULL, NULL, 'UPE', 3200.00),
('33333333333', 'Fernando Lima', 30, 'M', '50020000', 'Rua C', '789', '81977777777', NULL, NULL, 'USP', 3500.00),
('44444444444', 'Juliana Castro', 29, 'F', '50030000', 'Rua D', '101', '81966666666', NULL, NULL, 'UFRJ', 3100.00);

-- Inserindo Médicos
INSERT INTO MEDICO (CPF, Nome, Idade, Sexo, EndCep, EndRua, EndNum, Tel1, Tel2, Tel3, Remuneracao, CPF_CHEFE)
VALUES
('55555555555', 'Dr. João Almeida', 45, 'M', '50040000', 'Rua E', '567', '81955555555', NULL, NULL, 8950.00, '66666666666'),
('66666666666', 'Dra. Ana Lima', 38, 'F', '50050000', 'Rua F', '678', '81944444444', NULL, NULL, 9150.00, '55555555555'),
('77777777777', 'Dr. Ricardo Santos', 50, 'M', '50060000', 'Rua G', '789', '81933333333', NULL, NULL, 8800.00, NULL),
('88888888888', 'Dra. Beatriz Mendes', 42, 'F', '50070000', 'Rua H', '890', '81922222222', NULL, NULL, 9300.00, '55555555555'),
('99999999999', 'Dr. Fábio Alves', 47, 'M', '50080000', 'Rua I', '901', '81911111111', NULL, NULL, 9750.00, '77777777777'),
('10101010101', 'Dra. Patrícia Rocha', 39, 'F', '50090000', 'Rua J', '432', '81900000000', NULL, NULL, 9800.00, '66666666666');

-- Inserindo Especializações
INSERT INTO ESPECIALIZACAO (CPF, ESPECIALIZACAO)
VALUES
('55555555555', 'Cardiologia'),
('55555555555', 'Clínico Geral'),
('66666666666', 'Neurologia'),
('77777777777', 'Ortopedia'),
('88888888888', 'Cardiologia'),
('99999999999', 'Neurologia'),
('10101010101', 'Cardiologia');

-- Inserindo Departamentos
INSERT INTO DEPARTAMENTO (COD, Nome)
VALUES
('D001', 'Cardiologia'),
('D002', 'Neurologia'),
('D003', 'Ortopedia'),
('D004', 'Pediatria'),
('D005', 'Dermatologia');

-- Médicos trabalhando em departamentos
INSERT INTO TRABALHA_MED (CPF, COD)
VALUES
('55555555555', 'D001'),
('66666666666', 'D002'),
('77777777777', 'D003'),
('88888888888', 'D004'),
('99999999999', 'D005'),
('10101010101', 'D002');

-- Inserindo Enfermeiros
INSERT INTO ENFERMEIRO (CPF, COD, Nome, Sexo, EndCep, EndRua, EndNum, Tel1, Tel2, Tel3, Remuneracao)
VALUES
('12121212121', 'D001', 'Enfermeira Paula', 'F', '50100000', 'Rua K', '234', '81911111111', NULL, NULL, 5000.00),
('13131313131', 'D002', 'Enfermeiro José', 'M', '50110000', 'Rua L', '345', '81900000000', NULL, NULL, 5200.00),
('14141414141', 'D004', 'Enfermeiro Bruno', 'M', '50120000', 'Rua M', '567', '81977777777', NULL, NULL, 5300.00),
('15151515151', 'D005', 'Enfermeira Carla', 'F', '50130000', 'Rua N', '456', '81999988888', NULL, NULL, 5100.00);

-- Inserindo Pacientes
INSERT INTO PACIENTE (CPF, Nome, Idade, Sexo, EndCep, EndRua, EndNum, Tel1, Tel2, Tel3, CPF_AUXILIAR)
VALUES
('16161616161', 'Lucas Mendes', 60, 'M', '50140000', 'Rua O', '678', '81966666666', NULL, NULL, '12121212121'),
('17171717171', 'Fernanda Costa', 50, 'F', '50150000', 'Rua P', '789', '81955555555', NULL, NULL, '13131313131'),
('18181818181', 'Pedro Oliveira', 45, 'M', '50160000', 'Rua Q', '890', '81944444444', NULL, NULL, NULL),
('19191919191', 'Clara Silva', 38, 'F', '50170000', 'Rua R', '901', '81933333333', NULL, NULL, '15151515151');

-- Inserindo cirurgias
INSERT INTO CIRURGIA (CPF_R, CPF_M, CPF_P)
VALUES
('11111111111', '55555555555', '16161616161'),
('22222222222', '66666666666', '17171717171'),
('33333333333', '77777777777', '18181818181'),
('44444444444', '88888888888', '19191919191');

-- Inserindo Consultas
INSERT INTO CONSULTA (CPF_P, CPF_M, DATA_CONSULTA)
VALUES
('16161616161', '55555555555', TO_DATE('2025-03-10 08:30:00', 'YYYY-MM-DD HH24:MI:SS')),
('16161616161', '77777777777', TO_DATE('2025-03-14 10:00:00', 'YYYY-MM-DD HH24:MI:SS')),
('17171717171', '66666666666', TO_DATE('2025-03-11 09:15:00', 'YYYY-MM-DD HH24:MI:SS')),
('18181818181', '77777777777', TO_DATE('2025-03-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS')),
('17171717171', '66666666666', TO_DATE('2025-03-13 14:45:00', 'YYYY-MM-DD HH24:MI:SS')),
('18181818181', '88888888888', TO_DATE('2025-03-12 16:30:00', 'YYYY-MM-DD HH24:MI:SS')),
('19191919191', '88888888888', TO_DATE('2025-03-13 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Inserindo Receitas
INSERT INTO RECEITA (CPF_P, CPF_M, DATA_CONSULTA, ID, MEDICAMENTO)
VALUES
('16161616161', '55555555555', TO_DATE('2025-03-10 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'R001', 'Aspirina'),
('16161616161', '77777777777', TO_DATE('2025-03-14 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'R001', 'Dipirona'),
('16161616161', '77777777777', TO_DATE('2025-03-14 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'R002', 'Buscopan'),
('17171717171', '66666666666', TO_DATE('2025-03-13 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'R001', 'Paracetamol'),
('18181818181', '77777777777', TO_DATE('2025-03-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'R001', 'Ibuprofeno'),
('18181818181', '77777777777', TO_DATE('2025-03-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'R002', 'Amoxicilina'),
('19191919191', '88888888888', TO_DATE('2025-03-13 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'R001', 'Decongex');