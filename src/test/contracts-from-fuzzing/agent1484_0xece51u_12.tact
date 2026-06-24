contract FieldsWithSerialization {
  a: Int as uint8;
  b: Int as int16;
  c: Int as int257;

  init() {
    self.a = 127;
    self.b = -32000;
    self.c = 12345678901234567890;
  }
}