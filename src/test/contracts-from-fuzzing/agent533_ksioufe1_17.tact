struct SInner {
  x: Int;
}

struct SOuter {
  i1: SInner;
  i2: SInner;
  i3: SInner;
}

contract SameNested {
  x: SOuter;

  init() {
    self.x = SOuter{
      i1: SInner{x:1},
      i2: SInner{x:2},
      i3: SInner{x:3}
    };
  }
}