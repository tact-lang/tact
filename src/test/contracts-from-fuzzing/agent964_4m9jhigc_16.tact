struct OptionalNested {
  value: Int?;
}

contract OptionalNestedField {
  x: OptionalNested?;

  init() {
    self.x = OptionalNested{ value: 42 };
  }
}
