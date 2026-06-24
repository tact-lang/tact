struct WithAddress {
  addr: Address;
}

contract AddressStorage {
  val: WithAddress;

  init() {
    self.val = WithAddress{ addr: myAddress() };
  }
}