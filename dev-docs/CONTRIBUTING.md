# Hacking on Tact

## General information

The Tact smart contract programming language is a statically-typed smart contract programming language which is currently implemented as a transpiler into [FunC](https://docs.ton.org/v3/documentation/smart-contracts/func/overview), which in its turn compiles down to the [TVM](https://docs.ton.org/learn/tvm-instructions/tvm-overview) bitcode. This implementation strategy is likely to change in the future.

The Tact compiler parses the input source code into an abstract syntax tree, type-checks it, generates FunC code, runs the FunC compiler, which produces the corresponding [Fift](https://docs.ton.org/develop/fift/overview) code and a TVM binary in the [BoC](https://docs.ton.org/develop/data-formats/cell-boc) format.

Besides TVM binaries, the Tact compiler generates TypeScript "wrappers" to conveniently test Tact contracts locally in a simulated blockchain environment using, for instance, the standard de-facto [Sandbox](https://github.com/ton-org/sandbox) package.

Additionally, it generates summaries for humans and machines in Markdown and JSON formats.
The summaries include information like

- binary code size,
- [TL-B](https://docs.ton.org/develop/data-formats/tl-b-language) schemas for the program types including contract storage and message formats,
- TVM [exit codes](https://docs.ton.org/learn/tvm-instructions/tvm-exit-codes),
- trait inheritance and contract dependency diagrams.

Currently, Tact does not have a (formal) language specification, so one needs to consult the [Tact docs](https://docs.tact-lang.org) and the tests in this repository.

The list of known bugs can be obtained using the following GitHub request: <https://github.com/tact-lang/tact/issues?q=is%3Aopen+is%3Aissue+label%3Abug>.

More detail about different part of the compiler including their corresponding entry points can be found below.

## The Tact dependencies

Tact is implemented in TypeScript. The minimum required version for Node.js is 22.

The rest of the build and development dependencies are specified, as usual, in the [package.json](../package.json) file and the most important ones are described in the present document.

Tact's pipeline uses a patched version of the FunC compiler vendored as a WASM binary with some JS wrappers, see the following files:

- [src/func/funcfiftlib.js](../src/func/funcfiftlib.js)
- [src/func/funcfiftlib.wasm](../src/func/funcfiftlib.wasm)
- [src/func/funcfiftlib.wasm.js](../src/func/funcfiftlib.wasm.js)

The message of the commit [`f777da3213e3b064a7f407b2569cfd546cca277e`](https://github.com/tact-lang/tact/commit/f777da3213e3b064a7f407b2569cfd546cca277e) explains how the patched version was obtained. We had to patch the FunC compiler because the corresponding [FunC compiler issue](https://github.com/ton-blockchain/ton/issues/971) is unresolved at the time of writing.

## Building Tact

The most up-to-date recipe to build Tact is described in [.github/workflows/tact.yml](../.github/workflows/tact.yml) GitHub Actions file.

## Testing Tact implementation

As our testing framework we use [Jest](https://jestjs.io). We use a combination of snapshot and expectation tests supported by Jest.

Some tests are put in the same folder with the implementation and can be located in `*.spec.ts` files,
other tests are grouped into categories in the [src/test](../src/test) folder. The project map section has more information on tests relevant for each compiler component.

### How to update test snapshots

Updating all the test snapshots:

```shell
yarn test -u
```

Updating a subset of the test snapshots can be done like so:

```shell
yarn test -u spec-name-pattern1 spec-name-pattern2
```

## Benchmarks

The benchmarks system is used to track gas consumption changes after making changes to the compiler.

To run benchmarks:

```shell
yarn bench
```

### Adding a new benchmark

To add a new benchmark:

1. Add `*.tact` file to `src/test/benchmarks/contracts`
2. Recompile the benchmarks with `yarn gen:contracts:benchmarks`
3. Add additional benchmark to `src/test/benchmarks/benchmarks.spec.ts`

## Code quality

To pass review, code has to conform to our [styleguide](./STYLEGUIDE.md).

## Linting

To pass CI, one needs to have a warning-free build. To run all the lints described below execute the following command in your terminal:

```shell
yarn lint:all
```

### Linting the entire codebase with ESLint

Running [ESLint](https://eslint.org) across the whole Tact codebase:

```shell
yarn lint
```

### Spell-checking

To spell-check the entire codebase with [CSpell](http://cspell.org) run:

```shell
yarn spell
```

### Knip

The [Knip](https://knip.dev) tool is used to check issues with the compiler dependencies and API.
It can be run with

```shell
yarn knip
```

## Project map

### Compiler driver

Tact's command-line interface (CLI) is located in [bin/tact.js](../bin/tact.js).
Tact uses the [meow](https://github.com/sindresorhus/meow) CLI arguments parser.

The main entry point for the Tact CLI is [src/cli/tact/index.ts](../src/cli/tact/index.ts) and [src/pipeline/build.ts](../src/pipeline/build.ts) is the platform-independent compiler driver which contains the high-level compiler pipeline logic described above.

The Tact CLI gets Tact settings from a `tact.config.json` file or creates a default config for a single-file compilation mode. The format of `tact.config.json` files is specified in [src/config/configSchema.json](../src/config/configSchema.json).

The so-called "pre-compilation" steps that include imports resolution, type-checking, building schemas for high-level Tact data structures to be serialized/deserialized as cells (this step is dubbed "allocation") are located in [src/pipeline/precompile.ts](../src/pipeline/precompile.ts).

Besides the terminal, the Tact compiler is supposed to work in browser environments as well.

Some CLI tests can be found in [.github/workflows/tact.yml](../.github/workflows/tact.yml) GitHub Action file.

### Parser

The [src/grammar/grammar.ohm](../src/grammar/prev/grammar.ohm) file contains the Tact grammar expressed in the PEG-like language of the [Ohm.js](https://ohmjs.org) parser generator.

The helper file [src/grammar/grammar.ts](../src/grammar/prev/grammar.ts) contains the logic that transforms concrete syntax trees produced with the help of the Ohm.js-generated parser into abstract syntax trees (ASTs) defined in [src/ast/ast.ts](../src/ast/ast.ts). The grammar.ts file also does a bit of grammar validation, like checking that function or constant attributes are not duplicated or that user identifiers do not start with certain reserved prefixes.

The [src/grammar/test](../src/grammar/test) folder contains Tact files that are supposed to be parsed without any issues, and the [src/grammar/test-failed](../src/grammar/test-failed) folder contains grammatically incorrect test files which should result in parser errors. The parser error messages and the locations they point to are fixed in the [src/grammar/**snapshots**/grammar.spec.ts.snap](../src/grammar/prev/__snapshots__/grammar.spec.ts.snap) Jest snapshot file.

### Standard library

The [src/stdlib/stdlib](../src/stdlib/stdlib) folder contains source code of standard library. It has two subfolders:

- [src/stdlib/stdlib/std](../src/stdlib/stdlib/std) contains ambient definition that are present in every `.tact` file. It's loaded automatically by compiler, and should never otherwise be included.
- [src/stdlib/stdlib/libs](../src/stdlib/stdlib/libs/) contains standard library exports available via `@stdlib/...` imports from source code. Source code inside of these files is just a regular `.tact` source, and shouldn't import anything from `/std` folder either.

The library is built by `yarn gen:stdlib` script into [stdlib.ts](../src/stdlib/stdlib.ts) file that holds base64 of all Tact and FunC sources in the library. Whenever source code of standard library was changed, a new `stdlib.ts` must be generated.

Whenever CLI (or external tooling) needs to access the source of the standard library, it should initialize the virtual filesystem from `stdlib.ts`. Accessing the source of the standard library directly is error-prone and discouraged. For example, the standard library might not be found, if compiler is included as a library.

### Typechecker

The Tact type-checker's implementation can be found mostly in the following files:

- [src/types/resolveDescriptors.ts](../src/types/resolveDescriptors.ts) takes care of checking at the level of module-items, data type definitions, function signatures, etc. and it does not deal with statements (so does not traverse function bodies);
- [src/types/resolveStatements.ts](../src/types/resolveStatements.ts) checks statements and statements blocks;
- [src/types/resolveExpression.ts](../src/types/resolveExpression.ts) type-checks the Tact expressions.

The current implementation of the typechecker is going to be significantly refactored, as per [issue #458](https://github.com/tact-lang/tact/issues/458). The corresponding pull request will have formally specified the Tact typing rules.

Until we have the Tact type system specified, the only source of information about it would be the aforementioned Tact docs and the tests in the following locations:

- [src/types/test](../src/types/test): positive well-formedness tests at the level of data types, contracts, traits and function signatures;
- [src/types/test-failed](../src/types/test-failed): negative well-formedness tests at the level of data types, contracts, traits and function signatures;
- [src/types/stmts](../src/types/stmts): positive type-checking tests at the level of function bodies;
- [src/types/stmts-failed](../src/types/stmts-failed): negative type-checking tests at the level of function bodies;
- [src/test/compilation-failed](../src/test/compilation-failed): negative type-checking tests that require full environment, for instance, the standard library (the other tests in `src/types` don't have access to the full environment).

### Constant evaluator

The constant evaluator is used as an optimizer to prevent some statically known expressions from being evaluated at run-time and increase gas consumption of the contracts. It will be later extended to perform partial evaluation of contracts and use various simplification rules such as applying some algebraic laws to further reduce gas consumption of contracts at run-time.

The constant evaluator supports a large subset of Tact and handles, for instance, constants defined in terms of other constants, built-in and user-defined functions, logical and arithmetic operations.

The main logic of the constant evaluator can be found in the file [src/optimizer/interpreter.ts](../src/optimizer/interpreter.ts).

You can find the relevant tests in [src/test/e2e-emulated/contracts/constants.tact](../src/test/e2e-emulated/contracts/constants.tact) and the corresponding spec-file: [src/test/e2e-emulated/constants.spec.ts](../src/test/e2e-emulated/constants.spec.ts).

The negative tests for constant evaluation are contained in the Tact files prefixed with `const-eval` in the [src/test/compilation-failed/contracts](../src/test/compilation-failed/contracts) folder.

### Code generator

Some general information on how Tact code maps to FunC is described in the Tact docs: <https://docs.tact-lang.org/book/func>.

The code generator lives in the [src/generator](../src/generator) sub-folder with the entry point in [src/generator/writeProgram.ts](../src/generator/writeProgram.ts).

The implementation that we have right now is being refactored to produce FunC ASTs and then pretty-print those ASTs as strings instead of producing source FunC code in one step. Here is the relevant pull request: <https://github.com/tact-lang/tact/pull/559>.

One can find the end-to-end codegen test spec files in the [src/test/e2e-emulated](../src/test/e2e-emulated) folder. The test contracts are located in [src/test/e2e-emulated/contracts](../src/test/e2e-emulated/contracts) subfolder. Many of those spec files test various language features in relative isolation.
An important spec file that tests argument passing semantics for functions and assignment semantics for variables is here: [src/test/e2e-emulated/semantics.spec.ts](../src/test/e2e-emulated/semantics.spec.ts).

Contracts with `inline` in the name of the file set `experimental.inline` config option to `true`.
Contracts with `external` in the name of the file set `external` config option to `true`.

Note: If you add an end-to-end test contract, you also need to run `yarn gen` to compile it and create TypeScript wrappers.

`yarn gen` also re-compiles test contracts, so it's important to run it when code generation is changed.

Some other codegen tests are as follows:

- [src/test/benchmarks](../src/test/benchmarks): check gas consumption;
- [src/test/exit-codes](../src/test/exit-codes): test that certain actions produce the expected exit codes;
- [src/test/codegen](../src/test/codegen): test that these contracts compile just fine without running any dynamic tests: bug fixes for FunC code generation often add tests into this folder.

### Pretty-printer and AST comparators

The entry point to the Tact AST pretty-printer is [src/ast/ast-printer.ts](../src/ast/ast-printer.ts). It is going to be used for the Tact source code formatter once the parser keeps comments and other relevant information.

The AST comparator is defined in [src/ast/compare.ts](../src/ast/compare.ts). This is useful, for instance, for static analysis tools which can re-use the Tact TypeScript API.

The corresponding test spec files can be found in [src/test](../src/test) folder with the test contracts in [src/test/contracts](../src/test/contracts) folder.

## Build scripts and test helpers

The project contains special TypeScript files with the `.build.ts` extension that are used for build processes and testing purposes. These files are not included in the published NPM package.

A typical example is [test/contracts.build.ts](https://github.com/tact-lang/tact/blob/132fe4ad7f030671d28740313b9d573fd8829684/src/test/contracts.build.ts) which builds contract tests.

When adding new build or test scripts, make sure to use the `.build.ts` extension to keep them separate from the main compiler code.

## Random AST Expression Generation

To generate and inspect random Abstract Syntax Trees (ASTs), you can use the `yarn random-ast` command. This command generates a specified number of random Abstract Syntax Trees (ASTs) and pretty-prints them.

Note: At the moment only Ast Expression will be generated

### Usage

`yarn random-ast <count>`

Where `<count>` is the number of random expressions to generate.

### Example

`yarn random-ast 42`

This will produce 42 random expressions and pretty-print them in the terminal.

The implementation can be found in [random-ast.ts](../src/ast/random-ast.ts).
