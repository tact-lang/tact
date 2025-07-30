contract OrderedFields {
  a: Int as uint8;
  b: Int;
  c: Int as uint8;
  d: Int;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = 3;
    self.d = 4;
  }
}