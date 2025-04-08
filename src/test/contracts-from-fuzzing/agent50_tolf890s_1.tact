struct Nested {
  x: Int;
  y: Int?;
}

struct Outer {
  inside: Nested;
  z: Bool;
}

contract DeepNestedTest {
  data: Outer;

  init() {
    self.data = Outer{
      inside: Nested{ x: 1, y: null },
      z: true
    };
  }
}