contract OmitDefaults {
  x: Int;
  y: Bool = false;
  s: String;

  init() {
    self.x = 99;
    self.s = "hello";
  }
}
