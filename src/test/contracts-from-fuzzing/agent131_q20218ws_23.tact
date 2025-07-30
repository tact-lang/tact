contract ConstSizePrims {
  i1: Int as int64;
  i2: Int as uint32;
  i3: Int as int8;
  i4: Int as uint4;
  flag: Bool;

  init() {
    self.i1 = 1;
    self.i2 = 2;
    self.i3 = 3;
    self.i4 = 4;
    self.flag = true;
  }
}