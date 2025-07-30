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

contract DeepStructs {
  s: Outer;

  init() {
    self.s = Outer{
      m1: Middle{
        i1: Inner{a:11},
        i2: Inner{a:12},
      },
      m2: Middle{
        i1: Inner{a:21},
        i2: Inner{a:22},
      }
    };
  }
}