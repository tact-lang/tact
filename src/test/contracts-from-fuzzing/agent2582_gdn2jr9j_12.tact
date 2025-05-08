struct Inner {
  x: Int;
}

struct Outer {
  i1: Inner;
  i2: Inner;
  i3: Inner;
  i4: Inner;
}

contract Test {
  val: Outer;

  init() {
    self.val = Outer{
      i1: Inner{x:1},
      i2: Inner{x:2},
      i3: Inner{x:3},
      i4: Inner{x:4},
    };
  }
}
