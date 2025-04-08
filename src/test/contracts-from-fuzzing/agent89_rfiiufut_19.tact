struct OptionalAddr {
  addr: Address?;
}

contract OptAddrInStruct {
  s: OptionalAddr;

  init() {
    self.s = OptionalAddr { addr: null };
  }
}
