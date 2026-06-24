struct OptInStruct {
  val1: Int?;
  val2: Bool?;
}

contract OptionalStruct {
  x: OptInStruct?;

  init() {
    self.x = null;
  }
}
