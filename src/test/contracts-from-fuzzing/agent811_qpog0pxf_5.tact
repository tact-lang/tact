struct InnerMost {
  v: Int;
  maybeFlag: Bool?;
}

struct Inner {
  amount: Int;
  maybeInnerMost: InnerMost?;
}

struct Outer {
  count: Int;
  nested: Inner;
  maybeNested: Inner?;
}

contract DeepNest {
  val: Outer = Outer{
    count: 5,
    nested: Inner{
      amount: 10,
      maybeInnerMost: null,
    },
    maybeNested: null,
  };

  init() {
    self.val = Outer{
      count: 7,
      nested: Inner{
        amount: 20,
        maybeInnerMost: InnerMost{
          v: 55,
          maybeFlag: true,
        },
      },
      maybeNested: Inner{
        amount: -30,
        maybeInnerMost: InnerMost{
          v: -66,
          maybeFlag: null,
        },
      },
    };
  }
}