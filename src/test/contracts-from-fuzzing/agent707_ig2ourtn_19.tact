struct ChainOpt {
  a: Int?;
  b: Bool?;
  c: Cell?;
}

struct ChainWrap {
  inner: ChainOpt;
}

contract NestedAllOptional {
  w: ChainWrap;
  init() {
    self.w = ChainWrap{ inner: ChainOpt{ a:null, b:null, c:null } };
  }
}