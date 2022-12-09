{- 
    Trabalho Final - Grupo 03
        LUIZ ZAIRO BASTOS VIANA - 499995
        CARLOS EDUARDO RODRIGUES PITA - 509630

    Descrição sobre cada campo dos dados:
        professor(matricula, nome, unidade,cat)
        aluno(matricula, nome, curso, nascimento,cat)
        disciplina(cod, nome, curso, ch,cat)
-}
type Nascimento = (Int,Int,Int) -- Criação do tipo de dados Nascimento

-- Contrução do tipo Sistema
data Sistema = Professor String String String String
 |Aluno String String String Nascimento String
 |Disciplina String String String Int String
  deriving (Eq,Ord,Show)

-- Base de dados 
item0,item1,item2,item3,item4,item5,item6,item7,item8,item9,item10 :: Sistema
item0 = Disciplina "29" "Calculo Diferencial e Integral" "Ciencia da Computacao" 96 "disciplina"
item1 = Professor "1234" "Luiz Alberto" "Campus de Crateus" "professor"
item2 = Aluno "4999" "Luiz Zairo Bastos Viana" "Ciencia da Computacao" (28,01,2002) "aluno"
item3 = Professor "1235" "Wellington Franco" "Campus de Crateus" "professor"
item4 = Professor "1236" "Simone Santos" "Campus de Crateus" "professor"
item5 = Aluno "4567" "Antonio Jose" "Ciencia da Computacao" (12,12,2000) "aluno"
item6 = Disciplina "31" "Projeto Integrador III" "Ciencia da Computacao" 64 "disciplina"
item7 = Aluno "5096" "Carlos Eduardo Rodrigues Pita" "Ciencia da Computacao" (10,10,1930) "aluno"
item8 = Disciplina "28" "Programacao Funcional" "Ciencia da Computacao" 64 "disciplina"
item9 = Disciplina "30" "Inteligencia Artificial" "Ciencia da Computacao" 64 "disciplina"
item10 = Aluno "5098" "Carlos Eduardo " "Ciencia da Computacao" (10,10,2010) "aluno"


lista :: [Sistema] -- Criação de uma lista de Sistema
lista = [item0,item1,item2,item3,item4,item5,item6,item7,item8,item9,item10] -- Adicionando todos os valores a lista de itens


-- QUESTÃO 1

exibeListaCompleta :: [Sistema] -> IO()
exibeListaCompleta ((Professor matricula nome unidade categoria):xs) = do
    putStrLn "------PROFESSOR------"
    putStrLn ("Matricula: " ++ show matricula)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Unidade: " ++ show unidade)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaCompleta xs

exibeListaCompleta ((Aluno matricula nome curso nascimento categoria):xs) = do
    putStrLn "------ALUNO------"
    putStrLn ("Matricula: " ++ show matricula)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Nascimento: "++ show nascimento)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaCompleta xs

exibeListaCompleta ((Disciplina cod nome curso ch categoria):xs) = do
    putStrLn "------DISCIPLINA------"
    putStrLn ("Código: " ++ show cod)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Carga Horária: "++ show ch)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaCompleta xs

exibeListaCompleta [] = do
    putStrLn "----LEITURA DA LISTA FINALIZADA-----"


-- QUESTÃO 2

exibeListaProfessores :: [Sistema] -> IO()
exibeListaProfessores ((Professor matricula nome unidade categoria):xs) = do
    putStrLn "------PROFESSOR------"
    putStrLn ("Matricula: " ++ show matricula)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Unidade: " ++ show unidade)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaProfessores xs

exibeListaProfessores ((Aluno matricula nome curso nascimento categoria):xs) = exibeListaProfessores xs

exibeListaProfessores ((Disciplina cod nome curso ch categoria):xs) = exibeListaProfessores xs

exibeListaProfessores [] = putStrLn "------FINALIZADO------"


-- QUESTÃO 3

exibeListaAlunos :: [Sistema] -> IO()
exibeListaAlunos ((Professor matricula nome unidade categoria):xs) = exibeListaAlunos xs

exibeListaAlunos ((Aluno matricula nome curso nascimento categoria):xs) = do
    putStrLn "------ALUNO------"
    putStrLn ("Matricula: " ++ show matricula)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Nascimento: "++ show nascimento)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaAlunos xs

exibeListaAlunos ((Disciplina cod nome curso ch categoria):xs) = exibeListaAlunos xs

exibeListaAlunos [] = putStrLn "------FINALIZADO------"


-- QUESTÃO 4

exibeListaDisciplinas :: [Sistema] -> IO()
exibeListaDisciplinas ((Professor matricula nome unidade categoria):xs) = exibeListaDisciplinas xs

exibeListaDisciplinas ((Aluno matricula nome curso nascimento categoria):xs) = exibeListaDisciplinas xs

exibeListaDisciplinas ((Disciplina cod nome curso ch categoria):xs) = do
    putStrLn "------DISCIPLINA------"
    putStrLn ("Código: " ++ show cod)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Carga Horária: "++ show ch)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaDisciplinas xs

exibeListaDisciplinas [] = putStrLn "------FINALIZADO------"


-- QUESTÃO 5

exibeListaAlunosAdulto :: [Sistema] -> IO()
exibeListaAlunosAdulto ((Professor matricula nome unidade categoria):xs) = exibeListaAlunosAdulto xs

exibeListaAlunosAdulto ((Aluno matricula nome curso (dia, mes, ano) categoria):xs) = do
    if (2022 - ano) >= 18 then do
        putStrLn "------ALUNO------"
        putStrLn ("Matricula: " ++ show matricula)
        putStrLn ("Nome: " ++ show nome)
        putStrLn ("Curso: " ++ show curso)
        putStrLn ("Nascimento: "++ show (dia, mes, ano))
        putStrLn ("Categoria: "++ show categoria)
        exibeListaAlunosAdulto xs
    else do
        exibeListaAlunosAdulto xs

exibeListaAlunosAdulto ((Disciplina cod nome curso ch categoria):xs) = exibeListaAlunosAdulto xs

exibeListaAlunosAdulto [] = putStrLn "------FINALIZADO------"


-- Questão 06

exibeListaDisciplinas64 :: [Sistema] -> IO()
exibeListaDisciplinas64 ((Professor matricula nome unidade categoria):xs) = exibeListaDisciplinas64 xs

exibeListaDisciplinas64 ((Aluno matricula nome curso nascimento categoria):xs) = exibeListaDisciplinas64 xs

exibeListaDisciplinas64 ((Disciplina cod nome curso ch categoria):xs) = do
    if ch>64 then do
        putStrLn "------DISCIPLINA------"
        putStrLn ("Código: " ++ show cod)
        putStrLn ("Nome: " ++ show nome)
        putStrLn ("Curso: " ++ show curso)
        putStrLn ("Carga Horária: "++ show ch)
        putStrLn ("Categoria: "++ show categoria)
        exibeListaDisciplinas64 xs
    else do
        exibeListaDisciplinas64 xs

exibeListaDisciplinas64 [] = putStrLn "------FINALIZADO------"
