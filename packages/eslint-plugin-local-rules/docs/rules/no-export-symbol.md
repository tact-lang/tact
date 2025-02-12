# Ban exporting witness Symbol (`@tact-lang/local-rules/no-export-symbol`)

<!-- end auto-generated rule header -->

Please describe the origin of the rule here.

## Rule Details

This rule aims to...

Examples of **incorrect** code for this rule:

```ts
const exampleSymbol = Symbol("example");
export {exampleSymbol};
```

Examples of **correct** code for this rule:

```ts
const exampleSymbol = Symbol("example");
```

## When Not To Use It

Give a short description of when it would be appropriate to turn off this rule.

## Further Reading

If there are other links that describe the issue this rule addresses, please include them here in a bulleted list.
