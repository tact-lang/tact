struct InnerMost {
  a: Int;
  b: Int?;
}

struct Inner {
  im: InnerMost;
  c: String?;
}

struct Outer {
  inner: Inner;
  d: Bool;
}

contract DeepNesting {
  state: Outer;

  init() {
    self.state = Outer{
      inner: Inner{
        im: InnerMost{ a:1, b:null },
        c: null
      },
      d: true
    };
  }
}