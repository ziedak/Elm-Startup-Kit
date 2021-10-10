module Main exposing(..)

import Browser
import Html exposing(div,text,input,button)
import Html.Events exposing (onClick,onInput)
import String exposing(fromInt,toInt)
import Debug exposing(log)




type Messages=
    ShowText

init=
    {
        hi="Hello world"
    }

update msg model=
    model

main=Browser.sandbox{
    init=init,
    view=view,
    update=update
    }

view model=div [] [
    text (  model.hi)
    ]