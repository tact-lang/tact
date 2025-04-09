contract SparseBits {
  u8field: Int as uint8;
  u1field: Int as uint1;
  u4field: Int as uint4;
  i8field: Int as int8;

  init() {
    self.u8field = 255;
    self.u1field = 1;
    self.u4field = 15;
    self.i8field = 127;
  }
}