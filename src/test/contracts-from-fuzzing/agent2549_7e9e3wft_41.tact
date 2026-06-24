struct OptionalAddress {
  addr: Address?;
}

contract AddrOpt {
  f: OptionalAddress;

  init() {
    self.f = OptionalAddress{ addr: null };
  }
}