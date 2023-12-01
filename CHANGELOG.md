# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.5] - 2023-12-01

### Added
- Continuous integration to run Tact tests on Linux, macOS and Windows: PR [#96](https://github.com/tact-lang/tact/pull/96)

### Changed
- Migration to `@ton` NPM packages: PR [#89](https://github.com/tact-lang/tact/pull/89)

### Fixed
- Struct and message identifiers need to be capitalized: PRs [#81](https://github.com/tact-lang/tact/pull/81) and [#83](https://github.com/tact-lang/tact/pull/83)
- Fixed the signature of the `checkDataSignature` function in `stdlib/std/crypto.tact`: PR [#50](https://github.com/tact-lang/tact/pull/50)
- Show location info for the internal compiler error 'Invalid types for binary operation': PR [#63](https://github.com/tact-lang/tact/pull/63)

## [1.1.4] - 2023-09-27

### Changed
- Hacked paths to support builds on Windows

## [1.1.3] - 2023-06-27

### Added
- bitwise and and or operations
- staticaly compile expressions with bitwise operations if possible

## [1.1.2] - 2023-04-27

### Added
- Add full ABI in bindings

## [1.1.1] - 2023-04-20

### Fixed
- Fix typescript bindings generation for custom key and value serialization formats
- Fix missing external messages in bindings

## [1.1.0] - 2023-04-19

### ⚡️ Breaking changes
- `reply` is now a method of `Contract` instead of global context and changed it's behaviour if storage reserve is non-zero in contract.
- Logical expressions are now calculated differently: `&&` now does not execute right expression if left is `false` and `||` does not execute right expression if left is `true`. Before it was executed in any case. This change is made in attempt to reduce unexpected behaviour.
- `OwnableTransferable` is now sends response to the sender.
- `overwrites` was renamed to `override`
- `Deployable` trait now sends non-bounceable notifications instead of bounceable ones.

### Features
- `Address` to `Address` maps
- Ability to define key and value serializations for maps
- `sha256` hashing
- `forward` and `notify` functions that can be used to send messages to other contracts using remaining value of incoming message
- `virtual` and `abstract` constants that can be shared between traits
- `storageReserve` constant in every contract that can be used to reserve some storage space by any trait
- `abstract` functions that can be implemented in contracts
- `FactoryDeployable` trait for deploying from factory contract
- `@stdlib/dns` for easier DNS resolution
- Opt-in `external` message support
- Typed `bounce` receiver and `bounce<T>` type modifier
- `commit` for committing state changes
- `inline` modifier for functions for inlining them into the caller
- Ability to define empty messages (but not structs)
- Some string-related operations are now computed at compile time if possible

### Fixed
- Signature of `preloadBits` function
- Fixed `readForwardFee` function

## [1.1.0-beta.28] - 2023-04-19

### Fixed
- Fix `func` invocation

## [1.1.0-beta.27] - 2023-04-14

### Fixed
- Remove tact-bindings binary reference

## [1.1.0-beta.26] - 2023-04-14

### Added
- Ability to define empty messages (but not structs)

## [1.1.0-beta.25] - 2023-04-14

### Added
- Support for bounced receivers for message structs

## [1.1.0-beta.24] - 2023-04-13

### Changed
- Bounced messages now skipped first 32 bits before passing it to receivers

### Fixed
- Passing optional structs as arguments

## [1.1.0-beta.23] - 2023-04-13

### Changed
- deploy trait now sends non-bounceable notifications
- changed `forward` and added bounceable and init arguments

### Added
- `Contract.notify()` non-bounceable alternative to reply

## [1.1.0-beta.22] - 2023-04-13

### Added
- `commit` function to commit state changes

## [1.1.0-beta.21] - 2023-04-13

### Fixed
- Work-around func `0.4.3` bug with pragma processing
- Fix external messages with arguments type checking

## [1.1.0-beta.20] - 2023-04-11

### Changed
- Upgrade `func` to `0.4.3`

## [1.1.0-beta.19] - 2023-04-10

### Fixed
- Fix bouncing unknown messages

## [1.1.0-beta.18] - 2023-04-10

### Added
- `FactoryDeployable` trait for deploying from factory contract

## [1.1.0-beta.17] - 2023-04-10

### Added
- Abstract functions
- Abstract and virtual constants in traits

### Changed
- Rename `overrides` to `override`
- Updated ownership transferring methods

### Removed
- Unused `public` modifier

## [1.1.0-beta.16] - 2023-04-09

### Changed
- `reply` now in contract instead of global context

## [1.1.0-beta.15] - 2023-04-09

### Added
- `asCell` to maps

## [1.1.0-beta.14] - 2023-04-09

### Fixed
- Fix `dnsResolveWallet` compilation error

## [1.1.0-beta.13] - 2023-04-09

### Added
- `dns` library
- map key and value serialization formats

## [1.1.0-beta.12] - 2023-04-08

### Fixed
- Upgrade decompiler to a `@tact-lang/opcodes@0.0.13`

## [1.1.0-beta.11] - 2023-04-08

### Fixed
- Signature of `preloadBits` function

## [1.1.0-beta.10] - 2023-04-08

### Added
- `sha256` function to compute sha256 hash of a text or byte string

## [1.1.0-beta.9] - 2023-04-02

### Added
- Opt-in external messages support

## [1.1.0-beta.8] - 2023-04-02

### Fixed
- Missing implementation  of `Address` to `Address` maps

## [1.1.0-beta.7] - 2023-03-28

### Added
- `inline` modifier for functions to inline them into the caller

### Fixed
- Fix missing `method_id` in `get_abi_ipfs` and `lazy_deployment_completed`

## [1.1.0-beta.6] - 2023-03-27

### Changed
- Optimization of gas usage of low level primitives

## [1.1.0-beta.5] - 2023-03-25

### Changed
- Optimization of `String.asComment()` that tries to compute it compile time if possible

## [1.1.0-beta.4] - 2023-03-23

### Added
- Ability to compare cells

### Fixed
- Fixed contract crash when equality check involving nullable variables

### Changed
- Change logic of `&&` and `||`. Now second argument is not calculated when first argument is `false` or `true` respectively.

## [1.1.0-beta.3] - 2023-03-22

### Added
- `emit` function to emit events

### Fixed
- Fixed possible inconsistent behaviour when calling mutating get methods from inside of the contract
- Fixed regression of order of functions in generated files

## [1.1.0-beta.2] - 2023-03-22

### Changed
- Tact now emits func in multiple files, optimized not only for blockchain, but also for human

## [1.1.0-beta.1] - 2023-03-20

### Fixed
- Some functions for deep structures with optionals not emitted
- Crash in bindings generator on boolean value in dictionary

## [1.1.0-beta.0] - 2023-03-14

### Fixed
- `overwrites` -> `override`
- Invalid `check` function error generation
- Error message for `address(0)`

## [1.0.0] - 2023-03-08

### Added
- `sender()` function to get message sender address

## [1.0.0-rc.13] - 2023-03-08

### Changed
- Upgrade `func` to `0.4.2`

### Fixed
- Windows paths support

## [1.0.0-rc.12] - 2023-03-03

### Fixed
- `pow` is now compile-only function

### Changed
- Use new FunC wasm bundle

## [1.0.0-rc.11] - 2023-03-02

### Added
- exported `check` function for language server support

## [1.0.0-rc.10] - 2023-03-02

### Changed
- Contracts now can be deployed only to the basic workchain unless `masterchain` set `true`
- Checking field initialisation in init function

## [1.0.0-rc.9] - 2023-03-01

### Changed
- Contracts now work only with basic workchain. To enable masterchain support set `masterchain: true` in `tact.conf.json`

### Added
- `pow` function for exponentiation
- `address()` compile-time function for creating addresses from strings
- `cell()` compile-time function for creating cells from base64 strings
- `interfaces` field to ABI
- report workchain support in interfaces

## [1.0.0-rc.8] - 2023-02-27

### Added
- `logger` interface to programmatic API

## [1.0.0-rc.7] - 2023-02-27

### Added
- `verify` function to verify compiled package

## [1.0.0-rc.6] - 2023-02-26

### Fixed
- Fixing npm exports

## [1.0.0-rc.5] - 2023-02-26

### Fixed
- Fixing npm exports for typescript

## [1.0.0-rc.4] - 2023-02-26

### Fixed
- Fixing npm exports for typescript

## [1.0.0-rc.3] - 2023-02-26

### Fixed
- Fixed browser/node typings and exports
- Fixed browser environment execution

## [1.0.0-rc.2] - 2023-02-26

### Fixed
- Fixed missing `mkdirp` dependency

## [1.0.0-rc.1] - 2023-02-26

### Fixed
- Fixed cli command

## [1.0.0-rc.0] - 2023-02-26

### Added
- `@ton-lang/compiler/node` to invoke compiler from node similar how cli works
- `@ton-lang/compiler/browser` to invoke compiler from browser

### Removed
- Removed jetton library from stdlib. It would be re-introduced after 1.0 version with more thought put into it.

## [0.10.1] - 2023-02-23

### Added
- Display line and column numbers in error messages to be able to navigate to the error in the editor

### Fixed
- Execution order of struct and message fields
- `initOf` argument type checks

## [0.10.0] - 2023-02-23

### Changed
- Tact contracts are now [Argument-addressable](https://docs.tact-lang.org/evolution/OTP-005) meaning that they depend on init arguments and code hash only. Init function is now called when first valid message is received.
- Refactoring of allocator
- Moving contract's load function to the beginning of the execution
- Moving contract's save function to the end of the execution
- moving `debug` flag from `experimental` to `parameters` in `tact.config.json`
- Unknown fields in config are now considered an error
- Allow contracts without fields
- Typescript bindings are now working in browser and doesn't have `ton-emulator` dependency
- `map` syntax now uses `<>` instead of `[]` for future compatibility with generics

### Added
- Allow `Builder` type as a field type similar to `Cell` and `Slice`
- Allow `String` type as a field type

## [0.9.3] - 2023-02-19

### Added
- Error codes in reports
- Client-friendly typescript bindings

### Changed
- Change repository locations

## [0.9.2] - 2023-02-05

### Added
- `emptyMap()` for creating empty maps
- Allowing assigning `null` value to a map variable (same as calling `emptyMap()`)

## [0.9.1] - 2023-02-03

### Changed
- Update `dump` function to handle booleans and strings, better type checking or arguments
- Report `org.ton.debug.v0` interface if debug mode is enabled
- Update bindings generator to support `ton-emulator >= v2.1.0` 

## [0.9.0] - 2023-02-02

### Added
- Importing `func` files

### Changed
- Upgrade `func` to `0.4.1`
- Enforce `func` version in generated files
- Enable critical pragmas by default
- Enable inlining in a lot of places thanks to fixed crashes in `func`

## [0.8.11] - 2023-01-28

### Fixed
- Optional `Address` fields in typescript bindings

### Added
- `Address.asSlice` for manual address parsing
- `@stdlib/content` library with `createOffchainContent` functions

### [0.8.10] - 2023-01-27

## Fixed
- `>>` and `<<` operations
- Type checking of struct constructors

## [0.8.9] - 2023-01-25

### Fixed
- Fix missing func compiler in distributive

## [0.8.8] - 2023-01-25

### Added
- TextMate Grammar for syntax highlighting

### Changed
- Embed `func` compiler to package
- Better builder types
- Moved docs to `ton-docs` repository

## [0.8.7] - 2023-01-13

### Added
- `beginTailString` and `beginStringFromBuilder` for starting a `StringBuilder`
- `Slice.asString` for converting slice to a `String` (without checks of contents)

## [0.8.6] - 2023-01-10

### Fixed
- Fixing passing non-nullable type as second argument to map's `set` operation

### Changed
- New `2022.v12` func compiler

## [0.8.5] - 2023-01-09

### Changed
- Improve gas usage in `storeBool`

## [0.8.4] - 2023-01-09

### Added
-`newAddress` function to create a new address from chain and hash
-`getConfigParam` to get system configuration

## [0.8.3] - 2023-01-09

### Fixed
- Deep contract dependencies

## [0.8.2] - 2023-01-08

### Added
- `loadAddress` in `Slice`

## [0.8.1] - 2023-01-07

Fixing missing NPM release

## [0.8.0] - 2023-01-07

### Changed
- Changed message id algorithm to the one based on type signatures instead of tlb

### Added
- Dictionaries in typescript bindings
- Introduced packaging compilation step that packages a contract to a single package that can be deployed in predictable way.
- `tact-bindings` to build bindings to non-tact contracts

## [0.7.1] - 2023-01-04

### Fixed
- Assignability type checks

## [0.7.0] - 2023-01-04

### Added
- `toCell` to all structs and messages
- restored disassembler as part of a compilation flow
- `typescript` bindings parser of structs and messages

### Removed
- `abi.pack_cell` and `abi.pack_slice`

### Changed
- Updated codegen to prefix function names with a `$` to avoid clashing with system functions
- `random` and `randomInt` that are correctly initialized on first use unlike native one 
- Changed the way get and init methods expect their arguments and return values to match func-like primitives

### Fixed
- non-nullable value could break the nullable variable memory representation

## [0.6.0] - 2023-01-03

### Changed
- Large bindings generator refactoring to match new `ton-core` and `ton-emulator` packages

### Added
- `Deployable` trait in `@stdlib/deploy`

## [0.5.0] - 2022-12-23

### Added

- Constants in contracts
- Global constants
- Added `SendRemainingBalance`, `SendRemainingValue`, `SendIgnoreErrors`, `SendPayGasSeparately`, `SendDestroyIfZero` constants in stdlib
- Added `emptyCell` and `emptySlice` helpers
- Added jettons example

### Changed

- `require` now accepts two arguments, second one must be a string literal that has error message. This error message then will be exported to ABI
- Optional `Address` fields are not encoded using native representation

## [0.4.0] - 2022-12-22

### Changed
- Renamed Map's `get2` to `get` and removing `get` from keywords list.

### Fixed
- Fixed missing call arguments verification

## [0.3.0] - 2022-12-22

### Added 
- `String` literals and variables
- `Int.toString()` and `Int.toFloatString()`
- `StringBuilder` for gas-efficient string building
- Global compile-time `ton` function that conversts string to Int during compile time.
- `checkDataSignature` similar to func `check_data_signature`
- `String.asComment` for conversion text to a comment payload
- `Resumable` trait, allows to resume contract operations once it was stopped
- Comment receiver that allows to receive arbitrary comment
- `String.asSlice` cast string to a slice for parsing
- Binary shift operators `>>` and `<<`
- `Slice.fromBase64` that converts text slice that has base64 to binary representation (both classic and url)
- `Slice.asCell`, `Builder.asCell`, `Cell.asSlice`, `Builder.asCell` convenience functions
- `Slice.loadCoins` that reads coins from slice
- `myBalance` that returns current balance of a contract before execution phase

### Changed
- `contractAddress` now accepts single argument of type `StateInit` and always produces address for workchain. Old method is renamed to `contractAddressExt`.
- `hashCell` and `hashSlice` are now extension function `hash` on `Slice` and `Cell`
- Removed some keywords such as `message`, `contract`, `init` to allow use this names as variable names
- Renamed `receiveBounced` to `bounced`

### Fixed
- Fixing importing tact with providing extension, now `import "./lib";` and `import "./lib.tact";` are equivalent.
- Fixing extension function generation
- Fixing clashing of variable names with func primitives and global functions
- Fix fallback and bounce argument type resolving
- Fixed `loadUint`/`preloadUint`
- Fixed invalid generation of `>=` and `>` operators

## [0.2.0]

### Added
- `supported_interfaces` TEP support. TACT now automatically builds a list of supported interfaces of a contract
- `IPFS`-based ABI reporting. TACT now automatically calculates and embeds ABI hash into smart contract and prepares a file to upload to IPFS.
