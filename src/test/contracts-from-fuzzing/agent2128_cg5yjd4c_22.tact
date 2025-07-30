struct OptionCombo {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

struct NestedCombo {
  opt1: OptionCombo?;
  opt2: OptionCombo?;
}

contract OptMix {
  val: NestedCombo;

  init() {
    self.val = NestedCombo{
      opt1: null,
      opt2: null
    };
  }
}