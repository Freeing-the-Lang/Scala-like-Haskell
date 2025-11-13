module Parser where

import Lexer

data Expr
  = Var String
  | Num Int
  | Func String Expr        -- x => body
  | Call Expr Expr          -- f x
  deriving (Show, Eq)

parse :: [Token] -> Expr
parse tokens = fst (parseExpr tokens)

parseExpr :: [Token] -> (Expr, [Token])
parseExpr (TokIdent x : TokArrow : rest) =
    let (body, rest2) = parseExpr rest
    in (Func x body, rest2)

parseExpr (TokIdent x : rest) = (Var x, rest)
parseExpr (TokNumber n : rest) = (Num n, rest)

parseExpr (TokLParen : rest) =
    let (e, TokRParen:rest2) = parseExpr rest
    in (e, rest2)

parseExpr tokens = error ("Parse error: " ++ show tokens)
