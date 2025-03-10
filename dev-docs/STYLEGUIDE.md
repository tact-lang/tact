# TypeScript Styleguide

Due to stringent security and correctness requirements, we have to use a subset of TypeScript features that are known to be _less unsound_.

## Do

Prefer the most simple and basic language features.

- Variables `const x = f()`
- Functions `(x: T) => x`, `f(x)`
- Objects `{ foo: 'bar' }`, `x.foo`, `const { foo } = x;`
- Statements `if`, `for`, `return`
- Aliases `type F<T> = { foo: T }`
- Simple types `number`, `string`, `boolean`, `undefined`
- Literal types `1`, `"hello"`
- Unions of literal types `1 | 2 | 3`
- Tagged unions `{ kind: 'A', a: number } | { kind: 'B' }`

## Don't

### Don't explicitly break the type system

- **Don't use `as`**, except `as const`. It was meant to gradually type legacy code, not for production use in TS-native projects. Often, `x as T` was meant to be `const y: T = x;` or `x satisfies T`.
- **Don't use `any`**. Its actual meaning is "completely disregard type errors here". Prefer `unknown` or `never`.
- **Don't use guard types `x is T`**. These are just `as` in disguise: `const foo = (x: 1 | 2): x is 1 => x === 2;`. It might be used in straightforward cases, such as ADT boilerplate.
- **Don't use overloading**. It's almost the same as intersection types, which are broken.
- **Don't use @ts-ignore**. It's a worse version of `as` that can cause the TS compiler to enter an arbitrary incorrect state.
- **Don't use `x!` operator**. It does no checks at runtime, and is essentially `x as NotNull<typeof x>`.
- **Don't pick into values that are generic**: `<T>(x: T) => typeof x === 'number'`. Properly designed languages do not allow this.

Workarounds for bugs in the TS compiler will sometimes require an `as` or `any`. In this case, the workaround should be small and generic, separated into its own file, and annotated with a link to the corresponding TypeScript issue.

For example, `["a", "b"].includes(x)` doesn't narrow `x` to `'a' | 'b'`. Instead of multiple `x as ('a' | 'b')` over the whole codebase, we can define a wrapper once in `util.ts`, thoroughly test and review it, and keep it in containment this way.

```typescript
// `extends string` is usually a bad idea, but `key is K` is an even worse idea
export const includes = <const K extends string>(
  keys: readonly K[],
  key: string,
): key is K => {
  // we have to do this, otherwise, the next line will complain that `key` isn't `K`
  const keys1: readonly string[] = keys;
  return keys1.includes(key);
};
```

### Don't use mutability unless required

- **Don't use `let`.** Most likely it should be a separate function where each assignment is a `return`.
- **Never use `var`.** They're hoisted up to the function or module scope. `for (var i = 0; i < n; ++i) a.push(() => i)` creates an array of functions referencing the same value of `i === n`.
- **Never use `let` in tests.** The `jest` execution order is hard to understand and will most likely lead to flaky tests.
- **Never use `let` global variables.** These break tree-shaking, make code untestable and make behavior dependent on module initialization order.
- **Don't assign to function arguments** `(x) => { x = 1; }`
- **Don't use `for (let ...)` loops.** Prefer built-in array methods.
- **All object fields must be `readonly`**: `{ readonly foo: string }`.
- **Tag fields on tagged unions have to be readonly.** By assigning into a tag field of an `A | B` union, we can narrow it to an `A` type while it will have `B` (or some arbitrary combination of `A` and `B`) at runtime.
- **Arrays should be readonly**: `readonly string[]`
- **Tuples should be readonly**: `readonly [string, number]`
- **`Set` and `Map` should be readonly**: `env: ReadonlyMap<string, Type>`
- **Clone arrays before `.sort()`, `.reverse()`, `.splice()`**: `[...arr].sort()`
- **Prefer freezing highly reused objects** with `Object.freeze`.
- **Avoid the `void` type.**

### Don't use untagged unions

- **Don't use untagged non-literal unions** `{ a: 1 } | { b: 2 }`. These will require an `in`-condition for narrowing to select either of the branches.
- **Don't use `in`.** TypeScript has no distinction between open and closed object types. There might be no field in an object type, but there will be one at runtime. Narrowing for `in` operators is also buggy in other ways and doesn't correctly apply to either of its arguments.

### Don't use JS object "features"

- **Don't use optional fields** `foo?: Bar`. Every `?` doubles the number of cases that should be tested. Eventually, some combination of non-defined and undefined fields will be non-semantic. Prefer at least an explicit `foo: Bar | undefined`, or better, create a type with a descriptive name to make it a tagged union.
- _**Don't use optional fields**_. In JS, there is a distinction between a field that is not defined and a field that is `undefined` (sic). `'a' in {} === false`, `'a' in { a: undefined } === true`. TypeScript doesn't handle this properly in its type system.
- **Don't use `Proxy`**. These break the type safety, are incorrectly handled in debuggers, and lead to unexpected heisenbugs.
- **Don't use `get` and `set`**. See `Proxy` above. Use explicit `getFoo` and `setFoo` functions or avoid mutable state.
- **Don't use `...` with objects**. It will require intersection types or inheritance to type. Prefer aggregation: `{ ...a, b }` → `{ a, b }`.
- **Don't use `interface ... extends`**. There is no way to distinguish objects supporting parent and child interfaces at runtime safely.
  - Except where it's required to untie type recursion. For example `type Foo = A<Foo>` would only work as `interface Foo extends A<Foo> {}`
