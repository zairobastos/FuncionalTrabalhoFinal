<h1 align="center">Trabalho Final de Funcional</h1>

<div align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue"/>
  <img src="https://img.shields.io/github/contributors/zairobastos/FuncionalTrabalhoFinal"/>
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/zairobastos/FuncionalTrabalhoFinal">
</div>

### 🤓 Grupo 03
* Luiz Zairo Bastos Viana
* Carlos Eduardo Rodrigues Pita

### :hammer: Ferramentas úteis no desenvolvimento
* IDE's:
  * [Replit](https://replit.com/)
  * [VS CODE](https://code.visualstudio.com/download)
* Extensões úteis do VSCode:
    * [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)
    * [Haskell Syntax Highlighting
](https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell)
    * [haskell-linter](https://marketplace.visualstudio.com/items?itemName=hoovercj.haskell-linter)
* [Vídeo que pode auxiliar na instação do ghci](https://www.youtube.com/watch?v=Lm_9NXu_JLk&feature=youtu.be&ab_channel=LuizAlbertodoCarmoViana)

### :page_facing_up: Descrição do Trabalho
O propósito deste trabalho é a criação de um módulo com funções para manipular um determinado tipo algébrico de dados. O tipo está definido abaixo:
```haskell
--Descrição sobre o que cada tipo algébrico deve conter:
--professor(matricula, nome, unidade,cat)
--aluno(matricula, nome, curso, nascimento,cat)
--disciplina(cod, nome, curso, ch,cat)

type Nascimento = (Int,Int,Int)
data Sistema = Professor String String String String
|Aluno String String String Nascimento String
|Disciplina String String String Int String
deriving (Eq,Ord,Show)
```
O tipo algébrico Sistema armazena itens que podem ser valores de professor, aluno e disciplina, cada um tem campos específicos, sendo que a última informação de cada, cat, indica a que tipo pertence. Abaixo há um exemplo, não exaustivo, de registro que pode ser usado como teste:

```haskell
-- Base de dados utilizada no trabalho
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

```
### :question: Questões
Para uma melhor visualização gráfica e compilação das questões, recomendamos realizar o clone do repositório e utilizar uma IDE de Haskell, como o [VS Code](https://code.visualstudio.com/download) e a instalação de algumas extensões que podem lhe ajudar no desenvolvimento e melhor visualização sintática, são elas: [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell), [Haskell Syntax Highlighting
](https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell) e [haskell-linter](https://marketplace.visualstudio.com/items?itemName=hoovercj.haskell-linter). Existe também uma opção online: [Replit](https://replit.com/).
1. Crie uma função que recebe uma lista de itens do Sistema e mostre os detalhes de todos os itens de forma legível.

```haskell
-- QUESTÃO 1

exibeListaCompleta::[Sistema] -> IO()
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
```
2. Crie uma função que recebe uma lista de itens do Sistema e mostre uma lista dos professores.
```haskell
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
```
3. Crie uma função que recebe uma lista de itens do Sistema e mostre uma lista dos alunos.
```haskell
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
```
4. Crie uma função que recebe uma lista de itens do Sistema e mostre uma lista das disciplinas.
```haskell
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
```
5. Crie uma função que recebe uma lista de itens do Sistema e mostre uma lista dos alunos, de forma legível, que já atingiram a maioridade, considerando o ano atual de 2022.
```haskell
-- QUESTÃO 5

anoNascimento :: Nascimento -> Int
anoNascimento (dia,mes,ano) = ano

exibeListaAlunosAdulto :: [Sistema] -> IO()
exibeListaAlunosAdulto ((Professor matricula nome unidade categoria):xs) = exibeListaAlunosAdulto xs

exibeListaAlunosAdulto ((Aluno matricula nome curso nascimento categoria):xs) = do
    if (2022 - (anoNascimento nascimento)) >=18 then do
        putStrLn "------ALUNO------"
        putStrLn ("Matricula: " ++ show matricula)
        putStrLn ("Nome: " ++ show nome)
        putStrLn ("Curso: " ++ show curso)
        putStrLn ("Nascimento: "++ show nascimento)
        putStrLn ("Categoria: "++ show categoria)
        exibeListaAlunosAdulto xs
    else do
        exibeListaAlunosAdulto xs

exibeListaAlunosAdulto ((Disciplina cod nome curso ch categoria):xs) = exibeListaAlunosAdulto xs

exibeListaAlunosAdulto [] = putStrLn "------FINALIZADO------"
```
6. Crie uma função que recebe uma lista de itens do Sistema e mostre os detalhes das disciplinas com carga horária acima de 64.
```haskell
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
```
### 👨‍💻 Desenvolvedores
<a href="https://github.com/zairobastos/FuncionalTrabalhoFinal/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=zairobastos/FuncionalTrabalhoFinal" />
</a>

### 📔 Licença
[MIT](LICENSE)