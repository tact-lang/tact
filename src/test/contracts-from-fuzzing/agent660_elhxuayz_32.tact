struct Overflow {
  big1: Int as uint4;
  big2: Int as uint4;
}

contract OverflowSerializationTest {
  st: Overflow;

  init() {
    self.st = Overflow{
      big1: 15,
      big2: 16, // <-- This exceeds uint4
    };
  }
}