{- 
    Trabalho Final - Grupo 03
        LUIZ ZAIRO BASTOS VIANA - 499995
        CARLOS EDUARDO RODRIGUES PITA - 509630

    Descrição sobre cada campo dos dados:
        professor(matricula, nome, unidade,cat)
        aluno(matricula, nome, curso, nascimento,cat)
        disciplina(cod, nome, curso, ch,cat)
-}

import Data.List


type Nascimento = (Int,Int,Int) -- Criação do tipo de dados Nascimento

-- Contrução do tipo Sistema
data Sistema = Professor String String String String
 |Aluno String String String Nascimento String
 |Disciplina String String String Int String
  deriving (Eq,Ord,Show)

-- Base de dados 
item0,item1,item2,item3,item4,item5,item6,item7,item8,item9 :: Sistema
item0 = Professor "1234" "Luiz Alberto" "Campus de Crateus" "professor"
item1 = Professor "1235" "Wellington Franco" "Campus de Crateus" "professor"
item2 = Professor "1236" "Simone Santos" "Campus de Crateus" "professor"
item3 = Aluno "4567" "Antonio Jose" "Ciencia da Computacao" (12,12,2000) "aluno"
item4 = Aluno "4999" "Luiz Zairo Bastos Viana" "Ciencia da Computacao" (28,01,2002) "aluno"
item5 = Aluno "5096" "Carlos Eduardo Rodrigues Pita" "Ciencia da Computacao" (10,10,1930) "aluno"
item6 = Disciplina "28" "Programacao Funcional" "Ciencia da Computacao" 64 "disciplina"
item7 = Disciplina "29" "Calculo Diferencial e Integral" "Ciencia da Computacao" 96 "disciplina"
item8 = Disciplina "30" "Inteligencia Artificial" "Ciencia da Computacao" 64 "disciplina"
item9 = Disciplina "31" "Projeto Integrador III" "Ciencia da Computacao" 64 "disciplina"

lista :: [Sistema] -- Criação de uma lista de Sistema
lista = [item0,item1,item2,item3,item4,item5,item6,item7,item8,item9] -- Adicionando todos os valores a lista de itens

