module Main where

import Lexer
import Parser
import Evaluator

main :: IO ()
main = do
    putStrLn "Loading Scala-like-Haskell file: examples/hello.slh"
    src <- readFile "examples/hello.slh"

    let tokens = lexer src
    putStrLn "\n[Tokens]"
    print tokens

    let ast = parse tokens
    putStrLn "\n[AST]"
    print ast

    let result = eval ast
    putStrLn "\n[Result]"
    print result
