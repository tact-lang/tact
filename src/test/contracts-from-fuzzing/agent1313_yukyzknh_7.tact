struct BigNested {
  lvl1: Int;
  lvl2: Int;
  lvl3: Int;
  lvl4: Int;
  lvl5: Int;
  lvl6: Int;
  lvl7: Int;
  lvl8: Int;
  lvl9: Int;
  lvl10: Int;
}

contract ManyPersistentFields {
  a: BigNested;
  b: BigNested;
  c: BigNested;
  d: BigNested;

  init() {
    self.a = BigNested{lvl1:1,lvl2:2,lvl3:3,lvl4:4,lvl5:5,lvl6:6,lvl7:7,lvl8:8,lvl9:9,lvl10:10};
    self.b = self.a;
    self.c = self.b;
    self.d = self.c;
  }
}