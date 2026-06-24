contract OptionalPrimitives {
  x: Int?;
  y: Bool?;
  z: Address?;
  s: String?;

  init() {
    self.x = null;
    self.y = null;
    self.z = null;
    self.s = null;
  }
}