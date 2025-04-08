struct HasAddress {
  addr: Address;
}

contract StoreAddr {
  f: HasAddress;

  init() {
    self.f = HasAddress{addr: myAddress()};
  }
}