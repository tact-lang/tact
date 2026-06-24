contract OptionalDefaultTest {
  x: Int?;
  y: String?;

  init() {
    self.x = null;
    self.y = "";
  }
}