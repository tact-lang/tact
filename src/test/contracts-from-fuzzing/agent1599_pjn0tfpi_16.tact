// long list of primitive fields with serialization
contract Test {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as uint32;
  d: Int as int64;
  e: Int as uint51;
  f: Int as int257;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = 3;
    self.d = 4;
    self.e = 5;
    self.f = 6;
  }
}