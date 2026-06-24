struct AddressSet {
  owner: Address;
  admin: Address?;
  controller: Address?;
}

contract AddressTest {
  addrs: AddressSet;

  init() {
    self.addrs = AddressSet{
      owner: myAddress(),
      admin: null,
      controller: myAddress(),
    };
  }
}