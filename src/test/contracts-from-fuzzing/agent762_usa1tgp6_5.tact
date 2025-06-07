contract OptionalPrimitive {
  num: Int?;
  text: String?;
  addr: Address?;

  init() {
    self.num = null;
    self.text = null;
    self.addr = null;
  }
}