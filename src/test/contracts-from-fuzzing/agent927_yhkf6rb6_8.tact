struct OptionCombo {
  iv: Int?;
  bv: Bool?;
  sv: String?;
  cv: Cell?;
  av: Address?;
}

contract OptionComboContract {
  state: OptionCombo;

  init() {
    self.state = OptionCombo{
      iv: null,
      bv: null,
      sv: null,
      cv: null,
      av: null
    };
  }
}