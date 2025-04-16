struct SerialStruct {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as int32;
  d: Int as uint64;
  e: Int as int256;
}

contract SerializeStructs {
  s1: SerialStruct;
  s2: SerialStruct;

  init() {
    self.s1 = SerialStruct{a:1,b:2,c:-3,d:4,e:5};
    self.s2 = SerialStruct{a:6,b:7,c:-8,d:9,e:10};
  }
}