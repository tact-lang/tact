struct OptionalContainer {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalFieldStruct {
  v: OptionalContainer?;

  init() {
    self.v = null;
  }
}