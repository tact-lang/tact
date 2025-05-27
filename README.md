# Tact Language Compiler

<div align="center">

![Tact language banner](https://raw.githubusercontent.com/tact-lang/tact/refs/heads/main/assets/banner.png)

A next-gen smart contract programming language for TON Blockchain focused on efficiency and ease of development.
Tact is a good fit for complex smart contracts, quick onboarding, and rapid prototyping.

Developed by [TON Studio](https://tonstudio.io), powered by the community — as of the beginning of 2025, the number of _unique code_[^1] contracts deployed on the mainnet reached almost 28 thousand, of which about 33% were written in Tact. You can view some selected projects here: [Tact in production](#tact-in-production).

Tact has undergone a comprehensive security audit by [Trail of Bits](https://www.trailofbits.com), a leading Web3 security firm.

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
[![Audited by Trail of Bits](https://img.shields.io/badge/Audited%20by-Trail%20of%20Bits-blue?style=flat-square)](https://github.com/trailofbits/publications/blob/master/reviews/2025-01-ton-studio-tact-compiler-securityreview.pdf)
[![Twitter](https://img.shields.io/badge/X%2FTwitter-white?logo=x&style=flat&logoColor=gray)](https://x.com/tact_language)
[![Telegram](https://img.shields.io/badge/Community_Chat-white?logo=telegram&style=flat)](https://t.me/tactlang)
[![Telegram](https://img.shields.io/badge/Tact_Kitchen_🥣-white?logo=telegram&style=flat)](https://t.me/tact_kitchen)

</div>

## Features

The most prominent and distinctive features of Tact are:

- Familiar and user-friendly TypeScript-like syntax.
- Strong static type system with built-in [Structs], [Messages], and [maps], among others.
- First-class [maps] support, with many methods and a convenient [`foreach` statement][foreach] for traversing.
- Automatic (de)serialization of incoming messages and data structures.
- Automatic routing of [internal, external, and bounced messages][recvfun].
- Automatic handling of message types, including [binary, text, and fallback slices][recv].
- No boilerplate functions for [sending messages] and deploying child contracts.
- Reusable behaviors through [traits].
- Support for low-level programming with [`asm` functions][asmfun].
- Generation of [single-file TypeScript wrappers] for convenient interactions with compiled contracts, which include:
  - Type definitions for [Structs] and [Messages] observable in the [compilation report].
  - Corresponding `storeStructureName()` and `loadStructureName()` functions for (de)serialization.
  - All global and contract-level constants.
  - Bi-directional records of exit codes: from their names to numbers and vice versa.
  - Opcodes of all [Messages].
  - A contract wrapper class with various helper functions for initialization, deployment, and message exchange.
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
[single-file TypeScript wrappers]: https://docs.tact-lang.org/book/compile/#wrap
[compilation report]: https://docs.tact-lang.org/book/compile/#report
[stdlib]: https://docs.tact-lang.org/ref/
[documentation]: https://docs.tact-lang.org/

## Security

- [Security audit of Tact by the Trail of Bits (2025, PDF)](https://github.com/trailofbits/publications/blob/master/reviews/2025-01-ton-studio-tact-compiler-securityreview.pdf)
  - Backup link: [PDF Report](https://github.com/tact-lang/website/blob/416073ed4056034639de257cb1e2815227f497cb/pdfs/2025-01-ton-studio-tact-compiler-securityreview.pdf)

## Tact in production

Some selected software and applications based on contracts written in Tact, deployed in production, and consumed by end users:

###### Open source or source available

- [Proof of Capital](https://github.com/proof-of-capital/TON) - [Proof of Capital](https://proofofcapital.org/) is a market-making smart contract that protects interests of all holders.
  - See the [security audit report](https://raw.githubusercontent.com/nowarp/public-reports/master/2025-01-proof-of-capital.pdf) by [Nowarp](https://nowarp.io).

###### Closed source

- [Tradoor](https://tradoor.io) - Fast and social DEX on TON.
  - See the [security audit report](https://www.tonbit.xyz/reports/Tradoor-Smart-Contract-Audit-Report-Summary.pdf) by TonBit.
- [PixelSwap](https://www.pixelswap.io) - First modular and upgradeable DEX on TON.
  - See the [security audit report](https://github.com/trailofbits/publications/blob/master/reviews/2024-12-pixelswap-dex-securityreview.pdf) by Trail of Bits.
- [GasPump](https://gaspump.tg) - TON memecoin launchpad and trading platform.

See [Tact in production](https://github.com/tact-lang/awesome-tact#tact-in-production-) on the Awesome Tact list.

## Key resources

- [Awesome Tact](https://github.com/tact-lang/awesome-tact)
- [Tact By Example](https://tact-by-example.org/00-hello-world)
- [DeFi Cookbook](https://github.com/tact-lang/defi-cookbook)
- [Documentation](https://docs.tact-lang.org)
- [Changelog](./dev-docs/CHANGELOG.md)

## Installation

### Compiler

The Tact compiler is distributed as an [NPM package](https://www.npmjs.com/package/@tact-lang/compiler) bundled with the [Tact standard library](https://docs.tact-lang.org/ref/).

The recommended Node.js version is 22 or higher, while the minimum version is 18.

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

It will make the `tact` compiler available on your PATH, as well as:

- a convenient `unboc` disassembler of a contract's code compiled into a [Bag of Cells](https://docs.tact-lang.org/book/cells/#cells-boc) `.boc` format.
- a formatter `tact-fmt`, which can format or check the formatting of individual Tact files and directories.

### Tooling

###### Extensions and plugins

- [VS Code extension](https://marketplace.visualstudio.com/items?itemName=tonstudio.vscode-tact) - Powerful and feature-rich extension for Visual Studio Code (VSCode) and VSCode-based editors like VSCodium, Cursor, Windsurf, and others.
  - Get it on the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=tonstudio.vscode-tact).
  - Get it on the [Open VSX Registry](https://open-vsx.org/extension/tonstudio/vscode-tact).
  - Or install from the [`.vsix` files in nightly releases](https://github.com/tact-lang/tact-language-server/releases).
- [Language Server (LSP Server)](https://github.com/tact-lang/tact-language-server) - Supports Sublime Text, (Neo)Vim, Helix, and other editors with LSP support.
- [Intelli Tact](https://plugins.jetbrains.com/plugin/27290-tact) - Powerful and feature-rich plugin for JetBrains IDEs like WebStorm, IntelliJ IDEA, and others.
- [tact.vim](https://github.com/tact-lang/tact.vim) - Vim 8+ plugin.
- [tact-sublime](https://github.com/tact-lang/tact-sublime) - Sublime Text 4 package.
  - Get it on the [Package Control](https://packagecontrol.io/packages/Tact).

###### Security

- [Misti](https://github.com/nowarp/misti) - Static smart contract analyzer.
- [TON Symbolic Analyzer (TSA)](https://github.com/espritoxyz/tsa) - Static smart contract analysis tool based on symbolic execution.

###### Utility

- Formatter (`tact-fmt`) — The official formatter. It ships with the Tact Language Server, VS Code extension, and as a standalone binary with the compiler. You can invoke it by running `npx tact-fmt` in your Tact projects.
- BoC Disassembler (`unboc`) — Disassembler for [`.boc`](https://docs.tact-lang.org/book/cells/#cells-boc) files. Ships as a standalone binary with the compiler. You can invoke it by running `npx unboc` in your Tact projects.

### Getting started

For a quick start, read the ["Let's start!"](https://docs.tact-lang.org/#start) mini-guide in the Tact documentation. It uses the [Blueprint](https://github.com/ton-community/blueprint) development environment for writing, testing, and deploying smart contracts on TON Blockchain.

If you want more manual control, use [tact-template](https://github.com/tact-lang/tact-template). It's a ready-to-use template with the development environment set up, including the Tact compiler with TypeScript + Jest, a local TON emulator, AI-based editor support, and examples of how to run tests.

```shell
git clone --depth 1 https://github.com/tact-lang/tact-template
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

Contributions are welcome! To help develop the compiler, see the [contributing guide](./dev-docs/CONTRIBUTING.md).

In addition, we invite you to create new educational materials in any form, help foster the [community](#community), and build new [Tact contracts and projects](#tact-in-production). The best creations will be featured in [awesome-tact](https://github.com/tact-lang/awesome-tact) and on social media.

Good luck on your coding adventure with ⚡ Tact!

## License

MIT © The Tact Authors: Steve Korshakov; [TON Studio](https://tonstudio.io).

[^1]: The "unique code" means that each contract in the data sample has at least one TVM instruction that differs from the other contracts, excluding many preprocessed wallets with everything inlined — even seqno and a public key for signature verification!
