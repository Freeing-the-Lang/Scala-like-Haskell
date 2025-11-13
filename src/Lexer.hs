module Lexer where

data Token
  = TokIdent String
  | TokNumber Int
  | TokArrow      -- =>
  | TokEquals     -- =
  | TokLParen     -- (
  | TokRParen     -- )
  | TokEOF
  deriving (Show, Eq)

lexer :: String -> [Token]
lexer [] = [TokEOF]
lexer ('=':'>':xs) = TokArrow : lexer xs
lexer ('=':xs)     = TokEquals : lexer xs
lexer ('(':xs)     = TokLParen : lexer xs
lexer (')':xs)     = TokRParen : lexer xs
lexer (c:cs)
  | c `elem` [' ', '\n', '\t'] = lexer cs
  | c `elem` ['0'..'9']        = let (nums, rest) = span (`elem` ['0'..'9']) (c:cs)
                                 in TokNumber (read nums) : lexer rest
  | c `elem` ['a'..'z'] ++ ['A'..'Z'] =
        let (name, rest) = span (`elem` (['a'..'z'] ++ ['A'..'Z'])) (c:cs)
        in TokIdent name : lexer rest
  | otherwise = lexer cs
