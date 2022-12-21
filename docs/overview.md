# TACT overview

TACT is a scallable and safe language to build smart contracts for TON.

* [Type System](/types.md)
* [Functions](/functions.md)
* [Statements](/statements.md)
* [Contracts](/contract.md)

## TLDR

```
import "@stdlib/ownable";

contract Sample with OwnableTransferable {
  owner: Address;
  counter: Int;
  
  init(owner: Address) {
    self.owner = owner;
    self.counter = 0;
  }
  
  receive("increment") {
    self.requireOwner();
    self.counter = self.counter + 1;
  }
  
  get fun counter() {
    return self.counter;
  }
}
```
