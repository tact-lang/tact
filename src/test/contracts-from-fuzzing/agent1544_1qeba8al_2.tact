struct Nested {
  a: Int;
  b: Bool;
  deeper: Deeper;
}

struct Deeper {
  x: Int;
  y: Bool;
  z: Bool?;
}

contract ManyLevels {
  s: Nested;

  init() {
    self.s = Nested{
      a: 1,
      b: true,
      deeper: Deeper{
        x: 5,
        y: false,
        z: null
      }
    };
  }
}
