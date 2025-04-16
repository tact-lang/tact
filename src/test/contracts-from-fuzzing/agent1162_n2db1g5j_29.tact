contract BoolDefaults {
  a: Bool = false;
  b: Bool = true;
  c: Bool?;

  init() {
    self.c = null;
  }
}