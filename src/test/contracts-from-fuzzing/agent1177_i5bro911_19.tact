contract OptionalStringAddress {
  addr: Address?;
  s: String?;

  init() {
    self.addr = null;
    self.s = null;
  }
}
