struct InnerMost {
  a: Int;
}

struct MiddleLevel {
  inner: InnerMost;
}

struct TopLevel {
  mid: MiddleLevel;
}

contract MultiLayerNested {
  store: TopLevel;

  init() {
    self.store = TopLevel{
      mid: MiddleLevel{
        inner: InnerMost{
          a: 42,
        },
      },
    };
  }
}