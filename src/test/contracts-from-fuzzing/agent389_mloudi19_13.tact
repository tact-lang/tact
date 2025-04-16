struct OptionalStruct {
  foo: Int?;
  bar: Bool;
}

contract OptionalDefault {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct{foo:null, bar:true};
  }
}
