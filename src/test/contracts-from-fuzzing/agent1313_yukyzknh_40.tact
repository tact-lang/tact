struct OptionalWrapped {
  str: String?;
}

contract OptionalInsideStruct {
  s: OptionalWrapped;

  init() {
    self.s = OptionalWrapped{str:null};
  }
}