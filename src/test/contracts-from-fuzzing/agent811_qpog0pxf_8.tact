contract TinyFields {
  a: Int as uint1 = 1;
  b: Int as int4 = -3;
  c: Int as uint3 = 5; // should be out-of-range if over 7, but this is 5

  init() {
    self.a = 0;
    self.b = -1;
    self.c = 7;
  }
}