struct Inner {
  a: Int?;
  b: Bool?;
}

struct OuterOpt {
  opt1: Inner?;
  opt2: Inner?;
}

contract ManyNestedOpts {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{
      opt1: null,
      opt2: Inner{
        a: 8,
        b: false
      }
    };
  }
}
