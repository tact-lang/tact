contract OptionalAndDefaults {
  x: Int?;
  y: Int = 5;
  z: Bool?;

  init() {
    self.x = null;
    self.z = null;
    self.y = 42;
  }
}