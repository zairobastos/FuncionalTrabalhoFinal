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
    putStrLn ("Categoria: " ++ show categoria ++ "\n")
    exibeListaCompleta xs

exibeListaCompleta ((Aluno matricula nome curso (dia, mes, ano) categoria):xs) = do
    putStrLn "------ALUNO------"
    putStrLn ("Matricula: " ++ show matricula)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Nascimento: " ++ show dia ++ "/" ++ show mes ++ "/" ++ show ano)
    putStrLn ("Categoria: " ++ show categoria ++ "\n")
    exibeListaCompleta xs

exibeListaCompleta ((Disciplina cod nome curso ch categoria):xs) = do
    putStrLn "------DISCIPLINA------"
    putStrLn ("Código: " ++ show cod)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Carga Horária: " ++ show ch)
    putStrLn ("Categoria: " ++ show categoria ++ "\n")
    exibeListaCompleta xs

exibeListaCompleta [] = do
    putStrLn "----LEITURA DA LISTA FINALIZADA-----"


-- QUESTÃO 2

isProfessor :: Sistema -> Bool
isProfessor (Professor _ _ _ x)
    |x == "professor" = True
    |otherwise = False

isProfessor (Aluno {}) = False
isProfessor (Disciplina {}) = False

exibeListaProfessores :: [Sistema] -> IO()
exibeListaProfessores prof = print([a | a <- lista, isProfessor a])


-- QUESTÃO 3

isAluno :: Sistema -> Bool
isAluno (Aluno _ _ _ _ x)
    |x == "aluno" = True
    |otherwise = False

isAluno (Professor {}) = False
isAluno (Disciplina {}) = False


exibeListaAlunos :: [Sistema] -> IO()
exibeListaAlunos alun = print([a | a <- alun, isAluno a])


-- QUESTÃO 4

isDisciplina :: Sistema -> Bool
isDisciplina (Disciplina _ _ _ _ x)
    |x == "disciplina" = True
    |otherwise = False

isDisciplina (Professor {}) = False
isDisciplina (Aluno {}) = False


exibeListaDisciplinas :: [Sistema] -> IO()
exibeListaDisciplinas disc = print([a | a <- disc, isDisciplina a])


-- QUESTÃO 5

exibeAlunosAdulto :: [Sistema] -> IO()
exibeAlunosAdulto ((Professor matricula nome unidade categoria):xs) = exibeAlunosAdulto xs

exibeAlunosAdulto ((Aluno matricula nome curso (dia, mes, ano) categoria):xs) = do
    if (2022 - ano) >= 18 then do
        putStrLn "------ALUNO------"
        putStrLn ("Matricula: " ++ show matricula)
        putStrLn ("Nome: " ++ show nome)
        putStrLn ("Curso: " ++ show curso)
        putStrLn ("Nascimento: " ++ show dia ++ "/" ++ show mes ++ "/" ++ show ano)
        putStrLn ("Categoria: " ++ show categoria ++ "\n")
        exibeAlunosAdulto xs
    else do
        exibeAlunosAdulto xs

exibeAlunosAdulto ((Disciplina cod nome curso ch categoria):xs) = exibeAlunosAdulto xs

exibeAlunosAdulto [] = putStrLn "------FINALIZADO------"


-- QUESTÃO 6

isMoreThan64 :: Sistema -> Bool
isMoreThan64 (Disciplina _ _ _ ch _)
    |ch > 64 = True
    |otherwise = False

isMoreThan64 (Aluno {}) = False
isMoreThan64 (Professor {}) = False

listaDisciplinas64 :: [Sistema] -> IO()
listaDisciplinas64 disc64 = exibeListaDisciplinas64 (filter isMoreThan64 (filter isDisciplina disc64))

exibeListaDisciplinas64 :: [Sistema] -> IO()
exibeListaDisciplinas64 ((Disciplina cod nome curso ch categoria):xs) = do
    putStrLn "------DISCIPLINA------"
    putStrLn ("Código: " ++ show cod)
    putStrLn ("Nome: " ++ show nome)
    putStrLn ("Curso: " ++ show curso)
    putStrLn ("Carga Horária: "++ show ch)
    putStrLn ("Categoria: "++ show categoria)
    exibeListaDisciplinas64 xs

exibeListaDisciplinas64 [] = putStrLn "-----FINALIZADO-----"