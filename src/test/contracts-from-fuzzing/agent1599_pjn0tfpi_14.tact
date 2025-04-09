struct S {
  field1: Int as uint32;
  field2: Int as int64;
  field3: Int as uint8;
}

contract Test {
  s: S;

  init() {
    self.s = S{field1:1, field2:2, field3:3};
  }
}