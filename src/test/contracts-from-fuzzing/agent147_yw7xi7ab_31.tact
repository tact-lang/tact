struct AddressStruct {
  a: Address;
  b: Address?;
}

contract Ad {
  val: AddressStruct;
  init() {
    self.val = AddressStruct{a: myAddress(), b: null};
  }
}