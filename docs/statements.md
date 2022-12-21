# Statements

## Variable declaration

Declaring variable always requires initial value and an explicit type:

```
let value: Int = 123;
```

## Static function call

Anywhere in the function body a static functions can be called:

```
let expiration: Int = now() + 1000; // now() is stdlib static function
```

## Type function call

Some functions are defined only for specific types, they can be called this way:

```
let some: String = 95.toString(); // toString() is a stdlib function that is defined on Int type
```

## Operators

TACT supports operations:

* `!!` suffix operator - enforce non-null value, defined only for nullable types.
* `!` - logical inversion, defined only for `Bool` type.
* `/`, `*`, `%` - division and multiplication operations, defined only for `Int` type
* `-`, `+` - arithmetic operations, defined only for `Int` type
* `!=`, `==` - equality operations
* `>`, `<`, `>=`, `<=` - compare operations, defined only for `Int` type
* `&&`, `||` - logical `AND` and `OR`
