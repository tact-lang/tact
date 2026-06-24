struct Inner {
  x: Int;
  y: Bool;
}

struct Middle {
  in1: Inner;
  in2: Inner;
}

struct Outer {
  m1: Middle;
  m2: Middle;
  flag: Bool;
}

contract DeepNestTest {
  outer: Outer;

  init() {
    self.outer = Outer{
      m1: Middle{ in1: Inner{ x: 1, y: true }, in2: Inner{ x: 2, y: false } },
      m2: Middle{ in1: Inner{ x: 3, y: true }, in2: Inner{ x: 4, y: false } },
      flag: true
    };
  }
}