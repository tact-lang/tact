// Compose nested struct containing optional struct containing optional field
struct InnerMost {
  v: Int?;
}

struct MidOpt {
  innerMost: InnerMost?;
}

struct OuterWrap {
  mid: MidOpt;
}

contract OptChain {
  chain: OuterWrap;
  init() {
    self.chain = OuterWrap{ mid: MidOpt{ innerMost: InnerMost{ v: null } } };
  }
}