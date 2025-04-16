struct WeirdLarge {
  a: Int as int257;
  b: Int as uint8;
  c: Int as int4;
  d: Int as uint64;
}

contract WeirdLargeTest {
  val: WeirdLarge;

  init() {
    self.val = WeirdLarge{a:1,b:255,c:7,d:99999};
  }
}