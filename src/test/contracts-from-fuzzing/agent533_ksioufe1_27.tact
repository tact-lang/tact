struct OptStruct {
  inner: Int?;
}

contract OptField {
  s: OptStruct?;

  init() {
    self.s = null;
  }
}