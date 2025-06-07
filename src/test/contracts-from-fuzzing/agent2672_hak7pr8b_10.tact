contract SerializedInts {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as int32;
  d: Int as uint64;
  e: Int as int128;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = -3;
    self.d = 4;
    self.e = -5;
  }
}