# Documentation changelog

All notable changes to Tact documentation will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) but does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) — the changes made are grouped by their respective milestones. If the change wasn't a part of the milestone but was made in the month associated with it, it will still be included.

## Doc: 2025-06

- Adjusted inline code tag highlighting to support global Starlight themes, and modified the One Light color theme to support proper highlighting of `keyword.operator.new` TextMate scopes: PR [#3346](https://github.com/tact-lang/tact/pull/3346)

## Doc: 2025-05

- Described off-chain calls and mention exit code 11 for getters: PR [#3314](https://github.com/tact-lang/tact/pull/3314)
- Remarked the futility of synchronous on-chain data retrieval patterns for getters: PR [#3316](https://github.com/tact-lang/tact/pull/3316)
- Completely reworked the functions page: PR [#3076](https://github.com/tact-lang/tact/pull/3076), PR [#3277](https://github.com/tact-lang/tact/pull/3277)
- Documented that Tact cuts off the `0xFFFFFFFF` prefix from bounced messages: PR [#3343](https://github.com/tact-lang/tact/pull/3343)
- Clarified that unrecognized bounced messages do not cause an exit code 130: PR [#3352](https://github.com/tact-lang/tact/pull/3352)
