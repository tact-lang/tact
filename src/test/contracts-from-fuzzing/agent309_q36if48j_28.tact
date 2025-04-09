struct Nested {
  i: Int;
}

contract OptionalNestedContract {
  s: Nested?;

  init() {
    self.s = null;
  }
}