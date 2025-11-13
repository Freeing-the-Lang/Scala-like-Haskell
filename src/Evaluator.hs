module Evaluator where

import Parser

eval :: Expr -> Expr
eval (Num n) = Num n
eval (Var x) = Var x
eval (Func x body) = Func x body
eval (Call (Func x body) arg) =
    eval (subst x arg body)
eval e = e    -- fallback

subst :: String -> Expr -> Expr -> Expr
subst x v (Var y) | x == y = v
subst x v (Var y) = Var y
subst x v (Num n) = Num n
subst x v (Func y body)
  | x == y = Func y body
  | otherwise = Func y (subst x v body)
subst x v (Call f a) =
    Call (subst x v f) (subst x v a)
