struct SInner {
  x: Int;
}

struct SOuter {
  s: SInner;
}

contract OptionalOuterS {
  os: SOuter?;
  init() {
    self.os = null;
  }
}