struct OptionPrimitive {
  f1: Int?;
  f2: String?;
  f3: Bool?;
}

contract Test {
  optPrim: OptionPrimitive;
  init() {
    self.optPrim = OptionPrimitive{f1:null,f2:null,f3:null};
  }
}