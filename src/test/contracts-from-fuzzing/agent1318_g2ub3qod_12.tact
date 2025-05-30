struct InnerMost {
  x: Int;
  y: Bool;
}

struct Inner {
  a: Int;
  im: InnerMost;
}

struct Outer {
  b: Bool;
  inner: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      b: true,
      inner: Inner{a: 7, im: InnerMost{x:1,y:false}}
    };
  }
}