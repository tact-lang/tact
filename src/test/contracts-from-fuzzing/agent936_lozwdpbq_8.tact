struct HasAddresses {
  a1: Address;
  a2: Address;
  a3: Address;
}

contract TestContract {
  data: HasAddresses;

  init() {
    self.data = HasAddresses{
      a1: myAddress(),
      a2: myAddress(),
      a3: myAddress(),
    };
  }
}
