contract InitDefaults {
  a: Int = 10;
  b: Bool = false;

  init() {
    self.a = 20;
    self.b = true;
  }
}
