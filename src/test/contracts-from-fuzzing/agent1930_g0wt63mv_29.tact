contract OptionalsMix {
  a: Int?;
  b: Int; 
  c: Bool?;
  d: Bool;

  init() {
    self.a = null;
    self.b = 5;
    self.c = true;
    self.d = false;
  }
}
