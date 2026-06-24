struct Nested {
  a: Int;
  b: Bool?;
  c: String;
}

struct Outer {
  i: Int;
  n: Nested;
  s: String?;
}

contract Complex {
  data: Outer;

  init() {
    self.data = Outer{
      i: 5,
      n: Nested{ a: 1, b: null, c: "x" },
      s: null
    };
  }
}