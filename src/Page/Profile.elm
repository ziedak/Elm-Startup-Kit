module Page.Profile exposing (Model, Msg, init, subscriptions, toSession, update, view)

{-| An Author's profile.
-}

import Api exposing (Cred)
import Api.Endpoint as Endpoint

import Components.Avatar as Avatar exposing (Avatar)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Components.Loading as Loading
import Log
import Page


import Profile exposing (Profile)
import Route
import Session exposing (Session)
import Task exposing (Task)
import Time
import Url.Builder
import Components.Username as Username exposing (Username)
import Viewer exposing (Viewer)




-- MODEL


type alias Model =
    { session : Session
    , author : Username
    }



init : Session -> Username -> ( Model, Cmd Msg )
init session username =
    let
        maybeCred =
            Session.cred session
    in
    ( { session = session
      , author = username

      }
    , Cmd.none
    )


-- VIEW


view : Model -> { title : String, content : Html Msg }
view model =
    let
        title =
            titleForMe (Session.cred model.session)  model.author

    in
    { title = title
    , content =
            div [ class "profile-page" ]
                [  div [ class "user-info" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ]
                            [ div [ class "col-xs-12 col-md-10 offset-md-1" ]
                                [
                                 h4 [] [ Username.toHtml  model.author ]
                                ]
                            ]
                        ]
                    ]

                ]

    }



-- PAGE TITLE


titleForOther : Username -> String
titleForOther otherUsername =
    "Profile — " ++ Username.toString otherUsername


titleForMe : Maybe Cred -> Username -> String
titleForMe maybeCred username =
    case maybeCred of
        Just cred ->
            if username == Api.username cred then
                myProfileTitle

            else
                defaultTitle

        Nothing ->
            defaultTitle


myProfileTitle : String
myProfileTitle =
    "My Profile"


defaultTitle : String
defaultTitle =
    "Profile"



-- UPDATE


type Msg
    =GotSession Session



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of

        GotSession session ->
            ( { model | session = session }
            , Route.replaceUrl (Session.navKey session) Route.Home
            )




-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Session.changes GotSession (Session.navKey model.session)



-- EXPORT


toSession : Model -> Session
toSession model =
    model.session
