struct RemainderTest {
  prefix: Int;
  suffix: Slice as remaining;
}

contract RemainCheck {
  data: RemainderTest;

  init() {
    self.data = RemainderTest{
      prefix: 77,
      suffix: emptyCell().asSlice()
    };
  }
}
