contract StringOptionalMixed {
  x: String?;
  y: String;

  init() {
    self.x = null;
    self.y = "hello";
  }
}