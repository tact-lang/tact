struct Nested {
  x: Int;
  y: Int?;
}

contract Test {
  info: Nested;

  init() {
    self.info = Nested{ x: 1, y: 2 };
  }
}