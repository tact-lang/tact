# Tact Language Compiler

<img src="https://raw.githubusercontent.com/tact-lang/tact-docs/main/public/banner.jpeg">

A next-gen smart contract language for TON focused on efficiency and simplicity.

- [Changelog](/CHANGELOG.md)
- [Roadmap](/ROADMAP.md)
- [Examples](/examples/)

## Key Resources

- [Tact By Example](https://tact-by-example.org/00-hello-world)
- [Tact Documentation](https://docs.tact-lang.org)
- [Awesome Tact](https://github.com/tact-lang/awesome-tact)

## Community

- [Tact Discussion Group](https://t.me/tactlang)

## Getting started

The easiest way to start is to use our [project template](https://github.com/tact-lang/tact-template) and read [getting started](https://docs.tact-lang.org).

```
git clone https://github.com/tact-lang/tact-template
```

## Installation

TACT is distributed via NPM, to install tact into your project, you need:

```bash
yarn add @tact-lang/compiler
```

TACT doesn't have development environment dependencies and has everything built in. TACT's stdlib also distributed together with a compiler.

For Visual Studio Code syntax support, please download the [Tact extension](https://marketplace.visualstudio.com/items?itemName=KonVik.tact-lang-vscode).

## 10 Commandments of Tact

We have formed a large-scale vision for the philosophy of Tact to make sure that community has something to refer to.

1. Familiar syntax
   Tact features modern post-C syntax familiar to developers who know TypeScript, Swift, Kotlin and Rust.

2. First-class data structures
   Tact makes it easy to declare, decode and encode data structures according to their TL-B schemas.

3. Safe contract interfaces and ABI
   Tact offers strong compile-time checks for contract interfaces, typed addresses and lets describe messages natively in a subset of TL-B.

4. Message dispatch
   Tact offers a convenient yet flexible way to declare, receive and send messages between contracts.

5. Plaintext commands
   Tact offers an innovative way for securely sending commands to the contracts by the users using plaintext commands that are parsed on-chain.

6. Composition of contracts
   Tact offers traits to extract commonly used behaviors into reusable and verified components.

7. Statically bounded iterators
   Tact offers convenient iterators and arrays are bounded and do not hurt scalability of the contracts.

8. Batteries-included standard library
   Tact comes with a rich standard library that offers data handling functions and standardized behaviors.

9. Interactive
   Tact comes with a live playground, explorer and easy to use deployment tools.

10. Verifiable
    Tact produces deterministic builds. Compiler helps analyze gas usage and storage costs.

## License

MIT
