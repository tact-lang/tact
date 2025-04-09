struct AddressHolder {
  addr1: Address;
  addr2: Address;
}

contract AddrTest {
  x: AddressHolder;

  init() {
    self.x = AddressHolder{
      addr1: myAddress(),
      addr2: myAddress()
    };
  }
}