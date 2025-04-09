contract DefaultField {
  x: Int;
  y: Int = 5;

  init() {
    self.x = 10;
  }
}