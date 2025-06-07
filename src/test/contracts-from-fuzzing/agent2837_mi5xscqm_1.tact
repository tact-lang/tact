struct Inner {
  inside: Int;
}

contract TestNested {
  nested: Inner;
  init() {
    self.nested = Inner{ inside: 42 };
  }
}