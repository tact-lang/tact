struct OptionalNested {
  value: Int?;
}

contract OptStructField {
  field: OptionalNested;

  init() {
    self.field = OptionalNested{ value: null };
  }
}