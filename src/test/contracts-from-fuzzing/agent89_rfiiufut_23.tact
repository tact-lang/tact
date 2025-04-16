struct InnerRem {
  after: Cell as remaining;
}

struct OuterRem {
  before: Int;
  inner: InnerRem;
}

contract NestedRemaining {
  s: OuterRem;

  init() {
    self.s = OuterRem {
      before: 1,
      inner: InnerRem {
        after: emptyCell()
      }
    };
  }
}
