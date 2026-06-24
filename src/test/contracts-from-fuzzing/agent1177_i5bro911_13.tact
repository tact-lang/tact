struct OptionalInsideStruct {
  v1: Int?;
  v2: Bool?;
}

contract OptionalStructField {
  s: OptionalInsideStruct?;

  init() {
    self.s = OptionalInsideStruct{ v1: null, v2: true };
  }
}
