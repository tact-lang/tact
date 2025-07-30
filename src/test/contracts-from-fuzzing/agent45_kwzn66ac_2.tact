struct NestedNested {
  g: Int;
  h: Bool;
}

struct Nested {
  d: Int;
  e: Bool;
  f: NestedNested;
}

contract DeepNestedTest {
  a: Int;
  b: Bool;
  c: Nested;

  init() {
    self.a = 1;
    self.b = false;
    self.c = Nested {
      d: 2,
      e: true,
      f: NestedNested {
        g: 3,
        h: false
      }
    };
  }
}