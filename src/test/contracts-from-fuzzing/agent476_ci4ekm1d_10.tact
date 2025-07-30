contract SerializationSizes {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as int64;
  d: Int as int257;

  init() {
    self.a=1; self.b=2; self.c=3; self.d=4;
  }

  receive() {
    let s = self.a + self.b + self.c + self.d;
  }
}