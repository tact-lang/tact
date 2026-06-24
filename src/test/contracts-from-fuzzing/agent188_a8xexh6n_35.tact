struct NestedOpt {
  field1: Int?;
  field2: Bool?;
}

contract PersistentNestedOptional {
  nested: NestedOpt;

  init() {
    self.nested = NestedOpt { field1: 123, field2: null };
  }
}