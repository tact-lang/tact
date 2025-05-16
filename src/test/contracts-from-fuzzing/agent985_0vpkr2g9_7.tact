struct OptionStruct {
  flag: Bool?;
  count: Int?;
  label: String?;
}

contract OptionalStructField {
  opt: OptionStruct?;

  init() {
    self.opt = null;
  }
}