struct Nested {
  x: Int;
  y: Int?;
}

contract Test {
  foo: Nested;
  bar: Int;

  init() {
    self.foo = Nested{ x: 1, y: null };
    self.bar = 2;
  }
}