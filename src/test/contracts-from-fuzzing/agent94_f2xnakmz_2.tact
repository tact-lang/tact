struct Nested {
  x: Int;
  y: Bool;
}

struct Outer {
  n: Nested;
  z: String;
}

contract Deep {
  field: Outer;

  init() {
    self.field = Outer{
      n: Nested{ x: 10, y: false },
      z: "test"
    };
  }
}