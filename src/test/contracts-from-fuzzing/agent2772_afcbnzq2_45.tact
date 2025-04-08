contract OptionalIntAddress {
  a: Int?;
  b: Address?;

  init() {
    self.a = null;
    self.b = null;
  }
}
