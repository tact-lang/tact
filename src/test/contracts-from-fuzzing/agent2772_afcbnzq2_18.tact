contract OptionalAddresses {
  addr1: Address?;
  addr2: Address?;

  init() {
    self.addr1 = null;
    self.addr2 = myAddress();
  }
}
