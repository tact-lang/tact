struct IntSerialization {
  normal: Int;
  u4: Int as uint4;
  i8: Int as int8;
  u32: Int as uint32;
}

contract SerializeIntFields {
  s: IntSerialization;

  init() {
    self.s = IntSerialization{
      normal: 1,
      u4: 5,
      i8: -42,
      u32: 50000
    };
  }
}