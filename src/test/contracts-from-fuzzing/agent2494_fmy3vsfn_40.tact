struct WrappedAddr {
  a: Address;
}

contract AddrWrap {
  x: WrappedAddr;
  init() {
    self.x = WrappedAddr{a: myAddress()};
  }
}