struct InnerMost {
  a: Int;
  b: Bool;
}

struct Inner {
  m: Int?;
  n: Bool?;
  o: InnerMost;
}

struct Outer {
  x: Int;
  y: Bool;
  z: Inner;
}

contract DeepNestedStorage {
  s: Outer;

  init() {
    self.s = Outer{
      x: 1,
      y: true,
      z: Inner{
        m: null,
        n: false,
        o: InnerMost{
          a: 42,
          b: true,
        },
      },
    };
  }
}