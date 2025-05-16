struct Wrap {
  inner1: Int;
  inner2: Int;
}

struct OuterWrap {
  w1: Wrap;
  w2: Wrap;
  w3: Wrap;
}

contract MultiWrap {
  store: OuterWrap;

  init() {
    self.store = OuterWrap{
      w1: Wrap{inner1:1, inner2:2},
      w2: Wrap{inner1:3, inner2:4},
      w3: Wrap{inner1:5, inner2:6},
    };
  }
}