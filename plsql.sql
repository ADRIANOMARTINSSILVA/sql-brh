--Procedure Insere Projeto

CREATE OR REPLACE PROCEDURE brh.insere_projeto
    (p_NOME_DO_PROJETO IN VARCHAR2, p_RESPONSAVEL_DO_PROJETO IN VARCHAR2)
IS
BEGIN
    INSERT INTO brh.projeto (ID_PROJETO, NOME_DO_PROJETO, RESPONSAVEL_DO_PROJETO)
    VALUES (brh.seq_projeto.NEXTVAL, p_NOME_DO_PROJETO, p_RESPONSAVEL_DO_PROJETO)
END;

--Função Calcula Idade

CREATE OR REPLACE FUNCTION brh.calcula_idade 
    (p_DATA_NASCIMENTO IN DATE)
    RETURN NUMBER IS v_IDADE NUMBER;
BEGIN
    v_IDADE := FLOOR(MONTHS_BETWEEN(SYSDATE, p_DATA_NASCIMENTO) / 12);
    RETURN v_IDADE;
END

--Função Finaliza Projeto

CREATE OR REPLACE FUNCTION brh.finaliza_projeto 
    (p_ID_PROJETO IN NUMBER) 
RETURN DATE IS
    v_DATA_FIM DATE;
BEGIN
    v_DATA_FIM := SYSDATE;
    UPDATE brh.projeto
    SET DATA_FIM = v_DATA_FIM
    WHERE ID_PROJETO = p_ID_PROJETO;
    RETURN v_DATA_FIM;
END;
CREATE OR REPLACE FUNCTION brh.finaliza_projeto (
    p_ID_PROJETO IN NUMBER
) RETURN DATE IS
    v_DATA_FIM DATE;
BEGIN
    v_DATA_FIM := SYSDATE;
    UPDATE brh.projeto
    SET DATA_FIM = v_DATA_FIM
    WHERE ID_PROJETO = p_ID_PROJETO;
    RETURN v_DATA_FIM;
END;

-- Validar novo projeto
CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_NOME_PROJETO IN VARCHAR2,
    p_RESPONSAVEL IN VARCHAR2
) IS
BEGIN
    IF p_NOME_PROJETO IS NULL OR LENGTH(p_nome_projeto) < 2 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nome de projeto inválido! Deve ter dois ou mais caracteres.');
    END IF;
    INSERT INTO brh.projeto (ID_PROJETO, p_NOME_PROJETO, RESPONSAVEL)
    VALUES (brh.seq_projeto.NEXTVAL, p_NOME_PROJETO, p_RESPONSAVEL;
END;
