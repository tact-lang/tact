contract OptionalSerializeTest {
  a: Int? as uint16;
  b: Bool?;

  init() {
    self.a = null;
    self.b = true;
  }
}