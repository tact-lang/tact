contract OptAssign {
  x: Int?;
  init() {
    self.x = null;
    self.x = 123;
  }
}