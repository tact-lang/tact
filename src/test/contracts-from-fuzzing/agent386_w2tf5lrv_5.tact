struct OptionalStruct {
  foo: Int?;
  bar: Bool?;
}

contract Opts {
  opt1: Int? = null;
  opt2: Bool? = null;
  optS: OptionalStruct = OptionalStruct{foo: null, bar: null};

  init() {
    self.opt1 = 42;
    self.opt2 = true;
    self.optS = OptionalStruct{foo: 1, bar: false};
  }
}
