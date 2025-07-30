contract Test {
  a: Int;
  b: Int as uint32;
  c: Int as int64;
  d: Bool;
  e: Bool?;
  f: String;
  g: String;
  h: Address;
  i: Int;
  j: Int as uint8;
  k: Int as int16;
  l: Bool;
  m: Bool?;
  n: String;
  o: Int;

  init() {
    self.a = 11;
    self.b = 12;
    self.c = 13;
    self.d = false;
    self.e = true;
    self.f = "x";
    self.g = "y";
    self.h = myAddress();
    self.i = 14;
    self.j = 15;
    self.k = 16;
    self.l = true;
    self.m = false;
    self.n = "z";
    self.o = 17;
  }
}