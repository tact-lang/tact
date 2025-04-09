struct Inner {
  a: Int;
}

struct Outer {
  nested: Inner;
  b: Int;
}

contract Test {
  field: Outer;
  init() {
    self.field = Outer{
      nested: Inner{ a: 1 },
      b: 2,
    };
  }
}