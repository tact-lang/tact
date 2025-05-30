contract OptionalFieldsTest {
  x: Int?;
  y: Int?;

  init() {
    self.x = null;
    self.y = 123;
  }
}