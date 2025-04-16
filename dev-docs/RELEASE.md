# Tact vX.Y.Z release checklist

- [ ] Improve the changelog for `vX.Y.Z`: grammar, wording, polishing
- [ ] Make sure there are no open issues for the [vX.Y.Z milestone](https://github.com/tact-lang/tact/issues?q=is%3Aopen+is%3Aissue+milestone%3AvX.Y.Z) (except for the current one, of course)
- [ ] Remove `(not released yet)` from docs:
- [ ] Update test snapshots with Tact version
- [ ] Bump Tact version in [`package.json`](../package.json) file
- [ ] Bump Tact version in [CHANGELOG.md](./CHANGELOG.md): `Unreleased` -> `vX.Y.Z`
- [ ] Tag the new `vX.Y.Z` release in Git
  ```shell
  $ git tag vX.Y.Z
  $ git push origin vX.Y.Z
  ```
- [ ] Create the new `vX.Y.Z` release on GitHub: <https://github.com/tact-lang/tact/releases>
- [ ] `npm pack` and check the contents of the archive
- [ ] Publish the new `vX.Y.Z` release on NPM: [@tact-lang/compiler](https://www.npmjs.com/package/@tact-lang/compiler)
  ```shell
  $ git checkout vX.Y.Z
  $ yarn all && npm publish
  ```
- [ ] Request or perform the plugins/parsers/tools updates and releases:
  - [ ] <https://github.com/tact-lang/tact-template> (tracked in: )
  - [ ] <https://github.com/tact-lang/tree-sitter-tact> (tracked in: )
  - [ ] <https://github.com/tact-lang/tact.vim> (tracked in: )
  - [ ] <https://github.com/tact-lang/tact-sublime> (tracked in: )
  - [ ] <https://github.com/tact-lang/tact-language-server> (tracked in: )
  - [ ] A new release of VSCode extension with the [tact-language-server](https://github.com/tact-lang/tact-language-server):
    - [ ] [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=tonstudio.vscode-tact)
    - [ ] [Open VSX Registry](https://open-vsx.org/extension/tonstudio/vscode-tact)
  - [ ] <https://github.com/tact-lang/web-ide> (tracked in: )
  - [ ] <https://github.com/tact-lang/prism-ton> (tracked in: )
  - [ ] <https://github.com/ton-blockchain/intellij-ton> (tracked in: )
  - [ ] <https://github.com/ton-blockchain/verifier> (tracked in: )
- [ ] [TON Dev News](https://t.me/tondev_news) Telegram channel announcement
