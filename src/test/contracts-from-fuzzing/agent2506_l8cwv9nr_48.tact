// Optional address as persistent field
contract OptionalAddress {
  addr: Address?;
  init() {
    self.addr = null;
  }
}
