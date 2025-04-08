struct NestedOptional {
  a: Int?;
  b: Bool?;
}

contract StructOptionalFields {
  data: NestedOptional?;
  init() {
    self.data = null;
  }
}