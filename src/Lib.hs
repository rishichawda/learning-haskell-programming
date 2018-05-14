module Lib
    ( formatGrid ,
      displayGrid ,
      findWordsInLine ,
      findWord ,
      findWords ,
      getLines ,
      skew ,
      grid ,
      languages
    ) where

import Data.List (isInfixOf , transpose)
import Data.Maybe(catMaybes)
type Grid = [String]

formatGrid :: Grid -> String
formatGrid = unlines

displayGrid :: Grid -> IO()
displayGrid grid = putStrLn ( formatGrid grid )

findWordsInLine :: String -> String -> Bool
-- findWordsInLine word line = word `isInfixOf` line
findWordsInLine = isInfixOf

getLines grid =
  let horizontal = grid
      vertical = transpose grid
      diagonal1 = diagonalize grid
      diagonal2 = diagonalize ( map reverse horizontal )
      lines = horizontal ++ vertical ++ diagonal1 ++ diagonal2
  in lines ++ ( map reverse lines )

diagonalize :: Grid -> Grid
diagonalize grid = transpose ( skew grid )

skew :: Grid -> Grid
skew [] = []
skew ( l : ls ) = l : skew (map indent ls)
  where indent line = '_' : line

findWord :: Grid -> String -> Maybe String
-- findWord grid word = or ( map (findWordsInLine word) grid )
-- After eta conversion
-- findWord grid word = or $ map ( findWordsInLine word) grid
-- the above line searches for the word as it is in the original grid.
-- Let's modify it to search if the word is present in reverse order.
-- findWord grid word =
  -- let lines = grid ++ (map reverse grid )
  -- in or $ map ( findWordsInLine word ) lines
findWord grid word =
  let lines = getLines grid
      found = or $ map ( findWordsInLine word ) lines
  in if found then Just word else Nothing

-- findWords :: Grid -> [String] -> [Bool]
findWords grid word =
  let foundWords = map ( findWord grid ) word
  in catMaybes foundWords

grid = [ "__C________R___",
         "__SI________U__",
         "__HASKELL____B_",
         "__A__A_____S__Y",
         "__R___B___C____",
         "__PHP____H_____",
         "____S_LREP_____",
         "____I__M_Y__L__",
         "____L_E__T_O___",
         "_________HB____",
         "_________O_____",
         "________CN_____"
         ]

languages = [ "BASIC",
              "COBOL",
              "CSHARP",
              "HASKELL",
              "LISP",
              "PERL",
              "PHP",
              "PYTHON",
              "RUBY",
              "SCHEME"
              ]
