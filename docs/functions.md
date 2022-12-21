# TACT functions

Functions in TACT could be defined in different ways:

* Global static function
* Extension functions
* Mutable functions
* Native functions
* Receiver functions
* Getter functions

## Global static functions

You can define global function anywhere in you program:

```
fun pow(a: Int, c: Int): Int {
  let res: Int = a;
  repeat(c) {
    res = res * a;
  }
  return res;
}
```

## Extension function

Extension functions allows you to implement extension for any possible type.

> **Warning**
> Name of the first argument MUST be named `self` and type of this argument is the type you are extending.

```
extends fun pow(self: Int, c: Int) {
  let res: Int = a;
  repeat(c) {
    res = res * a;
  }
  return res;
}
```

## Mutable functions

Mutable functions are performing mutation of a value replacing it with an execution result. To perform mutation function must change `self` value.

```
extends mutates fun pow(self: Int, c: Int) {
  let res: Int = a;
  repeat(c) {
    res = res * a;
  }
  self = res;
}
```

## Native functions

Native functions are direct binding to a func functions:

> **Note**
> Native functions could be also mutable and extension

```
@name(store_uint)
native storeUint(s: Builder, value: Int, bits: Int): Builder;

@name(load_int)
extends mutates native loadInt(self: Slice, l: Int): Int;
```

## Receiver functions

Receiver functions are special function that are responsible of receiving messages in contracts and could be defined only within a contract or trait.

```
contract Treasure {

  // ...
  
  // This means that this contract can receive comment "Increment" and this function would be called for such messages
  receive("Increment") {
    self.counter = self.counter + 1;
  }
}
```

## Getter Functions

Getter functions that defines getters on smart contract and can be defined only within a contract or trait.

```
contract Treasure {

  // ...
  
  get fun counter(): Int {
    return self.counter;
  }
}
```
