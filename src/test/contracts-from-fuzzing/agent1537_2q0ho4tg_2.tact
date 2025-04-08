struct InnerMost {
  val: Int;
}

struct Inner {
  im: InnerMost;
  flag: Bool;
}

contract Test {
  nested: Inner;

  init() {
    self.nested = Inner{
      im: InnerMost{ val: 17 },
      flag: false,
    };
  }
}