struct OptionalStruct {
  f1: Int?;
  f2: Bool?;
}

contract OptionalStructDefaultVal {
  s: OptionalStruct = OptionalStruct{f1:null, f2:null};

  init() {
    self.s = OptionalStruct{f1:null, f2:null};
  }
}