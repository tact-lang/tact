contract ContrMix {
  x: Int?;
  y: Bool = true;
  z: String?;

  init() {
    self.x = 42;
    self.y = false;
    self.z = null;
  }
}