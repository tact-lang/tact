struct Deep {
  a: Int;
  b: Bool;
  c: String;
}

struct Nested {
  d: Int;
  e: Deep;
  f: Bool;
}

contract LevelTest {
  g: Int;
  nested: Nested;

  init() {
    self.g = 42;
    self.nested = Nested{
      d: 7,
      e: Deep{
        a: 1,
        b: false,
        c: "text",
      },
      f: true,
    };
  }
}