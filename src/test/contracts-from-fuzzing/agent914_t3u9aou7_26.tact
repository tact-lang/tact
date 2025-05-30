contract OptionalAddress {
  a: Address?;

  init() {
    self.a = myAddress();
  }
}