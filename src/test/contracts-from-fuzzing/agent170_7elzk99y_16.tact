struct IntSizes {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as int16;
  d: Int as uint32;
  e: Int as int64;
}

contract IntSizesTest {
  val: IntSizes;

  init() {
    self.val = IntSizes{
      a: 1,
      b: 2,
      c: 3,
      d: 4,
      e: 5
    };
  }
}