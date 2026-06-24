struct Inner {
  a: Int;
}

struct Outer {
  i1: Inner;
  i2: Inner;
  i3: Inner;
}

contract RepeatedNested {
  data: Outer;

  init() {
    self.data = Outer{
      i1: Inner{a: 1},
      i2: Inner{a: 2},
      i3: Inner{a: 3},
    };
  }
}