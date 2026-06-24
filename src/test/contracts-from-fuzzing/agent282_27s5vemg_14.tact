contract ManyAddressVars {
  a: Address;
  b: Address;
  c: Address;
  d: Address;
  e: Address;
  f: Address;
  g: Address;

  init() {
    let addr = myAddress();
    self.a = addr;
    self.b = addr;
    self.c = addr;
    self.d = addr;
    self.e = addr;
    self.f = addr;
    self.g = addr;
  }
}