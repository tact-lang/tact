contract AddressField {
  addr: Address;

  init() {
    self.addr = myAddress();
  }
}