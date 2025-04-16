struct InnerMost {
  val: Int;
}

struct Inner {
  nested: InnerMost;
  opt: Int?;
}

struct Outer {
  s: Inner;
  opt_s: Inner?;
}

contract TestContract {
  field: Outer;

  init() {
    self.field = Outer{
      s: Inner{
        nested: InnerMost{ val: 1 },
        opt: null,
      },
      opt_s: null,
    };
  }
}