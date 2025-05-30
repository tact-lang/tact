struct RecA {
  a: Int;
  b: RecB;
}

struct RecB {
  x: Int;
  y: String;
}

contract RecursionTest {
  data: RecA;

  init() {
    self.data = RecA{
      a: 1,
      b: RecB{ x: 2, y: "abc" }
    };
  }
}