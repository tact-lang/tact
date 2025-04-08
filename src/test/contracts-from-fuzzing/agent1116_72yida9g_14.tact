struct OptionalNested {
  inner: Int?;
}

contract OptionalDeep {
  nested: OptionalNested?;

  init() {
    self.nested = OptionalNested{ inner: 5 };
  }
}
