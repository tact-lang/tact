struct Inner {
  a: Int;
}

contract TestContract {
  nested: Inner;

  init() {
    self.nested = Inner{ a: 5 };
  }
}
