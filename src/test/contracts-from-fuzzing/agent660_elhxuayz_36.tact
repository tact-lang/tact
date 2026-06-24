struct ManyAddresses {
  a1: Address;
  a2: Address;
  a3: Address;
  a4: Address;
  a5: Address;
  a6: Address;
}

contract ManyAddressesTest {
  data: ManyAddresses;

  init() {
    let my = myAddress();
    self.data = ManyAddresses{
      a1: my,
      a2: my,
      a3: my,
      a4: my,
      a5: my,
      a6: my,
    };
  }
}