struct Inner {
  foo: Int;
}

struct Outer {
  inn: Inner?;
  bar: Int;
}

contract Test {
  outer: Outer;

  init() {
    self.outer = Outer{
      inn: null,
      bar: 1
    };
  }

  receive() {
    self.outer = Outer{
      inn: Inner{foo: 42},
      bar: 2
    };
  }
}
