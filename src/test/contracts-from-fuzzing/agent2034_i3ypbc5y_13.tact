contract ChainOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;

  init() {
    self.a = null;
    self.b = 1;
    self.c = 2;
    self.d = null;
    self.e = 5;
  }
}