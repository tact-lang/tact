struct HasAddr {
  owner: Address;
}

contract AddressField {
  field: HasAddr;

  init() {
    self.field = HasAddr{ owner: myAddress() };
  }
}
