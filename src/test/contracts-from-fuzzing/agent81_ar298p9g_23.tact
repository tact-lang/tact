struct Wrapper {
  nested: Inner;
}

struct Inner {
  ival: Int;
  bval: Bool;
}

contract TestContract {
  w: Wrapper;

  init() {
    self.w = Wrapper{ nested: Inner{ ival: 10, bval: true } };
  }
}