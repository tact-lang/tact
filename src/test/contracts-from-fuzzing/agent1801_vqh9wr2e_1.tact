struct Nested {
  inner1: Int;
  inner2: Int?;
}

contract DeepOptional {
  nestedField: Nested?;

  init() {
    self.nestedField = null;
  }
}