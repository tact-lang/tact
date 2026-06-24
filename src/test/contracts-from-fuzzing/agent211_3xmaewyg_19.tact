struct OptionalBoolStruct {
  flag: Bool?;
}

contract ContractWithOptBoolStruct {
  s: OptionalBoolStruct;

  init() {
    self.s = OptionalBoolStruct{ flag: null };
  }
}
