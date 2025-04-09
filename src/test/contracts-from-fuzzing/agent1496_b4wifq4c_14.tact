struct NestedOpt {
  x: Int?;
  y: Bool;
}

struct Wrapper {
  inner: NestedOpt?;
}

contract OptionalNestedTest {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      inner: NestedOpt{x: null, y: true}
    };
  }
}