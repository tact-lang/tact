contract TestSerializeWidths {
  a: Int as int8;
  b: Int as uint4;
  c: Int as int257;
  d: Int;

  init() {
    self.a = 127;
    self.b = 15;
    self.c = 0;
    self.d = 42;
  }
}