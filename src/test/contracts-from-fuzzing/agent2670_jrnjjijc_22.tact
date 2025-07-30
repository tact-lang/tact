contract SerializationKinds {
  u4: Int as uint4;
  u8: Int as uint8;
  s1: Int as int1;
  s257: Int as int257;

  init() {
    self.u4 = 3;
    self.u8 = 250;
    self.s1 = 0;
    self.s257 = -100;
  }
}