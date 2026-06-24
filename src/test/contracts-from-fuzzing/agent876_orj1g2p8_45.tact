contract NullableAddressStringInt {
  a: Address?;
  s: String?;
  n: Int?;

  init() {
    self.a = null;
    self.s = null;
    self.n = null;
  }
}