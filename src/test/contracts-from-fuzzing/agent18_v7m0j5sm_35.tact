struct Outer {
  a: Int?;
  b: Inner;
}

struct Inner {
  c: Int?;
  d: Int;
}

contract OptMix {
  v: Outer;

  init() {
    self.v = Outer{
      a: null,
      b: Inner{ c:null, d:42 }
    };
  }
}