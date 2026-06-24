struct ChainA {
  val: Int;
}

struct ChainB {
  a: ChainA;
}

struct ChainC {
  b: ChainB;
}

struct ChainD {
  c: ChainC;
}

contract ChainLink {
  d: ChainD;

  init() {
    self.d = ChainD{ c: ChainC{ b: ChainB{ a: ChainA{ val:7 } } } };
  }
}