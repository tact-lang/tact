struct Nested {
  x: Int;
  y: Int;
}

contract HasNested {
  val: Nested;

  init() {
    self.val = Nested{ x: 10, y: 20 };
  }
}