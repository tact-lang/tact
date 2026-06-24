contract OptThenAssign {
  x: Int?;
  y: Bool?;

  init() {
    self.x = null;
    self.y = true;
  }
}
