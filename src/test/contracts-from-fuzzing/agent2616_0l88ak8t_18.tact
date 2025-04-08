contract OptDefaults {
  a: Int? = null;
  b: Bool? = null;
  s: String? = null;
  addr: Address? = null;

  init() {
    self.a = 1;
    self.b = true;
    self.s = "s";
    self.addr = myAddress();
  }
}