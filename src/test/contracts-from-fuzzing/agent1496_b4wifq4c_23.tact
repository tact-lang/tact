struct AddressStruct {
  a1: Address;
  a2: Address;
}

contract PersistAddress {
  s: AddressStruct;

  init() {
    self.s = AddressStruct{a1:myAddress(), a2:myAddress()};
  }
}