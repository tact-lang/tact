contract ZeroDefaults {
  a: Int = 0;
  b: Int as uint8 = 0;
  c: Int as int16 = 0;
  d: Int as uint32 = 0;

  init() {
    self.a = 10;
    self.b = 20;
    self.c = 30;
    self.d = 40;
  }
}