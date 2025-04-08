struct Inner {
  small: Int? as uint3;
}

contract Test {
  data: Inner;

  init() {
    self.data = Inner{small: 7};
  }
}
