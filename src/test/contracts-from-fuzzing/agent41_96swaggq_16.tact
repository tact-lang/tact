struct ChainDefaults {
  a: InnerA;
}

struct InnerA {
  b: InnerB;
}

struct InnerB {
  c: InnerC;
}

struct InnerC {
  d: Int = 42;
}

contract DeepDefaultChain {
  ch: ChainDefaults;

  init() {
    self.ch = ChainDefaults{
      a: InnerA{
        b: InnerB{
          c: InnerC{}
        }
      }
    };
  }
}
