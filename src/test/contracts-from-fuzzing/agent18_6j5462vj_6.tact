struct OptionalInner {
  foo: Int?;
  bar: Bool?;
}

contract OptTest {
  data: OptionalInner?;
  init() {
    self.data = null;
  }
}