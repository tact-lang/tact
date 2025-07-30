struct RemainInnerMost {
  d: Slice as remaining;
}

struct RemainMiddle {
  c: Int;
  inner: RemainInnerMost;
}

contract RemainChain {
  payload: RemainMiddle;

  init() {
    self.payload = RemainMiddle{
      c: 123,
      inner: RemainInnerMost{
        d: emptyCell().asSlice()
      }
    };
  }
}