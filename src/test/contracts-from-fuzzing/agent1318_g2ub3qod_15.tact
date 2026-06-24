struct SizedInts {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as int32;
  d: Int as int64;
}

contract Test {
  s: SizedInts;

  init() {
    self.s = SizedInts{a:1,b:2,c:3,d:4};
  }
}