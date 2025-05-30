struct OptionalField {
  maybeInt: Int?;
}

contract OptionalNested {
  nested: OptionalField;

  init() {
    self.nested = OptionalField{ maybeInt: null };
  }
}
