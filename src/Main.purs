module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Array((!!))
import Data.Maybe (Maybe(..), fromMaybe)
--- import Data.Array (length, head)

main :: Effect Unit
main = do
    log $ case (getRec Base) !! 0 of
               Just x -> x
               Nothing -> "Fail"
    

-- log $ fromMaybe "fail" (Nothing)
-- main = logShow (diagonal 3.0 4.0)
-- log "Hello World"
data Rect
    = Base
    | BaseOffset
    | Tree1
    | Rocks1

getRec :: Rect -> Array String
getRec rec = 
    case rec of
         Base ->
             [
             "._._",
             "_._.",
             "._._",
             "_._."
             ]
         BaseOffset ->
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



