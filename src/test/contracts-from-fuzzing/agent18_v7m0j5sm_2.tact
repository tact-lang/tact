struct Nested {
  x: Int;
  y: Int?;
  z: Inner;
}

struct Inner {
  a: Int;
  b: Int?;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{
      x: 10,
      y: null,
      z: Inner{ a: 1, b: null }
    };
  }
}