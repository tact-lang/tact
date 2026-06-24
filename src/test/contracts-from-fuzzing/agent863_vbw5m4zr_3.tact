struct L2 {
  foo: Int;
}

struct L1 {
  bar: L2;
}

contract Test {
  nested: L1;

  init() {
    self.nested = L1 { bar: L2 { foo: 42 } };
  }
}