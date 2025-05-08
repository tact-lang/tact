struct Inner {
  a: Int;
  b: Bool;
}

struct Mid {
  i1: Inner;
  i2: Inner;
}

struct Outer {
  m1: Mid;
  m2: Mid;
}

contract TestContract {
  storage: Outer;

  init() {
    self.storage = Outer{
      m1: Mid{
        i1: Inner{a: 1, b: true},
        i2: Inner{a: 2, b: false}
      },
      m2: Mid{
        i1: Inner{a:3, b: false},
        i2: Inner{a:4, b:true}
      }
    };
  }
}