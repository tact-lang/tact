contract ManyAddresses {
  a1: Address;
  a2: Address;
  a3: Address;
  a4: Address;
  a5: Address;

  init() {
    self.a1 = myAddress();
    self.a2 = myAddress();
    self.a3 = myAddress();
    self.a4 = myAddress();
    self.a5 = myAddress();
  }
}