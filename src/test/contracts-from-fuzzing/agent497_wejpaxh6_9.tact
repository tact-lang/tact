struct InnerMost {
  val: Int;
}

struct Middle {
  a: InnerMost;
  b: InnerMost;
}

struct Outer {
  m1: Middle;
  m2: Middle;
}

contract TestContract {
  st: Outer;

  init() {
    self.st = Outer{
      m1: Middle{ a: InnerMost{val: 1}, b: InnerMost{val: 2} },
      m2: Middle{ a: InnerMost{val:3}, b: InnerMost{val:4} },
    };
  }
}