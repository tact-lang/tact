contract OptionalPrimitive {
  num: Int?;
  flag: Bool?;
  addr: Address?;
  txt: String?;

  init() {
    self.num = null;
    self.flag = null;
    self.addr = null;
    self.txt = null;
  }
}