struct Inner {
  p: Int;
  q: Int?;
}

struct Middle {
  in1: Inner;
  in2: Inner;
}

struct Outer {
  mid: Middle;
  another: Inner?;
}

contract NestedComplex {
  state: Outer;

  init() {
    self.state = Outer{
      mid: Middle{
        in1: Inner{p: 1, q: null},
        in2: Inner{p: 2, q: 3}
      },
      another: null
    };
  }
}