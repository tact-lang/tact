struct ChainC {
  z: Int;
}

struct ChainB {
  c: ChainC;
}

struct ChainA {
  b: ChainB;
}

contract OptionalChain {
  state: ChainA?;

  init() {
    self.state = ChainA{
      b: ChainB{
        c: ChainC{
          z: 99
        }
      }
    };
  }
}