primitive Int;

trait BaseTrait { virtual const storageReserve: Int = 0; }

contract Foo {
  // this should be a var-scope error because storageReserve
  // is a virtual constant defined in BaseTrait
  storageReserve: Int;

  init() {
    self.storageReserve = ton("0.05");
  }
}
