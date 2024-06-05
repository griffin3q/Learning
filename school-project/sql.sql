-- 1
    SELECT COUNT(samochody.ID_SAM) FROM samochody WHERE samochody.MARKA = "OPEL"

-- 2
    SELECT klienci.IMIE, klienci.NAZWISKO FROM klienci JOIN wypozyczenia ON klienci.ID_KLI = wypozyczenia.ID_KLI WHERE wypozyczenia.DATA_WYP = '2006-01-01'; 

-- 3
    SELECT samochody.MARKA, samochody.MARKA, samochody.KOSZT_DNIA FROM samochody WHERE samochody.KOSZT_DNIA > 20 AND samochody.KRAJ_PROD = 'NIEMCY';     

-- 4
    CREATE USER 'wypozyczajacy'@'%' IDENTIFIED BY 'zaq1@WSX';
-- 5
    SELECT 
        klienci.IMIE, 
        klienci.NAZWISKO, 
        samochody.MARKA, 
        samochody.MODEL, 
        samochody.NR_REJ, 
        wypozyczenia.DATA_WYP, 
        wypozyczenia.DATA_ZWR, 
        wypozyczenia.KOSZT 
    FROM 
        klienci 
    INNER JOIN 
        wypozyczenia ON klienci.ID_KLI = wypozyczenia.ID_KLI
    INNER JOIN 
        samochody ON samochody.ID_SAM = wypozyczenia.ID_SAM;

-- 6
    ALTER TABLE wypozyczenia MODIFY id_wyp INT AUTO_INCREMENT PRIMARY KEY;

-- 7 
    INSERT INTO wypozyczenia (ID_KLI, ID_SAM, DATA_WYP, DATA_ZWR, KOSZT)
    VALUES (100, 15, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH), 1000);

-- 8 
    SELECT COUNT(samochody.ID_SAM) FROM samochody;