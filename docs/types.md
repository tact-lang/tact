# TACT type system

Every variable, item, and value in a TACT program has a type:

* Primitives: Int, Bool, Slice, Cell, Builder, String and StringBuilder;
* Map
* Structs and Messages
* Contracts and Traits

Also all types could be defined as nullable.

## Primitive types

* Int - all integers in TACT are 257 bit signed integers.
* Bool - classical boolean with true/false values.
* Address - standart address.
* Slice, Cell, Builder - low level primitive of TON VM.
* String - type that represents text strings in TON VM.
* StringBuilder - helper type that allows you to concatenate strings in gas-efficient way

## Structs and Messages

Structs and Messages are almost the same thing with an only difference that message has a header in it's serialization and therefore could be used as receivers.

> **Warning**
> Currently circular **types** are not possible. Meaning that struct/message **A** can't have field of a struct/message **B** that have field of a struct/message **A**.

Example:
```
struct Point {
    x: Int;
    y: Int;
}

message SetValue {
    key: Int;
    value: Int?; // Optional
}
```

## Maps

The type `map[k]v` is used as way to associate data with corresponding keys.

Possible key types:
* Int
* Address

Possible value types:
* Int
* Bool
* Cell
* Address
* Struct/Message

## Contracts

Contracts are the main entry of a smart contract on TON blockchain. It holds all functions, getters and receivers of a contract.

```
contract HelloWorld {
  counter: Int;

  init() {
    self.counter = 0;
  }
  
  receive("increment") {
    self.counter = self.counter + 1;
  }
  
  get fun counter(): Int {
    return self.counter;
  }
}
```

## Traits

TACT doesn't support classical class inheritance, but instead introduces concept of **traits**. Trait defines functions, receivers and required fields. Trait is like abstract classes, but it does not define how and where fields must be stored. **All** fields from all traits must be explicitly declared in the contract itself. Traits itself also don't have constructors and all initial field initialization also must be done in main contract.

```
trait Ownable {
    owner: Address;

    fun requireOwner() {
        nativeThrowUnless(132, context().sender == self.owner);
    }

    get fun owner(): Address {
        return self.owner;
    }
}
```

And contract that uses trait:

```
contract Treasure with Ownable {
  owner: Address; // Field from trait MUST be defined in contract itself
  
  // Here we init the way we need, trait can't specify how you must init owner field
  init(owner: Address) {
    self.owner = owner;
  }
}
```
