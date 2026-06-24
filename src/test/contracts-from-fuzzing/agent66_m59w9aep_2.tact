struct Nested {
  a: Int;
  b: Inner;
}

struct Inner {
  foo: Int;
}

contract Test {
  data: Nested;
  init() {
    self.data = Nested{ a: 1, b: Inner{ foo: 2 } };
  }
}