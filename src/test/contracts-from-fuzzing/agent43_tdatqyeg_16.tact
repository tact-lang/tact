struct OptionalStruct {
  x: Int?;
  y: Bool?;
}

contract StructOptionalField {
  opt: OptionalStruct?;

  init() {
    self.opt = null;
  }
}