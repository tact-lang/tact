struct InnerMost {
  value: Int;
}

struct OptionalInner {
  im: InnerMost?;
}

struct Outer {
  opt: OptionalInner?;
}

contract Test {
  s: Outer;

  init() {
    self.s = Outer{
      opt: null
    };
  }
}