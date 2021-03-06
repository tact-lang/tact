# Tact
<div align="left">
  <a href="https://github.com/tact-lang/tact/actions">
    <img src="https://github.com/tact-lang/tact/actions/workflows/ci.yml/badge.svg">
  </a>
  <a href="https://t.me/tactlang">
    <img src="https://img.shields.io/badge/help-t.me%2Ftactlang-blue">
  </a>
</div>

## Building from source

* Install `opam` using this [guide](https://ocaml.org/learn/tutorials/up_and_running.html)
* Run following commands:
```
opam init
opam switch create $(pwd) --with-test -y
eval $(opam env)
dune build && dune install
```

You can now use `tact /path/to/file.tact`

## Development instructions

### Updating dependencies

Run `opam install . --working-dir --deps-only --with-test`

### Running REPL

Run `dune utop lib`

### Running tests

Run `dune test`

### Formatting code

Run `dune build @fmt --auto-promote` (or no `--auto-promote` if you want to review changes, followed
by `dune promote`)

### Working with expect-based tests

`ppx_expect`
[ppx_expect](https://github.com/janestreet/ppx_expect) tests allow to check output against an expectation
and upon failure, they produce a diff, which can be easily applied to the original source code by running
`dune promote` if the output is deemed to be correct. This allows us to write:

```ocaml
pp source ; [%expect {||}]
```

to fill in the blanks. In this particular case, it's useful to run `dune test --auto-promote`

### JavaScript bindings

Can be built during `dune build` or `dune build js` and will be available in
` _build/default/js/tact_js.bc.js`

In order to build a (smaller) release build, one should run:

```
dune build js --profile=release
```
