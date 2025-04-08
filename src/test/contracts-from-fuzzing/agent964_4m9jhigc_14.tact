struct SInner {
  v: Int;
}

struct SOuter {
  i1: SInner;
  i2: SInner;
  i3: SInner;
}

contract MultiNestedStructs {
  container: SOuter;

  init() {
    self.container = SOuter{
      i1: SInner{v:1},
      i2: SInner{v:2},
      i3: SInner{v:3}
    };
  }
}
