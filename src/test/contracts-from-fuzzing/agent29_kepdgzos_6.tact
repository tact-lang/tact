struct InnerMost {
  a: Int;
}

struct Inner {
  s: InnerMost;
}

struct Outer {
  inner: Inner;
}

contract NestedSingle {
  val: Outer;

  init() {
    self.val = Outer{
      inner: Inner{
        s: InnerMost{
          a: 42,
        }
      }
    };
  }
}