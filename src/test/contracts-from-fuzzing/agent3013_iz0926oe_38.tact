struct S {
  intf: Int?;
  boolf: Bool?;
  stringf: String?;
}

contract OptionalStructs {
  sa: S?;
  sb: S?;

  init() {
    self.sa = null;
    self.sb = null;
  }
}
