# Tact release checklist template

- [ ] Improve the changelog for `vX.Y.Z`: grammar, wording, polishing
- [ ] Make sure there are no open issues for the [vX.Y.Z milestone](https://github.com/tact-lang/tact/issues?q=is%3Aopen+is%3Aissue+milestone%3AvX.Y.Z)
      (except for the current one, of course)
- [ ] Bump Tact version in:
  - [ ] [`package.json`](./package.json) file
  - [ ] [CHANGELOG.md](./CHANGELOG.md): `Unreleased` -> `vX.Y.Z`
- [ ] Tag the new `vX.Y.Z` release in Git
  ```shell
  $ git tag -a vX.Y.Z
  $ git push origin vX.Y.Z
  ```
- [ ] Create the new `vX.Y.Z` release on GitHub: <https://github.com/tact-lang/tact/releases>
- [ ] Publish the new `vX.Y.Z` release on NPM:
      [@tact-lang/compiler](https://www.npmjs.com/package/@tact-lang/compiler)
  ```shell
  $ git checkout vX.Y.Z
  $ yarn all && npm publish
  ```
- [ ] Update [tact-docs](https://github.com/tact-lang/tact-docs) with the most recent Tact features
- [ ] Request or perform the plugins/parsers/tools updates and releases:
  - [ ] <https://github.com/tact-lang/tree-sitter-tact>
  - [ ] <https://github.com/tact-lang/tact.vim>
  - [ ] <https://github.com/tact-lang/tact-template>
  - [ ] <https://github.com/tact-lang/tact-vscode>
  - [ ] A new release of [tact-vscode](https://marketplace.visualstudio.com/items?itemName=KonVik.tact-lang-vscode) on the Visual Studio Marketplace
  - [ ] <https://github.com/novusnota/prism-ton>
  - [ ] <https://github.com/nujan-io/nujan-ide>
  - [ ] <https://github.com/ton-org/blueprint>
  - [ ] <https://github.com/ton-blockchain/intellij-ton>
- [ ] Write `vX.Y.Z` release notes explaining the newest changes with code examples and commit those to this repository
- [ ] [TON Dev News](https://t.me/tondev_news) Telegram channel announcement
- [ ] Accumulate TON dev chats feedback
