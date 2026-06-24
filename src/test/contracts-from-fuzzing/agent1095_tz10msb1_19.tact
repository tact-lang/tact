struct Inner {
  a: Int;
}

struct Middle {
  x: Inner;
}

struct Outer {
  y: Middle;
}

contract DeeplyNestedOnlyInts {
  s: Outer;

  init() {
    self.s = Outer{
      y: Middle{ x: Inner{ a: 123 } }
    };
  }
}