struct Inner {
  foo: Int;
}

contract TestContract {
  nested: Inner?;

  init() {
    self.nested = Inner { foo: 33 };
  }
}