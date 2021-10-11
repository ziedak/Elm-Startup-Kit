module Components.Email exposing (Email, decoder, encode, toString)

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type Email
    = Email String


toString : Email -> String
toString (Email str) =
    str


encode : Email -> Value
encode (Email str) =
    Encode.string str


decoder : Decoder Email
decoder =
    Decode.map Email Decode.string
