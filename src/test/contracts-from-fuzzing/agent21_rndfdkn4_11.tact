struct StructWithAddress {
  addr: Address;
  optAddr: Address?;
}

contract AddressFields {
  s: StructWithAddress;

  init() {
    self.s = StructWithAddress{
      addr: myAddress(),
      optAddr: null,
    };
  }
}
