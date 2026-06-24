contract ManyAddresses {
  a: Address;
  b: Address;
  c: Address;
  d: Address;
  e: Address;

  init() {
    self.a = myAddress();
    self.b = myAddress();
    self.c = myAddress();
    self.d = myAddress();
    self.e = myAddress();
  }
}