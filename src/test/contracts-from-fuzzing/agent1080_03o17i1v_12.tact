struct BigOpt {
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
  opt4: Cell?;
  opt5: Slice?;
  opt6: Address?;
}

contract LargeOpt {
  holder: BigOpt;

  init() {
    self.holder = BigOpt{
      opt1: null,
      opt2: null,
      opt3: null,
      opt4: null,
      opt5: null,
      opt6: null,
    };
  }
}