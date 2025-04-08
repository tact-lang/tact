struct OptionalNullableStruct {
  a: Int? = null;
  b: Bool? = null;
}

contract NestedNullDefaults {
  s: OptionalNullableStruct = OptionalNullableStruct{};

  init() {
    self.s = OptionalNullableStruct{};
  }
}