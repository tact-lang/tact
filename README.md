# Experimental Implementation of TACT language compiler

This is an experimental implementation of a TACT language in typescript. This implementation aims to become production ready soon, but all developers must test their contracts before rolling out them in production.

## Installation

TACT is distributed via NPM, to install tact into your project, you need:

```bash
yarn install ton-tact
```

TACT doesn't have environment dependencies and have everything built in. TACT's stdlib also distributed together with a compiler.

## Compilation pipeline

TACT compiler performs translation from TACT to FunC, then compiles FunC into binary. Compilation process is divided in several pipelines that are separately tested.

### Stage 1. Grammar Parsing and AST building

In this stage compilator parses source code and builds an AST of a code. Only syntax correctness verified here.

Status: Stable 🚀
Output: Valid AST of a code.

### Stage 2. Extraction of type descriptors

In this stage compilator extracts all declared types such as primitives, contracts, structs and native bindings. During this process all referenced types in fields, function arguments and return types are matched with declarations and checked that everything is correct.

Status: Stable 🚀
Output: All type declarations with valid type references

### Stage 3. Expressions and statements checks

This stage traverses all statements and expressions and checks that all types are correct.

Status: Alpha 🛑. Currently, only basic expression types are checked.
Output: All expressions and statements are correctly typed and all variables have correct references.

### Stage 5. Local optimizations

This stage traverses all expressions and statements and removes unsuded one, reduces some operations.

Status: Missing 🧨
Output: Optimized AST.

### Stage 4. Storage allocation

This stage takes all exported functions, structures and contracts and performs allocation of a fields in Cell tree that then would be used for serialization and parsing.

Status: Beta 🛑. Works correctly, but not optimal.
Output: Storage layout for all declared types.

### Stage 5. Code generation

This stage outputs ABI and FunC code that is ready to use.

Status: Alpha 🛑. Mostly implemented, but still sub-optimal and not well tested.
Output: Ready to use FunC contract code.