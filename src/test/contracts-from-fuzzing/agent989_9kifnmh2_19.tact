struct BigNested {
  n1: Nested;
  n2: Nested;
}

struct Nested {
  x: Int;
  y: Bool;
  z: String;
}

contract BigNest {
  val: BigNested;

  init() {
    self.val = BigNested{
      n1: Nested{ x: 1, y: true, z: "a" },
      n2: Nested{ x: 2, y: false, z: "b" }
    };
  }
}