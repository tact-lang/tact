contract AddressInit {
  addr: Address;

  init() {
    self.addr = myAddress();
  }
}