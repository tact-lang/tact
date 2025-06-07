contract NegativeCoerce {
  a: Int as uint8;
  b: Int? as uint8;

  init() {
    self.a = -1;
    self.b = -2;
  }
}
