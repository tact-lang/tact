struct Nested {
  x: Int;
  y: Bool;
}

contract TestNested {
  data: Nested;

  init() {
    self.data = Nested{ x: 7, y: true };
  }
}
