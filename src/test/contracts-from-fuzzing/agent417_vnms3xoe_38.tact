struct OnlyAddress {
  a: Address;
  b: Address?;
}

contract AddrCheck {
  f: OnlyAddress;
  init() {
    self.f = OnlyAddress{
      a: myAddress(),
      b: null
    };
  }
}