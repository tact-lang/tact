struct BoolIntMix {
  flag1: Bool;
  num1: Int;
  flag2: Bool;
  num2: Int;
}

contract MixedTest {
  mixed: BoolIntMix;

  init() {
    self.mixed = BoolIntMix{
      flag1: true,
      num1: 5,
      flag2: false,
      num2: 10,
    };
  }
}