struct OptNest {
  inner: Int?;
}

contract OptionalNested {
  field: OptNest;

  init() {
    self.field = OptNest{ inner: null };
  }
}