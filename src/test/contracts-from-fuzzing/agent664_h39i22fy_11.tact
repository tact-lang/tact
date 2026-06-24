struct OptionalInner {
  flag: Bool?;
}

struct S {
  inner: OptionalInner?;
}

contract Test {
  state: S;

  init() {
    self.state = S{
      inner: null,
    };
  }
}