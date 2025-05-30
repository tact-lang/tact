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
  val: Int?;
}

contract LongChain {
  root: ChainA;

  init() {
    self.root = ChainA{
      b: ChainB{
        c: ChainC{
          d: ChainD{
            val: null
          }
        }
      }
    };
  }
}