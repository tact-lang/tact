struct ChainA {
  b: ChainB;
}

struct ChainB {
  c: ChainC;
}

struct ChainC {
  d: ChainD;
}

struct ChainD {
  e: ChainE;
}

struct ChainE {
  i: Int;
}

contract Test23 {
  deep: ChainA;

  init() {
    self.deep = ChainA{
      b: ChainB{
        c: ChainC{
          d: ChainD{
            e: ChainE{i:123}
          }
        }
      }
    };
  }
}