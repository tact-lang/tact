contract ExplicitSerial {
  a: Int as uint4;
  b: Int as int64;
  f: Bool;

  init() {
    self.a = 5;
    self.b = -12;
    self.f = true;
  }
}