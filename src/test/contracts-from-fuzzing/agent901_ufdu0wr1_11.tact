struct OptionalsEverywhere {
  opt1: Int?;
  opt2: String?;
  opt3: Bool?;
  opt4: Address?;
  opt5: Cell?;
}

contract TestContract {
  data: OptionalsEverywhere;

  init() {
    self.data = OptionalsEverywhere {
      opt1: null,
      opt2: null,
      opt3: null,
      opt4: null,
      opt5: null,
    };
  }
}