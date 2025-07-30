struct OptionalIntStruct {
  a: Int?;
}

contract DoubleOptionalStruct {
  s1: OptionalIntStruct?;
  s2: OptionalIntStruct?;
  init() {
    self.s1 = null;
    self.s2 = null;
  }
}