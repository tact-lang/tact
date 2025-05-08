contract PersistentVariants {
  a: Int = 1;
  b: Int as uint8 = 2;
  c: Int as coins = 3;
  d: Bool = true;
  e: Bool?;

  init() {
    self.e = null;
  }
}
