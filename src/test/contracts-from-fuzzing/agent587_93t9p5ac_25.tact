struct OptionEmpty {
  maybe: Int?;
}

contract OptionEmptyContract {
  opt: OptionEmpty;

  init() {
    self.opt = OptionEmpty{ maybe:null };
  }
}