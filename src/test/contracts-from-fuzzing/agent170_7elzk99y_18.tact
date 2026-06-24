struct Addresses {
  a: Address;
  b: Address?;
}

contract AddrTest {
  data: Addresses;

  init() {
    self.data = Addresses{
      a: myAddress(),
      b: null
    };
  }
}