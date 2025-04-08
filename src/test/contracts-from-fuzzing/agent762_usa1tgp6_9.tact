struct NestedOptField {
  flag: Bool?;
}

contract OptionalStructField {
  s: NestedOptField?;

  init() {
    self.s = null;
  }
}