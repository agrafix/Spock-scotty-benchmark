{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment

import qualified Web.Scotty as Scotty
import qualified Web.Spock.Simple as Spock

main =
    do args <- getArgs
       let port = 8080
       case args of
         ["scotty"] ->
             Scotty.scotty port $
             do Scotty.get "/echo/hello-world" $
                  Scotty.text "Hello World"
                Scotty.get "/echo/plain/:param" $
                  do p <- Scotty.param "param"
                     Scotty.text p
                Scotty.get (Scotty.regex "^/echo/regex/([0-9]+)$") $
                  do p <- Scotty.param "1"
                     Scotty.text p
         ["spock"] ->
             Spock.runSpock port $ Spock.spockT id $
             do Spock.get "/echo/hello-world" $
                  Spock.text "Hello World"
                Spock.get "/echo/plain/:param" $
                  do Just p <- Spock.param "param"
                     Spock.text p
                Spock.get "/echo/regex/{param:^[0-9]+$}" $
                  do Just p <- Spock.param "param"
                     Spock.text p
         _ -> putStrLn "Usage: ./Spock-scotty-benchmark spock|scotty"
