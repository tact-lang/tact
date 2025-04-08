struct SInner {
  a: Int?;
}

struct SOuter {
  b: SInner?;
}

contract NullNest {
  s: SOuter?;

  init() {
    self.s = null;
  }
}