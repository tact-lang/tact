struct SerStruct {
  a: Int as uint8;
  b: Int as int16;
  c: Int;
}

contract SerializingNested {
  data: SerStruct = SerStruct{ a: 255, b: -123, c: 999999 };
  receive() {}
}