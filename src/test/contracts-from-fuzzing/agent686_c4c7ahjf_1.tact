struct Nested {
  innerVal: Int;
}

contract SingleNestedField {
  nestedField: Nested;

  init() {
    self.nestedField = Nested{innerVal: 1};
  }
}