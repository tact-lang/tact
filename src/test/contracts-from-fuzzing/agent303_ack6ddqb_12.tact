struct Inner {
  a: Int;
}

struct Middle {
  inners: Inner;
}

struct Outer {
  m: Middle;
}

contract NestedStructs {
  storage: Outer;
  init() {
    self.storage = Outer{
      m: Middle{
        inners: Inner{ a: 999 }
      }
    };
  }
}