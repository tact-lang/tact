contract LargeSerial {
  a: Int as uint4;
  b: Int as uint5;
  c: Bool;
  d: Int;
  e: String?;
  f: Int as uint64;
  g: Int;
  h: Int as uint8;
  i: Bool;

  init() {
    self.a=1;
    self.b=2;
    self.c=true;
    self.d=100000;
    self.e=null;
    self.f=1234;
    self.g=99;
    self.h=255;
    self.i=false;
  }
}