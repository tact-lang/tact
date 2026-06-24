struct OptAddr {
  addr: Address?;
}

contract OptionalAddr {
  a: OptAddr;

  init() {
    self.a = OptAddr{ addr: null };
  }
}
