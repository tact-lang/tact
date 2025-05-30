contract IntSerializers {
  a: Int as int8;
  b: Int as int16;
  c: Int as uint8;
  d: Int as uint16;

  init() {
    self.a = 42;
    self.b = 32000;
    self.c = 200;
    self.d = 60000;
  }
}