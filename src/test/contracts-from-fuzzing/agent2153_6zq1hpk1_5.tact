struct Inner {
  x: Int;
  y: Int?;
}

contract OptionalNested {
  nested: Inner?;

  init() {
    self.nested = null;
  }
}
