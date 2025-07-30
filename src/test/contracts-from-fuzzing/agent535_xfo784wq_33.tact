struct Inner {
  x: Int = 42;
}

struct Wrapper {
  inner: Inner;
}

contract StructDefaultInnerTest {
  w: Wrapper;

  init() {
    self.w = Wrapper{ inner: Inner{} };
  }
}