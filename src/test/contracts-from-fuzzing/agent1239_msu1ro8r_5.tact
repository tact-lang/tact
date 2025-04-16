struct OptNest {
  inner: Int?;
  label: String;
}

contract OptionalStructField {
  nested: OptNest?;

  init() {
    self.nested = OptNest{
      inner: null,
      label: "Test"
    };
  }
}