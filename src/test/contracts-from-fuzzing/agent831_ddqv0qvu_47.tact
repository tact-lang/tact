struct OptionalStruct {
  a: Int?;
  b: Bool?;
}

contract OptNested {
  val: OptionalStruct;

  init() {
    self.val = OptionalStruct{
      a: null,
      b: null
    };
  }
}