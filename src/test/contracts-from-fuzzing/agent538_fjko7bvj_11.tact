contract OnlyOptional {
  a: Int?;
  b: Bool?;
  addr: Address?;

  init() {
    self.a = null;
    self.b = null;
    self.addr = null;
  }
}
