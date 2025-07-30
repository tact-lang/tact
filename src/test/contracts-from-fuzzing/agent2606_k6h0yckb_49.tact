contract NestedSerialize {
  a: Int as uint8;
  b: Int as int16;

  init() {
    self.a = 256;
    self.b = -32769;
  }
}