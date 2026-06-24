contract OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: Address? = null;

  init() {
    self.a = 10;
    self.b = true;
    self.c = myAddress();
  }
}