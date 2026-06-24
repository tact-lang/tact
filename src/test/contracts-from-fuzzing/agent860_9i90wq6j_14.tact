struct StructA {
  a1: Int;
}

struct StructB {
  b1: StructA;
}

struct StructC {
  c1: StructB;
}

struct StructD {
  d1: StructC;
}

contract Chain4 {
  root: StructD;

  init() {
    self.root = StructD{d1: StructC{c1: StructB{b1: StructA{a1: 9}}}};
  }
}