contract OptionalAddressStringInt {
  addr: Address?;
  str: String?;
  num: Int?;

  init() {
    self.addr = null;
    self.str = null;
    self.num = null;
  }
}