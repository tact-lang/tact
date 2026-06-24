contract MixSerialize {
  a: Int as uint4;
  b: Int as int4;
  c: Int as uint12;
  d: Int as int12;

  init() {
    self.a = 7;
    self.b = 7;
    self.c = 4000;
    self.d = 2000;
  }
}