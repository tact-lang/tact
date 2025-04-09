struct Inner {
  optVal: Int?;
  toggle: Bool?;
}

contract OptionalStructTest {
  s: Inner;

  init() {
    self.s = Inner{
      optVal: null,
      toggle: null
    };
  }
}