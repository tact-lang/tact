struct Nested {
  inner1: Int;
  inner2: Bool;
  deeper: Deeper;
}

struct Deeper {
  d1: Int;
  d2: Bool;
  d3: String;
}

contract DeepTest {
  n: Nested;
  init() {
    self.n = Nested{
      inner1: 5,
      inner2: false,
      deeper: Deeper{d1:10, d2: true, d3: "x"},
    };
  }
}
