struct BoolsBetweenInts {
  i1: Int;
  b1: Bool;
  i2: Int;
  b2: Bool;
  i3: Int;
}

contract MixBoolIntOrderingTest {
  data: BoolsBetweenInts;

  init() {
    self.data = BoolsBetweenInts{
      i1: 1,
      b1: true,
      i2: 2,
      b2: false,
      i3: 3,
    };
  }
}