contract EdgeMix {
  a: Int?;
  b: Bool;
  c: String?;
  d: Address;
  e: Cell?;

  init() {
    self.a = null;
    self.b = false;
    self.c = null;
    self.d = myAddress();
    self.e = null;
  }
}