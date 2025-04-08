struct Nested {
  a: Int;
  b: Bool;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{a: 5, b: true};
  }
}