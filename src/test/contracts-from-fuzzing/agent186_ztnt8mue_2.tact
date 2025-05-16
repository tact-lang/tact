struct NestedOptional {
  field1: Int?;
  field2: Bool?;
  field3: String?;
}

contract TestContract {
  nested: NestedOptional;
  init() {
    self.nested = NestedOptional{ field1: null, field2: true, field3: "abc" };
  }
}