// Many fields, mixed serialization formats
contract SerialMixed {
  a: Int;
  b: Int as uint8;
  c: Int as int64;
  d: Int?;
  e: Bool;
  f: Bool?;
  g: String;
  h: String?;
  i: Int as uint4;
  j: Bool = true;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = 3;
    self.d = null;
    self.e = false;
    self.f = null;
    self.g = "hi";
    self.h = null;
    self.i = 5;
  }
}