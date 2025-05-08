struct HasAddress {
  addr: Address;
  name: String;
}

contract StructWithAddress {
  field: HasAddress;

  init() {
    self.field = HasAddress{addr: myAddress(), name: "me"};
  }
}