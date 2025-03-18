-- Group by/having
-- Quantos pacientes cada medico atendeu se esse numero for maior que 10 

SELECT C.CPF_M, M.Nome, COUNT(C.CPF_P) AS num_pacientes 
FROM CONSULTA C INNER JOIN MEDICO M ON C.CPF_M = M.CPF_M
GROUP BY C.CPF_M, M.Nome 
HAVING COUNT(C.CPF_P) > 10;


-- Junção interna 
-- CPF dos pacientes que passaram por cirurgia com um residente da instituição UFPE

SELECT DISTINCT CR.CPF_P 
FROM RESIDENTE R INNER JOIN CIRURGIA CR ON R.CPF = CR.CPF_R 
WHERE R.INSTITUICAO = 'UFPE';


-- Junção externa (exclusiva)
-- Pacientes sem enfermeiro

SELECT P.NOME 
FROM PACIENTE P LEFT JOIN ENFERMEIRO E ON E.CPF = P.CPF_AUXILIAR 
WHERE P.CPF_AUXILIAR IS NULL


-- Semi join
-- Quais medicos tem o chefe de CPF = '55555555555'

SELECT M1.NOME 
FROM MEDICO M1 
WHERE EXISTS (SELECT * 
              FROM MEDICO M2 
              WHERE M1.CPF_CHEFE=M2.CPF_CHEFE AND M1.CPF != M2.CPF)


-- Anti join
-- Projete o nome dos medicos que nunca prescreveram uma receita

SELECT M.NOME 
FROM MEDICO M 
WHERE NOT EXISTS (SELECT * 
                  FROM RECEITA R 
                  WHERE R.CPF_M = M.CPF);


-- Union
-- Projetar o nome de todas as pessoas que recebem remuneração no hospital

(SELECT NOME FROM MEDICO) 
UNION (SELECT NOME FROM RESIDENTE) 
UNION (SELECT NOME FROM ENFERMEIRO)


-- Subconsulta escalar 
-- Medicos que ganham mais que a media de remuneração

SELECT M.NOME 
FROM MEDICO M 
WHERE M.REMUNERACAO > (SELECT AVG(REMUNERACAO) 
                       FROM MEDICO)


-- Subconsulta de linha
-- Projete o nome dos medicos do sexo masculino cujo cpf do chefe é '77777777777'
SELECT M.NOME 
FROM MEDICO M 
WHERE (M.SEXO, M.CPF_CHEFE) IN (SELECT M1.SEXO, M1.CPF_CHEFE 
                                FROM MEDICO M1 
                                WHERE M1.SEXO='M' AND CPF_CHEFE='77777777777')


-- Subconsulta de tabela
-- Projetar a remuneração dos medicos que estão em um departamento
SELECT M.REMUNERACAO 
FROM MEDICO M WHERE M.CPF IN (SELECT T.CPF 
                              FROM TRABALHA_MED T)
                              