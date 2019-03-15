module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Array((!!), zipWith, foldl, head, tail)
import Data.Maybe (Maybe(..), fromMaybe)
--- import Data.Array (length, head)

main :: Effect Unit
main = do
    log $ foldl (<>) "\n" $ map (\n -> n <> "\n") $ row (getRec Base) [(getRec Base), (getRec Rocks1), (getRec Base), (getRec Tree1), (getRec Base)]

row :: Array String -> Array(Array String) -> Array String
row acc [] = acc
row acc l = row (zipWith (<>) acc (fromMaybe [] $ head l)) (fromMaybe [] $ tail l)
    

-- fact 0 acc = acc
-- fact n acc = fact (n - 1) (acc * n)

combineRecs :: Array String -> Array String -> Array String
combineRecs a1 a2 =
    zipWith (<>) a1 a2

-- log $ fromMaybe "fail" (Nothing)
-- main = logShow (diagonal 3.0 4.0)
-- log "Hello World"
data Rect
    = Base
    | Tree1
    | Rocks1

getRec :: Rect -> Array String
getRec rec = 
    case rec of
         Base ->
             [
             "_._.",
             "._._",
             "_._.",
             "._._"
             ]
         Tree1 ->
             [
             "_._.",
             "._._",
             "_/\\_.",
             "/..\\"
             ]
         Rocks1 ->
             [
             "_.()",
             "._._",
             "_._.",
             "()._"
             ]



