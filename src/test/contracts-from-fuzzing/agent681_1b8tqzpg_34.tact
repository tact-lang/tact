struct Nested {
  foo: Int;
}

contract NullablePersistent {
  val: Nested?;

  init() {
    self.val = null;
  }
}