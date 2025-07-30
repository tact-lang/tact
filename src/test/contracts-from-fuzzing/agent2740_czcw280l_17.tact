// Optional inside struct inside optional field
struct Inner {
  a: Int?;
}

contract OptChain {
  optInner: Inner?;

  init() {
    self.optInner = Inner{ a: null };
  }
}