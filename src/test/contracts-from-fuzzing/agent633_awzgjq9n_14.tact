struct OptionalStruct {
  s: Int;
}

contract OptionalStructInField {
  data: OptionalStruct?;

  init() {
    self.data = null;
  }
}
