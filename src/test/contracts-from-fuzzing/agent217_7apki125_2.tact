struct Inner {
  a: Int?;
  b: Int;
}

struct Middle {
  c: Int;
  d: Inner;
}

struct Outer {
  e: Middle;
  f: Int?;
}

contract DeepNestedTest {
  storage: Outer;

  init() {
    self.storage = Outer{
      e: Middle{
        c: 1,
        d: Inner{
          a: null,
          b: 2,
        },
      },
      f: null,
    };
  }
}