struct ContainsAddress {
  addr: Address;
}

contract AddressContract {
  field: ContainsAddress;

  init() {
    self.field = ContainsAddress{ addr: myAddress() };
  }
}