struct Deep {
  a: Int;
  b: Bool;
  c: String;
}

struct Middle {
  d: Deep;
  e: Deep?;
}

struct Top {
  f: Middle;
  g: Middle?;
}

contract ChainNestedTest {
  store: Top;

  init() {
    self.store = Top{
      f: Middle{ d: Deep{a: 1, b: false, c: "x"}, e: null },
      g: null
    };
  }
}