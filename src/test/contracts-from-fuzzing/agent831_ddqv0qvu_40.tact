contract OptionalDefault {
  x: Int?;
  b: Bool?;

  init() {
    self.x = null;
    self.b = null;
  }
}