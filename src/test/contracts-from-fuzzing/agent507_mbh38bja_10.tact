struct ChainA { x: Int; }
struct ChainB { prev: ChainA; }
struct ChainC { prev: ChainB; }
struct ChainD { prev: ChainC; }

contract ChainNested {
  data: ChainD;

  init() {
    self.data = ChainD{ prev: ChainC{ prev: ChainB{ prev: ChainA{ x: 55 } } } };
  }
}
