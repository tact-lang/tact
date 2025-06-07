contract OptionalDefaults {
  x: Int? = null;
  y: Bool? = null;

  init() {
    self.x = null;
    self.y = null;
  }
}