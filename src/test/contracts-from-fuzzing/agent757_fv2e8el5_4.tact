struct InnerMost {
  z: Bool;
}

struct Inner {
  x: Int;
  y: InnerMost;
}

struct Mid {
  a: Inner;
  b: Inner;
}

contract DeepNesting {
  data: Mid;

  init() {
    self.data = Mid{
      a: Inner{ x: 1, y: InnerMost{ z: true } },
      b: Inner{ x: 2, y: InnerMost{ z: false } }
    };
  }
}