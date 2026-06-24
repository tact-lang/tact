contract DefaultSerialization {
  i: Int = 5;
  j: Int as int64 = -42;
  k: Int as uint4 = 7;
  l: Int as int257 = 123;

  init() {
    self.i = 5;
    self.j = -42;
    self.k = 7;
    self.l = 123;
  }
}