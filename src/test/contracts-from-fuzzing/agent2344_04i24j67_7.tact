struct Middle {
  foo: Int?;
}

struct Outer {
  a: Int;
  m: Middle;
  b: Int?;
}

contract OptionalMix {
  s: Outer;

  init() {
    self.s = Outer{
      a: 1,
      m: Middle{ foo: null },
      b: null,
    };
  }
}