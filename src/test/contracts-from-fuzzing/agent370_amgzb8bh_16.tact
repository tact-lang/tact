struct Mid {
  f1: Int;
  f2: Bool;
}

struct Outer {
  m1: Mid;
  m2: Mid;
}

contract TwoMid {
  data: Outer;

  init() {
    self.data = Outer{
      m1: Mid{f1: 11, f2: true},
      m2: Mid{f1: 22, f2: false}
    };
  }
}