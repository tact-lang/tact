struct OptInNested {
  inner: Int?;
}

struct OuterOpt {
  nested: OptInNested?;
}

contract OptionalNestedStruct {
  field: OuterOpt;

  init() {
    self.field = OuterOpt{ nested: null };
  }
}