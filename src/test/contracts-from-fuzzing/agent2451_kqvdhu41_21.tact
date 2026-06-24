contract SerializeVariants {
  a: Int;
  b: Int as uint8;
  c: Int as int17;
  d: Int as uint33;

  init() {
    self.a=1; self.b=255; self.c=-10000; self.d=1000000;
  }
}