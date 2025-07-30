struct AddressStruct {
  a1: Address;
  a2: Address?;
}

contract AddrTest {
  addr: AddressStruct;

  init() {
    self.addr = AddressStruct{
      a1: myAddress(),
      a2: null
    };
  }
}