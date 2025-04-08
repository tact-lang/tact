struct RemainTest {
  a: Int;
  tail: Slice as remaining;
}

contract RemainFieldContract {
  data: RemainTest;

  init() {
    self.data = RemainTest{
      a: 7,
      tail: emptyCell().asSlice()
    };
  }
}
