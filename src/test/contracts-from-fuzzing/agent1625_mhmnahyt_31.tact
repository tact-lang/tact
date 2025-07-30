contract DefaultsWithOverride {
  x: Int = 1;
  y: Int;

  init() {
    self.y = 2;
    self.x = 3;
  }
}
