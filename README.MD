# ELM Statup App

## Development Build

[Install Elm](https://guide.elm-lang.org/install.html) , then from the root project directory, run this:

```
$ elm make src/Main.elm --output build/elm.js
```

If you want to include the time-traveling debugger, add `--debug` like so:

```
$ elm make src/Main.elm --output build/elm.js --debug
```

To view the site in a browser, bring up `index.html` from any local HTTP server, for example [`http-server`](https://www.npmjs.com/package/http-server).
OR just run:

```
$  elm reactor
```

Go to [Elm local server](http://localhost:8000) : http://localhost:8000 to see your project dashboard.

## Production Build

First compile `elm.js` using `elm make` with `--optimize`, and then Uglify the result.
