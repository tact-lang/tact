contract PartialDefaults {
  x: Int = 10;
  y: Int;

  init() {
    self.y = 20;
  }
}