- **Don't use objects as `Map`s**. Objects have a set of quirks: numeric keys get listed before string keys, key order is not guaranteed, keys can be inherited from `Object.prototype`, and the `__proto__` key can be used for prototype pollution exploits. Unless a high performance of hashmap is needed, or an object is statically defined, use `Map`.

### Don't use JS function "features"

- **Don't use optional parameters** `(x?: number) => {}`. TypeScript has a quirk that allows passing the function with fewer arguments to a parameter list that requires more. Eventually, this leads to passing unexpected values to optional parameters. Prefer decomposing the function into two, where one takes a full set of parameters, and the other one is a simpler version that takes less.
- **Don't use default parameters** `(x = 1) => {}`. See the reasoning above.
- **Don't use `...rest` parameters**. TypeScript doesn't have "mapped tuple types", so typing these will be problematic. In most cases, passing an array would suffice and would only take two more characters to type.
- **Don't use `arguments`**. This is a worse version of `...rest` that isn't even an array.
- **Don't pass functions directly** to built-in functions `.map(foo)`. A good example of why this is a bad idea: `["10", "10", "10"].map(parseInt)`. Prefer `.map(x => foo(x))`.

### Don't use OOP

- **Don't use methods**. Methods don't store a reference to `this` in their closure and take it from object _syntactically_, i.e., `x.f()` would use `x` as `this`. It means `const { f } = x; f();` will be a runtime error, and TypeScript would emit no error here at compile time.
- **Don't use inheritance**. Overriding is allowed in JS, but Liskov substitution is not guaranteed.
- **Don't use `class`**. In TS `private` is only a type system feature, and all the private fields are globally accessible at runtime. Worse, created objects have part of their description in `prototype`, and can't be worked with as regular objects. If a class is converted to a regular function, all the fields are correctly private; accessing them requires no `this`. prefix, and in most frequent cases, only one exposed method can be returned directly.

### Don't use funny types

- **Don't use conditional types**. These lack any theory behind them and were meant to type legacy JS code.
- **Don't use `Omit,` `Pick,` `Exclude,` and `Extract`**. These are conditional types in disguise.
- **Don't use mapped object types** `{ [K in keyof T]: ... }`. These lack any theory behind them, don't have the introducing syntax, and are buggy.
- **Don't use index types** `T["foo"]`. They disregard variance at their use site and most likely will pin types in another library/module with both lower and upper bounds; thus, they're very detrimental to modularity. Most likely, the type of the `foo` field should be defined separately.
- **Don't use indexed types** `{ [k: string]: number }`. It's `Record<string, number>`. The only valid case is to avoid type recursion quirks in TS: `type Json = null | boolean | number | string | Json[] | { [k: string]: Json }` would emit an error with `Record<string, Json>`
- **Don't define bounds on generic parameters** `<T extends (foo: number) => string>`. Type inference is broken here and, in many cases, will force TS to infer the type of bound instead of the expected type.
- **Don't use intersection types** `A & B`. They are so broken it's hard even to count them as intersection types.
- **Don't use `Object,` `object,` `{},` `Function`**. There's barely a case when common supertypes of objects and functions are even needed.

### Don't use arcane language "features"

- **Don't use `export default`**. It breaks IDE features such as renaming and also has complex semantics.
- **Don't use `while`** loops. Every iteration must have at least an explicit "fuel" check. `while` _always_ eventually leads to infinite loops.
- **Don't use `for (... in ...)`**. It requires a `hasOwnProperty` check. Prefer `Object.entries`, `Object.keys`, or `Object.values`.
- **Don't define `toString` and `toJSON`** on objects. These obfuscate results of `console.log`, making objects different depending on how they're logged (`util.inspect` wouldn't use them).
- **Don't use `JSON.parse` and `JSON.stringify`** without `zod`. Both functions have very broken types: `JSON.stringify(undefined)`.

### Other considerations

- **Avoid unnecessary switch**. Switch statements require extra considerations for unexpected passthrough, are bulky, and take an extra function to make exhaustive checks work. Unless `switch` can be rationalized, prefer `makeVisitor` from `src/utils/tricks.ts`.
- **Avoid unnecessary bigint**. We have to work with `bigint` because TVM supports ints of 257-bit length, but in the rest of the code, `bigint` would only cause issues with debugging it.
- **Beware of `${}`** in template strings. Any inlining succeeds, and there won't be any compile-time errors even if it's a function `${(x: number) => x}`.
- **Avoid `null`**. `typeof null === 'object'`, and there is `undefined` anyway.
- **Avoid exceptions**. Exceptions are untyped. Pass error continuations explicitly `(onFooError: () => T) => T`. An example can be found in `src/grammar/parser-error.ts`.
- **Avoid tuples**. TS gives them minimal distinction from arrays, and the type system is broken around them. Occasionally, for performance reasons, tuples might be a better option than objects.
- **Avoid `enum`**. It's equivalent to unions since 5.0, except generates boilerplate JS code. A version that doesn't generate extraneous code, `const enum`, is not properly supported by `babel`.
- **Avoid iterators**. They're untypable unless fixed in JS standard. Prefer generators. Prefer iterating with `for (... of ...)`.
