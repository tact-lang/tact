contract DefaultSerializeTest {
  a: Int = 1;
  b: Int as uint32 = 2;
  c: Int as coins = ton("1");

  init() {
    self.a = 3;
    self.b = 4;
    self.c = ton("2");
  }
}
