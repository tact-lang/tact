contract MixedSerialization {
  a: Int as int64;
  b: Int as uint32;
  c: Int as int257;

  init() {
    self.a=1;
    self.b=2;
    self.c=3;
  }
}