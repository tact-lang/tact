struct AddressStuff {
  primary: Address;
  backup: Address?;
}

contract AddrTest {
  x: AddressStuff;

  init() {
    self.x = AddressStuff{
      primary: myAddress(),
      backup: null
    };
  }
}