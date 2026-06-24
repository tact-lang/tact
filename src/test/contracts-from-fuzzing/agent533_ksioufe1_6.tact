struct OptionalStruct {
  x: Int;
}

contract OptInField {
  data: OptionalStruct?;

  init() {
    self.data = null;
  }
}