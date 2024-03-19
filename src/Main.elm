module Main exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (class, placeholder, type_)
import Html.Events exposing (onClick, onInput)



-- MODEL


type alias Model =
    { email : String
    , password : String
    }


initialModel : Model
initialModel =
    { email = ""
    , password = ""
    }



-- UPDATE


type Msg
    = UpdateEmail String
    | UpdatePassword String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateEmail newEmail ->
            { model | email = newEmail }

        UpdatePassword newPassword ->
            { model | password = newPassword }

        Submit ->
            -- Here you would handle form submission, e.g., send the data to a server
            model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input [ type_ "email", placeholder "Email", onInput UpdateEmail ] []
            ]
        , div []
            [ input [ type_ "password", placeholder "Password", onInput UpdatePassword ] []
            ]
        , div []
            [ button [ onClick Submit ] [ text "Sign In" ]
            ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }
