module Lib
    ( someFunc
    ) where

import SimpleCmd

someFunc :: IO ()
someFunc = do
    output <- cmd "aws lambda list-functions" []
    putStrLn output
