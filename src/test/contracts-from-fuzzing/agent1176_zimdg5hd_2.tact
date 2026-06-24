struct Inner {
  i: Int;
  b: Bool = true;
  s: String = "hi";
}

contract NestedContract {
  nested: Inner?;

  init() {
    self.nested = Inner{ i: 10 };
  }
}