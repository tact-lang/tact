contract InterleavedOptionals {
  a: Int?;
  b: Int;
  c: Bool?;
  d: Bool;

  init() {
    self.a = null;
    self.b = 1;
    self.c = null;
    self.d = true;
  }
}