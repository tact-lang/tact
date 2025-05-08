struct OptionalAddress {
  addr: Address?;
}

contract OptionalAddrTest {
  s: OptionalAddress;

  init() {
    self.s = OptionalAddress{ addr: null };
  }
}