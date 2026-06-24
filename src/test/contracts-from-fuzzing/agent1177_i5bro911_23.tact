struct HasAddress {
  addr: Address;
}

contract StructWithAddressOptional {
  s: HasAddress?;

  init() {
    self.s = null;
  }
}
