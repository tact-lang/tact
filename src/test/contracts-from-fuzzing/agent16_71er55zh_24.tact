struct One {
  a: Int;
}

struct Two {
  x: One;
}

struct Three {
  y: Two;
}

contract ChainWraps {
  field: Three;

  init() {
    self.field = Three{ y: Two{ x: One{ a: 8 } } };
  }
}