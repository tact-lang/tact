struct Wrap {
  inner: Wrapped;
}

struct Wrapped {
  data: Int;
}

contract WrapTest {
  w: Wrap;

  init() {
    self.w = Wrap{inner: Wrapped{data: 42}};
  }
}