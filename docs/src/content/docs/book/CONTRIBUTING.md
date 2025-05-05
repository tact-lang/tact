# Hacking on Tact

## General information

The Tact smart contract programming language is a statically-typed smart contract programming language currently implemented as a transpiler into [FunC](https://docs.ton.org/v3/documentation/smart-contracts/func/overview), which compiles down to the [TVM](https://docs.ton.org/learn/tvm-instructions/tvm-overview) bitcode. This implementation strategy is likely to change in the future.

The Tact compiler parses the input source code into an abstract syntax tree, type-checks it, generates FunC code, and runs the FunC compiler, which produces the corresponding [Fift](https://docs.ton.org/develop/fift/overview) code and a TVM binary in the [BoC](https://docs.ton.org/develop/data-formats/cell-boc) format.

Besides TVM binaries, the Tact compiler generates TypeScript "wrappers" to conveniently test Tact contracts locally in a simulated blockchain environment using, for instance, the standard de-facto [Sandbox](https://github.com/ton-org/sandbox) package.

Additionally, it generates summaries for humans and machines in Markdown and JSON formats.
The summaries include information like

- binary code size,
- [TL-B](https://docs.ton.org/develop/data-formats/tl-b-language) schemas for the program types, including contract storage and message formats,
- TVM [exit codes](https://docs.ton.org/learn/tvm-instructions/tvm-exit-codes),
- trait inheritance and contract dependency diagrams.

Currently, Tact does not have a (formal) language specification, so one needs to consult the [Tact docs](https://docs.tact-lang.org) and the tests in this repository.

The list of known bugs can be obtained using the following GitHub request: <https://github.com/tact-lang/tact/issues?q=is%3Aopen+is%3Aissue+label%3Abug>.

The document outlines how you can contribute and provides information about different components of the compiler, including their entry points.

## Get involved

There are many ways to contribute to Tact, and many of them do not involve writing any code. Here are few ideas to get started:

- Simply [start using Tact](https://docs.tact-lang.org/#start). Does everything work as expected? If not, we are always looking for improvements. Let us know by [opening an issue](https://github.com/tact-lang/tact/issues/new/choose).
- Look through the [open issues](https://github.com/tact-lang/tact/issues). Share your ideas, provide workarounds, or ask for clarification. Tact is there to help.
- If you find an issue you would like to fix, [open a pull request](#pull-requests).
- Alternatively, we invite you to create new educational materials in any form, help foster the [community](../README.md#community), and build new [Tact contracts and projects](../README.md#tact-in-production).

### Pull requests

If your future pull request (PR) does not close a particular issue, please create the issue first and describe the whole context: what you're adding/changing and why you're doing so. Then, after some discussion, open a PR to close that issue.

If you are only fixing a bug, it is fine to submit a pull request right away, but we still recommend that you [file an issue](https://github.com/tact-lang/tact/issues/new/choose) detailing what you're fixing. This is helpful in case we don't accept that specific fix but want to keep track of the issue. Additionally, by discussing the issue first, we might discover a better solution together, and there might not be any need for you to implement it yourself.

Furthermore, unrelated and/or undiscussed refactorings are less likely to be merged. Especially if they're made without introducing tests that demonstrate the contribution is correctly implemented. This usually includes positive and negative tests, showing the happy path(s), and featuring intentionally broken cases.

In general, small pull requests that do not perform any refactorings are much easier to review and more likely to get merged.

### Code quality

To pass review, the code has to conform to our [styleguide](./STYLEGUIDE.md).

### Linting

To pass CI, one needs to have a warning-free build. To run all the lints described below, execute the following command in your terminal:

```shell
yarn lint:all
```

### Linting the entire codebase with ESLint

Running [ESLint](https://eslint.org) across the whole Tact codebase:

```shell
yarn lint
```

### Spell-checking

To spell-check the entire codebase with [CSpell](http://cspell.org), run:

```shell
yarn spell
```

### Knip

The [Knip](https://knip.dev) tool checks issues with the compiler dependencies and API.
It can be run with

```shell
yarn knip
```

## The Tact dependencies

Tact is implemented in TypeScript. The minimum required version for Node.js is 22.

The rest of the build and development dependencies are specified, as usual, in the [`package.json`](../package.json) file, and the most important ones are described in the present document.

Tact's pipeline uses a patched version of the FunC compiler vendored as a WASM binary with some JS wrappers; see the following files:

- [`src/func/funcfiftlib.js`](../src/func/funcfiftlib.js)
- [`src/func/funcfiftlib.wasm`](../src/func/funcfiftlib.wasm)
- [`src/func/funcfiftlib.wasm.js`](../src/func/funcfiftlib.wasm.js)

The message of the commit [`f777da3213e3b064a7f407b2569cfd546cca277e`](https://github.com/tact-lang/tact/commit/f777da3213e3b064a7f407b2569cfd546cca277e) explains how the patched version was obtained. We had to patch the FunC compiler because the corresponding [FunC compiler issue](https://github.com/ton-blockchain/ton/issues/971) was unresolved at the time of writing.

## Building Tact

The most up-to-date recipe to build Tact is described in the [`.github/workflows/tact.yml`](../.github/workflows/tact.yml) GitHub Actions file.

## Using locally built versions of Tact in projects

See: [Using unreleased versions of tools early](https://github.com/tact-lang/tact/wiki/Using-unreleased-versions-of-tools-early).

## Running CLIs

To run the [Tact's CLI](#compiler-driver), use either of the following commands:

```shell
# If Tact is not built, but dependencies are installed via yarn install
npx ts-node src/cli/tact/index.ts

# If Tact is built via yarn build:fast
node bin/tact.js
```

To run the [BoC disassembly's CLI](#boc-disassembly), use either of the following commands:

```shell
# If Tact is not built, but dependencies are installed via yarn install
npx ts-node src/cli/unboc/index.ts

# If Tact is built via yarn build:fast
node bin/unboc.js
```

## Profiling CLIs

Use the [`0x`](https://npmjs.com/package/0x) tool to profile and visualize stack traces of the Tact compiler or [other CLIs](#running-clis). `0x` generates interactive flamegraphs to help identify performance bottlenecks in the code.

For example, let's profile the Tact compiler on compiling a certain contract from our [benchmarks suite](#benchmarks):

```shell
# Requires Tact compiler to be built beforehand
npx 0x ./bin/tact.js ./src/benchmarks/jetton/minter.tact
```

After the compilation, a folder containing the profiling results will be created. It will include the self-contained interactive `.html` page with flamegraph visualization — open it in your browser of choice to see and filter the results.

The X-axis represents the profile population (not time), and the Y-axis represents the stack depth. Colors can help differentiate between functions, and the width of each block corresponds to the CPU time it took: the wider the block, the longer it took to compute that function call.

Using the search input on the top right, you can highlight certain functions on the flamegraph.

See `npx 0x --help` for more options, including:

- `-D/--output-dir`, which is used to specify the artifact output directory.
- `-o/--open`, which automatically opens the flamegraph after finishing the run.

## Testing Tact implementation

We use [Jest](https://jestjs.io) as our testing framework. Jest supports a combination of snapshot and expectation tests.

Some tests are put in the same folder as the implementation and can be located in the `*.spec.ts` files; other tests are grouped into categories in the [src/test](../src/test) folder. The [project map section](#project-map) has more information on tests relevant to each compiler component.

To rebuild the compiler and run end-to-end tests, the usual workflow is as follows:

```shell
# build the compiler, but skip typechecking of the test files
yarn build:fast
# build the test contracts and benchmarks
yarn gen:contracts:fast
# run all tests except the slow property-based map tests
yarn test:fast
```

### How to update test snapshots

Updating all the test snapshots:

```shell
yarn test -u
```

Updating a subset of the test snapshots can be done like so:

```shell
yarn test -u spec-name-pattern1 spec-name-pattern2
```

Beware that updating snapshots from Javascript Debug Terminal in VSCode might lead to unexpected results. E2E CLI tests check `stderr` of child `tact` processes, but JS Debug Terminal adds "Debugger attached" messages into it.

## Coverage

To compute coverage, run

```shell
yarn istanbul
```

The log will be generated into `/coverage` folder. For better UX, serve its contents locally with

```shell
cd coverage
npx http-server . -p 3000
```

## Benchmarks

The benchmark system tracks gas consumption changes after making changes to the compiler.

To run benchmarks:

```shell
yarn bench
```

To run benchmarks and print comparison table

```shell
yarn bench
```

There are a few table print modes, you can set them with:

```shell
cross-env PRINT_MODE="first-last" yarn bench
```

Print modes:

- **`first-last`**: Displays only the first and last benchmark results for comparison. This is useful for quickly identifying overall changes between the initial and most recent benchmarks.
- **`full`**: Displays all benchmark results in detail. This mode provides a comprehensive view of all historical benchmark data.
- **`last-diff`**: Displays the last three benchmark results to highlight recent changes. This mode is helpful for tracking incremental updates and their impact.

Default print mode is `full`.

### Updating benchmarks

To update historical benchmarks with `results.json`:

```shell
yarn bench:update
```

To add new row to `results.json`:

```shell
yarn bench:add
```

### Adding a new benchmark

To add a new benchmark:
1. Create a new folder: `src/benchmarks/<your-benchmark-name>/` 
2. Inside it, add the following subfolders as needed:
4. Run `yarn gen:contracts:benchmarks` to recompile benchmarks.
5. Add additional benchmark   

## Project map

### Compiler driver

Tact's command-line interface (CLI) is located in [`bin/tact.js`](../bin/tact.js).
It can be run with:

```shell
# If Tact is not built, but dependencies are installed via yarn install
npx ts-node src/cli/tact/index.ts

# If Tact is built via yarn build:fast
node bin/tact.js
```

Tact uses an in-house CLI arguments parser listed in [`src/cli/arg-parser.ts`](../src/cli/arg-parser.ts).

The main entry point for the Tact CLI is [`src/cli/tact/index.ts`](../src/cli/tact/index.ts) and [`src/pipeline/build.ts`](../src/pipeline/build.ts) is the platform-independent compiler driver which contains the high-level compiler pipeline logic described above.

The Tact CLI gets Tact settings from a `tact.config.json` file or creates a default config for a single-file compilation mode. The format of `tact.config.json` files is specified in [`src/config/configSchema.json`](../src/config/configSchema.json).

The so-called "pre-compilation" steps, which include imports resolution, type-checking, and building schemas for high-level Tact data structures to be serialized/deserialized as cells (this step is dubbed "allocation"), are located in [`src/pipeline/precompile.ts`](../src/pipeline/precompile.ts).

Besides the terminal, the Tact compiler is supposed to work in browser environments as well.

Some CLI tests can be found in [`.github/workflows/tact.yml`](../.github/workflows/tact.yml) GitHub Action file.

### BoC disassembly

In addition to the compiler, Tact bundles the BoC disassembly from the [`@tact-lang/opcode`](https://npmjs.com/package/@tact-lang/opcode) package.

Its command-line interface (CLI) is located in [`bin/unboc.js`](../bin/unboc.js).
It can be run with:

```shell
# If Tact is not built, but dependencies are installed via yarn install
npx ts-node src/cli/unboc/index.ts

# If Tact is built via yarn build:fast
node bin/unboc.js
```

For more info, refer to the package's GitHub repository: [`tact-lang/ton-opcode`](https://github.com/tact-lang/ton-opcode).

### Parser

The [`src/grammar/grammar.peggy`](../src/grammar/grammar.peggy) file contains the Tact grammar expressed in the PEG language of the [pgen](https://github.com/tact-lang/syntax-tools/tree/main/packages/pgen) parser generator.

The helper file [`src/grammar/index.ts`](../src/grammar/index.ts) contains the logic that transforms concrete syntax trees produced with the help of parser into abstract syntax trees (ASTs) defined in [src/ast/ast.ts](../src/ast/ast.ts). The index.ts file also does grammar validation, like checking that function or constant attributes are not duplicated or that user identifiers do not start with specific reserved prefixes.

The [`src/grammar/test`](../src/grammar/test) folder contains Tact to test the parse: `.tact` files are expected to parse without any issues, and `.fail.tact` files should result in parser errors. The parser error messages and the locations they point to are fixed in the [`src/grammar/**snapshots**/grammar.spec.ts.snap`](../src/grammar/__snapshots__/grammar.spec.ts.snap) Jest snapshot file.

### Standard Library

The [`src/stdlib/stdlib`](../src/stdlib/stdlib) folder contains the source code of the standard library. It has two subfolders:

- [`src/stdlib/stdlib/std`](../src/stdlib/stdlib/std) contains ambient definitions that are present in every `.tact` file. It's loaded automatically by the compiler and should never otherwise be included.
- [`src/stdlib/stdlib/libs`](../src/stdlib/stdlib/libs/) contains standard library exports available via `@stdlib/...` imports from source code. The source code inside of these files is just a regular `.tact` source and shouldn't import anything from the `/std` folder either.

The library is built by the `yarn gen:stdlib` script into a [`stdlib.ts`](../src/stdlib/stdlib.ts) file that holds the base64 of all the Tact and FunC sources in the library. Whenever the standard library's source code changes, a new `stdlib.ts` must be generated.

Whenever CLI (or external tooling) needs to access the source of the standard library, it should initialize the virtual filesystem from `stdlib.ts`. Accessing the source of the standard library directly is error-prone and discouraged. For example, the standard library might not be found if the compiler is included as a library.

### Typechecker

The Tact type-checker implementation can be found mainly in the following files:

- [`src/types/resolveDescriptors.ts`](../src/types/resolveDescriptors.ts) takes care of checking at the level of module items, data type definitions, function signatures, etc., and it does not deal with statements (so it does not traverse function bodies);
- [`src/types/resolveStatements.ts`](../src/types/resolveStatements.ts) checks statements and statements blocks;
- [`src/types/resolveExpression.ts`](../src/types/resolveExpression.ts) type-checks the Tact expressions.

The current implementation of the typechecker is going to be significantly refactored, as per [issue #458](https://github.com/tact-lang/tact/issues/458). The corresponding pull request will formally specify the Tact typing rules.

Until we have the Tact type system specified, the only source of information about it would be the aforementioned Tact docs and the tests in the following locations:

- [`src/types/test`](../src/types/test): positive well-formedness tests at the level of data types, contracts, traits, and function signatures;
- [`src/types/test-failed`](../src/types/test-failed): negative well-formedness tests at the level of data types, contracts, traits, and function signatures;
- [`src/types/stmts`](../src/types/stmts): positive type-checking tests at the level of function bodies;
- [`src/types/stmts-failed`](../src/types/stmts-failed): negative type-checking tests at the level of function bodies;
- [`src/test/compilation-failed`](../src/test/compilation-failed): negative type-checking tests that require full environment, for instance, the standard library (the other tests in `src/types` don't have access to the full environment).

### Constant evaluator

The constant evaluator is used as an optimizer to prevent some statically known expressions from being evaluated at run-time and increase the gas consumption of the contracts. It will later be extended to perform partial evaluation of contracts and use various simplification rules, such as applying some algebraic laws, to further reduce the gas consumption of contracts at run-time.

The constant evaluator supports a large subset of Tact and handles, for instance, constants defined in terms of other constants, built-in and user-defined functions, logical and arithmetic operations.

The main logic of the constant evaluator is in the file [`src/optimizer/interpreter.ts`](../src/optimizer/interpreter.ts).

You can find the relevant tests in [`src/test/e2e-emulated/constants/constants.tact`](../src/test/e2e-emulated/constants/constants.tact) and the corresponding spec-file: [`src/test/e2e-emulated/constants/constants.spec.ts`](../src/test/e2e-emulated/constants/constants.spec.ts).

The negative tests for constant evaluation are in the Tact files prefixed with `const-eval` in the [`src/test/compilation-failed/contracts`](../src/test/compilation-failed/contracts) folder.

### Code generator

Some general information on how Tact code maps to FunC is described in the Tact docs: <https://docs.tact-lang.org/book/func>.

The code generator lives in the [`src/generator`](../src/generator) sub-folder with the entry point in [`src/generator/writeProgram.ts`](../src/generator/writeProgram.ts).

The implementation that we have right now is being refactored to produce FunC ASTs and then pretty-print those ASTs as strings instead of producing source FunC code in one step. Here is the relevant pull request: <https://github.com/tact-lang/tact/pull/559>.

One can find the end-to-end codegen test spec files in the [`src/test/e2e-emulated`](../src/test/e2e-emulated) folder. The test contracts are located in the subfolders of the [`src/test/e2e-emulated`](../src/test/e2e-emulated) folder. Many of those spec files test various language features in relative isolation.
An important spec file that tests argument passing semantics for functions and assignment semantics for variables is here: [`src/test/e2e-emulated/semantics.spec.ts`](../src/test/e2e-emulated/functions/semantics.spec.ts).

Contracts with `inline` in the name of the file set `experimental.inline` config option to `true`.
Contracts with `external` in the name of the file set the `external` config option to `true`.

Note: If you add an end-to-end test contract, you must also run `yarn gen` to compile it and create TypeScript wrappers.

`yarn gen` also re-compiles test contracts, so running it when code generation is changed is essential.

Some other codegen tests are as follows:

- [`src/test/gas-consumption`](../src/test/gas-consumption/): check gas consumption;
- [`src/test/exit-codes`](../src/test/e2e-emulated/exit-codes): test that certain actions produce the expected exit codes;
- [`src/test/codegen`](../src/test/codegen): test that these contracts compile just fine without running any dynamic tests: bug fixes for FunC code generation often add tests into this folder.

### Benchmarks

Every benchmark now lives in its own directory inside `src/benchmarks/<benchmark‑name>/`.

#### File & folder roles

| Path / file                    | Purpose                                                                                   |
|--------------------------------|-------------------------------------------------------------------------------------------|
| `tact/*.tact`                  | Tact source code that is being benchmarked                                                |
| `func/*.fc`                    | Equivalent FunC code that we compare against                                              |
| `<benchmark>.spec.ts`          | Jest test spec that prepares and runs the benchmark                                       |
| `results_gas.json`             | Aggregated gas‑consumption results, updated by the CLI                                    |
| `results_code_size.json`       | Contract byte‑code size history, also updated by the CLI                                  |

> **CLI support** – All commands for creating, updating, or comparing benchmarks are documented in the [Updating Benchmarks](#benchmarks) section.

### Pretty-printer and AST comparators

The entry point to the Tact AST pretty-printer is [`src/ast/ast-printer.ts`](../src/ast/ast-printer.ts). It will be used for the Tact source code formatter once the parser keeps comments and other relevant information.

### Build scripts and test helpers

The project contains special TypeScript files with the `.build.ts` extension used for build processes and testing purposes. These files are not included in the published NPM package.

A typical example is [`test/contracts.build.ts`](https://github.com/tact-lang/tact/blob/132fe4ad7f030671d28740313b9d573fd8829684/src/test/contracts.build.ts) which builds contract tests.

When adding new build or test scripts, make sure to use the `.build.ts` extension to keep them separate from the main compiler code.

## Random AST Expression Generation

To generate and inspect random Abstract Syntax Trees (ASTs), you can use the `yarn random-ast` command. This command generates a specified number of random Abstract Syntax Trees (ASTs) and pretty-prints them.

Note: At the moment, only Ast Expression will be generated

### Usage

`yarn random-ast <count>`

Where `<count>` is the number of random expressions to generate.

### Example

```shell
yarn random-ast 42
```

It will produce 42 random expressions and pretty-print them in the terminal.

The implementation can be found in [`random-ast.ts`](../src/ast/random-ast.ts).
