struct TailTest {
  a: Int;
  rem: Slice as remaining;
}

contract TailRemain {
  d: TailTest;

  init() {
    self.d = TailTest {
      a: 5,
      rem: beginCell().endCell().asSlice()
    };
  }
}