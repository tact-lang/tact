contract InitOrder {
  x: Int = 1;
  y: Int;

  init() {
    self.y = self.x + 1;
  }
}