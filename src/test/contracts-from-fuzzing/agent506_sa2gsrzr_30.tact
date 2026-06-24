struct DeepOne {
  num: Int = 7;
}

struct DeepTwo {
  one: DeepOne = DeepOne{};
}

struct DeepThree {
  two: DeepTwo = DeepTwo{};
}

contract LayeredDefaults {
  val: DeepThree = DeepThree{};

  init() {
    self.val = DeepThree{};
  }
}