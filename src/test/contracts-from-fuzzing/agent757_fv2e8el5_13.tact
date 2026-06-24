struct First {
  a: Int;
}

struct Second {
  b: Bool;
  inner: First;
}

contract FieldsOrder {
  x: Second;

  init() {
    self.x = Second{ b: false, inner: First{ a: 42 } };
  }
}