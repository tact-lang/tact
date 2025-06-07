struct NestedOptionalStruct {
  val: Int?;
}

contract NullableStruct {
  f: NestedOptionalStruct?;

  init() {
    self.f = null;
  }
}