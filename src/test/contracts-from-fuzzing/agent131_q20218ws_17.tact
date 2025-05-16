contract BigDefaultInt {
  num: Int = 123456789012345678901234567890;

  init() {
    self.num = -98765432109876543210;
  }
}