struct Nested {
  inner1: Int;
  inner2: Bool?;
}

contract DeeplyNestedStorage {
  nestedField: Nested;

  init() {
    self.nestedField = Nested { inner1: 1, inner2: true };
  }
}