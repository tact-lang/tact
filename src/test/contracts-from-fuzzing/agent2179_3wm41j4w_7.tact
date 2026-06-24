struct Inner {
  a: Int;
}

struct Middle {
  i1: Inner;
  i2: Inner;
}

struct Outer {
  m1: Middle;
  m2: Middle;
}

contract NestedDuplicateStructs {
  data: Outer;

  init() {
    self.data = Outer{
      m1: Middle{ i1: Inner{a: 1}, i2: Inner{a:2} },
      m2: Middle{ i1: Inner{a:3}, i2: Inner{a:4} }
    };
  }
}