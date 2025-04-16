struct OptionalStruct {
  a: Int?;
}

contract DefaultOptionalStruct {
  s: OptionalStruct = OptionalStruct{a:null};

  init() {
    self.s = OptionalStruct{a:null};
  }
}