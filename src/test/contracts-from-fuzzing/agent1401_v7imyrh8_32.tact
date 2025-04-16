struct OptionalAddr {
  addr: Address?;
}

contract OptAddrTest {
  s: OptionalAddr;

  init() {
    self.s = OptionalAddr{ addr: null };
  }
}