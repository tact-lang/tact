struct BigOptional {
  s: String?;
  i: Int?;
  b: Bool?;
}

contract OptCombo {
  optField: BigOptional?;

  init() {
    self.optField = null;
  }
}