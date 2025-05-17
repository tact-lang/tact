# Security Policy

## Supported Versions

We release security patches for the following versions:

- [1.6.10](https://www.npmjs.com/package/@tact-lang/compiler/v/1.6.10),
- [1.5.4](https://www.npmjs.com/package/@tact-lang/compiler/v/1.5.4).

Other versions are not supported.

## Reporting a Vulnerability

If you discover a security vulnerability, please **do not open an issue**.
Instead, please send us a detailed report using either email ([it+tact@tonstudio.io](mailto:it+tact@tonstudio.io)) or the GitHub Security Advisory ["Report a Vulnerability"](https://github.com/tact-lang/tact/security/advisories/new) tab.

If you use email, please encrypt your email using our [PGP key](#pgp-key-to-use-if-reporting-via-email). If you're unfamiliar with PGP encryption, please still send us an email without disclosing the vulnerability and we will coordinate a secure channel with you.

Thank you for helping us make Tact safer for everyone building on TON.

## Response Times

We will acknowledge your report within three business days and aim to provide a resolution or mitigation plan within 30 calendar days. If a resolution requires more time, we will keep you updated on the progress.

## Disclosure Policy

If we confirm the vulnerability, we will work with you to coordinate a fix before public disclosure.

- Fixes will be announced in a security advisory.
- Credit will be given to the reporter unless anonymity is requested.

## What to Include in the Security Report

- A description of the vulnerability,
- Steps to reproduce (if applicable),
- The potential impact (if known),
- Any suggestions for remediation (if known).

Please include all details necessary to reproduce the vulnerability, such as:

- the input program that triggers the bug,
- compiler version affected,
- target TVM version,
- the link to the mainnet or testnet transaction that demonstrates the bug,
- if reproducing the bug using local emulators, such as [Sandbox](https://github.com/ton-org/sandbox), please add the test script, the instructions to install its dependencies, and the command to run the script to reproduce the issue,
- the Tact language server version, and IDE or text editor, if applicable,
- any relevant details about your execution environment, like the Node.js version or your operating system.

Please include steps to reproduce the bug you have found in as much detail as possible.

Please do not make the source code needed to reproduce the vulnerability publicly available.

## Disclaimer

Please notice this is not a bug bounty policy. When a bug bounty with the Tact compiler in its scope is available, we will update this document with the link to it.

## PGP Key to Use If Reporting via Email

To encrypt your email, use the following PGP key:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=vEk2
-----END PGP PUBLIC KEY BLOCK-----
```
