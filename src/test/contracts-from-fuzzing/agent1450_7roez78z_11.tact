struct AddressNest {
  a1: Address;
  a2: Address;
  a3: Address;
}

contract AddressFieldsTest {
  addresses: AddressNest;

  init() {
    self.addresses = AddressNest{
      a1: myAddress(),
      a2: myAddress(),
      a3: myAddress(),
    };
  }
}