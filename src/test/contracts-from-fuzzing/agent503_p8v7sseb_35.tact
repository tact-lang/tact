struct Inner {
  n: Int?;
}

struct Outer {
  inr: Inner;
}

contract NestedOptionExplicitNull {
  d: Outer;

  init() {
    self.d = Outer{
      inr: Inner{ n: null }
    };
  }
}
