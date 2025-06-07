contract OptionalAddressInit {
  addr: Address?;

  init() {
    self.addr = myAddress();
  }
}