struct LayeredAddr {
  addr1: Address;
  addr2: Address;
  wrapper: AddrWrap;
}

struct AddrWrap {
  a: Address;
  b: Address;
}

contract AddrLayer {
  field: LayeredAddr;

  init() {
    self.field = LayeredAddr{
      addr1: myAddress(),
      addr2: myAddress(),
      wrapper: AddrWrap{ a: myAddress(), b: myAddress() },
    };
  }
}