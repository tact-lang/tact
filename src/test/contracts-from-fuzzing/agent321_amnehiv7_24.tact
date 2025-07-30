struct Mixed {
  a: Int as int64;
  b: Int as uint16;
  c: Int as uint8;
  d: Int;
}

contract MixedSerialization {
  val: Mixed;

  init() {
    self.val = Mixed{ a:1, b:2, c:3, d:4 };
  }
}