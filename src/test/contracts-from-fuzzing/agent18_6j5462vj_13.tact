contract OptDefault {
  a: Int? = null;
  b: Bool? = null;
  c: Address? = null;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
  }
}