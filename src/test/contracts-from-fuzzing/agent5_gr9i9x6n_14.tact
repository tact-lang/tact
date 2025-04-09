struct OptAddr {
  addr: Address?;
  comment: String?;
}

contract OptionalAddresses {
  x: OptAddr;

  init() {
    self.x = OptAddr{
      addr: null,
      comment: null
    };
  }

  receive() {
    if (self.x.addr != null) {
      let _ = self.x.addr!!;
    }
  }
}
