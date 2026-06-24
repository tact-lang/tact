struct BigNested {
  a: Int;
  b: Nested;
}

struct Nested {
  x: Int;
  y: Nested2;
}

struct Nested2 {
  s: String;
  f: Bool;
}

contract HugeNest {
  data: BigNested;

  init() {
    self.data = BigNested {
      a: 1,
      b: Nested {
        x: 2,
        y: Nested2 {
          s: "end",
          f: true
        }
      }
    };
  }
}