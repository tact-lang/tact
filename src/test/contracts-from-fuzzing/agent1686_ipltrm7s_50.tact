struct OptionalBool {
  flag: Bool?;
}

contract BoolOptionalTest{
  val: OptionalBool;

  init() {
    self.val = OptionalBool{flag:null};
  }
}