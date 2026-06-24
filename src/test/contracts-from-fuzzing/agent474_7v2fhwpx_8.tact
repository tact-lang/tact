struct Tiny {
  i: Int;
}

struct Middle {
  ts: Tiny;
}

struct Big {
  ms: Middle;
}

contract Test {
  nested: Big;

  init() {
    self.nested = Big{
      ms: Middle{
        ts: Tiny{ i: 101 }
      }
    };
  }
}
