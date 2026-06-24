struct InnerMost {
  a: Int;
}

struct Inner {
  m1: InnerMost;
  m2: InnerMost;
}

struct Middle {
  i1: Inner;
  i2: Inner;
}

struct Outer {
  m: Middle;
}

contract ManyLayers {
  val: Outer;
  init() {
    self.val = Outer{
      m: Middle{
        i1: Inner{m1: InnerMost{a:1}, m2: InnerMost{a:2}},
        i2: Inner{m1: InnerMost{a:3}, m2: InnerMost{a:4}}
      }
    };
  }
}