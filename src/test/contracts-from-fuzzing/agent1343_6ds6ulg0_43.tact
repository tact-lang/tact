struct ManyTiny {
  a: Int as uint1;
  b: Int as uint1;
  c: Int as uint1;
  d: Int as uint1;
}

contract ManyTinyWrap {
  f: ManyTiny;
  init() {
    self.f = ManyTiny{a:1,b:0,c:1,d:0};
  }
}
