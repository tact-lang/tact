struct SOptionalBool {
  val: Bool?;
}

contract OptionalBoolInStruct {
  s: SOptionalBool;

  init() {
    self.s = SOptionalBool{ val: null };
  }
}