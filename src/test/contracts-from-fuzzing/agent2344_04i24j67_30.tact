contract InitNoDefaults {
  x: Int;
  y: Bool;

  init() {
    self.x = 11;
    self.y = false;
  }
}