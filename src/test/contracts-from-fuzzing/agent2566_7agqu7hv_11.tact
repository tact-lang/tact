struct Flexible {
  text: String?;
  count: Int?;
  flag: Bool?;
}

contract OptionMix {
  val: Flexible;

  init() {
    self.val = Flexible{text: null, count: null, flag: null};
  }
}
