struct NestedOpt {
  opt1: Inner?;
}

struct Inner {
  foo: Int;
  bar: String?;
}

contract Test {
  s: NestedOpt;

  init() {
    self.s = NestedOpt{
      opt1: Inner{
        foo: 7,
        bar: null
      }
    };
  }
}
