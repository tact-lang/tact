# Tact Language Compiler

<div align="center">

<img src="https://raw.githubusercontent.com/tact-lang/tact-docs/main/public/banner.jpeg" alt="" />

A next-gen smart contract programming language for TON Blockchain, focused on efficiency and ease of development.
Tact is a good fit for complex smart contracts, quick onboarding and rapid prototyping.

Developed by [TON Studio](https://tonstudio.io), powered by the community.

**[Try online!] • [Features] • [Security] • [Key resources] • [Installation] • [Community] • [Contributing]**

[Try online!]: https://ide.ton.org
[Features]: #features
[Security]: #security
[Key resources]: #key-resources
[Installation]: #installation
[Community]: #community
[Contributing]: #contributing

[![Website](https://img.shields.io/badge/Website-blue?style=flat)](https://tact-lang.org)
[![Documentation](https://img.shields.io/badge/Documentation-blue?style=flat)](https://docs.tact-lang.org)
[![Twitter](https://img.shields.io/badge/X%2FTwitter-white?logo=x&style=flat&logoColor=gray)](https://x.com/tact_language)
[![Telegram](https://img.shields.io/badge/Community_Chat-white?logo=telegram&style=flat)](https://t.me/tactlang)
[![Telegram](https://img.shields.io/badge/Tact_Kitchen_🥣-white?logo=telegram&style=flat)](https://t.me/tact_kitchen)

</div>

## Features

The most prominent and distinctive features of Tact are:

- Familiar and user-friendly TypeScript-like syntax.
- Strong static type system with built-in [Structs], [Messages] and [maps], among others.
- First-class [maps] support, with many methods and a convenient [`foreach` statement][foreach] for traversing.
- Automatic (de)serialization of incoming messages and data structures.
- Automatic routing of [internal, external and bounced messages][recvfun].
- Automatic handling of message types, including [binary, text, and fallback slices][recv].
- No boilerplate functions for [sending messages] and deploying child contracts.
- Reusable behaviors through [traits].
- Support for low-level programming with [`asm` functions][asmfun].
- Rich [standard library][stdlib].
- Extensive [documentation].
- Robust [tooling](#tooling).
- ...and there's much more to come!

[Structs]: https://docs.tact-lang.org/book/structs-and-messages#structs
[Messages]: https://docs.tact-lang.org/book/structs-and-messages#messages
[maps]: https://docs.tact-lang.org/book/maps
[foreach]: https://docs.tact-lang.org/book/statements#foreach-loop
[recv]: https://docs.tact-lang.org/book/receive/
[recvfun]: https://docs.tact-lang.org/book/contracts/#receiver-functions
[sending messages]: https://docs.tact-lang.org/book/send/#message-sending-functions
[traits]: https://docs.tact-lang.org/book/types/#traits
[asmfun]: https://docs.tact-lang.org/book/assembly-functions/
[stdlib]: https://docs.tact-lang.org/ref/
[documentation]: https://docs.tact-lang.org/

## Security

- [Security audit of Tact by the Trail of Bits (2025, PDF)](https://tact-lang.org/assets/pdfs/2025-01-ton-studio-tact-compiler-securityreview.pdf)
  - Backup link: [PDF Report](https://github.com/tact-lang/website/blob/416073ed4056034639de257cb1e2815227f497cb/pdfs/2025-01-ton-studio-tact-compiler-securityreview.pdf)

## Key resources

- [Awesome Tact](https://github.com/tact-lang/awesome-tact)
- [Tact By Example](https://tact-by-example.org/00-hello-world)
- [Documentation](https://docs.tact-lang.org)
- [Changelog](./dev-docs/CHANGELOG.md)

## Installation

### Compiler

The Tact compiler is distributed as an [NPM package](https://www.npmjs.com/package/@tact-lang/compiler) bundled with the [Tact standard library](https://docs.tact-lang.org/ref/).

The recommended Node.js version is 22 or higher, while the bare minimum Node.js version must be at least 18 or higher.

Use your favorite package manager to install it into a Node.js project:

```shell
# yarn is recommended, but not required
yarn add @tact-lang/compiler

# you can also use npm
npm i @tact-lang/compiler@latest

# or pnpm
pnpm add @tact-lang/compiler

# or bun
bun add @tact-lang/compiler
```

Alternatively, you can install it globally as such:

```shell
npm i -g @tact-lang/compiler
```

This will make the `tact` compiler available on your PATH, as well as a convenient `unboc` disassembler of a contract's code compiled into a [Bag of Cells](https://docs.tact-lang.org/book/cells/#cells-boc) `.boc` format.

### Tooling

###### Extensions and plugins

- [VS Code extension](https://marketplace.visualstudio.com/items?itemName=tonstudio.vscode-tact) - Powerful and feature-rich extension for Visual Studio Code (VSCode) and VSCode-based editors like VSCodium, Cursor, Windsurf and others.
  - Get it on the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=tonstudio.vscode-tact).
  - Get it on the [Open VSX Registry](https://open-vsx.org/extension/tonstudio/vscode-tact).
  - Or install from the [`.vsix` files in nightly releases](https://github.com/tact-lang/tact-language-server/releases).
- [Language Server (LSP Server)](https://github.com/tact-lang/tact-language-server) - Supports Sublime Text, (Neo)Vim, Helix, and other editors with LSP support.
- [tact.vim](https://github.com/tact-lang/tact.vim) - Vim 8+ plugin.
- [tact-sublime](https://github.com/tact-lang/tact-sublime) - Sublime Text 4 package.
  - Get it on the [Package Control](https://packagecontrol.io/packages/Tact).

###### Security

- [Misti](https://github.com/nowarp/misti) - Static smart contract analyzer.
- [TON Symbolic Analyzer (TSA)](https://github.com/espritoxyz/tsa) - Static smart contract analysis tool based on symbolic execution.

### Getting started

For a quick start, read the ["Let's start!"](https://docs.tact-lang.org/#start) mini-guide in the Tact documentation, which uses the [Blueprint](https://github.com/ton-community/blueprint) development environment for writing, testing and deploying smart contracts on TON Blockchain.

If you want more manual control, use [tact-template](https://github.com/tact-lang/tact-template) — it's a ready-to-use template with the development environment set up, including the Tact compiler with TypeScript + Jest, a local TON emulator, AI-based editor support, and examples of how to run tests.

```shell
git clone https://github.com/tact-lang/tact-template
```

## Community

If you can’t find the answer in the [docs](https://docs.tact-lang.org), or you’ve tried to do some local testing and it still didn’t help — don’t hesitate to reach out to Tact’s flourishing community:

- [`@tactlang` on Telegram](https://t.me/tactlang) - Main community chat and discussion group.
- [`@tactlang_ru` on Telegram](https://t.me/tactlang_ru) _(Russian)_
- [`@tact_kitchen` on Telegram](https://t.me/tact_kitchen) - Channel with updates from the team.
- [`@tact_language` on X/Twitter](https://x.com/tact_language)
- [`tact-lang` organization on GitHub](https://github.com/tact-lang)
- [`@ton_studio` on Telegram](https://t.me/ton_studio)
- [`@thetonstudio` on X/Twitter](https://x.com/thetonstudio)

## Contributing

Contributions are welcome! To help with the development of the compiler, see the [contributing guide](./dev-docs/CONTRIBUTING.md).

In addition, we invite you to create new educational materials in any form, help foster the [community](#community), and write new Tact contracts. The best creations will be featured in [awesome-tact](https://github.com/tact-lang/awesome-tact) and on social media.

Good luck on your coding adventure with ⚡ Tact!

## License

MIT © The Tact Authors: Steve Korshakov; [TON Studio](https://tonstudio.io).
