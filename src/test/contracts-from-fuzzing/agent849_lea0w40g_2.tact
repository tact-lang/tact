struct Nested {
  x: Int;
  y: Int;
  z: Int?;
}

contract TestContract {
  nested: Nested;

  init() {
    self.nested = Nested{
      x: 1,
      y: 2,
      z: null,
    };
  }
}