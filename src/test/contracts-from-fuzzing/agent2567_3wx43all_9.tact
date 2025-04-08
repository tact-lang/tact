struct OptionNestedStruct {
  a: Int;
  b: Bool?;
}

contract WithOptionalStruct {
  s: OptionNestedStruct?;

  init() {
    self.s = OptionNestedStruct{a: 1, b: false};
  }
}