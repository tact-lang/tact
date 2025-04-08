struct InnerMost { x: Int; y: Bool; }

struct Inner {
  a: Int;
  b: Bool;
  c: InnerMost;
  d: Int?;
}

contract DeepNest {
  s: Inner;

  init() {
    self.s = Inner{
      a: 1,
      b: true,
      c: InnerMost{ x: 2, y: false },
      d: null
    };
  }
}
