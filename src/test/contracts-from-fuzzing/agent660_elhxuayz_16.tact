struct JustAddrs {
  a: Address;
  b: Address;
  c: Address;
}

contract AddressesTest {
  store: JustAddrs;

  init() {
    let addr = myAddress();
    self.store = JustAddrs{
      a: addr,
      b: addr,
      c: addr,
    };
  }
}