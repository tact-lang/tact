# Security policy

The Tact team and community take security bugs in Tact seriously. We appreciate your efforts to disclose your findings responsibly and will make every effort to acknowledge your contributions and fix your findings as soon as possible.

## Table of Contents

- [Supported Versions](#supported-versions)
- [Reporting Security Issues](#reporting-security-issues)
  - [How to Report](#how-to-report)
- [In scope](#in-scope)
- [Out of scope](#out-of-scope)
- [Responsible Disclosure](#responsible-disclosure)
- [PGP key to use if reporting via email](#pgp-key-to-use-if-reporting-via-email)

## Supported Versions

We currently support the latest stable release of the Tact compiler and infrastructure libraries.

| Versions | Supported |
| -------- | --------- |
| Latest   | ✅ Yes    |
| 1.6.x    | ✅ Yes    |
| < 1.6    | ❌ No     |

You can check the latest Tact compiler version at <https://www.npmjs.com/package/@tact-lang/compiler>.

## Reporting Security Issues

If you discover a security vulnerability in the Tact compiler, standard library, tooling, or related infrastructure, **please report it privately and responsibly**.

### How to Report

Please send us a detailed report using either email or the GitHub Security Advisory ["Report a Vulnerability"](https://github.com/tact-lang/tact/security/advisories/new) tab.

📧 **Email:** `it+tact@tonstudio.io`
🔒 Please encrypt your email using our [PGP key](#pgp-key-to-use-if-reporting-via-email).

Your report should include:

- A description of the vulnerability.
- Steps to reproduce (if applicable).
- The potential impact.
- Any suggestions for remediation (if known).

Please include all details necessary to reproduce the vulnerability, such as:

- the input program that triggers the bug,
- compiler version affected,
- target TVM version,
- the link to the mainnet or testnet transaction that demonstrates the bug,
- if reproducing the bug using local emulators, such as [Sandbox](https://github.com/ton-org/sandbox), please add the test script, the instructions to install its dependencies, and the command to run the script to reproduce the issue,
- the Tact language server version,
- IDE or text editor, if applicable,
- any relevant details about your execution environment, like the Node.js version or your operating system.

Please include steps to reproduce the bug you have found in as much detail as possible.

We will acknowledge your report within three business days and aim to provide a resolution or mitigation plan within 30 days. If a resolution requires more time, we will keep you updated on the progress.

## In scope

This policy applies to:

- The Tact compiler, including the TypeScript wrappers it generates,
- The Tact standard library (`stdlib`),
- Developer tooling: Tact's CLI, VS Code plugin, and the Tact [language server](https://github.com/tact-lang/tact-language-server),
- The Tact [documentation](https://docs.tact-lang.org),
- Web-based compiler services, such as [TON Web IDE](https://ide.ton.org),
- Smart contract generation and deployment utilities.

A security issue, in this case, may stem from miscompilation, incorrect documentation description, incorrect language server, editor plugin, or TON Web IDE suggestions, which can lead to monetary loss if an affected smart contract is deployed in the mainnet and a malicious third party interacts with it.

## Out of scope

Only the targets listed under in-scope are part of the security policy. This means that, for example, our infrastructure, such as webpages, is not part of the scope.

Please note that Tact does not hold security guarantees regarding the compilation of untrusted input, and we do not consider compiler crashes on maliciously generated data as security issues.

This policy does _not_ cover third-party tools, libraries, or smart contracts written by individual developers or companies using Tact.

## Responsible Disclosure

We appreciate responsible disclosure and are committed to working with the security community. If you report a valid vulnerability, we will credit you in our release notes unless you request otherwise.

---

**Thank you for helping us make Tact safer for everyone building on TON.**

## PGP key to use if reporting via email

To encrypt your email, use the following PGP key:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=vEk2
-----END PGP PUBLIC KEY BLOCK-----
```
