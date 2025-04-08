struct Foo {
  x: Int;
}

struct Wrapper {
  nested: Foo?;
}

contract TestContract {
  w: Wrapper;

  init() {
    self.w = Wrapper{ nested: null };
  }
}
