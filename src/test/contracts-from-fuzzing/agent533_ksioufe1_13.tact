struct Inner { value: Int; }

contract OptionalNestedField {
  nested: Inner?;

  init() {
    self.nested = Inner{value: 7};
  }
}