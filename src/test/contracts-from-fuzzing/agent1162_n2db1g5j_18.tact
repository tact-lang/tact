contract OptionalDefaults {
  x: Int?;
  y: Bool = true;
  z: String?;

  init() {
    self.x = null;
    self.z = null;
  }
}