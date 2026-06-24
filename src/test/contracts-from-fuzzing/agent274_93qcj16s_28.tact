struct ChainA {
  sub: ChainB;
}

struct ChainB {
  sub: ChainC;
}

struct ChainC {
  sub: ChainD;
}

struct ChainD {
  sub: ChainE;
}

struct ChainE {
  leaf: Int;
}

contract LongChain {
  chain: ChainA;

  init() {
    self.chain = ChainA{
      sub: ChainB{
        sub: ChainC{
          sub: ChainD{
            sub: ChainE{
              leaf: 65536
            }
          }
        }
      }
    };
  }
}
