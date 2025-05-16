contract ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int as uint8;
  e: Int as uint64;
  f: Bool;
  g: String;
  h: Int;
  i: Bool;
  j: Int as uint16;
  
  init() {
    self.a = 1;
    self.b = true;
    self.c = "c";
    self.d = 2;
    self.e = 3;
    self.f = false;
    self.g = "g";
    self.h = 8;
    self.i = true;
    self.j = 9;
  }
}
