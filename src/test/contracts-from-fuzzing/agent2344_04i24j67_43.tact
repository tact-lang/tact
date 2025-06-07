struct SerialStruct {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
}

contract SerialStructCont {
  s: SerialStruct;

  init() {
    self.s = SerialStruct{ a:1, b:2, c:3 };
  }
}