struct Inner {
  val1: Int;
  val2: Bool;
}

contract Test {
  nested: Inner; // Nested struct as persistent state

  init() {
    self.nested = Inner{ val1: 1, val2: true };
  }
}