struct OptionalStruct {
  val: Int?;
}

contract OptDefault {
  x: OptionalStruct;

  init() {
    self.x = OptionalStruct{ val: null };
  }
}
