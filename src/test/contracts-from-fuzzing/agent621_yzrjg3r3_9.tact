struct AddressNest {
  addr1: Address;
  addr2: Address;
  optAddr: Address?;
}

contract Test {
  saved: AddressNest;

  init() {
    self.saved = AddressNest{
      addr1: myAddress(),
      addr2: myAddress(),
      optAddr: null,
    };
  }
}
