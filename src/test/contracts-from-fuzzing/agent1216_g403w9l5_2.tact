struct Nested {
  a: Int;
  b: Bool;
}

struct Outer {
  n1: Nested;
  n2: Nested;
  n3: Nested;
  str: String;
}

contract DeepNestTest {
  outer: Outer;

  init() {
    self.outer = Outer{
      n1: Nested{ a: 1, b: true },
      n2: Nested{ a: 2, b: false },
      n3: Nested{ a: 3, b: true },
      str: "test",
    };
  }
}