contract OptionalBoolTest {
  a: Bool?;
  b: Bool?;

  init() {
    self.a = null;
    self.b = null;
  }

  receive() {
    if (self.a != null) {
      let _ = self.a!!;
    }
  }
}
