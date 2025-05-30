struct NestedOptional {
  nested: Int?;
}

contract TestOptionalField {
  data: NestedOptional?;

  init() {
    self.data = null;
  }
}
