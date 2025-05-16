struct NestedBool {
  flag: Bool;
}

struct OptionalBoolStruct {
  nested: NestedBool?;
}

contract BoolOptContract {
  stored: OptionalBoolStruct;

  init() {
    self.stored = OptionalBoolStruct{ nested: null };
  }
}