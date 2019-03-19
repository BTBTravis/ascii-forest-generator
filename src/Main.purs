module Main where

import Prelude
import Data.Array((:), (!!), take, drop, zipWith, foldl, foldr, concat, head, tail, replicate)
import Data.Maybe (fromMaybe)
import Random.PseudoRandom (randomRs, mkSeed)

type Col = Array Row
type Row = Array Rect
type Rect = Array String
data RectName
    = Base
    | Tree1
    | Rocks1

intToRect :: Int -> RectName
intToRect i =
    fromMaybe Base $ [Base, Tree1, Rocks1] !! i

rectToStrings :: RectName -> Rect
rectToStrings rec =
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

getRandomNumbers :: Int -> Int -> Array Int
getRandomNumbers seed total =
    randomRs 0 2 total (mkSeed seed)


group :: forall a. Array(Array a) -> Int -> Array a -> Array(Array a)
group acc i [] = acc
group acc i rest = group ((take i rest) : acc) i (drop i rest)

flattenRow :: Rect -> Row -> Rect
flattenRow acc [] = acc
flattenRow acc rest = flattenRow (zipWith (<>) acc (fromMaybe [] (head rest))) (fromMaybe [] (tail rest))

generate :: Int -> Int -> Int -> String
generate seed x y =
    foldl (<>) ""
    $ map (\x -> x <> "\n")
    $ concat
    $ map (flattenRow (rectToStrings Base))
    $ map (map rectToStrings)
    $ map (map intToRect)
    $ group [] x
    $ getRandomNumbers seed (x * y)

