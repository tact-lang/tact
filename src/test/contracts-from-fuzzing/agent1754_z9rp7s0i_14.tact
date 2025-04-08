contract FieldOrdering {
  a: Int as uint8 = 1;
  b: Int = 2;
  c: Int as int64 = 3;
  d: Bool = true;

  init() {
    self.a = 10;
    self.b = 20;
    self.c = 30;
    self.d = false;
  }
}
