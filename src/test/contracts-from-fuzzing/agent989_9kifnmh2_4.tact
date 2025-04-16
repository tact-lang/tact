struct OptionalInner {
  a: Int?;
  b: Bool?;
}

contract OptTest {
  optField: OptionalInner;

  init() {
    self.optField = OptionalInner{ a: null, b: true };
  }
}