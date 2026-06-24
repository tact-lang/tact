struct OptionsInStruct {
  foo: Int?;
  bar: Bool?;
}

contract NilStructInit {
  s: OptionsInStruct;

  init() {
    self.s = OptionsInStruct{
      foo: null,
      bar: null
    };
  }
}