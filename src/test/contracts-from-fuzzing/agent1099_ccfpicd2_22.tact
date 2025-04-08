struct Id {
  val: Int;
}

contract OptionalStruct {
  s: Id?;

  init() {
    self.s = null;
  }
}