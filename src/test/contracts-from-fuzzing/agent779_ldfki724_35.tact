struct Mid {
  a: Int;
  b: Bool;
}

struct Outer {
  m1: Mid;
  m2: Mid;
}

contract DoubleMid {
  data: Outer;

  init() {
    self.data = Outer{
      m1: Mid{ a: 1, b: true },
      m2: Mid{ a: 2, b: false }
    };
  }
}