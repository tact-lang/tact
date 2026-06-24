struct ChainX {
  a: Int;
  b: ChainY;
}

struct ChainY {
  c: ChainZ;
}

struct ChainZ {
  d: Int;
}

contract Test45 {
  chain: ChainX;

  init() {
    self.chain = ChainX{
      a: 1,
      b: ChainY{
        c: ChainZ{ d: 2 }
      }
    };
  }
}