contract ManySerializationFormats {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint128;
  d: Int as int257;

  init() {
    self.a = 255;
    self.b = -5000;
    self.c = 340282366920938463463374607431768211455;
    self.d = -1;
  }
}