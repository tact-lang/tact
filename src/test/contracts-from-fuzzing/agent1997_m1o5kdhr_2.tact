struct Inner {
  a: Int;
  b: Bool?;
}

struct Middle {
  inner: Inner;
  s: String?;
}

struct Outer {
  m: Middle;
  flag: Bool;
}

contract NestedStorage {
  s: Outer;

  init() {
    self.s = Outer{
      m: Middle{
        inner: Inner{
          a: 7,
          b: null
        },
        s: null
      },
      flag: true
    };
  }
}
