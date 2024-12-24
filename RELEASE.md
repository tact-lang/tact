# Tact release checklist template

- [ ] Improve the changelog for `vX.Y.Z`: grammar, wording, polishing
- [ ] Make sure there are no open issues for the [vX.Y.Z milestone](https://github.com/tact-lang/tact/issues?q=is%3Aopen+is%3Aissue+milestone%3AvX.Y.Z) (except for the current one, of course)
- [ ] Remove "(not released yet)" from docs:
  - [ ] `cd docs` — important as to not change the texts elsewhere, such as in code comments
  - [ ] `regex='([sS]ince Tact \d\.\d) \(not released yet\)'; rg "$regex" -r '$1'` (or similar with `grep`) — to preview the changes
  - [ ] `regex='([sS]ince Tact \d\.\d) \(not released yet\)'; rg "$regex" -l | xargs sd "$regex" '$1'` (or similar with `grep` and `sed`) — to apply the changes
- [ ] Bump Tact version in:
  - [ ] [`package.json`](./package.json) file
  - [ ] [CHANGELOG.md](./CHANGELOG.md): `Unreleased` -> `vX.Y.Z`
- [ ] Tag the new `vX.Y.Z` release in Git
  ```shell
  $ git tag vX.Y.Z
  $ git push origin vX.Y.Z
  ```
- [ ] Create the new `vX.Y.Z` release on GitHub: <https://github.com/tact-lang/tact/releases>
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
  - [ ] <https://github.com/tact-lang/tact-vscode> (tracked in: )
  - [ ] A new release of [tact-vscode](https://marketplace.visualstudio.com/items?itemName=KonVik.tact-lang-vscode) on the Visual Studio Marketplace
  - [ ] <https://github.com/novusnota/prism-ton> (tracked in: )
  - [ ] <https://github.com/nujan-io/nujan-ide> (tracked in: )
  - [ ] <https://github.com/ton-org/blueprint> (tracked in: )
  - [ ] <https://github.com/ton-blockchain/intellij-ton> (tracked in: )
- [ ] Write `vX.Y.Z` release notes explaining the newest changes with code examples
- [ ] [TON Dev News](https://t.me/tondev_news) Telegram channel announcement
- [ ] Accumulate TON dev chats feedback
