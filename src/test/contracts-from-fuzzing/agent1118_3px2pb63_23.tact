struct DefaultAndRemaining {
  a: Int = 1;
  b: Slice as remaining;
}

contract DefaultRemainTest {
  data: DefaultAndRemaining;

  init() {
    self.data = DefaultAndRemaining{
      b: emptyCell().asSlice()
    };
  }
}