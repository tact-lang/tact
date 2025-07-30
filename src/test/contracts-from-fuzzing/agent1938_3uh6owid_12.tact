struct OptionalDeepTen {
  val: OptionalDeepNine?;
}
struct OptionalDeepNine {
  val: OptionalDeepEight?;
}
struct OptionalDeepEight {
  val: OptionalDeepSeven?;
}
struct OptionalDeepSeven {
  val: OptionalDeepSix?;
}
struct OptionalDeepSix {
  val: OptionalDeepFive?;
}
struct OptionalDeepFive {
  val: OptionalDeepFour?;
}
struct OptionalDeepFour {
  val: OptionalDeepThree?;
}
struct OptionalDeepThree {
  val: OptionalDeepTwo?;
}
struct OptionalDeepTwo {
  val: OptionalDeepOne?;
}
struct OptionalDeepOne {
  val: Int?;
}

contract OptionalDeepTenTest {
  data: OptionalDeepTen;
  init() {
    self.data = OptionalDeepTen{ val: null };
  }
}