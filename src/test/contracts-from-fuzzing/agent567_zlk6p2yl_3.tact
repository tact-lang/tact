struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  inn: Inner;
  x: Int;
}

contract TestNested {
  data: Outer;

  init() {
    self.data = Outer{
      inn: Inner{ a: 7, b: true },
      x: 99,
    };
  }
}