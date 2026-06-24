struct Nested {
  val: Int;
}

contract Test {
  field: Nested;

  init() {
    self.field = Nested{ val: 123 };
  }
}