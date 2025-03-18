-- Impede que um médico sem especialização realize uma cirurgia

CREATE OR REPLACE TRIGGER MEDICO_CIRURGIA
BEFORE INSERT ON CIRURGIA
FOR EACH ROW
DECLARE
    counter NUMBER := 0;
    sem_especializacao EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO counter
    FROM ESPECIALIZACAO ES
    WHERE ES.CPF = :NEW.CPF_M;

    IF counter = 0 THEN
        RAISE sem_especializacao;
    END IF;

EXCEPTION
    WHEN sem_especializacao THEN
        DBMS_OUTPUT.PUT_LINE('Médico não possui especialização.');
        RAISE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir cirurgia.');
        RAISE;
END;
/


-- Verifica se há mais médicos ou enfermeiros cadastrados

declare
    qtdMedicos number:= 0;
    qtdEnfermeiros number:= 0;
begin
    SELECT COUNT(M.CPF) into qtdMedicos
    FROM MEDICO M;
    SELECT COUNT(E.CPF) into qntEnfermeiros
    FROM ENFERMEIRO E;
    if qtdMedicos > qtdEnfermeiros then
        DBMS_OUTPUT.PUT_LINE('Existem mais médicos do que enfermeiros cadastrados');
    elsif qtdMedicos < qtdEnfermeiros then
        DBMS_OUTPUT.PUT_LINE('Existem mais enfermeiros do que médicos cadastrados');
    else
        DBMS_OUTPUT.PUT_LINE('A quantidade de médicos e enfermeiros é igual');
    end if;
    DBMS_OUTPUT.PUT_LINE('Quantidade de médicos : ' || qtdMedicos );
    DBMS_OUTPUT.PUT_LINE('Quantidade de enfermeiros : ' || qtdEnfermeiros );
end;
/


-- Explicar

DECLARE
    nomeM medico.nome%TYPE;
    remuneracaoM medico.remuneracao%TYPE;
    qtdChefiados number :=0;
BEGIN
    SELECT nome, remuneracao, (select count(*) 
                               from medico 
                               where cpf_chefe='55555555555') INTO nomeM, remuneracaoM, qtdChefiados
    FROM medico
    WHERE CPF = '55555555555';

    DBMS_OUTPUT.PUT_LINE('Nome: ' || nomeM);
    DBMS_OUTPUT.PUT_LINE('Remuneração: R$' || remuneracaoM);
    DBMS_OUTPUT.PUT_LINE('Chefia ' || qtdChefiados || ' medicos');
END;
/
    
--percorre a tabela consulta e retorna todas as consultas de um médico específico

DECLARE
v_cpf_medico MEDICO.CPF_M%TYPE := :cpf_medico;
BEGIN
FOR consulta_out IN (
SELECT c.CPF_M, c.CPF_P, c.timestamp, p.Nome AS Nome_Paciente
FROM CONSULTA c INNER JOIN PACIENTE p ON c.CPF_P = p.CPF_P
WHERE c.CPF_M = v_cpf_medico
) LOOP
DBMS_OUTPUT.PUT_LINE('Médico: ' || consulta_out.CPF_M ||
' - Paciente: ' || consulta_out.Nome_Paciente ||
' - Data/Hora: ' || TO_CHAR(consulta_out.timestamp, 'YYYY-MM-DD HH24:MI:SS'));
END LOOP;
END;

-- busca os médicos e seus respectivos departamentos, e exibe o nome do médico junto com o nome do departamento onde ele trabalha

DECLARE
    v_nome_medico VARCHAR(40);
    v_departamento_nome VARCHAR(40);
BEGIN
    -- Para cada médico, busque o nome do médico e o nome do departamento onde ele trabalha
    FOR medico IN (
        SELECT m.NOME AS nome_medico, d.NOME AS nome_departamento
        FROM MEDICO m
        JOIN TRABALHA_MED tm ON m.CPF = tm.CPF
        JOIN DEPARTAMENTO d ON tm.COD = d.COD
    ) LOOP
        -- Exibe o nome do médico e o nome do departamento
        DBMS_OUTPUT.PUT_LINE('Médico: ' || medico.nome_medico || ', Departamento: ' || medico.nome_departamento);
    END LOOP;
END;
