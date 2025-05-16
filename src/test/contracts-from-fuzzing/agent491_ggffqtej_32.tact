struct Ordered {
  a: Int;
  b: Int;
}

contract OrderOverride {
  foo: Ordered;

  init() {
    self.foo = Ordered{ b:2, a:1 };
  }
}
