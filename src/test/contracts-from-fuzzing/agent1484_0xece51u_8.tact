struct OptionInStruct {
  f: Int?;
  g: Bool?;
}

contract NestedOptionInStruct {
  s: OptionInStruct;

  init() {
    self.s = OptionInStruct{ f: null, g: null };
  }
}