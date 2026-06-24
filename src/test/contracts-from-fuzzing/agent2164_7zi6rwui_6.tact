struct Deep2 {
  x: Int;
}

struct Mid {
  a: Deep2;
  b: Int;
}

struct Top {
  foo: Mid;
  bar: Int;
}

contract Test {
  state: Top;

  init() {
    self.state = Top {
      foo: Mid {
        a: Deep2 { x: 123 },
        b: 456
      },
      bar: 789
    };
  }
}
