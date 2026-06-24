struct Inner {
  flag: Bool?;
  count: Int?;
}

struct Outer {
  inner: Inner?;
  maybeNum: Int?;
  maybeFlag: Bool?;
}

contract OptionMix {
  stuff: Outer;

  init() {
    self.stuff = Outer {
      inner: null,
      maybeNum: null,
      maybeFlag: null
    };
  }
}