struct InnerOptional {
  opt: Int?;
}

contract OptionalInStruct {
  data: InnerOptional;

  init() {
    self.data = InnerOptional{opt: null};
  }
}