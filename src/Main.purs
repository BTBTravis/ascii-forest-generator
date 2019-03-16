module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Array((!!), zipWith, foldl, head, tail, replicate)
import Data.Maybe (fromMaybe)
import Effect.Random (randomInt)
import Data.Unfoldable (replicateA)

main :: Effect Unit
main = do
    seeds <- replicateA 15 (randomInt 1 3)
    log $ foldl (<>) "\n" $ map (\n -> n <> "\n") $ buildRow (getRec Base) (getRandomRec seeds)


buildRow :: Array String -> Array(Array String) -> Array String
buildRow acc [] = acc
buildRow acc l = buildRow (zipWith (<>) acc (fromMaybe [] $ head l)) (fromMaybe [] $ tail l)
    
data Rect
    = Base
    | Tree1
    | Rocks1

getRandomRec :: Array(Int) -> Array(Array String)
getRandomRec seeds =
    map (\seed -> getRecFromInt seed) seeds

getRecFromInt :: Int -> Array String
getRecFromInt i =
    case i of
         1 -> (getRec Base)
         2 -> (getRec Tree1)
         3 -> (getRec Rocks1)
         _ -> (getRec Base)

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
             "_/\\.",
             "/..\\"
             ]
         Rocks1 ->
             [
             "_.()",
             "._._",
             "_._.",
             "()._"
             ]



