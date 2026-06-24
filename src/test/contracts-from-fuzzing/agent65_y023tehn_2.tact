struct Nested {
  x: Int;
  y: Bool;
  z: Int?;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{
      x: 12,
      y: true,
      z: null,
    };
  }
}
