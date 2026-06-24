struct ChainA {
  x: Int;
  b: ChainB;
}

struct ChainB {
  y: Int;
  c: ChainC;
}

struct ChainC {
  z: Int;
}

contract DeepChain {
  root: ChainA;
  init() {
    self.root = ChainA{
      x: 1,
      b: ChainB{
        y: 2,
        c: ChainC{
          z: 3
        }
      }
    };
  }
}