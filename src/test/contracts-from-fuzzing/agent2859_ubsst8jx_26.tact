contract SerializeSizes {
  i1: Int as uint128;
  i2: Int as int64;
  i3: Int as uint32;
  i4: Int;

  init() {
    self.i1=1;
    self.i2=2;
    self.i3=3;
    self.i4=4;
  }
}