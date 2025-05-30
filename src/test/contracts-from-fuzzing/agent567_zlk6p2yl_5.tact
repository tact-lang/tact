contract OptionalFields {
  x: Int?;
  y: Bool?;
  z: String?;

  init() {
    self.x = 5;
    self.y = null;
    self.z = null;
  }
}