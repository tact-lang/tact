contract DefaultVsNon {
  a: Int;
  b: Int = 5;
  c: Bool;
  d: Bool = true;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = false;
    self.d = false;
  }
}