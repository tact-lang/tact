struct OptionalStruct {
  inner: Int?;
}

contract OptStructInContract {
  x: OptionalStruct?;

  init() {
    self.x = null;
  }
}