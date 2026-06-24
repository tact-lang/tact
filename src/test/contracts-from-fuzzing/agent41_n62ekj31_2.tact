struct Deep {
  nested: Nested;
}

struct Nested {
  value: Int;
}

contract Test {
  deepField: Deep;

  init() {
    self.deepField = Deep{ nested: Nested{ value: 42 } };
  }
}