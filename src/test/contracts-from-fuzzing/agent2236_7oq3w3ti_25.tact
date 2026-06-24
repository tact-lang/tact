contract OnlyBools {
  a: Bool;
  b: Bool;
  c: Bool?;
  d: Bool?;

  init() {
    self.a = true;
    self.b = false;
    self.c = null;
    self.d = null;
  }
}