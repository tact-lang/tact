struct SerialStruct {
  a: Int as uint4;
  b: Int as int8;
  c: Int as uint16;
  d: Int as int32;
  e: Int as int257;
}

contract StructWithSerialize {
  data: SerialStruct;

  init() {
    self.data = SerialStruct{
      a: 3,
      b: -7,
      c: 65535,
      d: -2147483648,
      e: 0,
    };
  }
}
