# ElixirCtfeExample

An example of parsing and embedding file contents at compile time

> as a short demo after the [Explore Templates and CTFE](https://www.meetup.com/Munich-D-Programmers/events/244112572/) D language meetup

[![Build Status](https://travis-ci.org/d-led/elixir_ctfe_example.svg?branch=master)](https://travis-ci.org/d-led/elixir_ctfe_example)

```
$ mix clean && mix compile
Compiling 1 file (.ex)
==== Reading priv/embed_this.txt at compile time ... Hello;World!
Generated elixir_ctfe_example app
$ mix run
==== This is printed at run time: <<< Hello, World! >>>
$ mix run
==== This is printed at run time: <<< Hello, World! >>>
```

Application source: [application.ex](lib/elixir_ctfe_example/application.ex)

Text to embed: [embed_this.txt](priv/embed_this.txt)

Elixir school: [unquote](https://elixirschool.com/en/lessons/advanced/metaprogramming/#unquote)
