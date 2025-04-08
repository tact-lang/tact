struct NestedStructOpt {
  a: Int?;
  b: Bool;
}

contract NestedOptionalField {
  nested: NestedStructOpt?;

  init() {
    self.nested = null;
  }
}
