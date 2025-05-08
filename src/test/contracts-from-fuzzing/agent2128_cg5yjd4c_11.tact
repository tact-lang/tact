struct RemainInner {
  val: Int;
  rem: Slice as remaining;
}

struct Top {
  a: Int as int64;
  b: Bool;
  child: RemainInner;
}

contract RemainStructTest {
  s: Top;

  init() {
    self.s = Top{
      a: 1,
      b: false,
      child: RemainInner{
        val: 5,
        rem: emptyCell().asSlice()
      }
    };
  }
}