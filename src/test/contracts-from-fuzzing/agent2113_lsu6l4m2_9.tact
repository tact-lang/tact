struct InnerMost {
  value: Int?;
}

struct Mid {
  inner: InnerMost?;
}

struct OuterMost {
  mid: Mid?;
}

contract DeepOptionals {
  storage: OuterMost;

  init() {
    self.storage = OuterMost{
      mid: null
    };
  }
}