struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Test {
  val: OptionalStruct;
  init() {
    self.val = OptionalStruct{
      a: null,
      b: null,
      c: null
    };
  }
}