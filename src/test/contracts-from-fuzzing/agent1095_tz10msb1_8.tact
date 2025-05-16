struct SInner {
  a: Int;
  b: Bool;
}

struct SLevel {
  s1: SInner?;
  s2: SInner?;
}

contract MultiOpt {
  state: SLevel;

  init() {
    self.state = SLevel{
      s1: null,
      s2: SInner{ a: 1, b: true }
    };
  }
}