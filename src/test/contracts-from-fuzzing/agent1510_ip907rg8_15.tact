struct Ragged {
  a: Int;
  b: OptInner?;
  c: Int;
}

struct OptInner {
  x: Int;
  y: Int;
}

contract RaggedOptionals {
  r: Ragged;

  init() {
    self.r = Ragged{
      a: 1,
      b: null,
      c: 3
    };
  }
}