struct OptBoolStruct {
  a: Bool?;
}

contract OptBool {
  f: OptBoolStruct;

  init() {
    self.f = OptBoolStruct{a:true};
  }
}