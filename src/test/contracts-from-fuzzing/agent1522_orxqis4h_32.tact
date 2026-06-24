struct AddrTest {
  a: Address;
  b: Address?;
}

contract AddressesStored {
  data: AddrTest;

  init() {
    self.data = AddrTest{
      a: myAddress(),
      b: null,
    };
  }

  receive() {
    let _ = self.data;
  }
}