contract SerializeTest {
  intField: Int as uint64;
  smallInt: Int as uint8;
  flag: Bool;
  optStr: String?;

  init() {
    self.intField = 1000;
    self.smallInt = 255;
    self.flag = true;
    self.optStr = null;
  }
}